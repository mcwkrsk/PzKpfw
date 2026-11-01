#include "src/native/is_module_contract_x86.hpp"
#include <cstddef>
#include <cstdint>

int main() {
    using namespace is2::abi_x86;
    PluginDescriptorObserved32 descriptor{};
    IsModuleObserved32 module{};
    descriptor.field_0_cstr_ptr = 0x10001000u;
    descriptor.field_4_float = 0.1f;
    descriptor.field_8_cstr_ptr = 0x10002000u;
    module.vftable_ptr = 0x10003000u;
    module.descriptor_ptr = 0x10004000u;
    module.qmap_data_ptr = 0x10005000u;
    module.qlist_data_ptr = 0x10006000u;
    if (sizeof(descriptor) != 12 || sizeof(module) != 28) return 1;
    if (offsetof(IsModuleObserved32, qlist_data_ptr) != 12) return 2;
    if (descriptor.field_4_float < 0.099f || descriptor.field_4_float > 0.101f) return 3;
    return 0;
}
