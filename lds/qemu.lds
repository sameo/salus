OUTPUT_ARCH( "riscv" )

ENTRY( _start )

MEMORY
{
    ram  (wxa) : ORIGIN = 0x80200000, LENGTH = 128M
}

PHDRS
{
    text PT_LOAD;
    data PT_LOAD;
    bss PT_LOAD;
}

SECTIONS
{
    .start : {
        *(.text.start)
    } >ram AT>ram :text

    .text : {
        *(.text.init) *(.text .text.*)
    } >ram AT>ram :text

    PROVIDE(_global_pointer = .);

    .rodata : {
        *(.rodata .rodata.*)
    } >ram AT>ram :text

    .data : {
        . = ALIGN(4096);
        *(.sdata .sdata.*) *(.data .data.*)
    } >ram AT>ram :data

    .bss : {
        *(.sbss .sbss.*) *(.bss .bss.*)
        PROVIDE(_bss_end = .);
    } >ram AT>ram :bss

    PROVIDE(_stack_start = _bss_end);
    PROVIDE(_stack_end = _stack_start + 0x80000);

    /DISCARD/ : {
        *(.eh_frame)
    }
}
