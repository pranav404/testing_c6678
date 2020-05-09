#include<stdio.h>
#include<math.h>


/*
 * main.c
 */

void fft(float *ipr, float tr[],float ti[], float *ptr);
void fft256(float *ipr,float tr[],float ti[], float *op);
 int main(void) {

	unsigned char buff[4],buffer[2];
	float tr[64],ti[64],dataarray[128],output[128];
	int n,j,read,data,i,k,sample_num,passes;
	FILE *fp1,*fp2,*fp3,*fp4;
	const char *c = "as3.wav";
	fp1  = fopen(c,"rb");

	if(fp1 == NULL)
	{
		printf("Error:File cannot be read\n");
		fclose(fp1);
		exit(0);
	}
	c = "Output1.dat";
	fp4 = fopen(c,"wb");

	for(i = 0;i<11;i++)
	{
		read = fread(buff,sizeof(buff),1,fp1);
	}
	sample_num = (buff[0]|(buff[1]<<8)|(buff[2]<<16)|(buff[3]<<24))/2;
	printf("Enter the number of points of FFT to be done\n");
	scanf("%d",&n);
	if(n == 128)
	{

		c = "cos.txt";
		fp2 = fopen(c,"r");
		c = "sin.txt";
		fp3 = fopen(c,"r");
		fread(tr,sizeof(float),64,fp2);
		fread(ti,sizeof(float),64,fp3);
		fclose(fp2);
		fclose(fp3);
		passes = sample_num/128;
		printf("Printing the data\n");
		for(k = 0;k<10;k+=1)
		{

			printf("\nk = %d \n",k);
			for(i = 0;i<128;i++)
			{
				data = 0;
				read = fread(buffer,sizeof(buffer),1,fp1);
				data = (buffer[0])|(buffer[1]<<8);
				if(data>32767)
				{
					dataarray[i] = ((float)data/32767) - 2;
				}
				else
				{
					dataarray[i] = (float)data/32767;
				}
			}
			fft(dataarray,tr,ti,output);

		}
		for(i = 0;i<128;i++)
			printf("%0.5f\n",output[i]);
		fclose(fp1);
		fclose(fp4);

	}

	return 0;
}
 void fft(float* ipr, float tr[], float ti[], float* ptr)
 {
 	float br[128], bi[128];
 	float r, r1, im, im1, t1,t2,r2,im2;
 	int i, k, j, bits;
 	for (i = 0; i < 128; i++)               //Performing bit reversal
 	{
 		k = i;
 		for (bits = j = 0; bits < 7; bits++)
 		{
 			j = (j << 1) | (k & 1);
 			k >>= 1;

 		}
 		br[j] = *(ipr + i);
 		bi[j] = 0.0;

 	}
 	//First stage
 	for (k = 0; k < 128; k += 4)
 	{
 		r = br[k];
 		im = bi[k];
 		r1 = br[k + 1];
 		im1 = bi[k + 1];
 		br[k] = (r + r1);
 		bi[k] = (im + im1);
 		br[k + 1] = (r - r1);
 		bi[k + 1] = (im - im1);
 		r = br[k+2];
		im = bi[k+2];
		r1 = br[k + 3];
		im1 = bi[k + 3];
		br[k+2] = (r + r1);
		bi[k+2] = (im + im1);
		br[k + 3] = (r - r1);
		bi[k + 3] = (im - im1);


 	}

 	//Second stage
 	for (i = 0; i < 128; i += 4)
 	{
 			r = br[i];
 			im = bi[i];
 			r1 = br[i+2];
 			im1 = bi[i+2];
 			r2 = br[i+1];
 			t1 = ((tr[0]*r1)-(ti[0]*im1));
 			im2 = bi[i+1];
 			t2 = ((tr[0]*im1)+(ti[0]*r1));
 			br[i] = r+t1;
 			bi[i+2] = im - t2;
 			br[i+2] = r  - t1;
 			bi[i] = im+t2;
 			r1 = br[i+3];
 			im1 = bi[i+3];
 			t1 = ((tr[32]*r1)-(ti[32]*im1));
 			br[i+1] = r2 + t1;
 			t2 = ((tr[32]*im1)+(ti[32]*r1));
 			br[i+3] = r2-t1;
 			bi[i+1] = im2 + t2;
 			bi[i+3] = im2 - t2;

 	}


 	//third stage
 	for (i = 0; i < 127; i += 8)
 	{
 		for (k = 0; k < 4; k++)
 		{
 			r = br[k + i];
 			im = bi[k + i];
 			r1 = br[k + i + 4];
 			im1 = bi[k + i + 4];
 			br[k + i] = (r + ((tr[16 * k] * r1) - (ti[16 * k] * im1)));
 			bi[k + i] = (im + ((tr[16 * k] * im1) + (ti[16 * k] * r1)));
 			br[k + i + 4] = (r - ((tr[16 * k] * r1) - (ti[16 * k] * im1)));
 			bi[k + i + 4] = (im - ((tr[16 * k] * im1) + (ti[16 * k] * r1)));
 		}
 	}
 	//fourth stage:
 	for (i = 0; i < 127; i += 16)
 	{
 		for (k = 0; k < 8; k++)
 		{
 			r = br[k + i];
 			im = bi[k + i];
 			r1 = br[k + i + 8];
 			im1 = bi[k + i + 8];
 			br[k + i] = (r + ((tr[8 * k] * r1) - (ti[8 * k] * im1)));
 			bi[k + i] = (im + ((tr[8 * k] * im1) + (ti[8 * k] * r1)));
 			br[k + i + 8] = (r - ((tr[8 * k] * r1) - (ti[8 * k] * im1)));
 			bi[k + i + 8] = (im - ((tr[8 * k] * im1) + (ti[8 * k] * r1)));
 		}
 	}
 	//Fifth Stage
 	for (i = 0; i < 127; i += 32)
 	{
 		for (k = 0; k < 16; k++)
 		{
 			r = br[k + i];
 			im = bi[k + i];
 			r1 = br[k + i + 16];
 			im1 = bi[k + i + 16];
 			br[k + i] = (r + ((tr[4 * k] * r1) - (ti[4 * k] * im1)));
 			bi[k + i] = (im + ((tr[4 * k] * im1) + (ti[4 * k] * r1)));
 			br[k + i + 16] = (r - ((tr[4 * k] * r1) - (ti[4 * k] * im1)));
 			bi[k + i + 16] = (im - ((tr[4 * k] * im1) + (ti[4 * k] * r1)));
 		}
 	}
 	//6th stage
 	for (i = 0; i < 127; i += 64)
 	{
 		for (k = 0; k < 32; k++)
 		{
 			r = br[k + i];
 			im = bi[k + i];
 			r1 = br[k + i + 32];
 			im1 = bi[k + i + 32];
 			br[k + i] = (r + ((tr[2 * k] * r1) - (ti[2 * k] * im1)));
 			bi[k + i] = (im + ((tr[2 * k] * im1) + (ti[2 * k] * r1)));
 			br[k + i + 32] = (r - ((tr[2 * k] * r1) - (ti[2 * k] * im1)));
 			bi[k + i + 32] = (im - ((tr[2 * k] * im1) + (ti[2 * k] * r1)));
 		}
 	}
 	//Seventh Stage
 	for (i = 0; i < 127; i += 128)
 	{
 		for (k = 0; k < 64; k++)
 		{
 			r = br[k + i];
 			im = bi[k + i];
 			r1 = br[k + i + 64];
 			im1 = bi[k + i + 64];
 			br[k + i] = (r + ((tr[k] * r1) - (ti[k] * im1)));
 			bi[k + i] = (im + ((tr[k] * im1) + (ti[k] * r1)));
 			br[k + i + 64] = (r - ((tr[k] * r1) - (ti[k] * im1)));
 			bi[k + i + 64] = (im - ((tr[k] * im1) + (ti[k] * r1)));
 		}
 	}
 	for (i = 0; i < 128; i++)
 	{
 		*(ptr + i) +=  sqrt((br[i] * br[i]) + (bi[i] * bi[i]));
 	}


 }
 void fft256(float* ipr, float tr[], float ti[], float* op)
 {
 	float br[256], bi[256], r, i, r1, i1;
 	int k, j, temp, bits;
 	//performing bit reversal
 	for (k = 0; k < 256; k++)
 	{
 		temp = k;
 		j = 0;
 		for (bits = 0; bits < 8; bits++)
 		{
 			j = (j << 1) | (temp & 1);
 			temp >>= 1;
 		}
 		br[j] = *(ipr + k);
 		bi[k] = 0;
 	}
 	//first stage
 	for (k = 0; k < 256; k += 2)
 	{
 		r = br[k];
 		i = bi[k];
 		r1 = br[k + 1];
 		i1 = bi[k + 1];
 		br[k] = r + r1;
 		bi[k] = i + i1;
 		br[k + 1] = r - r1;
 		bi[k + 1] = i - i1;
 	}
 	//second stage
 	for (k = 0; k < 256; k+=4)
 	{
 		for (j = 0; j < 2; j++)
 		{
 			r = br[k+j];
 			i = bi[k+j];
 			r1 = br[k + j + 2];
 			i1 = bi[k + j + 2];
 			br[k + j] = r + ((r1 * tr[64 * j]) - (i1 * ti[64 * j]));
 			bi[k + j] = i + ((r1 * ti[64 * j]) + (i1 * tr[64 * j]));
 			br[k + j + 2] = r - ((r1 * tr[64 * j]) - (i1 * ti[64 * j]));
 			bi[k + j + 2] = i - ((r1 * ti[64 * j]) + (i1 * tr[64 * j]));

 		}
 	}
 	//third stage
 	for (k = 0; k < 256; k += 8)
 	{
 		for (j = 0; j < 4; j++)
 		{
 			r = br[k + j];
 			i = bi[k + j];
 			r1 = br[k + j + 4];
 			i1 = bi[k + j + 4];
 			br[k + j] = r + ((r1 * tr[32 * j]) - (i1 * ti[32 * j]));
 			bi[k + j] = i + ((r1 * ti[32 * j]) + (i1 * tr[32 * j]));
 			br[k + j + 4] = r - ((r1 * tr[32 * j]) - (i1 * ti[32 * j]));
 			bi[k + j + 4] = i - ((r1 * ti[32 * j]) + (i1 * tr[32 * j]));

 		}
 	}
 	//fourth stage
 	for (k = 0; k < 256; k += 16)
 	{
 		for (j = 0; j < 8; j++)
 		{
 			r = br[k + j];
 			i = bi[k + j];
 			r1 = br[k + j + 8];
 			i1 = bi[k + j + 8];
 			br[k + j] = r + ((r1 * tr[16 * j]) - (i1 * ti[16 * j]));
 			bi[k + j] = i + ((r1 * ti[16 * j]) + (i1 * tr[16 * j]));
 			br[k + j + 8] = r - ((r1 * tr[16 * j]) - (i1 * ti[16 * j]));
 			bi[k + j + 8] = i - ((r1 * ti[16 * j]) + (i1 * tr[16 * j]));

 		}
 	}
 	//fifth stage
 	for (k = 0; k < 256; k += 32)
 	{
 		for (j = 0; j < 16; j++)
 		{
 			r = br[k + j];
 			i = bi[k + j];
 			r1 = br[k + j + 16];
 			i1 = bi[k + j + 16];
 			br[k + j] = r + ((r1 * tr[8 * j]) - (i1 * ti[8 * j]));
 			bi[k + j] = i + ((r1 * ti[8 * j]) + (i1 * tr[8 * j]));
 			br[k + j + 16] = r - ((r1 * tr[8 * j]) - (i1 * ti[8 * j]));
 			bi[k + j + 16] = i - ((r1 * ti[8 * j]) + (i1 * tr[8 * j]));

 		}
 	}
 	//sixth stage
 	for (k = 0; k < 256; k += 64)
 	{
 		for (j = 0; j < 32; j++)
 		{
 			r = br[k + j];
 			i = bi[k + j];
 			r1 = br[k + j + 32];
 			i1 = bi[k + j + 32];
 			br[k + j] = r + ((r1 * tr[4 * j]) - (i1 * ti[4 * j]));
 			bi[k + j] = i + ((r1 * ti[4 * j]) + (i1 * tr[4 * j]));
 			br[k + j + 32] = r - ((r1 * tr[4 * j]) - (i1 * ti[4 * j]));
 			bi[k + j + 32] = i - ((r1 * ti[4 * j]) + (i1 * tr[4 * j]));

 		}
 	}
 	//seventh stage
 	for (k = 0; k < 256; k += 128)
 	{
 		for (j = 0; j < 64; j++)
 		{
 			r = br[k + j];
 			i = bi[k + j];
 			r1 = br[k + j + 64];
 			i1 = bi[k + j + 64];
 			br[k + j] = r + ((r1 * tr[2 * j]) - (i1 * ti[2 * j]));
 			bi[k + j] = i + ((r1 * ti[2 * j]) + (i1 * tr[2 * j]));
 			br[k + j + 64] = r - ((r1 * tr[2 * j]) - (i1 * ti[2 * j]));
 			bi[k + j + 64] = i - ((r1 * ti[2 * j]) + (i1 * tr[2 * j]));
 		}
 	}
 	//eight stage
 	for (k = 0; k < 256; k += 256)
 	{
 		for (j = 0; j < 128; j++)
 		{
 			r = br[k + j];
 			i = bi[k + j];
 			r1 = br[k + j + 128];
 			i1 = bi[k + j + 128];
 			br[k + j] = r + ((r1 * tr[j]) - (i1 * ti[j]));
 			bi[k + j] = i + ((r1 * ti[j]) + (i1 * tr[j]));
 			br[k + j + 128] = r - ((r1 * tr[j]) - (i1 * ti[j]));
 			bi[k + j + 128] = i - ((r1 * ti[j]) + (i1 * tr[j]));

 		}
 	}
 	for (k = 0; k < 256; k++)
 	{
 		*(op + k) = sqrt((br[k] * br[k]) + (bi[k] * bi[k]));
 	}
 }
