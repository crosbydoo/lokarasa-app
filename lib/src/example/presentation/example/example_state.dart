part of 'example_bloc.dart';

/// State data
class ExampleStateData extends Equatable {
  final int incrementValue;
  final List<PostDto> posts;
  final ErrorDto? error;

  const ExampleStateData({
    this.incrementValue = 0,
    this.posts = const [],
    this.error,
  });

  ExampleStateData copyWith({
    int? incrementValue,
    List<PostDto>? posts,
    ErrorDto? error,
  }) {
    return ExampleStateData(
      incrementValue: incrementValue ?? this.incrementValue,
      posts: posts ?? this.posts,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [incrementValue, posts, error];
}

/// State
abstract class ExampleState extends Equatable {
  final ExampleStateData data;

  const ExampleState(this.data);
}

class ExampleInitialState extends ExampleState {
  const ExampleInitialState() : super(const ExampleStateData());

  @override
  List<Object> get props => [super.data];
}

class ExampleLoadingState extends ExampleState {
  const ExampleLoadingState(super.data);

  @override
  List<Object> get props => [super.data];
}

class ExampleDisplayValueState extends ExampleState {
  const ExampleDisplayValueState(super.data);

  @override
  List<Object> get props => [super.data];
}

class ExampleDisplayPostsState extends ExampleState {
  const ExampleDisplayPostsState(super.data);

  @override
  List<Object> get props => [super.data];
}

class ExampleErrorState extends ExampleState {
  const ExampleErrorState(super.data);

  @override
  List<Object> get props => [super.data];
}
