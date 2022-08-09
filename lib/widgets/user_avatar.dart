import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_colors.dart';

///
class UserAvatar extends StatelessWidget {
  ///
  final double size;

  ///
  final VoidCallback? onTap;

  ///
  final bool unreadPosts;

  ///
  final String userAvatarPath;

  ///
  const UserAvatar(
      {Key? key,
      required this.size,
      this.onTap,
      this.unreadPosts = false,
      required this.userAvatarPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: unreadPosts
              ? Border.all(
                  width: 2.5,
                  color: AppColors.green,
                )
              : Border.all(
                  width: 0.5,
                  color: const Color(0xFFc9cad1),
                ),
        ),
        margin: const EdgeInsets.only(right: 16.0),
        width: size,
        height: size,
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          userAvatarPath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
