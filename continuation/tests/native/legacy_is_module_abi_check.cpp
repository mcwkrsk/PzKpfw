#include "../../sdk/legacy_is_module_abi.hpp"
int main() {
    is2::legacy_abi::IsModuleObject32 module{};
    is2::legacy_abi::DescriptorRecord32 descriptor{};
    is2::legacy_abi::WorkWidgetObservedPrefix32 widget{};
    module.opaque_10_to_1b[0] = 0;
    module.qlist_data_pointer = 3U;
    descriptor.field_4_bits = 0x3dcccccdU;
    widget.owner_module_pointer = 1U;
    widget.menu_widget_pointer = 2U;
    return (module.qlist_data_pointer == 3U &&
            descriptor.field_4_bits == 0x3dcccccdU &&
            widget.owner_module_pointer == 1U &&
            widget.menu_widget_pointer == 2U) ? 0 : 1;
}
