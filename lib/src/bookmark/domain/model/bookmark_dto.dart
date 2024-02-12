import 'package:hive/hive.dart';

part 'bookmark_dto.g.dart';

@HiveType(typeId: 1)
class BookmarkDto {
  BookmarkDto({
    required this.id,
    required this.name,
    required this.city,
    required this.rating,
    required this.idPicture,
    this.isBookmark = false,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String city;

  @HiveField(3)
  double rating;

  @HiveField(4)
  String idPicture;

  @HiveField(5)
  bool? isBookmark;
}
