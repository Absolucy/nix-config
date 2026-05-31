{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Lucy";
        email = "lucy@absolucy.moe";
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBKTwrhWnMhRIyZmpCpdG7258/ZsorjZdQx0e/Cs4mFn";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
      };
      push.autoSetupRemote = true;
      merge = {
        conflictStyle = "diff3";
        mergiraf = {
          name = "mergiraf";
          driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
        };
      };
      # signing stuff
      gpg = {
        format = "ssh";
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      commit.gpgsign = true;
    };
    ignores = [
      ".DS_Store"
      "__MACOSX"
      "*.swp"
      ".direnv"
    ];
  };
}
