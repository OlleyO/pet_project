import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_project/constants/styles.dart';
import 'package:pet_project/mocks/data.dart';
import 'package:pet_project/models/creator_model.dart';
import 'package:pet_project/models/post_model.dart';
import 'package:pet_project/models/user_model.dart';
import 'package:pet_project/screens/profile_screen.dart';
import 'package:pet_project/widgets/post.dart';
import 'package:pet_project/widgets/space.dart';
import 'package:pet_project/widgets/user_avatar.dart';

/// Main App page
class HomeScreen extends StatefulWidget {
  /// Page's route
  static const String path = "home";

  ///
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final UserModel currentUser = UserModel.fromJson(userInfo);
  final List<CreatorModel> authors =
      creators.map((c) => CreatorModel.fromJson(c)).toList();

  final List<PostModel> usersPosts =
      posts.map((p) => PostModel.fromJson(p)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              title: Text("Messages"),
            ),
            const ListTile(title: Text("Likes")),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.pushNamed(context, ProfileScreen.path);
              },
            ),
          ],
        ),
      ),
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
          Builder(
            builder: (context) {
              return Center(
                child: UserAvatar(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  size: 40.0,
                  userAvatarPath: currentUser.photoUrl,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: authors
                      .map(
                        (a) => UserAvatar(
                          size: 40.0,
                          userAvatarPath: a.photoUrl,
                        ),
                      )
                      .toList(),
                ),
              ),
              Space.vertical(24.0),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) => Post(
                  postData: usersPosts[index],
                ),
              )
              // Column(
              //   children: usersPosts.map((p) => Post(postData: p)).toList(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
