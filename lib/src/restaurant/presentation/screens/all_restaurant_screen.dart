import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/constant/app_constant.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/resources/widgets/common_textformfield.dart';
import 'package:restaurant_app/src/restaurant/presentation/bloc/search_restaurant/search_restaurant_bloc.dart';

class AllRestaurantScreen extends StatefulWidget {
  const AllRestaurantScreen({super.key});

  @override
  State<AllRestaurantScreen> createState() => _AllRestaurantScreenState();
}

class _AllRestaurantScreenState extends State<AllRestaurantScreen> {
  late SearchRestaurantBloc searchBloc;

  final searchText = TextEditingController();

  @override
  void initState() {
    searchBloc = SearchRestaurantBloc(
      searchRestaurantUsecase: GetIt.instance(),
    )..add(SearchRestaurantInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Restaurant',
          style: StyleTypograph.heading3.medium,
        ),
      ),
      body: BlocConsumer<SearchRestaurantBloc, SearchRestaurantState>(
        bloc: searchBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: CommonTextForm(
                  obscured: false,
                  hint: 'Search name, kategori dan menu',
                  controller: searchText,
                  suffixIcon: Icons.search,
                  onpress: () {
                    searchBloc.add(
                      SearchRestaurantResultEvent(
                        searchKeyword: searchText.text,
                        founded: state.data.founded,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: showAll(state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget showAll(SearchRestaurantState state) {
    if (state is SearchRestaurantSuccessState) {
      var result = state.data.restaurant;
      if (result.isEmpty) {
        return Center(
          child: Text('No restaurants found.'),
        );
      }
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
          children: List.generate(result.length, (index) {
            var dataIndex = result[index];
            var namePlaces = dataIndex.name;
            var cityName = dataIndex.city;
            var rating = dataIndex.rating;
            var idPicture = dataIndex.pictureId;

            return InkWell(
              onTap: () {
                var idRestaurant = dataIndex.id;
                context.goNamed(
                  'detail-fromlist',
                  pathParameters: {'id': idRestaurant},
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(12),
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
                      flex: 2,
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
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              namePlaces,
                              overflow: TextOverflow.ellipsis,
                              style: StyleTypograph.body1.bold.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              cityName,
                              style: StyleTypograph.body2.regular.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  rating.toString(),
                                  style: StyleTypograph.body2.regular.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                RatingBar.builder(
                                  initialRating: rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
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
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    } else if (state is SearchRestaurantLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SearchRestaurantFailedState) {
      return Center(
        child: Text('Failed to fetch restaurants.'),
      );
    }
    return const Text('No data');
  }
}
