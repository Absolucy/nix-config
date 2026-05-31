{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    direnv
    zsh
    ripgrep
    fd
  ];

  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];
}
