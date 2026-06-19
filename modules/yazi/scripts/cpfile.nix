{ pkgs }:
pkgs.writeShellApplication {
  name = "cpfile";
  runtimeInputs = [ ];
  text = ''
    if [[ $# -eq 0 ]]; then
      echo "Usage: cpfile <file1> [file2] [file3] ..."
      exit 1
    fi

    for file in "$@"; do
      if [[ ! -f "$file" ]]; then
        echo "Error: File '$file' does not exist"
        exit 1
      fi
    done

    file_paths=()
    for file in "$@"; do
      file_paths+=("$(realpath "$file")")
    done

    if command -v wl-copy >/dev/null 2>&1; then
      printf 'file://%s\n' "''${file_paths[@]}" | wl-copy --type text/uri-list
    elif command -v xclip >/dev/null 2>&1; then
      printf 'file://%s\n' "''${file_paths[@]}" | xclip -selection clipboard -target text/uri-list
    elif command -v xsel >/dev/null 2>&1; then
      printf 'file://%s\n' "''${file_paths[@]}" | xsel --clipboard --input
    else
      exit 1
    fi
  '';
}
