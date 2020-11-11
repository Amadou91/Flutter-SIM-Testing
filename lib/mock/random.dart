import 'dart:math';

random() {
  var rng = new Random();
  int roll;
  roll = rng.nextInt(6);
  if (roll == 0)  {
    return true;
  }
    print(roll);
    return false;
}

