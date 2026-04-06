{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      github.copilot
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };
}
