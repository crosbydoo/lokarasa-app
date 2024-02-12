import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class ProfileHeaderContent extends StatelessWidget {
  const ProfileHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AvatarGlow(
                glowRadiusFactor: 0.15,
                glowColor: Colors.blue,
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: AssetImage('assets/img/profile.png'),
                ),
              ),
              Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Crosbydev',
                    style: StyleTypograph.heading3.bold.copyWith(
                      color: Colors.orange,
                    ),
                  ),
                  Gap(5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Mobile Developer',
                      style: StyleTypograph.label1.medium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Gap(10),
                  Text(
                    'Indonesia · He/Him',
                    style: StyleTypograph.label2.medium.copyWith(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
