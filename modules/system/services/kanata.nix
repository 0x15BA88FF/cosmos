{ pkgs, lib, config, ... }: {
  options.systemModules.kanata.enable = lib.mkEnableOption "Enable kanata";

  config = lib.mkIf config.systemModules.kanata.enable {
    boot.kernelModules = [ "uinput" ];
    hardware.uinput.enable = true;
    systemd = {
      services.kanata-internalKeyboard.serviceConfig.SupplementaryGroups =
        [ "input" "uinput" ];
      user.services.kanata = {
        description = "Kanata keyboard remapper";
        serviceConfig = {
          Type = "simple";
          Restart = "on-failure";
          ExecStart = "${pkgs.kanata}/bin/kanata --cfg /etc/kanata/config.kbd";
        };
        wantedBy = [ "default.target" ];
      };
    };
    services = {
      kanata = {
        enable = true;
        keyboards = {
          internalKeyboard = {
            devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
            extraDefCfg = "process-unmapped-keys yes";
            config = ''
              (defsrc
                  `     1    2    3    4    5    6    7    8    9    0    -    =     bspc
                  tab     q    w    e    r    t    y    u    i    o    p    [    ]      \
                  caps     a    s    d    f    g    h    j    k    l    ;    '        ret
                  lshift     z    x    c    v    b    n    m    ,    .    /        rshift
              )
              (defalias
                  caps  (tap-hold       250    250     esc     (layer-toggle vi-mode))
                  a     (tap-hold       250    250     a       lalt   )
                  s     (tap-hold       250    250     s       lmeta  )
                  d     (tap-hold       250    250     d       lshift )
                  f     (tap-hold       250    250     f       lctrl  )

                  j     (tap-hold       250    250     j       rctrl  )
                  k     (tap-hold       250    250     k       rshift )
                  l     (tap-hold       250    250     l       rmeta  )
                  ;     (tap-hold       250    250     ;       ralt   )

                  up     (tap-hold       200    200     up     up     )
                  dwn    (tap-hold       200    200     down   down   )
                  lft    (tap-hold       200    200     left   left   )
                  rgt    (tap-hold       200    200     right  right  )
              )
              (deflayer default
                  _      _    _    _    _    _    _    _    _    _    _    _    _       _
                  _       _    _    _    _    _    _    _    _    _    _    _    _      _
                  @caps   @a   @s   @d   @f    _    _   @j   @k   @l   @;    _          _
                  _          _    _    _    _    _    _    _    _    _    _             _
              )
              (deflayer vi-mode
                  _     _    _    _    _    _    _    _    _    _    _    _    _        _
                  _      _    _    _    _    _    _    _    _    _    _    _    _       _
                  _       _    _    _    _    _ @lft @dwn  @up @rgt    _    _           _
                  _         _    _    _    _    _    _    _    _    _    _              _
              )
              (deflayer empty
                  _     _    _    _    _    _    _    _    _    _    _    _    _        _
                  _      _    _    _    _    _    _    _    _    _    _    _    _       _
                  _       _    _    _    _    _    _    _    _    _    _    _           _
                  _         _    _    _    _    _    _    _    _    _    _              _
              )
            '';
          };
        };
      };
      udev.extraRules = ''
        KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
      '';
    };
    environment.systemPackages = with pkgs; [ kanata ];
  };
}
