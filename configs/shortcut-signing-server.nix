{ pkgs, config, ... }:
let
  shortcut-signing-server = pkgs.callPackage ../packages/shortcut-signing-server.nix { };
  logDir = "${config.home.homeDirectory}/Library/Logs";
in
{
  launchd.agents.shortcut-signing-server = {
    enable = true;
    config = {
      ProgramArguments = [
        "${shortcut-signing-server}/bin/shortcut-signing-server"
        "serve"
        "0.0.0.0:4201"
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "${logDir}/shortcut-signing-server.log";
      StandardErrorPath = "${logDir}/shortcut-signing-server.error.log";
    };
  };
}
