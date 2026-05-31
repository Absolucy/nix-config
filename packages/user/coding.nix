{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixfmt
    # Python
    python3
    uv
    ruff
    # Misc
    mergiraf
  ];
}
