import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/src/bookmark/presentation/screens/bookmark_screen.dart';

class DashboardBookmark extends StatefulWidget {
  const DashboardBookmark({super.key});

  @override
  State<DashboardBookmark> createState() => _DashboardBookmarkState();
}

class _DashboardBookmarkState extends State<DashboardBookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 10),
          child: Image.asset(
            'assets/img/lokarasa.png',
            scale: 15,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/img/person_gesture.png',
                  scale: 25,
                ),
                Gap(10),
                Expanded(
                  child: Text(
                    'Fitur Bookmark memudahkan kita agar tidak lupa tempat favoritemu.',
                    style: StyleTypograph.label2.medium.copyWith(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BookmarkScreen(),
          ),
        ],
      ),
    );
  }
}
