 import 'dart:math';

double getRandomDouble(double min, double max) {
  final random = Random();
  return min + random.nextDouble() * (max - min);
}