/****************************************************************************/
/*  C6678.cmd                                                               */
/*  Copyright (c) 2011 Texas Instruments Incorporated                       */
/*  Author: Rafael de Souza                                                 */
/*                                                                          */
/*    Description: This file is a sample linker command file that can be    */
/*                 used for linking programs built with the C compiler and  */
/*                 running the resulting .out file on an C6678              */
/*                 device.  Use it as a guideline.  You will want to        */
/*                 change the memory layout to match your specific C6xxx    */
/*                 target system.  You may want to change the allocation    */
/*                 scheme according to the size of your program.            */
/*                                                                          */
/*    Usage:       The map below divides the external memory in segments    */
/*                 Use the linker option --define=COREn=1                   */
/*                 Where n is the core number.                              */
/*                                                                          */
/****************************************************************************/

MEMORY
{
    SHRAM:           o = 0x0C000000 l = 0x00400000   /* 4MB Multicore shared Memmory */
  
    CORE0_L2_SRAM:   o = 0x10800000 l = 0x00080000   /* 512kB CORE0 L2/SRAM */
    CORE0_L1P_SRAM:  o = 0x10E00000 l = 0x00008000   /* 32kB CORE0 L1P/SRAM */
    CORE0_L1D_SRAM:  o = 0x10F00000 l = 0x00008000   /* 32kB CORE0 L1D/SRAM */
  
    CORE1_L2_SRAM:   o = 0x11800000 l = 0x00080000   /* 512kB CORE1 L2/SRAM */
    CORE1_L1P_SRAM:  o = 0x11E00000 l = 0x00008000   /* 32kB CORE1 L1P/SRAM */
    CORE1_L1D_SRAM:  o = 0x11F00000 l = 0x00008000   /* 32kB CORE1 L1D/SRAM */
  
    CORE2_L2_SRAM:   o = 0x12800000 l = 0x00080000   /* 512kB CORE2 L2/SRAM */
    CORE2_L1P_SRAM:  o = 0x12E00000 l = 0x00008000   /* 32kB CORE2 L1P/SRAM */
    CORE2_L1D_SRAM:  o = 0x12F00000 l = 0x00008000   /* 32kB CORE2 L1D/SRAM */
  
    CORE3_L2_SRAM:   o = 0x13800000 l = 0x00080000   /* 512kB CORE3 L2/SRAM */
    CORE3_L1P_SRAM:  o = 0x13E00000 l = 0x00008000   /* 32kB CORE3 L1P/SRAM */
    CORE3_L1D_SRAM:  o = 0x13F00000 l = 0x00008000   /* 32kB CORE3 L1D/SRAM */
  
    CORE4_L2_SRAM:   o = 0x14800000 l = 0x00080000   /* 512kB CORE4 L2/SRAM */
    CORE4_L1P_SRAM:  o = 0x14E00000 l = 0x00008000   /* 32kB CORE4 L1P/SRAM */
    CORE4_L1D_SRAM:  o = 0x14F00000 l = 0x00008000   /* 32kB CORE4 L1D/SRAM */
  
    CORE5_L2_SRAM:   o = 0x15800000 l = 0x00080000   /* 512kB CORE5 L2/SRAM */
    CORE5_L1P_SRAM:  o = 0x15E00000 l = 0x00008000   /* 32kB CORE5 L1P/SRAM */
    CORE5_L1D_SRAM:  o = 0x15F00000 l = 0x00008000   /* 32kB CORE5 L1D/SRAM */
    
    CORE6_L2_SRAM:   o = 0x16800000 l = 0x00080000   /* 512kB CORE6 L2/SRAM */
    CORE6_L1P_SRAM:  o = 0x16E00000 l = 0x00008000   /* 32kB CORE6 L1P/SRAM */
    CORE6_L1D_SRAM:  o = 0x16F00000 l = 0x00008000   /* 32kB CORE6 L1D/SRAM */
  
    CORE7_L2_SRAM:   o = 0x17800000 l = 0x00080000   /* 512kB CORE7 L2/SRAM */
    CORE7_L1P_SRAM:  o = 0x17E00000 l = 0x00008000   /* 32kB CORE7 L1P/SRAM */
    CORE7_L1D_SRAM:  o = 0x17F00000 l = 0x00008000   /* 32kB CORE7 L1D/SRAM */
  
    EMIF16_CS2:      o = 0x70000000 l = 0x04000000   /* 64MB EMIF16 CS2 Data Memory */
    EMIF16_CS3:      o = 0x74000000 l = 0x04000000   /* 64MB EMIF16 CS3 Data Memory */
    EMIF16_CS4:      o = 0x78000000 l = 0x04000000   /* 64MB EMIF16 CS4 Data Memory */
    EMIF16_CS5:      o = 0x7C000000 l = 0x04000000   /* 64MB EMIF16 CS5 Data Memory */
  
    CORE0_DDR3:      o = 0x80000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE0 */
    CORE1_DDR3:      o = 0x90000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE1 */  
    CORE2_DDR3:      o = 0xA0000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE2 */  
    CORE3_DDR3:      o = 0xB0000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE3 */  
    CORE4_DDR3:      o = 0xC0000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE4 */  
    CORE5_DDR3:      o = 0xD0000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE5 */  
    CORE6_DDR3:      o = 0xE0000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE6 */  
    CORE7_DDR3:      o = 0xF0000000 l = 0x10000000   /* 256MB DDR3 SDRAM for CORE7 */  
}
 
SECTIONS
{
#ifdef CORE0
    .text          >  CORE0_L2_SRAM
    .stack         >  CORE0_L2_SRAM
    .bss           >  CORE0_L2_SRAM
    .cio           >  CORE0_L2_SRAM
    .const         >  CORE0_L2_SRAM
    .data          >  CORE0_L2_SRAM
    .switch        >  CORE0_L2_SRAM
    .sysmem        >  CORE0_L2_SRAM
    .far           >  CORE0_L2_SRAM
    .args          >  CORE0_L2_SRAM
    .ppinfo        >  CORE0_L2_SRAM
    .ppdata        >  CORE0_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE0_L2_SRAM
    .cinit         >  CORE0_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE0_L2_SRAM
    .init_array    >  CORE0_L2_SRAM
    .neardata      >  CORE0_L2_SRAM
    .fardata       >  CORE0_L2_SRAM
    .rodata        >  CORE0_L2_SRAM
    .c6xabi.exidx  >  CORE0_L2_SRAM
    .c6xabi.extab  >  CORE0_L2_SRAM
#endif

#ifdef CORE1
    .text          >  CORE1_L2_SRAM
    .stack         >  CORE1_L2_SRAM
    .bss           >  CORE1_L2_SRAM
    .cio           >  CORE1_L2_SRAM
    .const         >  CORE1_L2_SRAM
    .data          >  CORE1_L2_SRAM
    .switch        >  CORE1_L2_SRAM
    .sysmem        >  CORE1_L2_SRAM
    .far           >  CORE1_L2_SRAM
    .args          >  CORE1_L2_SRAM
    .ppinfo        >  CORE1_L2_SRAM
    .ppdata        >  CORE1_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE1_L2_SRAM
    .cinit         >  CORE1_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE1_L2_SRAM
    .init_array    >  CORE1_L2_SRAM
    .neardata      >  CORE1_L2_SRAM
    .fardata       >  CORE1_L2_SRAM
    .rodata        >  CORE1_L2_SRAM
    .c6xabi.exidx  >  CORE1_L2_SRAM
    .c6xabi.extab  >  CORE1_L2_SRAM
#endif

#ifdef CORE2
    .text          >  CORE2_L2_SRAM
    .stack         >  CORE2_L2_SRAM
    .bss           >  CORE2_L2_SRAM
    .cio           >  CORE2_L2_SRAM
    .const         >  CORE2_L2_SRAM
    .data          >  CORE2_L2_SRAM
    .switch        >  CORE2_L2_SRAM
    .sysmem        >  CORE2_L2_SRAM
    .far           >  CORE2_L2_SRAM
    .args          >  CORE2_L2_SRAM
    .ppinfo        >  CORE2_L2_SRAM
    .ppdata        >  CORE2_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE2_L2_SRAM
    .cinit         >  CORE2_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE2_L2_SRAM
    .init_array    >  CORE2_L2_SRAM
    .neardata      >  CORE2_L2_SRAM
    .fardata       >  CORE2_L2_SRAM
    .rodata        >  CORE2_L2_SRAM
    .c6xabi.exidx  >  CORE2_L2_SRAM
    .c6xabi.extab  >  CORE2_L2_SRAM
#endif

#ifdef CORE3
    .text          >  CORE3_L2_SRAM
    .stack         >  CORE3_L2_SRAM
    .bss           >  CORE3_L2_SRAM
    .cio           >  CORE3_L2_SRAM
    .const         >  CORE3_L2_SRAM
    .data          >  CORE3_L2_SRAM
    .switch        >  CORE3_L2_SRAM
    .sysmem        >  CORE3_L2_SRAM
    .far           >  CORE3_L2_SRAM
    .args          >  CORE3_L2_SRAM
    .ppinfo        >  CORE3_L2_SRAM
    .ppdata        >  CORE3_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE3_L2_SRAM
    .cinit         >  CORE3_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE3_L2_SRAM
    .init_array    >  CORE3_L2_SRAM
    .neardata      >  CORE3_L2_SRAM
    .fardata       >  CORE3_L2_SRAM
    .rodata        >  CORE3_L2_SRAM
    .c6xabi.exidx  >  CORE3_L2_SRAM
    .c6xabi.extab  >  CORE3_L2_SRAM
#endif

#ifdef CORE4
    .text          >  CORE4_L2_SRAM
    .stack         >  CORE4_L2_SRAM
    .bss           >  CORE4_L2_SRAM
    .cio           >  CORE4_L2_SRAM
    .const         >  CORE4_L2_SRAM
    .data          >  CORE4_L2_SRAM
    .switch        >  CORE4_L2_SRAM
    .sysmem        >  CORE4_L2_SRAM
    .far           >  CORE4_L2_SRAM
    .args          >  CORE4_L2_SRAM
    .ppinfo        >  CORE4_L2_SRAM
    .ppdata        >  CORE4_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE4_L2_SRAM
    .cinit         >  CORE4_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE4_L2_SRAM
    .init_array    >  CORE4_L2_SRAM
    .neardata      >  CORE4_L2_SRAM
    .fardata       >  CORE4_L2_SRAM
    .rodata        >  CORE4_L2_SRAM
    .c6xabi.exidx  >  CORE4_L2_SRAM
    .c6xabi.extab  >  CORE4_L2_SRAM
#endif

#ifdef CORE5
    .text          >  CORE5_L2_SRAM
    .stack         >  CORE5_L2_SRAM
    .bss           >  CORE5_L2_SRAM
    .cio           >  CORE5_L2_SRAM
    .const         >  CORE5_L2_SRAM
    .data          >  CORE5_L2_SRAM
    .switch        >  CORE5_L2_SRAM
    .sysmem        >  CORE5_L2_SRAM
    .far           >  CORE5_L2_SRAM
    .args          >  CORE5_L2_SRAM
    .ppinfo        >  CORE5_L2_SRAM
    .ppdata        >  CORE5_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE5_L2_SRAM
    .cinit         >  CORE5_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE5_L2_SRAM
    .init_array    >  CORE5_L2_SRAM
    .neardata      >  CORE5_L2_SRAM
    .fardata       >  CORE5_L2_SRAM
    .rodata        >  CORE5_L2_SRAM
    .c6xabi.exidx  >  CORE5_L2_SRAM
    .c6xabi.extab  >  CORE5_L2_SRAM
#endif

#ifdef CORE6
    .text          >  CORE6_L2_SRAM
    .stack         >  CORE6_L2_SRAM
    .bss           >  CORE6_L2_SRAM
    .cio           >  CORE6_L2_SRAM
    .const         >  CORE6_L2_SRAM
    .data          >  CORE6_L2_SRAM
    .switch        >  CORE6_L2_SRAM
    .sysmem        >  CORE6_L2_SRAM
    .far           >  CORE6_L2_SRAM
    .args          >  CORE6_L2_SRAM
    .ppinfo        >  CORE6_L2_SRAM
    .ppdata        >  CORE6_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE6_L2_SRAM
    .cinit         >  CORE6_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE6_L2_SRAM
    .init_array    >  CORE6_L2_SRAM
    .neardata      >  CORE6_L2_SRAM
    .fardata       >  CORE6_L2_SRAM
    .rodata        >  CORE6_L2_SRAM
    .c6xabi.exidx  >  CORE6_L2_SRAM
    .c6xabi.extab  >  CORE6_L2_SRAM
#endif

#ifdef CORE7
    .text          >  CORE7_L2_SRAM
    .stack         >  CORE7_L2_SRAM
    .bss           >  CORE7_L2_SRAM
    .cio           >  CORE7_L2_SRAM
    .const         >  CORE7_L2_SRAM
    .data          >  CORE7_L2_SRAM
    .switch        >  CORE7_L2_SRAM
    .sysmem        >  CORE7_L2_SRAM
    .far           >  CORE7_L2_SRAM
    .args          >  CORE7_L2_SRAM
    .ppinfo        >  CORE7_L2_SRAM
    .ppdata        >  CORE7_L2_SRAM
  
    /* COFF sections */
    .pinit         >  CORE7_L2_SRAM
    .cinit         >  CORE7_L2_SRAM
  
    /* EABI sections */
    .binit         >  CORE7_L2_SRAM
    .init_array    >  CORE7_L2_SRAM
    .neardata      >  CORE7_L2_SRAM
    .fardata       >  CORE7_L2_SRAM
    .rodata        >  CORE7_L2_SRAM
    .c6xabi.exidx  >  CORE7_L2_SRAM
    .c6xabi.extab  >  CORE7_L2_SRAM
#endif
}
