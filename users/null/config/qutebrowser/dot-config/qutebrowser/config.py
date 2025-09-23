c = c
config = config

config.load_autoconfig()

config.source("theme.py")
config.source("adblock.py")
config.source("keybinds.py")

c.auto_save.session = True
c.completion.shrink = True
c.completion.open_categories = [ "searchengines", "quickmarks", "bookmarks", "history", "filesystem" ]

c.tabs.background = True
c.tabs.indicator.width = 0
c.tabs.title.format = " {audio}{current_title}"
c.tabs.padding = { "top": 9, "bottom": 9, "left": 9, "right": 9 }

c.url.searchengines = {
    "!gh": "https://github.com/search?&q={}",
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "!yt": "https://www.youtube.com/results?search_query={}",
    "!wiki": "https://en.wikipedia.org/wiki/Special:Search?search={}",

    "!archpkg": "https://archlinux.org/packages/?q={}",
    "!archwiki": "https://wiki.archlinux.org/?search={}",
    "!aurpkg": "https://aur.archlinux.org/packages?O=0&K={}",

    "!nixwiki": "https://wiki.nixos.org/w/index.php?search={}",
    "!nixpkg": "https://search.nixos.org/packages?channel=unstable&query={}",
    "!nixopts": "https://search.nixos.org/options?channel=unstable&query={}",

    "!xai": "https://chat.x.com/?q={}",
    "!cai": "https://claude.ai/chat?q={}",
    "!oai": "https://chat.openai.com/chat?q={}",
}

c.colors.webpage.darkmode.enabled = False
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
config.set("colors.webpage.darkmode.enabled", False, "file://*")

config.set("content.webgl", False, "*")
config.set("content.geolocation", False)
config.set("content.cookies.store", True)
config.set("content.canvas_reading", False)
config.set("content.cookies.accept", "all")
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
