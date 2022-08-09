import 'package:flutter/material.dart';
import 'package:pet_project/constants/app_colors.dart';
import 'package:pet_project/constants/styles.dart';
import 'package:pet_project/mocks/data.dart';
import 'package:pet_project/models/user_model.dart';
import 'package:pet_project/screens/home_screen.dart';
import 'package:pet_project/screens/profie_edit_screen.dart';
import 'package:pet_project/widgets/number_compact.dart';
import 'package:pet_project/widgets/space.dart';
import 'package:pet_project/widgets/user_avatar.dart';

///
class ProfileScreen extends StatefulWidget {
  ///
  static const String path = "profile";

  ///
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser = UserModel.fromJson(userInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.0,
        elevation: 6.0,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
        title: Text(
          "Linkstagram",
          style: kAppBarTitleStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  )),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppColors.darkGray),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      width: 0.5,
                      color: AppColors.gray,
                    ),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.path);
                },
                child: const Text("Home"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ).copyWith(top: 32.0, bottom: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      NumberCompact(
                        currentUser.followers,
                        style: k16SemiBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: k16Med.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                  UserAvatar(size: 88, userAvatarPath: currentUser.photoUrl),
                  Column(
                    children: [
                      NumberCompact(
                        currentUser.following,
                        style: k16SemiBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Following",
                        style: k16Med.copyWith(
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Space.vertical(23.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${currentUser.firstName} ${currentUser.lastName}",
                    style: k16Med.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    " - ",
                    style: k16Med.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    currentUser.jobTitle,
                    style: k16Med.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              Space.vertical(17.0),
              Text(
                currentUser.description,
                textAlign: TextAlign.center,
                style: k12Med.copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              Space.vertical(17.0),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 10),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      )),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(AppColors.black),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                          width: 0.5,
                          color: AppColors.gray,
                        ),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        k12Med.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ProfileEditScreen.path);
                    },
                    child: const Text("Edit profile"),
                  )),
                  Space.horizontal(12.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(10.0),
                        ),
                        elevation: MaterialStateProperty.all<double>(0.0),
                      ),
                      child: Text(
                        "New post",
                        style: k12Med,
                      ),
                    ),
                  )
                ],
              ),
              Space.vertical(32.0),
              GridView.count(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                children: List.generate(
                  11,
                  (index) => Image.asset(
                    "assets/images/Phone/Rectangle ${45 + index}.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
