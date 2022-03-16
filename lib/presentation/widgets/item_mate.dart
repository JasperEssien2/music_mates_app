import 'package:flutter/material.dart';
import 'package:music_mates_app/data/model/user_model.dart';

class ItemMate extends StatelessWidget {
  const ItemMate({
    Key? key,
    required this.userModel,
    this.size = 120,
  }) : super(key: key);

  final UserModel userModel;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(userModel.imageUrl!),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(2, 2),
          )
        ],
        color: Colors.grey[200],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.cyan),
      ),
      height: size,
      width: size,
    );
  }
}
