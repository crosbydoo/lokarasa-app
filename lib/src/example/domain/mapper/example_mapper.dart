import 'package:restaurant_app/src/example/data/remote/responses/post_response.dart';
import 'package:restaurant_app/src/example/domain/models/post_dto.dart';

extension PostResponseExt on PostResponse? {
  PostDto toDto() {
    return PostDto(
      id: this?.id ?? 0,
      userId: this?.userId ?? 0,
      title: this?.title ?? '',
      body: this?.body ?? '',
    );
  }
}
