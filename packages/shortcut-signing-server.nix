{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "shortcut-signing-server";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "scaxyz";
    repo = "shortcut-signing-server";
    rev = "${version}";
    hash = "sha256-08BjdQLD6IdlfukzYa44bKE/5g35I2uOIIMwobqp794=";
  };

  vendorHash = "sha256-jSOStOPZf2SJ7jLTHv6en5oFI0DbSYNduEAJzzrBmHs=";

  meta = {
    description = "A simple server for signing iOS/macOS shortcuts";
    homepage = "https://github.com/scaxyz/shortcut-signing-server";
    license = lib.licenses.unlicense;
    mainProgram = "shortcut-signing-server";
    platforms = lib.platforms.darwin;
  };
}
