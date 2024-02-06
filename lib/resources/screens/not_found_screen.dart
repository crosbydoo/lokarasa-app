import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/routes/named_router.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/slipped.png'),
            Text(
              'Opps!',
              style: StyleTypograph.heading3.bold,
            ),
            const Gap(20),
            Text(
              'We’re sorry. The page you requested could not be found or accessed',
              textAlign: TextAlign.center,
              style: StyleTypograph.label1.medium,
            ),
            const Gap(32),
            ElevatedButton(
              onPressed: () {
                context.go(NamedRouter.homePage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
              ),
              child: Text(
                'Back to Main Page',
                style: StyleTypograph.body1.medium.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
