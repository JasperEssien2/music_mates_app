import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_mates_app/core/maths_mixin.dart';
import 'package:music_mates_app/data/model/user_model.dart';
import 'package:music_mates_app/presentation/widgets/export.dart';

class MatesRingWidget extends StatefulWidget {
  const MatesRingWidget({Key? key}) : super(key: key);

  @override
  _MatesRingWidgetState createState() => _MatesRingWidgetState();
}

/// Here we utilise the [MathsMixin] and the [SingleTickerProviderStateMixin] because we will implement an animation
class _MatesRingWidgetState extends State<MatesRingWidget>
    with MathsMixin, SingleTickerProviderStateMixin {
  late Size size;

  /// An animation controller is defined and a duration set
  late final animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1000));

  @override
  void initState() {
    super.initState();
    /// This line of code starts the animation
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// dummy data for user's music mates
    final mates = List.generate(9, (index) => UserModel.dummy());

    /// dummy data for the current user
    final currentUser = UserModel.dummy();

    /// We want this widget to be adaptable as possible, so we use 
    /// [LayoutBuilder] to get the constraint (max width and max height) given to this widget.
    return LayoutBuilder(
      builder: (c, constraints) {
        size = Size(constraints.maxWidth, constraints.maxHeight);


        return AnimatedBuilder(
          animation: animationController,
          builder: (c, _) {
            var animValue = animationController.value;
            return Opacity(
              opacity: animValue,
              /// We use [Stack] widget so we can flexibly position our widgets
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: size.width * 0.8,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.cyan[100]!,
                        ),
                      ),
                    ),
                  ),

                  /// The spread operator (three dots) is used to add multiple items to a collection.
                  /// The _getList() method returns the list of circle widgets setting their position 
                  ..._getList(mates, animValue),
                  Center(
                    child: ItemMate(
                      userModel: currentUser,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<Widget> _getList(List<UserModel> mates, double animValue) {
    
    /// The large circle will be 40% of the screen width
    final radius = size.width * 0.4;

    /// This vairable holds the original small radius and caps it at 90px
    final endSmallRadius = min(
        radiusOfSmallCicleInRelationToLargeCircle(radius, mates.length), 90.0);

    /// This variable holds the small radius based on the animation value, 
    /// the [lerpDouble()] is used to perform a linear interpoloation between 
    /// two doubles and return the current value based on the current [t] value , in this case animation value
    final smallCircleRadius = lerpDouble(0, endSmallRadius, animValue)!;

    final length = mates.length;

    List<Widget> widgets = [];

    for (int i = 0; i < length; i++) {

      /// Get the angle for the current index
      final angle = (unitAngle(length.toInt()) * i).radian;

      /// set center offset, where motion animation starts from
      final centerOffset = Offset(size.width / 2, size.height / 2);

      /// This offset is where the animation ends, [Offset.fromDirection] returns an offset from an angle. 
      /// To know more about Offsets visit this link [https://blog.logrocket.com/understanding-offsets-flutter/]
      final destinationOffset = Offset.fromDirection(angle, radius)
          .translate(size.width / 2, size.height / 2);

      /// Offset.lerp() handles linear interpolation between two offsets
      final offset = Offset.lerp(centerOffset, destinationOffset, animValue)!;

      /// Wrap the [ItemMate] with the [Positioned] widget
      widgets.add(
        Positioned.fromRect(
          rect: Rect.fromCenter(
            center: offset,
            height: smallCircleRadius.toDouble(),
            width: smallCircleRadius.toDouble(),
          ),
          child: ItemMate(
            userModel: mates[i],
            size: smallCircleRadius,
          ),
        ),
      );
    }

    return widgets;
  }
}