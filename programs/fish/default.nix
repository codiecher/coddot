{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      ## Set vim mode
      set -g fish_key_bindings fish_vi_key_bindings

      # Configure FZF
      set -x FZF_DEFAULT_OPTS '--color=fg:#f8f8f2,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4 --layout=reverse --height 50%'

      # Remove welcome message
      set -x fish_greeting ""

      ## Add directories to $PATH
      fish_add_path /home/yozawa/.local/share/scripts \
          /home/yozawa/.local/bin \
          /lib/flatpak/exports/bin

      zoxide init --cmd cd fish | source
    '';

    shellAbbrs = {
      z = "zoxide";
    };

    shellAliases = {
      del = "trash_file";
      add-alias = "nvim ~/.system/programs/fish/default.nix";
      global = "nvim ~/.system/nixos.nix";
      homeman = "nvim ~/.system/home-manager.nix";
      winvm = "quickemu --vm ~/winvm/windows-10.conf --display spice";
      upd = "rm /home/yozawa/.local/share/nvim/lazy/blink.cmp/target/release/libblink_cmp_fuzzy.so && nh os switch -u";
      touhou6 = "LANG=ja_JP.UTF-8 wine 'OneDrive/Touhou Series/Touhou 6 - The Embodiment of Scarlet Devil/th06.exe'";

    };

    functions = {
      fish_prompt.body = ''
        set_color D16526
        echo '>' (set_color normal)
      '';

      fzf_edit.body = ''
        fzf --multi --bind 'enter:become(nvim {+})'
      '';

      trash_file.body = ''
        mv $argv ~/.local/share/Trash
      '';

      ya.body = ''
        set tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
  };
}
