{ pkgs, ... }:
{
  programs.nnn = {
    enable = true;
    plugins.src =
      (pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "v5.0";
        sha256 = "sha256-HShHSjqD0zeE1/St1Y2dUeHfac6HQnPFfjmFvSuEXUA=";
      })
      + "/plugins";
    bookmarks = {
      "M" = "nmount";
      "C" = "xclip -sel clipboard -t image/png*";
      "R" = "/home/null/.local/share/Trash/files";
    };
    plugins = { };
  };
}
