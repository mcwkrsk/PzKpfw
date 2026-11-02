# Отчёты по ключевым функциям `AFStructure`

## `makeElementary`

- Binary: `MAIWmodels.dll`
- SHA-256: `80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525`
- RVA / VA: `0xBB60` / `0x1000BB60`
- Symbol: `?makeElementary@AFStructure@@QAEXPAVAFElement@@@Z`
- Calling convention: MSVC x86 thiscall; one explicit pointer argument; `ret 4`
- Calls: `removeAFElementChildren` VA `0x1000C3B0`; `AFElement::setType` VA `0x10009EB0`; `setStatus` VA `0x10009D60`; `setFormalization` VA `0x10009D40`; `codeStructure` VA `0x1000B100`
- Pseudocode: see `03_class_hierarchy.md`; inferred directly from call sequence
- Confidence: HIGH
- Remaining: inspect side effects of child cleanup, status/formalization enum names and exact code generation; verify on runtime model

## `makeIteration`

- Binary: `MAIWmodels.dll`
- SHA-256: `80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525`
- RVA / VA: `0xBBA0` / `0x1000BBA0`
- Symbol: `?makeIteration@AFStructure@@QAEXPAVAFElement@@@Z`
- Calling convention: MSVC x86 thiscall; one explicit `AFElement*`; `ret 4`
- Operations: obtains/allocates another element, increments internal ID/number counter at a structure field offset, sets generated element number, adds composition link, adds arrangement link with zero sentinel, then applies `type=3`, `formalization=0`, `status=1` and calls codeStructure
- Confidence: HIGH for the call sequence; MEDIUM for interpretation of the counter field and link order
- Remaining: inspect allocation helper at VA `0x10002A60`, validate generated node fields, inspect serialization and runtime UI

## `makeAlternative`

- Binary: `MAIWmodels.dll`
- SHA-256: `80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525`
- RVA / VA: `0xB760` / `0x1000B760`
- Symbol: `?makeAlternative@AFStructure@@QAEXPAVAFElement@@H@Z`
- Calling convention: MSVC x86 thiscall; `AFElement*` plus integer child count; `ret 8`
- Guard: if count < 2, exits without conversion. It inspects existing links/children before mutation.
- Mutations: selected element gets `type=1`, `status=1`, `formalization=0`; for each requested branch it allocates a new element, sets that child to `type=0`, `status=0`, `formalization=0`, adds a composition link; after children are created it builds the arrangement links among them and calls `codeStructure()`.
- Confidence: HIGH for call sequence and raw enum setter values; exact guard semantics and arrangement direction need runtime validation.

## `makeSequanse`

- Binary: `MAIWmodels.dll`
- SHA-256: `80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525`
- RVA / VA: `0xBC20` / `0x1000BC20`
- Symbol: `?makeSequanse@AFStructure@@QAEXPAVAFElement@@H@Z`
- Calling convention: MSVC x86 thiscall; `AFElement*` plus integer child count; `ret 8`
- Guard: if count < 2, exits. It examines existing children/links before changing the selected element.
- Mutations observed: selected element receives `type=2`, `status=1`, `formalization=2`; each newly created child receives `type=0`, `status=0`, `formalization=0`; composition links and arrangement links are then added, followed by `codeStructure()`.
- Confidence: HIGH for setter values and link-building pattern, MEDIUM for all edge cases and the meaning of formalization code `2`.


- Binary: `MAIWmodels.dll`
- SHA-256: `80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525`
- RVA / VA: `0xBC20` / `0x1000BC20`
- Symbol: `?makeSequanse@AFStructure@@QAEXPAVAFElement@@H@Z`
- Details of the body are now recorded above; the disassembly extends through VA `0x1000C001`.
- Remaining: exact semantic preconditions of the first traversal and the role of formalization value `2`.

## `removeAFElement`

- Binary: `MAIWmodels.dll`
- SHA-256: `80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525`
- RVA / VA: `0xC230` / `0x1000C230`
- Symbol: `?removeAFElement@AFStructure@@QAEXPAVAFElement@@@Z`
- Observed operations: resolve related link(s), detach arrangement relationship, obtain and process a vector/range of child/related objects, then locate the element pointer in an internal vector; only partial body was reviewed
- Confidence: LOW/MEDIUM pending full control-flow analysis
