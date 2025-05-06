{
  config,
  pkgs,
  lib,
  blink-cmp,
  ...
}:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;

    extraLuaConfig = builtins.readFile ./init.lua;

    extraPackages = with pkgs; [
      # CMAKE
      neocmakelsp

      # C/C++
      clang-tools
      gcc # Needed for treesitter

      # LUA
      lua-language-server
      stylua

      # Markdown
      markdownlint-cli
      marksman
      prettierd

      # Rust
      rust-analyzer
      cargo
      taplo
      vscode-extensions.vadimcn.vscode-lldb

      # Nix
      nixd
      nixfmt-rfc-style

      # YAML
      yaml-language-server
    ];
  };

  xdg.configFile."nvim/lua" = {
    recursive = true;
    source = ./lua;
  };

  xdg.dataFile."nvim/lazy/blink.cmp/target/release/libblink_cmp_fuzzy.so" = {
    recursive = true;
    source = "${blink-cmp.packages.x86_64-linux.blink-fuzzy-lib}/lib/libblink_cmp_fuzzy.so";
  };
}
