{ pkgs, ... }:
{
  home.packages = with pkgs; [
    curl
    wget
    aria2
    htop
    jq
    eza
    fzf
    bat
    tokei
    zoxide
    delta
    hyperfine
    tealdeer
    gitoxide
    atuin
    tree
    (pkgs.callPackage ../shortcut-signing-server.nix { })
  ];
}
