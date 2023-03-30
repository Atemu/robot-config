{ config, lib, ... }:

{
  flavor = "lineageos";

  apps.fdroid.enable = true;

  microg.enable = true;

  source.dirs."frameworks/base".patches = lib.optionals (config.androidVersion == 12) [
    ./screenOrientation-19.patch
  ] ++ lib.optionals (config.androidVersion == 13)  [
    ./screenOrientation-20.patch
  ];

  # I don't need clang-tidy checks, I'm just building what others have made and verified
  source.dirs."build/soong".postPatch = ''substituteInPlace cc/tidy.go --replace "flags.Tidy = true" "flags.Tidy = false"'';

  ccache.enable = true;
  ccache.directory = "/Volumes/Data/Ccache";
}
