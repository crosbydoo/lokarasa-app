import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/example/data/remote/responses/post_response.dart';

abstract class ExampleRepository {
  FutureOrError<List<PostResponse>> getPosts();
}
