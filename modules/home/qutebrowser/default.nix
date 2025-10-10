{ pkgs, ... }: {
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = true;
    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
      yt = "https://www.youtube.com/results?search_query={}";
      wiki = "https://en.wikipedia.org/wiki/Special:Search?search={}";

      archpkg = "https://archlinux.org/packages/?q={}";
      archwiki = "https://wiki.archlinux.org/?search={}";
      aurpkg = "https://aur.archlinux.org/packages?O=0&K={}";

      nixwiki = "https://wiki.nixos.org/w/index.php?search={}";
      nixpkg = "https://search.nixos.org/packages?channel=unstable&query={}";
      nixopts = "https://search.nixos.org/options?channel=unstable&query={}";

      aix = "https://chat.x.com/?q={}";
      aic = "https://claude.ai/chat?q={}";
      aio = "https://chat.openai.com/chat?q={}";
    };
    settings = {
      auto_save.session = true;
      completion = {
        shrink = true;
        open_categories =
          [ "searchengines" "quickmarks" "bookmarks" "history" "filesystem" ];
      };
      tabs = {
        show = "multiple";
        background = true;
        indicator.width = 0;
        title.format = "{audio}{current_title}";
      };
      statusbar.show = "in-mode";
      colors.webpage.preferred_color_scheme = "dark";
      content.blocking = {
        enabled = true;
        adblock.lists = [
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt"
          "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt"
          "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt"
        ];
      };
    };
    keyBindings = {
      normal = {
        gJ = "tab-move +";
        gK = "tab-move -";

        pP = "open -- {primary}";
        pp = "open -- {clipboard}";
        pt = "open -t -- {clipboard}";

        cu = "config-source theme.py";
        cs = "cmd-set-text -s :config-source";
        tp = "config-cycle content.proxy system socks://localhost:9050/";
      };
    };
    greasemonkey = [
      (pkgs.fetchurl {
        url =
          "https://update.greasyfork.org/scripts/498197/Auto%20Skip%20YouTube%20Ads.user.js";
        sha256 = "sha256-BoavAeaS+qMt2pqknx6S+9kv6gXt2ZIRQsQDIMP91Ak=";
      })
    ];
    extraConfig = ''
      c.tabs.padding = { "bottom": 8, "left": 8, "right": 8, "top": 9 }
      c.statusbar.padding = { "bottom": 4, "left": 8, "right": 8, "top": 4 }
    '';
  };

  stylix.targets.qutebrowser.enable = true;
}
