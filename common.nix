{ config, lib, ... }:

{
  flavor = "lineageos";

  apps.fdroid.enable = true;

  microg.enable = true;

  source.dirs."frameworks/base".patches = lib.mkIf (config.androidVersion == 12) [
    ./0001-always-have-screenOrientation-SCREEN_ORIENTATION_UNS.patch
  ];

  ccache.enable = true;
  ccache.directory = "/Volumes/Data/Ccache";
}
