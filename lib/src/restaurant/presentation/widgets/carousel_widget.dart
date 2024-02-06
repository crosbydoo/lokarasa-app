import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();
    final selected = ValueNotifier<int>(0);

    final quoteList = [
      "Good food is the foundation of genuine happiness",
      "First we eat, then we do everything else",
      "One cannot think well, love well, sleep well, if one has not dined well",
      "Tell me what you eat, and I will tell you what you are",
      "Food is our common ground, a universal experience.",
    ];
    final authotList = [
      'Auguste Escoffier',
      'M.F.K. Fisher',
      'Virginia Woolf',
      'Anthelme Brillat-Savarin',
      'James Beard',
    ];

    final iconList = [
      'assets/img/serving.png',
      'assets/img/eat.png',
      'assets/img/pizza.png',
      'assets/img/burger.png',
      'assets/img/buyfood.png',
    ];

    return ValueListenableBuilder(
      valueListenable: selected,
      builder: (context, value, child) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: authotList.length,
              carouselController: controller,
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                height: MediaQuery.sizeOf(context).height / 8,
                onPageChanged: (index, reason) {
                  selected.value = index;
                },
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      iconList[itemIndex],
                      scale: 3,
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              quoteList[itemIndex],
                              style: StyleTypograph.label1.medium.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            authotList[itemIndex],
                            style: StyleTypograph.label1.regular.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (var i = 0; i < authotList.length; i++)
                  GestureDetector(
                    onTap: () {
                      controller.animateToPage(i);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                            .withOpacity(selected.value == i ? 0.9 : 0.4),
                      ),
                    ),
                  ),
              ],
            )
          ],
        );
      },
    );
  }
}
