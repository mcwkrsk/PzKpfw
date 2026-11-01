#pragma once

// Evidence-only address reference for the supplied PM_auto.dll build.
// These are PE image VAs and field offsets, NOT callable function pointers
// and NOT a production ABI. Never invoke these addresses outside the exact
// original module image and process lifetime.

#include <cstdint>

namespace is2::re::pm_auto::image_x86 {
inline constexpr std::uint32_t kImageBase = 0x10000000u;
inline constexpr std::uint32_t kQObjectConnectImplIat = 0x10022368u;
inline constexpr std::uint32_t kConnectImplStaticCallsiteCount = 17u;

namespace slot_object {
inline constexpr std::uint32_t kMemberFunctionAdapter = 0x1000AE30u;
inline constexpr std::uint32_t kFunctionalDiagramDragged = 0x1000AD00u;
inline constexpr std::uint32_t kFunctionalDiagramClosed = 0x1000AD40u;
inline constexpr std::uint32_t kFunctionalDiagramDoubleClick = 0x1000ADF0u;
inline constexpr std::uint32_t kButtonClick05F00 = 0x1000AB80u;
inline constexpr std::uint32_t kButtonClick063B0 = 0x1000AC20u;
inline constexpr std::uint32_t kButtonClick05890 = 0x1000AAE0u;
inline constexpr std::uint32_t kButtonClick06DC0 = 0x1000ADC0u;
inline constexpr std::uint32_t kTextChanged = 0x1000AB10u;
inline constexpr std::uint32_t kModelDataChanged = 0x1000AB40u;
inline constexpr std::uint32_t kFormalizationCombo = 0x1000AC50u;
inline constexpr std::uint32_t kComboIntForwarder = 0x1000AD80u;
inline constexpr std::uint32_t kPreviousPage = 0x1000AA80u;
inline constexpr std::uint32_t kNextPage = 0x1000ABB0u;
inline constexpr std::uint32_t kCbWithBtnCombo = 0x1001B5A0u;
inline constexpr std::uint32_t kCbWithBtnButton = 0x1001B610u;
} // namespace slot_object

namespace target {
inline constexpr std::uint32_t kDiagramDragged = 0x100064F0u;
inline constexpr std::uint32_t kDiagramClosed = 0x1000DAD0u;
inline constexpr std::uint32_t kDiagramDoubleClick = 0x10006EB0u;
inline constexpr std::uint32_t kModelDataChanged = 0x10005B10u;
inline constexpr std::uint32_t kTextChanged = 0x100059C0u;
inline constexpr std::uint32_t kComboValueChanged = 0x10006BF0u;
inline constexpr std::uint32_t kButtonActionA = 0x10005F00u;
inline constexpr std::uint32_t kButtonActionB = 0x10005890u;
inline constexpr std::uint32_t kButtonActionC = 0x10006DC0u;
inline constexpr std::uint32_t kButtonActionD = 0x100063B0u;
inline constexpr std::uint32_t kAfElementSetFormalizationIat = 0x100220D8u;
inline constexpr std::uint32_t kTabWidgetSetCurrentWidgetIat = 0x100228D0u;
inline constexpr std::uint32_t kComboBoxSetCurrentIndexIat = 0x100227F8u;
} // namespace target

namespace decomposition_widget_offset {
inline constexpr std::uint32_t kButtonNewSequence = 0x7Cu;
inline constexpr std::uint32_t kButtonNewAlternative = 0x6Cu;
inline constexpr std::uint32_t kButtonNewIteration = 0x78u;
inline constexpr std::uint32_t kButtonToElementary = 0x70u;
inline constexpr std::uint32_t kButtonChangeProperties = 0xB8u;
inline constexpr std::uint32_t kButtonInsertBefore = 0x9Cu;
inline constexpr std::uint32_t kButtonInsertAfter = 0x8Cu;
inline constexpr std::uint32_t kButtonDeleteElement = 0x94u;
inline constexpr std::uint32_t kButtonDecomposeToList = 0xA8u;
inline constexpr std::uint32_t kButtonDeleteList = 0x90u;
inline constexpr std::uint32_t kButtonPressedFieldA = 0x58u;
inline constexpr std::uint32_t kButtonPressedFieldB = 0x54u;
} // namespace decomposition_widget_offset

namespace cb_with_btn_offset {
inline constexpr std::uint32_t kComboBox = 0x1Cu;
inline constexpr std::uint32_t kButton = 0x20u;
inline constexpr std::uint32_t kSelectedValue = 0x24u;
inline constexpr std::uint32_t kOwnerForCombo = 0x4Cu;
inline constexpr std::uint32_t kOwnerForButton = 0x74u;
} // namespace cb_with_btn_offset

} // namespace is2::re::pm_auto::image_x86
