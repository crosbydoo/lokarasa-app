import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/constant/app_constant.dart';
import 'package:restaurant_app/core/routes/named_router.dart';
import 'package:restaurant_app/core/utils/greeting.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/src/restaurant/presentation/bloc/restaurant/restaurant_bloc.dart';
import 'package:restaurant_app/src/restaurant/presentation/widgets/carousel_widget.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  late RestaurantBloc bloc;

  @override
  void initState() {
    bloc = RestaurantBloc(
      usecase: GetIt.instance(),
      detailUsecase: GetIt.instance(),
      reviewUsecase: GetIt.instance(),
    )
      ..add(RestaurantInitEvent())
      ..add(RestaurantShowListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantBloc, RestaurantState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greetingTime(),
              style: StyleTypograph.heading2.bold.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            Text(
              'Where you want to go?',
              style: StyleTypograph.label1.medium,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/hero.png'),
                ),
              ),
              child: const CarouselWidget(),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Places',
                          style: StyleTypograph.heading3.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            context.go(
                              NamedRouter.goAllRestaurantPage,
                            );
                          },
                          child: Text(
                            'See all',
                            style: StyleTypograph.body1.medium.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: listRestaurant(state),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget listRestaurant(RestaurantState state) {
    if (state is RestaurantLoadingState) {
      return const CircularProgressIndicator();
    }
    if (state is RestaurantSuccesState) {
      var result = state.data.data;
      return SizedBox(
        height: MediaQuery.sizeOf(context).height / 5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: result.length,
          itemBuilder: (context, index) {
            var data = result[index];
            var namePlaces = data.name;
            var cityPlaces = data.city;
            var idPicture = data.pictureId;
            return InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                var idRestaurant = data.id;
                context.goNamed(
                  'detail',
                  pathParameters: {'id': idRestaurant},
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width / 2,
                margin: const EdgeInsets.only(right: 20, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 1,
                      offset: const Offset(2, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '${AppConstant.baseImgUrl}/$idPicture',
                            ),
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            namePlaces,
                            style: StyleTypograph.heading3.medium.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            cityPlaces,
                            style: StyleTypograph.label1.medium.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
    return const Text('no data');
  }
}
