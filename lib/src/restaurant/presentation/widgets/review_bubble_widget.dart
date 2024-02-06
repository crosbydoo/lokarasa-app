import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class ReviewBubbleWidget extends StatelessWidget {
  const ReviewBubbleWidget({
    super.key,
    required this.textReview,
    required this.userReview,
    required this.dateReview,
  });
  final String textReview;
  final String userReview;
  final String dateReview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textReview,
            style: StyleTypograph.label1.bold,
          ),
          Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By: $userReview',
                overflow: TextOverflow.ellipsis,
                style: StyleTypograph.body1.medium,
              ),
              Text(
                dateReview,
                overflow: TextOverflow.ellipsis,
                style: StyleTypograph.body1.regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
