import 'dart:math' as math;

mixin MathsMixin {
  double numberOfCirclesFitInCircumference(double largeRad, double smallRad) {
    return math.pi / math.asin(smallRad / largeRad);
  }

  double unitAngle(int numberOfPoints) => 360 / numberOfPoints;
}

extension MathsHelper on num {
  double get radian => this * math.pi / 180;
}
