#pragma once

// Evidence-only offsets recovered from the supplied PM_auto.dll build.
// These constants are reference data, NOT a complete C++ object layout and
// must not be used to dereference objects without a separately validated ABI.
#include <array>
#include <cstdint>

namespace is2::observed::pm_auto {

inline constexpr std::uint32_t kDecompositionContextOffset = 0x02C;
inline constexpr std::uint32_t kSelectedAFElementOffset = 0x038;

inline constexpr std::uint32_t kFirstItemModelOffset = 0x120;
inline constexpr std::uint32_t kSecondItemModelOffset = 0x128;
inline constexpr std::uint32_t kFirstElementIndexOffset = 0x140;
inline constexpr std::uint32_t kSecondElementIndexOffset = 0x144;
inline constexpr std::uint32_t kPropertiesPanelOffset = 0x100;

inline constexpr std::uint32_t kDiagramBlockAFElementOffset = 0x1D0;
inline constexpr std::uint32_t kDiagramBlockNestedViewOffset = 0x1C4;
inline constexpr std::uint32_t kDiagramBlockParentViewOffset = 0x1D8;
inline constexpr std::uint32_t kDiagramBlockNestedFlagOffset = 0x1C1;

struct ContextEnablement final {
    std::uint32_t context;
    std::array<std::uint32_t, 4> widget_offsets;
};

inline constexpr std::array<ContextEnablement, 4> kContextEnablement{{
    {1, {0x070, 0x078, 0x06C, 0x0A0}},
    {2, {0x07C, 0x078, 0x06C, 0x0A0}},
    {3, {0x070, 0x07C, 0x078, 0x0A0}},
    {4, {0x070, 0x07C, 0x06C, 0x0A0}},
}};

inline constexpr std::array<std::uint32_t, 3> kAlwaysEnabledWidgetOffsets{{
    0x058, 0x054, 0x0B8
}};

static_assert(kDecompositionContextOffset == 0x02C);
static_assert(kFirstItemModelOffset != kSecondItemModelOffset);
static_assert(kFirstElementIndexOffset != kSecondElementIndexOffset);
static_assert(kContextEnablement.size() == 4);

} // namespace is2::observed::pm_auto
