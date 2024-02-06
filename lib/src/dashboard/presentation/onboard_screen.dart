import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/routes/named_router.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/resources/widgets/common_button.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.asset('assets/img/person_eat.png'),
                    ),
                    const Gap(30),
                    Text(
                      'Loka Rasa',
                      style: StyleTypograph.heading2.medium,
                    ),
                    Text(
                      'Monggo Pinarak Dhahar Sesarengan',
                      style: StyleTypograph.label1.regular,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CommonButton.normalButton(
                  onPressed: () {
                    context.go(NamedRouter.homePage);
                  },
                  text: 'Get Started',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
