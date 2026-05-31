{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    history = {
      append = true;
      expireDuplicatesFirst = true;
    };
    shellAliases = {
      ls = "eza --git --color=auto --icons=auto";
      ll = "eza --git --color=auto --icons=auto --long --binary --all";
      cat = "bat --paging=never --style=plain";
    };
    sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
  };
}
