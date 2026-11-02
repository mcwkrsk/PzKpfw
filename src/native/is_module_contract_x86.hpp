#pragma once
// Static evidence model for IS-2's IsModule ABI (PE32/x86, Qt 5.9.1).
// These are wire/layout observations, NOT drop-in Qt declarations or an official SDK.
#include <cstddef>
#include <cstdint>

namespace is2::abi_x86 {

// The descriptor factory in each of the five supplied plugin DLLs allocates
// exactly 0x0c bytes and writes {pointer, float32, pointer}.
struct PluginDescriptorObserved32 {
    std::uint32_t field_0_cstr_ptr; // +0x00; points to static NUL-terminated text
    float field_4_float;            // +0x04; observed bit pattern 0x3DCCCCCD (~0.1f)
    std::uint32_t field_8_cstr_ptr; // +0x08; points to static NUL-terminated text
};
static_assert(sizeof(PluginDescriptorObserved32) == 0x0C);
static_assert(offsetof(PluginDescriptorObserved32, field_0_cstr_ptr) == 0x00);
static_assert(offsetof(PluginDescriptorObserved32, field_4_float) == 0x04);
static_assert(offsetof(PluginDescriptorObserved32, field_8_cstr_ptr) == 0x08);

// Object allocated by each exported loadModule() factory (operator new(0x1c)).
// The first four members are supported by direct host/plugin disassembly and
// imported Qt globals. Bytes +0x10..+0x1b are intentionally opaque.
struct IsModuleObserved32 {
    std::uint32_t vftable_ptr;          // +0x00; derived three-slot table
    std::uint32_t descriptor_ptr;       // +0x04; host stores virtual slot[2] result
    std::uint32_t qmap_data_ptr;        // +0x08; initialized from Qt QMapDataBase::shared_null
    std::uint32_t qlist_data_ptr;       // +0x0c; initialized from Qt QListData::shared_null
    std::uint8_t opaque_10_1b[0x0c];    // +0x10..+0x1b; no semantics assigned
};
static_assert(sizeof(IsModuleObserved32) == 0x1C);
static_assert(offsetof(IsModuleObserved32, vftable_ptr) == 0x00);
static_assert(offsetof(IsModuleObserved32, descriptor_ptr) == 0x04);
static_assert(offsetof(IsModuleObserved32, qmap_data_ptr) == 0x08);
static_assert(offsetof(IsModuleObserved32, qlist_data_ptr) == 0x0C);
static_assert(offsetof(IsModuleObserved32, opaque_10_1b) == 0x10);

inline constexpr std::uint32_t kIsModuleSlot0Offset = 0x00;
inline constexpr std::uint32_t kIsModuleCreateWidgetsSlotOffset = 0x04;
inline constexpr std::uint32_t kIsModuleGetDescriptorSlotOffset = 0x08;
inline constexpr std::uint32_t kIsModuleWidgetListOffset = 0x0C;

} // namespace is2::abi_x86
