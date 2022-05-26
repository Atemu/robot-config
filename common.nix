{
  flavor = "lineageos";

  apps.fdroid.enable = true;

  microg.enable = true;

  source.dirs."frameworks/base".patches = [ ./0001-always-have-screenOrientation-SCREEN_ORIENTATION_UNS.patch ];
}
