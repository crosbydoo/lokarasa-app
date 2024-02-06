import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/src/restaurant/domain/models/detail_restaurant_dto.dart';
import 'package:restaurant_app/src/restaurant/presentation/widgets/menu_chip_widget.dart';
import 'package:restaurant_app/src/restaurant/presentation/widgets/review_bubble_widget.dart';

class DetailBodyContent extends StatelessWidget {
  const DetailBodyContent({
    super.key,
    required this.description,
    this.menu,
    this.review,
  });

  final String description;
  final MenusDto? menu;
  final List? review;

  @override
  Widget build(BuildContext context) {
    print('check menu $menu');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: StyleTypograph.heading3.bold,
          ),
          Gap(8),
          ExpandableText(
            description,
            expandText: 'Read more',
            collapseText: 'Read less',
            maxLines: 2,
            linkColor: Colors.blue,
            style: StyleTypograph.body1.regular,
            textAlign: TextAlign.justify,
          ),
          Gap(12),
          Text(
            'Foods Menu',
            style: StyleTypograph.heading3.bold,
          ),
          MenuChipWidget(
            menuItem: menu!.foods.map((food) => food.name).toList(),
          ),
          Gap(12),
          Text(
            'Drinks Menu',
            style: StyleTypograph.heading3.bold,
          ),
          MenuChipWidget(
            menuItem: menu!.drinks.map((drink) => drink.name).toList(),
          ),
          Gap(12),
          Text(
            'Review',
            style: StyleTypograph.heading3.bold,
          ),
          Column(
            children: List.generate(review!.length, (index) {
              var result = review![index];
              var nameSender = result.name;
              var date = result.date;
              var reviewText = result.review;
              return ReviewBubbleWidget(
                dateReview: date,
                textReview: reviewText,
                userReview: nameSender,
              );
            }),
          )
        ],
      ),
    );
  }
}
