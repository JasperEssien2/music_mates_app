import 'package:flutter/material.dart';
import 'package:music_mates_app/core/helpers/animation_helpers.dart';
import 'package:music_mates_app/core/helpers/maths_mixin.dart';
import 'package:music_mates_app/core/model/user_model.dart';
import 'package:music_mates_app/music_mates/presentation/widgets/export.dart';

class MatesConnect extends StatefulWidget {
  const MatesConnect({Key? key}) : super(key: key);

  @override
  _MatesConnectState createState() => _MatesConnectState();
}

class _MatesConnectState extends State<MatesConnect> with MathsMixin {
  late Size size;

  @override
  Widget build(BuildContext context) {
    final mates = [
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
      UserModel.dummy(),
    ];

    final currentUser = UserModel.dummy();

    return LayoutBuilder(
      builder: (c, constraints) {
        size = Size(constraints.maxWidth, constraints.maxHeight);

        return Stack(
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
            ..._getList(mates),
            Center(
              child: ItemMate(
                userModel: currentUser,
              ),
            )
          ],
        );
      },
    );
  }

  List<Widget> _getList(List<UserModel> mates) {
    final radius = size.width * 0.4;
    const smallCircleRadius = 40;
    final numberOfFittedCircle =
        numberOfCirclesFitInCircumference(radius, smallCircleRadius.toDouble());

    List<Widget> widgets = [];

    for (int i = 0; i <= numberOfFittedCircle; i++) {
      final angle = (unitAngle(numberOfFittedCircle.toInt()) * i).radian;
      final offset = Offset.fromDirection(angle, radius);

      widgets.add(
        Positioned.fromRect(
          rect: Rect.fromCenter(
            center: offset.translate(size.width / 2, size.height / 2),
            height: smallCircleRadius.toDouble(),
            width: smallCircleRadius.toDouble(),
          ),
          child: ItemMate(
            userModel: mates[i],
            radius: numberOfFittedCircle,
          ),
        ),
      );
    }

    return widgets;
  }
}

class FriendsWidgetAnimation implements AnimationHelper {
  FriendsWidgetAnimation(this.animationController);

  final AnimationController animationController;

  @override
  void setup() {
    // TODO: implement setup
  }

  @override
  void resetAndStart() {
    // TODO: implement resetAndStart
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
