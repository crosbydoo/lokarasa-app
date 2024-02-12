import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileBodyContent extends StatefulWidget {
  const ProfileBodyContent({Key? key});

  @override
  State<ProfileBodyContent> createState() => _ProfileBodyContentState();
}

class _ProfileBodyContentState extends State<ProfileBodyContent> {
  final sosmedList = ['Github', 'Linkedin'];
  final iconList = ['assets/img/github.jpg', 'assets/img/linkedin.jpeg'];
  final urlLink = [
    'https://github.com/crosbydoo',
    'https://www.linkedin.com/in/ristu-aji/',
  ];

  final listSkill = [
    'Indonesian',
    'Computer Science',
    'Mobile Dev',
    'Software Engineering',
    'Flutter',
    'Swift',
    'Kotlin',
    'Vue',
    'Node',
  ];

  final iconSkill = [
    'assets/svg/island.svg',
    'assets/svg/computer.svg',
    'assets/svg/mobile.svg',
    'assets/svg/code.svg',
    'assets/svg/flutter.svg',
    'assets/svg/swift.svg',
    'assets/svg/kotlin.svg',
    'assets/svg/vue.svg',
    'assets/svg/node.svg',
  ];

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Color? _getCustomColor(int index) {
    if (index >= 0 && index <= 4) {
      switch (index) {
        case 0:
          return Colors.red;
        case 1:
          return Colors.green.shade700;
        case 2:
          return Colors.amber.shade700;
        case 3:
          return Colors.blue.shade800;
      }
    }
    return null;
  }

  ColorFilter? _getColorFilter(int index) {
    final customColor = _getCustomColor(index);
    if (customColor != null) {
      return ColorFilter.mode(customColor, BlendMode.srcIn);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: StyleTypograph.heading3.bold,
          ),
          Gap(5),
          Wrap(
            children: List.generate(listSkill.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Chip(
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      width: 0.5,
                    ),
                  ),
                  label: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset(
                        iconSkill[index],
                        height: 20,
                        width: 20,
                        colorFilter: _getColorFilter(index),
                      ),
                      SizedBox(width: 10),
                      Text(
                        listSkill[index],
                        style: StyleTypograph.body3.medium.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          Gap(20),
          ExpandableText(
            "Hi, I'm Ristu from Yogyakarta, Indonesia. I'm a mobile developer with approximately 1 year of professional world experience. Very enthusiastic about new things related to technology, I like to workout and don't forget to study because it is important for self-development isn't ?."
            " And for y'all who need help, find a friends, don't hesitate to hit me up",
            expandText: 'Read more',
            collapseText: 'Read less',
            maxLines: 2,
            linkColor: Colors.blue,
            style: StyleTypograph.body1.regular,
            textAlign: TextAlign.justify,
          ),
          Gap(20),
          Text(
            'Connect with me',
            style: StyleTypograph.heading3.bold,
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(2, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: InkWell(
                  onTap: () {
                    _launchUrl(urlLink[index]);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          iconList[index],
                        ),
                      ),
                      Gap(10),
                      Text(
                        sosmedList[index],
                        style: StyleTypograph.body1.medium,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          Gap(100),
        ],
      ),
    );
  }
}
