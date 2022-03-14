import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_mates_app/core/helpers/constants.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/images/ic_google.svg"),
            AppSpacing.h12,
            const Text("Get started With Google"),
          ],
        ),
      ),
    );
  }
}
