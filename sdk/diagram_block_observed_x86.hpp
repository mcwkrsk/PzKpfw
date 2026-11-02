#pragma once
#include <cstddef>
#include <cstdint>

// Evidence-only prefix for the supplied 32-bit PM_auto.dll build.
// This is NOT a complete DiagramBlock declaration and is not a portable SDK ABI.
struct DiagramBlockObservedPrefix_x86 {
    std::byte opaque_0000_01CF[0x1D0];
    std::uint32_t af_element_va;       // +0x1D0; passed to AFElement methods
    std::uint32_t owner_context_va;    // +0x1D4; identity/list owner, concrete type unresolved
};

static_assert(offsetof(DiagramBlockObservedPrefix_x86, af_element_va) == 0x1D0);
static_assert(offsetof(DiagramBlockObservedPrefix_x86, owner_context_va) == 0x1D4);
static_assert(sizeof(DiagramBlockObservedPrefix_x86) == 0x1D8);
