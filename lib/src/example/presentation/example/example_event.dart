part of 'example_bloc.dart';

/// Event
abstract class ExampleEvent extends Equatable {
  const ExampleEvent();
}

class ExampleInitEvent extends ExampleEvent {
  @override
  List<Object?> get props => [];
}

class ExampleGetPostEvent extends ExampleEvent {
  @override
  List<Object?> get props => [];
}

class ExampleIncrementEvent extends ExampleEvent {
  final int incremental;

  const ExampleIncrementEvent({
    required this.incremental,
  });

  @override
  List<Object?> get props => [incremental];
}
