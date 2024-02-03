import 'package:either_dart/either.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/example/data/repository/example_repository.dart';
import 'package:restaurant_app/src/example/domain/mapper/example_mapper.dart';
import 'package:restaurant_app/src/example/domain/models/post_dto.dart';

class GetPostUseCase {
  final ExampleRepository repository;

  GetPostUseCase(this.repository);

  FutureOrError<List<PostDto>> execute() {
    return repository
        .getPosts()
        .mapRight((data) => data.map((e) => e.toDto()).toList());
  }
}
