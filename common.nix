{ config, lib, ... }:

{
  flavor = "lineageos";

  apps.fdroid.enable = true;

  microg.enable = true;

  source.dirs."frameworks/base".patches = lib.mkIf (config.androidVersion == 12) [
    ./0001-always-have-screenOrientation-SCREEN_ORIENTATION_UNS.patch
  ];

  # I don't need clang-tidy checks, I'm just building what others have made and verified
  source.dirs."build/soong".postPatch = ''substituteInPlace cc/tidy.go --replace "flags.Tidy = true" "flags.Tidy = false"'';

  ccache.enable = true;
  ccache.directory = "/Volumes/Data/Ccache";
}
