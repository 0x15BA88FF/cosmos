config = config

config.bind("gJ", "tab-move +")
config.bind("gK", "tab-move -")

config.bind("pP", "open -- {primary}")
config.bind("pp", "open -- {clipboard}")
config.bind("pt", "open -t -- {clipboard}")

config.bind("cu", "config-source theme.py")
config.bind("cs", "cmd-set-text -s :config-source")

config.bind("tt", "config-cycle tabs.show multiple never")
config.bind("ts", "config-cycle statusbar.show always never")
config.bind("tp", "config-cycle content.proxy system socks://localhost:9050/")
