import 'package:flutter/material.dart';

class DashboardProfile extends StatelessWidget {
  const DashboardProfile({super.key});

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
        children: [],
      ),
    );
  }
}
