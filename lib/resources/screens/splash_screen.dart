import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/core/routes/named_router.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3200), () {
      context.go(NamedRouter.onboardPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 4,
              child: Lottie.asset(
                'assets/lottie/platties.json',
                fit: BoxFit.cover,
              ),
            ),
            const Gap(30),
            Text(
              'Loka Rasa',
              style: StyleTypograph.heading2.medium,
            ),
          ],
        ),
      ),
    );
  }
}
