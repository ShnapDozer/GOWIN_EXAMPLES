// **************************************************************************************
// *
// 		(C) COPYRIGHT 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// *
// * File Name		:	startup_GOWIN_M3.s
// * Author			:	Embedded Development Team
// * Version		:	V1.0.0
// * Date			:	2020-4-1 09:00:00
// * Description	:	Gowin_EMPU_M3 Devices vector table for GCC toolchain
// *                    Should use with GNU GCC Tools for Gowin_EMPU_M3
// *					This module performs:
// *					- Set the initial SP
// *					- Set the initial PC == Reset_Handler
// *					- Set the vector table entries with exceptions ISR address
// *					- Configure the system clock
// *					- Branches to __main in the C library(which eventually calls main())
// *					After Reset the Cortex-M3 processor is in Thread mode,
// *					priority is Privileged and the Stach is set to Main
// *
// * <<< Use Configuration Wizard in Context Menu >>>
// *
// ****************************************************************************************


    .syntax unified
    .arch armv7-m

    .section .stack
    .align 3

//
// <h> Stack Configuration
//   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
//

    .section .stack
    .align 3
#ifdef __STACK_SIZE
    .equ    Stack_Size, __STACK_SIZE
#else
    .equ    Stack_Size, 0x1000
#endif
    .globl    __StackTop
    .globl    __StackLimit
__StackLimit:
    .space    Stack_Size
    .size __StackLimit, . - __StackLimit
__StackTop:
    .size __StackTop, . - __StackTop


//
// <h> Heap Configuration
//   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
//

    .section .heap
    .align 3
#ifdef __HEAP_SIZE
    .equ    Heap_Size, __HEAP_SIZE
#else
    .equ    Heap_Size, 0x1000
#endif
    .globl    __HeapBase
    .globl    __HeapLimit
__HeapBase:
    .if    Heap_Size
    .space    Heap_Size
    .endif
    .size __HeapBase, . - __HeapBase
__HeapLimit:
    .size __HeapLimit, . - __HeapLimit


// Vector Table

    .section .isr_vector
    .align 2
    .globl __isr_vector
__isr_vector:
    .long   __StackTop                  // Top of Stack
    .long   Reset_Handler               // Reset Handler
    .long   NMI_Handler                 // NMI Handler
    .long   HardFault_Handler           // Hard Fault Handler
    .long   MemManage_Handler           // MPU Fault Handler
    .long   BusFault_Handler            // Bus Fault Handler
    .long   UsageFault_Handler          // Usage Fault Handler
    .long   0                           // Reserved
    .long   0                           // Reserved
    .long   0                           // Reserved
    .long   0                           // Reserved
    .long   SVC_Handler                 // SVCall Handler
    .long   DebugMon_Handler            // Debug Monitor Handler
    .long   0                           // Reserved
    .long   PendSV_Handler              // PendSV Handler
    .long   SysTick_Handler             // SysTick Handler

    //External Interrupts
    .long   UART0_Handler               // 16+ 0: UART 0 RX and TX Handler
    .long   UART1_Handler               // 16+ 1: UART 1 RX and TX Handler
    .long   TIMER0_Handler              // 16+ 2: Timer0 Handler
    .long   TIMER1_Handler              // 16+ 3: Timer1 Handler
    .long   GPIO0_Handler               // 16+ 4: GPIO0 Pin0~15 Combined Handler
    .long   UARTOVF_Handler             // 16+ 5: UART0/1 Overflow Handler
    .long   RTC_Handler                 // 16+ 6: RTC Handler
    .long   I2C_Handler                 // 16+ 7: I2C Handler
    .long   Interrupt8_Handler          // 16+ 8: Reserved
    .long   ENT_Handler                 // 16+ 9: Ethernet Handler
    .long   Interrupt10_Handler         // 16+10: Reserved
    .long   Interrupt11_Handler         // 16+11: Reserved
    .long   Interrupt12_Handler         // 16+12: Reserved
    .long   Interrupt13_Handler         // 16+13: Reserved
    .long   Interrupt14_Handler         // 16+14: Reserved
    .long   Interrupt15_Handler         // 16+15: Reserved
    .long   GPIO0_0_Handler             // 16+16: GPIO Port 0 pin 0 Handler
    .long   GPIO0_1_Handler             // 16+17: GPIO Port 0 pin 1 Handler
    .long   GPIO0_2_Handler             // 16+18: GPIO Port 0 pin 2 Handler
    .long   GPIO0_3_Handler             // 16+19: GPIO Port 0 pin 3 Handler
    .long   GPIO0_4_Handler             // 16+20: GPIO Port 0 pin 4 Handler
    .long   GPIO0_5_Handler             // 16+21: GPIO Port 0 pin 5 Handler
    .long   GPIO0_6_Handler             // 16+22: GPIO Port 0 pin 6 Handler
    .long   GPIO0_7_Handler             // 16+23: GPIO Port 0 pin 7 Handler
    .long   GPIO0_8_Handler             // 16+24: GPIO Port 0 pin 8 Handler
    .long   GPIO0_9_Handler             // 16+25: GPIO Port 0 pin 9 Handler
    .long   GPIO0_10_Handler            // 16+26: GPIO Port 0 pin 10 Handler
    .long   GPIO0_11_Handler            // 16+27: GPIO Port 0 pin 11 Handler
    .long   GPIO0_12_Handler            // 16+28: GPIO Port 0 pin 12 Handler
    .long   GPIO0_13_Handler            // 16+29: GPIO Port 0 pin 13 Handler
    .long   GPIO0_14_Handler            // 16+30: GPIO Port 0 pin 14 Handler
    .long   GPIO0_15_Handler            // 16+31: GPIO Port 0 pin 15 Handler
    .long   USER_INT0_Handler           // 16+32: Extended User Interrupt 0 Handler
    .long   USER_INT1_Handler           // 16+33: Extended User Interrupt 1 Handler
    .long   USER_INT2_Handler           // 16+34: Extended User Interrupt 2 Handler
    .long   USER_INT3_Handler           // 16+35: Extended User Interrupt 3 Handler
    .long   USER_INT4_Handler           // 16+36: Extended User Interrupt 4 Handler
    .long   USER_INT5_Handler           // 16+37: Extended User Interrupt 5 Handler
    .long   USER_INT6_Handler           // 16+38: Extended User Interrupt 6 Handler
    .long   USER_INT7_Handler           // 16+39: Extended User Interrupt 7 Handler
    .long   USER_INT8_Handler           // 16+40: Extended User Interrupt 8 Handler
    .long   USER_INT9_Handler           // 16+41: Extended User Interrupt 9 Handler
    .long   USER_INT10_Handler          // 16+42: Extended User Interrupt 10 Handler
    .long   USER_INT11_Handler          // 16+43: Extended User Interrupt 11 Handler
    .long   USER_INT12_Handler          // 16+44: Extended User Interrupt 12 Handler
    .long   USER_INT13_Handler          // 16+45: Extended User Interrupt 13 Handler
    .long   USER_INT14_Handler          // 16+46: Extended User Interrupt 14 Handler
    .long   USER_INT15_Handler          // 16+47: Extended User Interrupt 15 Handler

    .size    __isr_vector, . - __isr_vector

// Reset Handler
    .text
    .thumb
    .thumb_func
    .align 2
    .globl    Reset_Handler
    .type    Reset_Handler, %function
Reset_Handler:
//    Loop to copy data from read only memory to RAM. The ranges
//      of copy from/to are specified by following symbols evaluated in
//      linker script.
//      __etext: End of code section, i.e., begin of data sections to copy from.
//      __data_start__/__data_end__: RAM address range that data should be
//      copied to. Both must be aligned to 4 bytes boundary.

    ldr    r1, =__etext
    ldr    r2, =__data_start__
    ldr    r3, =__data_end__

    subs    r3, r2
    ble    .LC1
.LC0:
    subs    r3, #4
    ldr    r0, [r1, r3]
    str    r0, [r2, r3]
    bgt    .LC0
.LC1:

#ifdef __STARTUP_CLEAR_BSS
//    This part of work usually is done in C library startup code. Otherwise,
//      define this macro to enable it in this startup.
// 
//      Loop to zero out BSS section, which uses following symbols
//      in linker script:
//       __bss_start__: start of BSS section. Must align to 4
//       __bss_end__: end of BSS section. Must align to 4

    ldr r1, =__bss_start__
    ldr r2, =__bss_end__

    movs    r0, 0
.LC2:
    cmp     r1, r2
    itt    lt
    strlt   r0, [r1], #4
    blt    .LC2
#endif //__STARTUP_CLEAR_BSS

#ifndef __NO_SYSTEM_INIT
    // bl    SystemInit
    ldr     r0,=SystemInit
    blx     r0
#endif

    bl    main
    bl    exit



    .pool
    .size Reset_Handler, . - Reset_Handler

//    Macro to define default handlers. Default handler
//    will be weak symbol and just dead loops. They can be
//    overwritten by other handlers
    .macro    def_default_handler    handler_name
    .align 1
    .thumb_func
    .weak    \handler_name
    .type    \handler_name, %function
\handler_name :
    b    .
    .size    \handler_name, . - \handler_name
    .endm

// System Exception Handlers

    def_default_handler    NMI_Handler
    def_default_handler    HardFault_Handler
    def_default_handler    MemManage_Handler
    def_default_handler    BusFault_Handler
    def_default_handler    UsageFault_Handler
    def_default_handler    SVC_Handler
    def_default_handler    DebugMon_Handler
    def_default_handler    PendSV_Handler
    def_default_handler    SysTick_Handler

// IRQ Handlers

    def_default_handler    UART0_Handler
    def_default_handler    UART1_Handler
    def_default_handler    TIMER0_Handler
    def_default_handler    TIMER1_Handler
    def_default_handler    GPIO0_Handler
    def_default_handler    UARTOVF_Handler
    def_default_handler    RTC_Handler
    def_default_handler    I2C_Handler
    def_default_handler    Interrupt8_Handler
    def_default_handler    ENT_Handler
    def_default_handler    Interrupt10_Handler
    def_default_handler    Interrupt11_Handler
    def_default_handler    Interrupt12_Handler
    def_default_handler    Interrupt13_Handler
    def_default_handler    Interrupt14_Handler
    def_default_handler    Interrupt15_Handler
    def_default_handler    GPIO0_0_Handler
    def_default_handler    GPIO0_1_Handler
    def_default_handler    GPIO0_2_Handler
    def_default_handler    GPIO0_3_Handler
    def_default_handler    GPIO0_4_Handler
    def_default_handler    GPIO0_5_Handler
    def_default_handler    GPIO0_6_Handler
    def_default_handler    GPIO0_7_Handler
    def_default_handler    GPIO0_8_Handler
    def_default_handler    GPIO0_9_Handler
    def_default_handler    GPIO0_10_Handler
    def_default_handler    GPIO0_11_Handler
    def_default_handler    GPIO0_12_Handler
    def_default_handler    GPIO0_13_Handler
    def_default_handler    GPIO0_14_Handler
    def_default_handler    GPIO0_15_Handler
    def_default_handler    USER_INT0_Handler
    def_default_handler    USER_INT1_Handler
    def_default_handler    USER_INT2_Handler
    def_default_handler    USER_INT3_Handler
    def_default_handler    USER_INT4_Handler
    def_default_handler    USER_INT5_Handler
    def_default_handler    USER_INT6_Handler
    def_default_handler    USER_INT7_Handler
    def_default_handler    USER_INT8_Handler
    def_default_handler    USER_INT9_Handler
    def_default_handler    USER_INT10_Handler
    def_default_handler    USER_INT11_Handler
    def_default_handler    USER_INT12_Handler
    def_default_handler    USER_INT13_Handler
    def_default_handler    USER_INT14_Handler
    def_default_handler    USER_INT15_Handler

    //
    // def_default_handler    Default_Handler
    //.weak    DEF_IRQHandler
    //.set    DEF_IRQHandler, Default_Handler

    .end

//*************************GowinSemiconductor*****END OF FILE*********************

