{
  pkgs,
  import-tree,
  ...
}:
{

  imports = [
    (import-tree ./packages/system)
  ];

  system.primaryUser = "lucy";

  networking.hostName = "lucys-macbook-air";
  networking.computerName = "Lucy's MacBook Air";

  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
    };
  };

  services.openssh.enable = true;

  users.users."lucy" = {
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVxddtnU6Bb6uZNUAeJiTakgsuol+QYTOY75COXIVal lucy"
    ];
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.geist-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.monaspace
  ];

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "uninstall";
    brews = [
      "mole"
    ];
    casks = [
      "1password"
      "1password-cli"
    ];
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nix.enable = false; # determinator or whatever it's called manages nix

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 5;
}
