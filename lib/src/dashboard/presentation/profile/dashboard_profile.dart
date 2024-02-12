import 'package:flutter/material.dart';
import 'package:restaurant_app/resources/widgets/common_container_image.dart';
import 'package:restaurant_app/src/dashboard/presentation/profile/contents/profile_body_content.dart';
import 'package:restaurant_app/src/dashboard/presentation/profile/contents/profile_header_content.dart';

class DashboardProfile extends StatelessWidget {
  const DashboardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      imagePath: 'assets/img/profile_bg.png',
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: false,
          iconTheme: const IconThemeData(size: 30, color: Colors.white),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Image.asset(
              'assets/img/lokarasa.png',
              scale: 15,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            ProfileHeaderContent(),
            ProfileBodyContent(),
          ],
        ),
      ),
    );
  }
}
