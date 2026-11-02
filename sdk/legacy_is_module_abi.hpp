#pragma once
// Evidence-oriented x86 ABI sketch for the supplied IS-2 beta binaries.
// This header models field widths/offsets only; it is not a loadable Qt SDK.
#include <cstddef>
#include <cstdint>

namespace is2::legacy_abi {

#pragma pack(push, 4)
struct ModuleVTable32 {
    std::uint32_t slot0; // default RET body in the supplied base IsModule vtable
    std::uint32_t slot1; // default RET body; concrete plugins override with widget creation
    std::uint32_t slot2; // pure virtual (_purecall) in the supplied base vtable
};

struct DescriptorRecord32 {
    std::uint32_t field_0_pointer; // points to a static NUL-terminated string
    std::uint32_t field_4_bits;    // observed float32 bit pattern 0x3dcccccd (approximately 0.1f)
    std::uint32_t field_8_pointer; // points to a static NUL-terminated string
};

struct IsModuleObject32 {
    std::uint32_t vtable_pointer;       // +0x00
    std::uint32_t descriptor_pointer;   // +0x04; host writes slot2 return value here
    std::uint32_t qmap_data_pointer;    // +0x08; initialized from QMapDataBase::shared_null
    std::uint32_t qlist_data_pointer;   // +0x0c; initialized from QListData::shared_null
    std::uint8_t opaque_10_to_1b[0x0c]; // +0x10..+0x1b; meaning unknown
};

// Only an observed prefix: fields between the two recovered pointers remain opaque.
struct WorkWidgetObservedPrefix32 {
    std::uint32_t opaque_00_to_17[6]; // +0x00..+0x17
    std::uint32_t owner_module_pointer; // +0x18; written by IS.exe during registration
    std::uint32_t opaque_1c;            // +0x1c
    std::uint32_t menu_widget_pointer;  // +0x20; used by the host's tab-destruction handler
};
#pragma pack(pop)

static_assert(sizeof(ModuleVTable32) == 0x0c);
static_assert(sizeof(DescriptorRecord32) == 0x0c);
static_assert(sizeof(IsModuleObject32) == 0x1c);
static_assert(offsetof(IsModuleObject32, descriptor_pointer) == 0x04);
static_assert(offsetof(IsModuleObject32, qmap_data_pointer) == 0x08);
static_assert(offsetof(IsModuleObject32, qlist_data_pointer) == 0x0c);
static_assert(offsetof(IsModuleObject32, opaque_10_to_1b) == 0x10);
static_assert(sizeof(WorkWidgetObservedPrefix32) == 0x24);
static_assert(offsetof(WorkWidgetObservedPrefix32, owner_module_pointer) == 0x18);
static_assert(offsetof(WorkWidgetObservedPrefix32, menu_widget_pointer) == 0x20);

// ABI calling-convention notation for a 32-bit Windows build. Do not call these
// from a 64-bit process; the function signatures are reconstructed, not runtime-tested.
#if defined(_MSC_VER) && defined(_M_IX86)
#  define IS2_LEGACY_THISCALL __thiscall
#  define IS2_LEGACY_CDECL __cdecl
#elif defined(__GNUC__) && defined(__i386__)
#  define IS2_LEGACY_THISCALL __attribute__((thiscall))
#  define IS2_LEGACY_CDECL __attribute__((cdecl))
#else
#  define IS2_LEGACY_THISCALL
#  define IS2_LEGACY_CDECL
#endif

using Slot0Fn = void (IS2_LEGACY_THISCALL *)(IsModuleObject32* self);
using Slot1Fn = void (IS2_LEGACY_THISCALL *)(IsModuleObject32* self);
using Slot2Fn = DescriptorRecord32* (IS2_LEGACY_THISCALL *)(IsModuleObject32* self);
using LoadModuleExportFn = IsModuleObject32* (IS2_LEGACY_CDECL *)();

#undef IS2_LEGACY_THISCALL
#undef IS2_LEGACY_CDECL

} // namespace is2::legacy_abi
