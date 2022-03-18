import 'dart:math' as math;

mixin MathsMixin {
 
  double radiusOfSmallCicleInRelationToLargeCircle(
          double largeRad, int numberOfCircles) =>
      largeRad * math.sin(math.pi / numberOfCircles);

  double unitAngle(int numberOfPoints) => 360 / numberOfPoints;
}

extension MathsHelper on num {
  double get radian => this * math.pi / 180;
}
