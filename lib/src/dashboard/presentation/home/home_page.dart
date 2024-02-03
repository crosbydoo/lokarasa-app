import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/utils/greeting.dart';
import 'package:restaurant_app/resources/provider/theme_provider.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/resources/themes/dark_theme.dart';
import 'package:restaurant_app/src/restaurant/presentation/screens/restaurant_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greetingTime(),
                style: StyleTypograph.heading2.bold.copyWith(
                  color: Colors.blue[300],
                ),
              ),
              Text(
                'Mau makan dimana?',
                style: StyleTypograph.label1.medium,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) => IconButton(
                onPressed: () {
                  themeProvider.changeMode();
                },
                icon: Icon(
                  themeProvider.themeData == darkMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  size: 30,
                  color: themeProvider.themeData == darkMode
                      ? Colors.yellow[300]
                      : Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: RestaurantScreen(),
      ),
    );
  }
}
