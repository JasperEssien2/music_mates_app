import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_mates_app/core/app_provider.dart';
import 'package:music_mates_app/core/maths_mixin.dart';
import 'package:music_mates_app/data/model/user_model.dart';
import 'package:music_mates_app/presentation/widgets/export.dart';

class MatesConnect extends StatefulWidget {
  const MatesConnect({Key? key}) : super(key: key);

  @override
  _MatesConnectState createState() => _MatesConnectState();
}

class _MatesConnectState extends State<MatesConnect>
    with MathsMixin, SingleTickerProviderStateMixin {
  late Size size;
  late final animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1000));

  @override
  void initState() {
    super.initState();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.dataController.data;

    final mates = UserList.musicMatesJson(data).users;

    final currentUser = UserModel.fromJson(data['userInfo']);

    return LayoutBuilder(
      builder: (c, constraints) {
        size = Size(constraints.maxWidth, constraints.maxHeight);
        bool isLoading = true;

        return AnimatedBuilder(
          animation: animationController,
          builder: (c, _) {
            var animValue = animationController.value;
            return Opacity(
              opacity: animValue,
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
                  if (mates.isNotEmpty)
                    ..._getList(mates, animValue, isLoading: isLoading),
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

  List<Widget> _getList(List<UserModel> mates, double animValue,
      {bool isLoading = false}) {
    final radius = size.width * 0.4;

    final endSmallRadius = min(
        radiusOfSmallCicleInRelationToLargeCircle(radius, mates.length), 90.0);

    final smallCircleRadius = lerpDouble(0, endSmallRadius, animValue)!;

    final length = mates.length;

    List<Widget> widgets = [];

    for (int i = 0; i < length; i++) {
      final angle = (unitAngle(length.toInt()) * i).radian;

      final centerOffset = Offset(size.width / 2, size.height / 2);
      final destinationOffset = Offset.fromDirection(angle, radius)
          .translate(size.width / 2, size.height / 2);
      final offset = Offset.lerp(centerOffset, destinationOffset, animValue)!;

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
