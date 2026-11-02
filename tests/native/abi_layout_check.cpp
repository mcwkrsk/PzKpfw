#include "../../src/native/recovered_abi_x86.hpp"

int main() {
    using namespace is2::recovered::x86;
    return (sizeof(SubjectCategoryPrivate32) == 0x5c &&
            sizeof(ParameterPrivate32) == 0x50 &&
            sizeof(SubjectOperationPrivate32) == 0xb0 &&
            sizeof(TreeHandle32) == 0x08 &&
            sizeof(AFStructurePublicPrefix32) == 0x10 &&
            sizeof(AIStructurePublicPrefix32) == 0x08 &&
            sizeof(AbstractModelPublicPrefix32) == 0x08 &&
            sizeof(WideStringRecord24) == 0x18 &&
            offsetof(ChildrenCache20, reference_count_10) == 0x10 &&
            offsetof(AFStructurePrivate32, auxiliary_tree_1c) == 0x1c &&
            offsetof(AIStructurePrivate32, auxiliary_tree_04) == 0x04) ? 0 : 1;
}
