#pragma once
// Stage 1.8: observed IsModule base/derived vtable contract.
// PE32 x86 / Qt 5.9.1 build family. Evidence header only; not an official SDK.
#include <cstddef>
#include <cstdint>

namespace is2::abi_x86 {

struct IsModuleVTableObserved32 {
    std::uint32_t slot0_post_create_noop; // host calls after slot1; concrete target is RET
    std::uint32_t slot1_create_widgets;   // creates WorkWidget(s), appends raw pointers
    std::uint32_t slot2_get_descriptor;  // returns descriptor-like 12-byte record in EAX
};
static_assert(sizeof(IsModuleVTableObserved32) == 0x0C);
static_assert(offsetof(IsModuleVTableObserved32, slot0_post_create_noop) == 0x00);
static_assert(offsetof(IsModuleVTableObserved32, slot1_create_widgets) == 0x04);
static_assert(offsetof(IsModuleVTableObserved32, slot2_get_descriptor) == 0x08);

// Base IsModule vtable in each of the five supplied binaries:
//   slot0 -> one-byte RET body
//   slot1 -> same one-byte RET body
//   slot2 -> IAT thunk to CRT _purecall
// Therefore slot2 is pure virtual in the observed base class. No virtual
// destructor entry is present in this three-slot table.
inline constexpr bool kBaseSlot0IsRet = true;
inline constexpr bool kBaseSlot1IsRet = true;
inline constexpr bool kBaseSlot2IsPurecall = true;
inline constexpr bool kVirtualDestructorObserved = false;

// This describes only the x86 method-call shapes recovered from IS.exe:
// slot0: thiscall void(this)
// slot1: thiscall void(this)
// slot2: thiscall Descriptor*(this)
// C++ names/signatures beyond these ABI facts remain unconfirmed.
struct IsModuleObserved32;
struct PluginDescriptorObserved32;
using ModuleSlot0Address32 = std::uint32_t;
using ModuleSlot1Address32 = std::uint32_t;
using ModuleSlot2Address32 = std::uint32_t;

} // namespace is2::abi_x86
