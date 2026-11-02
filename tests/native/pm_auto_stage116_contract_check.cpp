#include "sdk/pm_auto_view_projection_x86.hpp"

int main() {
    using namespace is2::observed::pm_auto;
    if (kDecompositionContextOffset != 0x2C) return 1;
    if (kFirstItemModelOffset != 0x120 || kSecondItemModelOffset != 0x128) return 2;
    if (kFirstElementIndexOffset != 0x140 || kSecondElementIndexOffset != 0x144) return 3;
    if (kContextEnablement[0].context != 1 || kContextEnablement[0].widget_offsets[0] != 0x70) return 4;
    if (kContextEnablement[1].context != 2 || kContextEnablement[1].widget_offsets[0] != 0x7C) return 5;
    if (kContextEnablement[2].context != 3 || kContextEnablement[2].widget_offsets[1] != 0x7C) return 6;
    if (kContextEnablement[3].context != 4 || kContextEnablement[3].widget_offsets[1] != 0x7C) return 7;
    if (kDiagramBlockNestedViewOffset != 0x1C4 || kDiagramBlockParentViewOffset != 0x1D8) return 8;
    return 0;
}
