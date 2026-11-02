# MSVC RTTI and vftable recovery

Input: `MAIWmodels.dll`; image base `0x10000000`; SHA-256 `80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525`.
TypeDescriptors discovered: **57**; validated COL records: **54**; vftable candidates: **54**.

## Method and limitations
Parsed MSVC x86 RTTI structures: TypeDescriptor, CompleteObjectLocator, ClassHierarchyDescriptor and BaseClassDescriptor. Vftable candidates are found by locating COL pointers in `.rdata` and reading contiguous `.text` pointers. Addresses are evidence; aliases may be folded by identical-code folding. A vftable slot is not assigned a unique source-level name where the exports do not resolve it. Constructor/destructor and access-control semantics require instruction-level corroboration.

## Class inheritance (RTTI base order)

| Most-derived type | RTTI base sequence |
|---|---|
| `AIStructure` | `AIStructure` |
| `AFStructure` | `AFStructure` |
| `AbstractModelPrivate` | `AbstractModelPrivate` |
| `AbstractModel` | `AbstractModel` |
| `AElement` | `AElement` |
| `AFElement` | `AFElement → AElement` |
| `AEContentLink` | `AEContentLink → AEBinaryLink → AElement` |
| `AEBinaryLink` | `AEBinaryLink → AElement` |
| `AContentStructure` | `AContentStructure` |
| `AElementPrivate` | `AElementPrivate` |
| `AEBinaryLinkPrivate` | `AEBinaryLinkPrivate → AElementPrivate` |
| `AEContentLinkPrivate` | `AEContentLinkPrivate → AEBinaryLinkPrivate → AElementPrivate` |
| `AFEBinaryLink` | `AFEBinaryLink → AEBinaryLink → AElement` |
| `AFEBinaryLinkPrivate` | `AFEBinaryLinkPrivate → AEBinaryLinkPrivate → AElementPrivate` |
| `AFElementPrivate` | `AFElementPrivate → AElementPrivate` |
| `AFStructurePrivate` | `AFStructurePrivate` |
| `AIEBinaryLinkPrivate` | `AIEBinaryLinkPrivate → AEBinaryLinkPrivate → AElementPrivate` |
| `AIEBinaryLink` | `AIEBinaryLink → AEBinaryLink → AElement` |
| `AIElementPrivate` | `AIElementPrivate → AElementPrivate` |
| `AIElement` | `AIElement → AElement` |
| `AIStructurePrivate` | `AIStructurePrivate` |
| `ConceptStructure` | `ConceptStructure → AIStructure` |
| `ConceptModelPrivate` | `ConceptModelPrivate → AbstractModelPrivate` |
| `ConceptModel` | `ConceptModel → AbstractModel` |
| `SubjectRelationStructure` | `SubjectRelationStructure → AFStructure` |
| `ConceptStructurePrivate` | `ConceptStructurePrivate → AIStructurePrivate` |
| `SubjectCategory` | `SubjectCategory → AIElement → AElement` |
| `SCBinaryLink` | `SCBinaryLink → AIEBinaryLink → AEBinaryLink → AElement` |
| `SubjectCategoryPrivate` | `SubjectCategoryPrivate → AIElementPrivate → AElementPrivate` |
| `SubjectRelationPrivate` | `SubjectRelationPrivate → AFElementPrivate → AElementPrivate` |
| `SubjectRelation` | `SubjectRelation → AFElement → AElement` |
| `SubjectRelationStructurePrivate` | `SubjectRelationStructurePrivate → AFStructurePrivate` |
| `ObjectPrivate` | `ObjectPrivate → AIElementPrivate → AElementPrivate` |
| `Object` | `Object → AIElement → AElement` |
| `ObjectsListPrivate` | `ObjectsListPrivate → AIStructurePrivate` |
| `ObjectsList` | `ObjectsList → AIStructure` |
| `ParameterPrivate` | `ParameterPrivate → AIElementPrivate → AElementPrivate` |
| `Parameter` | `Parameter → AIElement → AElement` |
| `ParametersListPrivate` | `ParametersListPrivate → AIStructurePrivate` |
| `ParametersList` | `ParametersList → AIStructure` |
| `SubjectOperationsStructure` | `SubjectOperationsStructure → AFStructure` |
| `PrimaryModelPrivate` | `PrimaryModelPrivate → AbstractModelPrivate` |
| `PrimaryModel` | `PrimaryModel → AbstractModel` |
| `SubjectOperationPrivate` | `SubjectOperationPrivate → AFElementPrivate → AElementPrivate` |
| `SubjectOperation` | `SubjectOperation → AFElement → AElement` |
| `SubjectOperationsStructurePrivate` | `SubjectOperationsStructurePrivate → AFStructurePrivate` |

## Virtual function tables

| Class | vftable VA | Slots (0-based): target — export alias |
|---|---:|---|
| `AIStructure` | `0x100170fc` | 0: `0x10001a30` — unresolved / non-exported |
| `AFStructure` | `0x1001713c` | 0: `0x10001990` — unresolved / non-exported<br>1: `0x10015aa2` — unresolved / non-exported |
| `AbstractModelPrivate` | `0x10017148` | 0: `0x10001b70` — unresolved / non-exported |
| `AbstractModel` | `0x100170f4` | 0: `0x10001ad0` — unresolved / non-exported |
| `AElement` | `0x10017104` | 0: `0x10001850` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10015aa2` — unresolved / non-exported |
| `AFElement` | `0x10017120` | 0: `0x100018f0` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10008af0` — ?getCode@AFElement@@UAE?AVMString@@XZ |
| `AEContentLink` | `0x10017188` | 0: `0x100023e0` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ |
| `AEBinaryLink` | `0x1001716c` | 0: `0x10002340` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10015aa2` — unresolved / non-exported |
| `AContentStructure` | `0x10017164` | 0: `0x100022a0` — unresolved / non-exported |
| `AElementPrivate` | `0x100171dc` | 0: `0x10002f20` — unresolved / non-exported |
| `AEBinaryLinkPrivate` | `0x100171e8` | 0: `0x10004250` — unresolved / non-exported |
| `AEContentLinkPrivate` | `0x1001720c` | 0: `0x100035a0` — unresolved / non-exported |
| `AFEBinaryLink` | `0x10017254` | 0: `0x100041a0` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ |
| `AFEBinaryLinkPrivate` | `0x10017270` | 0: `0x10004250` — unresolved / non-exported |
| `AFElementPrivate` | `0x10017278` | 0: `0x10006b50` — unresolved / non-exported |
| `AFStructurePrivate` | `0x100172d8` | 0: `0x1000aa20` — unresolved / non-exported |
| `AIEBinaryLinkPrivate` | `0x10017330` | 0: `0x1000cb00` — unresolved / non-exported |
| `AIEBinaryLink` | `0x10017310` | 0: `0x1000ca50` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10015aa2` — unresolved / non-exported<br>6: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ |
| `AIElementPrivate` | `0x10017338` | 0: `0x1000cbe0` — unresolved / non-exported |
| `AIElement` | `0x10017340` | 0: `0x1000d2b0` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ<br>6: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ |
| `AIStructurePrivate` | `0x10017360` | 0: `0x1000daf0` — unresolved / non-exported |
| `ConceptStructure` | `0x100173a0` | 0: `0x1000e810` — unresolved / non-exported |
| `ConceptModelPrivate` | `0x1001738c` | 0: `0x1000e950` — unresolved / non-exported |
| `ConceptModel` | `0x10017384` | 0: `0x1000e760` — unresolved / non-exported |
| `SubjectRelationStructure` | `0x10017394` | 0: `0x1000e8b0` — unresolved / non-exported<br>1: `0x10011b20` — ?createAFElement@SubjectRelationStructure@@UAEPAVAFElement@@XZ |
| `ConceptStructurePrivate` | `0x100173ac` | 0: `0x1000f880` — unresolved / non-exported |
| `SubjectCategory` | `0x100173b4` | 0: `0x1000f7e0` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x100114a0` — ?getCode@SubjectCategory@@UAE?AVMString@@XZ<br>6: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ |
| `SCBinaryLink` | `0x100173d4` | 0: `0x1000f740` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10010800` — ?getCode@SCBinaryLink@@UAE?AVMString@@XZ<br>6: `0x100109e0` — ?getName@SCBinaryLink@@UAE?AVMString@@XZ |
| `SubjectCategoryPrivate` | `0x100174f8` | 0: `0x10011300` — unresolved / non-exported |
| `SubjectRelationPrivate` | `0x10017520` | 0: `0x100119b0` — unresolved / non-exported |
| `SubjectRelation` | `0x10017504` | 0: `0x10011900` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10008af0` — ?getCode@AFElement@@UAE?AVMString@@XZ |
| `SubjectRelationStructurePrivate` | `0x10017528` | 0: `0x10011af0` — unresolved / non-exported |
| `ObjectPrivate` | `0x1001755c` | 0: `0x10012580` — unresolved / non-exported |
| `Object` | `0x1001753c` | 0: `0x100124d0` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ<br>6: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ |
| `ObjectsListPrivate` | `0x1001756c` | 0: `0x100128d0` — unresolved / non-exported |
| `ObjectsList` | `0x10017564` | 0: `0x10012820` — unresolved / non-exported |
| `ParameterPrivate` | `0x10017594` | 0: `0x10012d90` — unresolved / non-exported |
| `Parameter` | `0x10017574` | 0: `0x10012ce0` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10012e40` — ?getCode@Parameter@@UAE?AVMString@@XZ<br>6: `0x10004360` — ?getClassStr@AIElement@@UAE?AVMString@@XZ; ?getCode@AEContentLink@@UAE?AVMString@@XZ; ?getCode@AFEBinaryLink@@UAE?AVMString@@XZ; ?getCode@AIElement@@UAE?AVMString@@XZ; ?getName@AIEBinaryLink@@UAE?AVMString@@XZ |
| `ParametersListPrivate` | `0x100175ac` | 0: `0x10013830` — unresolved / non-exported |
| `ParametersList` | `0x100175a4` | 0: `0x10013780` — unresolved / non-exported |
| `SubjectOperationsStructure` | `0x100175c4` | 0: `0x100141b0` — unresolved / non-exported<br>1: `0x10014b40` — ?createAFElement@SubjectOperationsStructure@@EAEPAVAFElement@@XZ |
| `PrimaryModelPrivate` | `0x100175bc` | 0: `0x10014100` — unresolved / non-exported |
| `PrimaryModel` | `0x100175b4` | 0: `0x10014050` — unresolved / non-exported |
| `SubjectOperationPrivate` | `0x100175ec` | 0: `0x10014600` — unresolved / non-exported |
| `SubjectOperation` | `0x100175d0` | 0: `0x10014550` — unresolved / non-exported<br>1: `0x10003aa0` — ?getBinaryLinksCount@AElement@@UAEHXZ; ?getDynamicStructureCount@AbstractModel@@QAEHXZ<br>2: `0x10003a20` — ?getBiaryLink@AElement@@UAE?AUALinkBinding@@H@Z<br>3: `0x10003ab0` — ?getBinaryLinksList@AElement@@UAE?AVALElementList@@XZ<br>4: `0x10003db0` — ?unlink@AElement@@UAEXXZ<br>5: `0x10008af0` — ?getCode@AFElement@@UAE?AVMString@@XZ |
| `SubjectOperationsStructurePrivate` | `0x100175f4` | 0: `0x10014a80` — unresolved / non-exported |

## Observations
- Repeated base-subobject offsets (`mdisp=0`) are consistent with single, non-virtual inheritance for the principal application classes in this build; do not infer C++ access level from this alone.
- `__purecall` target is `0x10015aa2`; abstract base slots are therefore visible in the tables.
- Multiple virtual names may share one implementation address; this can result from compiler identical-code folding or explicit forwarding/thunk code. Confirm with caller context before assigning semantics.
- Classes ending in `Private` commonly expose a one-slot destructor vftable, consistent with private implementation objects.

Raw records: `rtti_recovery.json`; normalized tables: `class_hierarchy.tsv` and `vtable_slots.tsv`.
