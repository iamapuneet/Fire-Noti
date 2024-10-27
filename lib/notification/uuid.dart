import 'dart:math';

int generateSSID() {
  Random random = Random();
  int ssidInt = random.nextInt(2147483647);
  return ssidInt;
}
