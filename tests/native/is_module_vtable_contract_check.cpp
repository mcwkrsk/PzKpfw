#include "../../src/native/is_module_vtable_contract_x86.hpp"
#include "../../src/native/is_module_contract_x86.hpp"
#include <cassert>
#include <cstdint>
int main() {
    using namespace is2::abi_x86;
    IsModuleVTableObserved32 vt{0x10001000u, 0x10002000u, 0x10003000u};
    assert(sizeof(vt) == 12);
    assert(vt.slot0_post_create_noop == 0x10001000u);
    assert(vt.slot1_create_widgets == 0x10002000u);
    assert(vt.slot2_get_descriptor == 0x10003000u);
    assert(kBaseSlot0IsRet && kBaseSlot1IsRet && kBaseSlot2IsPurecall);
    assert(!kVirtualDestructorObserved);
    IsModuleObserved32 module{};
    assert(sizeof(module) == 0x1c);
    return 0;
}
