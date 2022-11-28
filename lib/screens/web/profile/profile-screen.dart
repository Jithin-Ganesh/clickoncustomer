import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/elevated-buton.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../models/user.dart';
import '../../../providers/user-provider.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/img-provider.dart';

class ProfileWebScreen extends StatefulWidget {
  static const routeName = '/profile-web';
  final int? id;
  const ProfileWebScreen({
    Key? key, this.id,
  }) : super(key: key);

  @override
  _ProfileWebScreenState createState() => _ProfileWebScreenState();
}

class _ProfileWebScreenState extends State<ProfileWebScreen> {
  ProfileWebScreen get _args {
    final args = ModalRoute.of(context)!.settings.arguments as ProfileWebScreen;
    return args;
  }

  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Responsive(
      tablet: Container(
        child: const Center(
          child: ImgProvider(
            url: "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
      ),
      mobile: const Center(
        child: ImgProvider(
          url: "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      desktop: Scaffold(
        backgroundColor: bgColor2,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(175), child: WebNavBar2()),
        body: FutureBuilder(
          future: Provider.of<UserProvider>(context, listen: false)
              .fetchUserProfile(id: _args.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 15,
                ),
              );
            } else {
              if (snapshot.hasData) {
                final userProfile = snapshot.data as User;
                return Consumer<UserProvider>(builder: (context, value, child) => SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30, vertical: 40),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ImgProvider(
                                  url: 'assets/images/dummy/profile.png',
                                  height: 300,
                                  width: 300,
                                  radius: 150,
                                  boxFit: BoxFit.fill,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 50,
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(context,
                                      //     EditProfileWebScreen.routeName,
                                      //     arguments: EditProfileWebScreen(
                                      //       user: value.user,
                                      //     ));
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        "assets/images/icons8-pen-67.png",
                                        color: accentColor,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Name :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                      fontSize: 25, color: accentColor),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "${value.user?.firstName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Last Name :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                      fontSize: 25, color: accentColor),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "${value.user?.lastName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Email :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                      fontSize: 25, color: accentColor),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  value.user?.email ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Phone Number :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(
                                      fontSize: 25, color: accentColor),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  value.user?.phone ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.copyWith(fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                );
              }
            }
            return Text(
              snapshot.error.toString(),
            );
          },
        ),
      ),
    );
  }
}
