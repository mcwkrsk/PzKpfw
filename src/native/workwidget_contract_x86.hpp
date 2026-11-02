#pragma once
// Observed x86 layout fragments for the IS-2 host/plugin UI contract.
// This is an evidence header, not a drop-in Qt SDK: opaque regions stay opaque.
#include <cstddef>
#include <cstdint>

namespace is2::abi_x86 {

struct QtQString32 {
    std::uint32_t d_ptr;
};

// IS.exe allocates 0x14 bytes, constructs QColor at +0x04, then stores
// the application-state pointer at +0x00. QColor internals are intentionally opaque.
struct PluginHostContext32 {
    std::uint32_t application_state_ptr; // +0x00
    std::uint8_t qcolor_storage[0x10];   // +0x04; constructed as QColor
};
static_assert(sizeof(PluginHostContext32) == 0x14);
static_assert(offsetof(PluginHostContext32, application_state_ptr) == 0x00);
static_assert(offsetof(PluginHostContext32, qcolor_storage) == 0x04);

// The host uses these offsets in the application-state object. The first eight
// bytes are not named because their purpose has not been recovered yet.
struct AppModelContextPrefix32 {
    std::uint8_t unknown_00_07[0x08];
    std::uint32_t primary_model_facade_ptr;  // +0x08; RTTI/vptr = PrimaryModel
    std::uint32_t concept_model_facade_ptr;  // +0x0C; RTTI/vptr = ConceptModel
};
static_assert(sizeof(AppModelContextPrefix32) == 0x10);
static_assert(offsetof(AppModelContextPrefix32, primary_model_facade_ptr) == 0x08);
static_assert(offsetof(AppModelContextPrefix32, concept_model_facade_ptr) == 0x0C);

// Observed prefix only; WorkWidget is a QWidget-derived polymorphic object
// with additional bases/fields and its complete size varies by plugin.
struct WorkWidgetObservedPrefix32 {
    std::uint8_t unknown_00_1B[0x1C];
    QtQString32 title;                 // +0x1C; copied by host into MenuWidget
    std::uint32_t menu_widget_ptr;     // +0x20; written by IS.exe:0x413DD0
};
static_assert(offsetof(WorkWidgetObservedPrefix32, title) == 0x1C);
static_assert(offsetof(WorkWidgetObservedPrefix32, menu_widget_ptr) == 0x20);
static_assert(sizeof(WorkWidgetObservedPrefix32) == 0x24);

// Allocation/deallocation size observed in all plugin factories/destructors: 0x20.
struct MenuWidgetObserved32 {
    std::uint8_t unknown_00_17[0x18];
    std::uint32_t work_widget_ptr;     // +0x18; written by IS.exe:0x413DD0
    QtQString32 title;                 // +0x1C; constructed by plugin ctor, host copies title
};
static_assert(sizeof(MenuWidgetObserved32) == 0x20);
static_assert(offsetof(MenuWidgetObserved32, work_widget_ptr) == 0x18);
static_assert(offsetof(MenuWidgetObserved32, title) == 0x1C);

inline constexpr std::uint32_t kWorkWidgetCreateMenuWidgetSlot = 0xB4;
inline constexpr std::uint32_t kWorkWidgetSetHostContextSlot = 0xCC;
inline constexpr std::uint32_t kMenuWidgetHostHookSlot = 0xB4;

} // namespace is2::abi_x86
