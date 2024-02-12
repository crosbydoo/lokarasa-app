// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_app/core/constant/app_constant.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';
import 'package:restaurant_app/resources/widgets/common_snackbar.dart';
import 'package:restaurant_app/src/bookmark/domain/model/bookmark_dto.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  late Box<BookmarkDto> boxBookmark;

  @override
  void initState() {
    initHive();
    super.initState();
  }

  Future<Box<BookmarkDto>> initHive() async {
    boxBookmark = await Hive.openBox<BookmarkDto>('bookmarkBox');
    return boxBookmark;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<BookmarkDto>>(
      future: initHive(),
      builder: (context, snapshot) {
        if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/nodata.png',
                scale: 2.5,
              ),
              Text(
                'Oops, data empty',
                style: StyleTypograph.heading2.medium,
              ),
            ],
          );
        }
        if (snapshot.hasData) {
          return Container(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var bookmark = snapshot.data!.getAt(index);
                var imageId = bookmark!.idPicture;
                var name = bookmark.name;
                var city = bookmark.city;
                var id = bookmark.id;
                var rating = bookmark.rating;

                return InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    context.goNamed(
                      'bookmark',
                      pathParameters: {'id': id},
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme == Brightness.light
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.10,
                          width: MediaQuery.sizeOf(context).width * 0.20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                '${AppConstant.baseImgUrl}/$imageId',
                              ),
                            ),
                          ),
                        ),
                        Gap(20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: StyleTypograph.label1.bold,
                              ),
                              Gap(8),
                              Text(
                                city,
                                style: StyleTypograph.label1.regular,
                              ),
                              Gap(8),
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
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.bookmark,
                            size: 30,
                            color: Colors.green.shade400,
                          ),
                          onPressed: () {
                            setState(() {
                              boxBookmark.deleteAt(index);
                              CommonSnackbar.showSuccessSnackbar(
                                context: context,
                                title: 'Success',
                                message: 'Unbookmark berhasil',
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
