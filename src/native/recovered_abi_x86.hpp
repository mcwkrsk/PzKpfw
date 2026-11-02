#pragma once
// Reverse-engineered 32-bit MSVC ABI layouts from MAIWmodels.dll.
// These are analysis structures, not portable runtime classes. Pointer-like
// fields are represented as uint32_t so the header can be checked on x64 too.
#include <cstddef>
#include <cstdint>

namespace is2::recovered::x86 {
#pragma pack(push, 4)

struct PtrVector32 {
    std::uint32_t begin;
    std::uint32_t end;
    std::uint32_t capacity;
};

struct MStringHandle32 { std::uint32_t representation; };

// MSVC 14.0 x86 basic_string storage: 16-byte buffer/union + size + capacity.
// Capacity 7 indicates wchar_t SSO; capacity 15 indicates char SSO.
struct BasicStringStorage32 {
    std::uint8_t buffer_or_pointer[16];
    std::uint32_t size;
    std::uint32_t capacity;
};

struct IERoleRecord12 { std::uint8_t bytes[12]; };

// AFElementPrivate::alternatives stores 0x18-byte entries. Its destructor
// invokes the MSVC basic_string<wchar_t> destructor on each entry's first
// byte. The semantic meaning of the string is not yet known.
struct WideStringRecord24 { BasicStringStorage32 value; };

// Forensic x86 descriptor used with the recovered AIStructure red-black trees.
// The first DWORD points to a separately allocated tree header; the second is
// incremented by insert helpers and decremented (with an underflow guard) by
// matching erase helpers, establishing it as node_count. TreeHandle32 is an
// analytical name, not an original symbol or recovered source typedef.
struct TreeHandle32 {
    std::uint32_t header_node;
    std::uint32_t node_count;
};

// Public wrapper prefixes recovered from constructors/d_func/destructors.
// AFStructure has a wrapper-owned tree handle at +0x04 and a PIMPL pointer
// at +0x0c. AIStructure and AbstractModel store their PIMPL pointer at +0x04.
struct AFStructurePublicPrefix32 {
    std::uint32_t vftable;
    TreeHandle32 auxiliary_tree_04;
    std::uint32_t private_pointer_0c;
};
struct AIStructurePublicPrefix32 {
    std::uint32_t vftable;
    std::uint32_t private_pointer_04;
};
struct AbstractModelPublicPrefix32 {
    std::uint32_t vftable;
    std::uint32_t private_pointer_04;
};

// Inline state used by AFElementPrivate's children/cache helper. Accesses
// prove the item buffer, count and refcount roles; wrapper/state fields remain
// deliberately opaque. The separately allocated 8-byte sidecar is released
// by AFElementPrivate after this helper returns.
struct ChildrenCache20 {
    std::uint32_t sidecar_00;
    std::uint32_t items_begin_04;
    std::uint32_t item_count_08;
    std::uint32_t state_or_payload_0c;
    std::uint32_t reference_count_10;
};

struct AElementPrivate32 {
    std::uint32_t vftable;
    std::uint32_t id;
    MStringHandle32 name;
    MStringHandle32 auxiliary_string;
    PtrVector32 binary_links;
};

struct AEBinaryLinkPrivate32 {
    // AElementPrivate base subobject, flattened to keep this a standard-layout record.
    std::uint32_t vftable;
    std::uint32_t id;
    MStringHandle32 name;
    MStringHandle32 auxiliary_string;
    PtrVector32 binary_links;
    std::uint32_t endpoint0;
    std::uint32_t endpoint1;
    std::uint32_t endpoint2;
    std::uint32_t link_type;
};

struct AFElementPrivate32 {
    // AElementPrivate base subobject, flattened.
    std::uint32_t vftable;
    std::uint32_t id;
    MStringHandle32 name;
    MStringHandle32 auxiliary_string;
    PtrVector32 binary_links;
    std::uint32_t unknown_1c;
    BasicStringStorage32 unknown_string_20;
    BasicStringStorage32 structure_symbols_38;
    std::uint32_t code_value_50;
    std::int32_t number_54;
    std::uint16_t symbol_58;
    std::uint16_t padding_5a;
    std::int32_t query_number_5c;
    PtrVector32 ie_roles_60;
    ChildrenCache20 children_cache_6c;
    std::int32_t type_80;
    std::int32_t status_84;
    std::int32_t formalization_88;
    PtrVector32 alternatives_8c;
};

struct AIElementPrivate32 {
    // AElementPrivate base subobject, flattened.
    std::uint32_t vftable;
    std::uint32_t id;
    MStringHandle32 name;
    MStringHandle32 auxiliary_string;
    PtrVector32 binary_links;
    std::uint8_t is_added_1c;
    std::uint8_t padding_1d[3];
    BasicStringStorage32 string_20;
    std::uint32_t unknown_38;
    std::int32_t coding_type_3c;
};

struct AFStructurePrivate32 {
    std::uint32_t vftable;
    PtrVector32 elements_04;
    PtrVector32 links_10;
    TreeHandle32 auxiliary_tree_1c;
    std::uint32_t next_element_number_24;
};

struct AIStructurePrivate32 {
    std::uint32_t vftable;
    TreeHandle32 auxiliary_tree_04;
    std::uint32_t next_element_id_0c;
    std::uint32_t unknown_10;
    PtrVector32 elements_14;
    PtrVector32 links_20;
};

struct AbstractModelPrivate32 {
    std::uint32_t vftable;
    PtrVector32 static_structures_04;
    PtrVector32 dynamic_structures_10;
    PtrVector32 content_structures_1c;
};


// Derived private implementations. Their parent subobjects are flattened by
// composition here; offsets are those observed in this exact x86 build.
struct SubjectCategoryPrivate32 {
    AIElementPrivate32 base;
    std::int32_t group_40;
    std::int32_t number_44;
    std::int32_t unknown_48;
    std::int32_t status_4c;
    std::int32_t unknown_50;
    std::int32_t unknown_54;
    std::uint8_t auto_range_58;
    std::uint8_t padding_59[3];
};

struct ParameterPrivate32 {
    AIElementPrivate32 base;
    std::int32_t group_40;
    std::int32_t number_44;
    MStringHandle32 sign_48;
    std::uint32_t object_pointer_4c;
};

struct SubjectOperationPrivate32 {
    AFElementPrivate32 base;
    BasicStringStorage32 mark_98;
};

struct ObjectsListPrivate32 { AIStructurePrivate32 base; };
struct ParametersListPrivate32 { AIStructurePrivate32 base; };
struct SubjectOperationsStructurePrivate32 { AFStructurePrivate32 base; };
struct PrimaryModelPrivate32 { AbstractModelPrivate32 base; };

#pragma pack(pop)

static_assert(sizeof(PtrVector32) == 0x0c);
static_assert(sizeof(BasicStringStorage32) == 0x18);
static_assert(sizeof(WideStringRecord24) == 0x18);
static_assert(sizeof(TreeHandle32) == 0x08);
static_assert(offsetof(TreeHandle32, header_node) == 0x00);
static_assert(offsetof(TreeHandle32, node_count) == 0x04);
static_assert(sizeof(AFStructurePublicPrefix32) == 0x10);
static_assert(offsetof(AFStructurePublicPrefix32, auxiliary_tree_04) == 0x04);
static_assert(offsetof(AFStructurePublicPrefix32, private_pointer_0c) == 0x0c);
static_assert(sizeof(AIStructurePublicPrefix32) == 0x08);
static_assert(offsetof(AIStructurePublicPrefix32, private_pointer_04) == 0x04);
static_assert(sizeof(AbstractModelPublicPrefix32) == 0x08);
static_assert(offsetof(AbstractModelPublicPrefix32, private_pointer_04) == 0x04);
static_assert(offsetof(ChildrenCache20, items_begin_04) == 0x04);
static_assert(offsetof(ChildrenCache20, item_count_08) == 0x08);
static_assert(offsetof(ChildrenCache20, reference_count_10) == 0x10);
static_assert(sizeof(AElementPrivate32) == 0x1c);
static_assert(sizeof(AEBinaryLinkPrivate32) == 0x2c);
static_assert(sizeof(AFElementPrivate32) == 0x98);
static_assert(offsetof(AFElementPrivate32, structure_symbols_38) == 0x38);
static_assert(offsetof(AFElementPrivate32, number_54) == 0x54);
static_assert(offsetof(AFElementPrivate32, symbol_58) == 0x58);
static_assert(offsetof(AFElementPrivate32, query_number_5c) == 0x5c);
static_assert(offsetof(AFElementPrivate32, type_80) == 0x80);
static_assert(offsetof(AFElementPrivate32, alternatives_8c) == 0x8c);
static_assert(sizeof(AIElementPrivate32) == 0x40);
static_assert(offsetof(AIElementPrivate32, is_added_1c) == 0x1c);
static_assert(offsetof(AIElementPrivate32, string_20) == 0x20);
static_assert(offsetof(AIElementPrivate32, coding_type_3c) == 0x3c);
static_assert(sizeof(AFStructurePrivate32) == 0x28);
static_assert(offsetof(AFStructurePrivate32, auxiliary_tree_1c) == 0x1c);
static_assert(sizeof(AIStructurePrivate32) == 0x2c);
static_assert(offsetof(AIStructurePrivate32, auxiliary_tree_04) == 0x04);
static_assert(sizeof(AbstractModelPrivate32) == 0x28);
static_assert(sizeof(SubjectCategoryPrivate32) == 0x5c);
static_assert(offsetof(SubjectCategoryPrivate32, group_40) == 0x40);
static_assert(offsetof(SubjectCategoryPrivate32, status_4c) == 0x4c);
static_assert(offsetof(SubjectCategoryPrivate32, auto_range_58) == 0x58);
static_assert(sizeof(ParameterPrivate32) == 0x50);
static_assert(offsetof(ParameterPrivate32, group_40) == 0x40);
static_assert(offsetof(ParameterPrivate32, sign_48) == 0x48);
static_assert(offsetof(ParameterPrivate32, object_pointer_4c) == 0x4c);
static_assert(sizeof(SubjectOperationPrivate32) == 0xb0);
static_assert(offsetof(SubjectOperationPrivate32, mark_98) == 0x98);
static_assert(sizeof(ObjectsListPrivate32) == 0x2c);
static_assert(sizeof(ParametersListPrivate32) == 0x2c);
static_assert(sizeof(SubjectOperationsStructurePrivate32) == 0x28);
static_assert(sizeof(PrimaryModelPrivate32) == 0x28);

} // namespace is2::recovered::x86
