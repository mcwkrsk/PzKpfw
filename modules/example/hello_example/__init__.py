"""Example PzKpfw module: adds one command to the «Модули» menu."""


def register(api):
    def show_counts():
        doc = api.document()
        if doc is None:
            api.show_text("Пример модуля", "Сначала откройте проект .is2.")
            return
        params = doc.params_node.findall("param")
        api.show_text("Пример модуля", f"Действий: {len(doc.actions)}\nПараметров: {len(params)}")

    api.add_menu_command("Пример: состав проекта", show_counts)
