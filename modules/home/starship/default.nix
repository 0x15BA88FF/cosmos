{ ... }: {
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;
      format = " $username $hostname $directory $nix_shell$character";
      right_format =
        "$git_branch$git_status$deno$cmake$direnv$docker_context$c$lua$rust$golang$nodejs$python $cmd_duration";
      username = {
        disabled = false;
        show_always = true;
        format =
          "[](fg:bright-cyan)[$user](fg:black bg:bright-cyan)[](fg:bright-cyan)";
      };
      hostname = {
        disabled = false;
        ssh_only = false;
        format =
          "[](fg:bright-cyan)[$hostname](fg:black bg:bright-cyan)[](fg:bright-cyan)";
      };
      directory = {
        format = "[](fg:bright-blue)[$path]($style)[](fg:bright-blue)";
        repo_root_format =
          "[$before_root_path]($style)[$repo_root]($style)[$path]($style)[  ]($style)";
        style = "fg:black bg:bright-blue";
      };
      cmd_duration = {
        show_milliseconds = true;
        format = "[](fg:green)[ $duration](fg:black bg:green)[](fg:green)";
      };
      character = {
        vicmd_symbol = "[🞈](fg:yellow bold)";
        error_symbol = "[🞈](fg:red bold)";
        success_symbol = "[🞈](fg:green bold)";
      };
    };
  };
}
