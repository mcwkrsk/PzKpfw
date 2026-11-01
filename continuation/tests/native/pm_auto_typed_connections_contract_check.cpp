#include "sdk/pm_auto_typed_connections_x86.hpp"

#include <cstdint>

using namespace is2::re::pm_auto::image_x86;

static_assert(kQObjectConnectImplIat == 0x10022368u);
static_assert(kConnectImplStaticCallsiteCount == 17u);
static_assert(slot_object::kMemberFunctionAdapter == 0x1000ae30u);
static_assert(slot_object::kFunctionalDiagramDragged == 0x1000ad00u);
static_assert(target::kAfElementSetFormalizationIat == 0x100220d8u);
static_assert(decomposition_widget_offset::kButtonNewSequence == 0x7cu);
static_assert(cb_with_btn_offset::kSelectedValue == 0x24u);

int main() {
    // VAs and offsets are stored as 32-bit evidence values, not native pointers.
    const std::uint32_t adapter = slot_object::kMemberFunctionAdapter;
    const std::uint32_t formalization = target::kAfElementSetFormalizationIat;
    return (adapter != 0u && formalization != 0u) ? 0 : 1;
}
