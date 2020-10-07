#![no_std]
#![no_main]
#![feature(asm)]
#![feature(naked_functions)]

/// For simple panic handling
#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

/// Entry point
/// setup stack pointer (FIX: use linker symbol)
#[no_mangle]
#[naked]
pub extern "C" fn Reset() -> ! {
    // Setup stack
    unsafe { asm!("mov sp, 0x200000"); }



    loop {}
}


#[link_section = ".vector_table.reset_vector"]
#[no_mangle]
pub static RESET_VECTOR: extern "C" fn() -> ! = Reset;
