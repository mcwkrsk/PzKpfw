#include "../../src/native/workwidget_contract_x86.hpp"
#include <iostream>
int main() {
    using namespace is2::abi_x86;
    std::cout << std::hex << sizeof(PluginHostContext32) << ' '
              << sizeof(MenuWidgetObserved32) << ' '
              << offsetof(WorkWidgetObservedPrefix32, menu_widget_ptr) << '\n';
    return 0;
}
