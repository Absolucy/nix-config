{
  pkgs,
  lib,
  import-tree,
  ...
}:
{
  home.username = "lucy";
  home.homeDirectory = lib.mkForce "/Users/lucy";
  home.stateVersion = "24.11";
  home.shell.enableZshIntegration = true;

  programs.home-manager.enable = true;

  imports = [
    (import-tree ./configs)
    (import-tree ./packages/user)
  ];
}
