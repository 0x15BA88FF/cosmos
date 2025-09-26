{ ... }: {
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;

      format =
        "[ ](fg:bright-cyan)$username[@](bg:bright-cyan fg:black)$hostname[](fg:bright-cyan) [](fg:bright-blue)$directory[](fg:bright-blue) $nix_shell$character";
      right_format =
        "$git_branch$git_status$deno$cmake$direnv$docker_context$c$lua$rust$golang$nodejs$python [](fg:green)$cmd_duration[](fg:green)";

      username = {
        disabled = false;
        show_always = true;
        format = "[$user]($style)";
        style_user = "fg:black bg:bright-cyan";
      };

      hostname = {
        disabled = false;
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "fg:black bg:bright-cyan";
      };

      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        repo_root_format =
          "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style)[  ]($repo_root_style)";
        read_only_style = "fg:black bg:red";
        repo_root_style = "fg:black bg:bright-blue";
        style = "fg:black bg:bright-blue";
        use_os_path_sep = true;
      };

      cmd_duration = {
        format = "[ $duration]($style)";
        style = "fg:black bg:green";
        show_milliseconds = true;
        min_time = 0;
      };

      character = {
        vicmd_symbol = "[🞈](fg:yellow bold)";
        success_symbol = "[🞈](fg:green bold)";
        error_symbol = "[🞈](fg:red bold)";
      };
    };
  };
}
