import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/src/restaurant/presentation/bloc/restaurant_bloc.dart';

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
        if (state is RestaurantSuccesState) {
          var result = state.data.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/serving.png',
                      scale: 3,
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Good food is the foundation of genuine happiness.',
                            style: StyleTypograph.label1.medium,
                          ),
                          const Gap(12),
                          Text(
                            'Auguste Escoffier',
                            style: StyleTypograph.label1.medium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  result.length,
                  (index) {
                    var data = result[index];
                    var name = data.city;
                    return Text(name);
                  },
                ),
              ),
            ],
          );
        }
        return const Column(
          children: [
            Text('hahs'),
          ],
        );
      },
    );
  }
}
