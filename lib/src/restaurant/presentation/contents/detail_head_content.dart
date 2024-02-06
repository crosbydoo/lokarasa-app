import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/core/constant/app_constant.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/src/restaurant/presentation/widgets/title_widget.dart';

class DetailHeadContent extends StatelessWidget {
  const DetailHeadContent({
    super.key,
    required this.idPicture,
    required this.name,
    required this.address,
    required this.rating,
    required this.city,
    required this.categories,
  });
  final String idPicture;
  final String name;
  final String address;
  final double rating;
  final String city;
  final List categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.9,
          image: NetworkImage('${AppConstant.baseImgUrl}/$idPicture'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: StyleTypograph.heading1.bold.copyWith(color: Colors.white),
            ),
            Text(
              '$address, $city',
              style:
                  StyleTypograph.heading3.regular.copyWith(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(categories.length, (index) {
                      var category = categories[index];
                      var nameCategory = category.name;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TitleWidget(
                          backgroundColor: Colors.grey.shade700,
                          text: nameCategory,
                        ),
                      );
                    }),
                  ),
                  Row(
                    children: [
                      Text(
                        rating.toString(),
                        style: StyleTypograph.heading3.bold
                            .copyWith(color: Colors.white),
                      ),
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        ignoreGestures: true,
                        tapOnlyMode: false,
                        onRatingUpdate: (double value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
