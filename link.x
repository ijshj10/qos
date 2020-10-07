MEMORY
{ 
    DDR : ORIGIN = 0x100000, LENGTH = 0x3FF00000
    ps7_qspi_linear_0 : ORIGIN = 0xFC000000, LENGTH = 0x1000000
    ps7_ram_0 : ORIGIN = 0x0, LENGTH = 0x30000
    ps7_ram_1 : ORIGIN = 0xFFFF0000, LENGTH = 0xFE00
}

ENTRY(Reset);

EXTERN(RESET_VECTOR);

SECTIONS
{
    .vector_table :
    {
        KEEP(*(.vector_table.reset_vector));
    } > DDR

    .text :
    {
        *(.text .text.*);
    } > DDR

    .rodata : ALIGN(4)
    {
        *(.rodata .rodata.*);
    } > DDR

    .data : ALIGN(4)
    {
        *(.data .data.*);
    } > DDR

    .bss (NOLOAD) : ALIGN(4)
    {
        *(.bss .bss.*);
    } > DDR

    /DISCARD/ :
    {

        *(.ARM.exidx .ARM.exidx.*);
    }
}
