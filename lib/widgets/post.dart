import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_colors.dart';
import 'package:pet_project/constants/app_icons.dart';
import 'package:pet_project/constants/styles.dart';
import 'package:pet_project/models/post_model.dart';
import 'package:pet_project/widgets/space.dart';
import 'package:pet_project/widgets/time_ago.dart';
import 'package:pet_project/widgets/user_avatar.dart';

/// Post widget
class Post extends StatelessWidget {
  /// post data to show
  final PostModel postData;

  ///
  const Post({
    Key? key,
    required this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserAvatar(
                      size: 40.0, userAvatarPath: postData.authorPhotoUrl),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${postData.firstName} ${postData.lastName}",
                        style: k16Med.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      TimeAgo(
                        postData.createdAt,
                        style: k12Med.copyWith(
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                iconSize: 32.0,
                onPressed: () {},
                icon: const Icon(
                  AppIcons.menu,
                ),
              ),
            ],
          ),
          Space.vertical(12.0),
          Image.asset(
            postData.photoUrl,
            height: 343,
          ),
          Space.vertical(16.0),
          Text(
            postData.description,
            style: k16Med.copyWith(
              color: AppColors.darkGray,
            ),
          ),
          Space.vertical(14.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Row(
                          children: [
                            Icon(
                              AppIcons.heart,
                              color: AppColors.gray,
                            ),
                            Space.horizontal(8.0),
                            Text(
                              postData.likes.toString(),
                              style: k16SemiBold.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Row(
                          children: [
                            Icon(
                              AppIcons.comments,
                              color: AppColors.gray,
                            ),
                            Space.horizontal(12.0),
                            Text(
                              postData.comments.toString(),
                              style: k16SemiBold.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Share",
                        style: k16SemiBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Space.horizontal(12.0),
                      const Icon(AppIcons.arrow_right),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
