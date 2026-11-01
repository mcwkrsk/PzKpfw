# IS-2 Plugin SDK reconstruction — experimental notes

This directory is an ABI research scaffold, not a production SDK and not a claim of runtime compatibility.

## Verified legacy interface

- The supplied `IS.exe` loads a DLL by resolving the exact export `loadModule`.
- It calls the resulting object's virtual slots in the sequence `+0x08` (descriptor), `+0x04` (create widget(s)), and `+0x00` (post-create no-op in all five supplied plugin builds).
- The base `IsModule` vtable has three slots. Slot 2 resolves to CRT `_purecall` in all five DLLs; no virtual destructor is present in that table.
- The module's `+0x0c` field is initialized with Qt `QListData::shared_null`; the create-widget method appends raw `WorkWidget*` values through Qt 5.9 `QListData` machinery.
- The descriptor is a 12-byte record `{uint32 pointer, float32 0.1f, uint32 pointer}`. The meanings of its fields have not been recovered.
- The module object is 0x1c bytes in these builds; bytes +0x10..+0x1b remain opaque.

The host copies/iterates the widget list during registration and writes `WorkWidget+0x18 = IsModule*`; the paired menu pointer is observed at `WorkWidget+0x20`. See `../docs/14_plugin_ownership_stage18.md`, `../docs/15_host_module_widget_list_consumption.md`, `legacy_is_module_abi.hpp` and `../src/native/is_module_vtable_contract_x86.hpp`.

## Compatibility warnings

1. The actual program is PE32/x86 and was built against Qt 5.9.1/MSVC 2015. A 64-bit build is not ABI-compatible.
2. Qt's private `QListData` layout and shared-null object must match the shipped QtCore build.
3. There is no verified virtual destructor or destroy callback. Do not invent one in a legacy binary adapter.
4. Descriptor semantics and ownership are unknown. Do not free the descriptor from a recreated module until the original host's contract is established.
5. `WorkWidget` and `MenuWidget` layouts also contain Qt/QObject state. They must not be implemented from the partial evidence headers alone.

## Recommended design for a new SDK

For new plugins, use a separate, versioned C ABI with opaque handles and explicit `create`, `destroy`, `describe`, and `createWidget` callbacks. Keep an adapter layer for the legacy three-slot ABI. This prevents the old process-lifetime/raw-pointer behavior from becoming a design requirement in new code.

No sample DLL is provided here because the exact private Qt layout, descriptor semantics, and destroy behavior are not yet complete, and no Windows Qt 5.9.1 toolchain is available in this environment. A mock DLL that merely has the same first 28 bytes would be misleading: the host later treats `+0x0c` as a live Qt QListData member.


## Stage 1.9 host-side list consumption

`legacy_is_module_abi.hpp` records the observed 32-bit prefix layouts for `IsModule`, the 12-byte descriptor, and the two recovered `WorkWidget` pointer offsets. Unknown bytes are explicitly opaque. `WorkWidget+0x18` is written with the module owner during host registration; `WorkWidget+0x20` is used to locate the associated menu tab. The static destroy handler removes from `MainForm+0x30` but does not remove the matching pointer from `IsModule+0x0c`; treat this as a potential stale-pointer risk pending runtime validation.

## Qt MOC contract reference (Stage 1.10)

The complete static method/signal inventory for the five shipped plugin DLLs is documented in `../docs/16_qt_moc_contracts.md`. Use `../analysis/plugins/qt_moc_contracts.json` for machine-readable metadata and `../analysis/plugins/qt_moc_dispatch.json` for the selected method-index-to-handler address map. These records are forensic reference data for the exact supplied x86 build; they are not a drop-in SDK header, and they do not establish runtime signal delivery. In particular, a MOC slot can map to an empty `RET` stub.


## PM_auto typed connection reference (Stage 1.12)

`pm_auto_typed_connections_x86.hpp` records the image VAs of selected QSlotObject dispatchers, machine-code callback targets and field offsets used by `PM_auto.dll`. The JSON/TSV source of truth is `../analysis/plugins/pm_auto_typed_connections.json/.tsv`. These are forensic addresses for exactly one SHA-256-pinned PE32 build. They are not exports, portable entry points, or declarations that a third-party plugin can safely call. The ten button-to-MOC-slot edges and the additional lambda/closure paths are documented in `../docs/18_pm_auto_typed_connections.md`.
