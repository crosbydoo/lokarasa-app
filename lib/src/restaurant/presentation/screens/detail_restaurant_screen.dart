import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_app/resources/widgets/common_snackbar.dart';
import 'package:restaurant_app/src/bookmark/domain/model/bookmark_dto.dart';
import 'package:restaurant_app/src/restaurant/presentation/bloc/restaurant/restaurant_bloc.dart';
import 'package:restaurant_app/src/restaurant/presentation/components/form_review_component.dart';
import 'package:restaurant_app/src/restaurant/presentation/contents/detail_body_content.dart';
import 'package:restaurant_app/src/restaurant/presentation/contents/detail_head_content.dart';

class DetailRestaurantScreen extends StatefulWidget {
  const DetailRestaurantScreen({super.key, this.id});
  final String? id;

  @override
  State<DetailRestaurantScreen> createState() => _DetailRestaurantScreenState();
}

class _DetailRestaurantScreenState extends State<DetailRestaurantScreen> {
  late RestaurantBloc bloc;
  final TextEditingController nameInput = TextEditingController();

  late Box<BookmarkDto> boxBookmark;
  bool isBookmarked = false;

  @override
  void initState() {
    bloc = RestaurantBloc(
      detailUsecase: GetIt.instance(),
      usecase: GetIt.instance(),
    )..add(RestaurantShowDetailEvent(id: widget.id!));

    initializeHive();
    super.initState();
  }

  initHive() async {
    boxBookmark = await Hive.openBox<BookmarkDto>('bookmarkBox');
    return boxBookmark;
  }

  Future<Box<BookmarkDto>> initializeHive() async {
    boxBookmark = await Hive.openBox<BookmarkDto>('bookmarkBox');
    return boxBookmark;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantBloc, RestaurantState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(size: 30, color: Colors.white),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              showHeaderData(state),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                FutureBuilder(
                  future: initializeHive(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Box<BookmarkDto>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.data == null) {
                      return Center(child: Text('Data is null'));
                    } else {
                      boxBookmark = snapshot.data!;

                      return FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.blue.shade300,
                        onPressed: () {
                          if (boxBookmark
                              .containsKey('key_${state.data.detailData.id}')) {
                            CommonSnackbar.showCustomSnackbar(
                              context,
                              'Already Bookmarked',
                              'This restaurant is already in your bookmarks.',
                              Colors.orange,
                            );
                          } else {
                            setState(() {
                              boxBookmark.put(
                                'key_${state.data.detailData.id}',
                                BookmarkDto(
                                  id: state.data.detailData.id,
                                  name: state.data.detailData.name,
                                  city: state.data.detailData.city,
                                  rating: state.data.detailData.rating,
                                  idPicture: state.data.detailData.pictureId,
                                ),
                              );
                              isBookmarked = true;
                            });
                            CommonSnackbar.showSuccessSnackbar(
                              context,
                              'Success',
                              'Successfully adding to bookmark',
                            );
                          }
                        },
                        child: Icon(
                          Icons.bookmark,
                          size: 30,
                          color: isBookmarked
                              ? Colors.green.shade700
                              : Colors.white,
                        ),
                      );
                    }
                  },
                ),
                Gap(20),
                Expanded(
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    label: Text('Add Review'),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: SafeArea(
                              top: false,
                              child: FormReviewComponent(
                                controller: nameInput,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showHeaderData(RestaurantState state) {
    if (state is RestaurantDetailSuccessState) {
      var result = state.data.detailData;
      var name = result.name;
      var idPicture = result.pictureId;
      var city = result.city;
      var address = result.address;
      var rating = result.rating;
      var description = result.description;
      var category = result.categories;
      var menus = result.menus;
      var review = result.customerReviews;

      print('check $menus');

      return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          DetailHeadContent(
            idPicture: idPicture,
            name: name,
            address: address,
            rating: rating,
            city: city,
            categories: category,
          ),
          DetailBodyContent(
            menu: menus,
            review: review,
            description: description,
          ),
          Gap.expand(100)
        ],
      );
    }
    return Container(
      child: Center(
        child: Text('No Data'),
      ),
    );
  }
}
