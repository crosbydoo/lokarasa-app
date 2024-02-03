import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app/src/example/domain/models/post_dto.dart';
import 'package:restaurant_app/src/example/presentation/example/example_bloc.dart';

class ExamplePage extends StatelessWidget {
  static const route = '/example';

  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExampleBloc(
        getPostUseCase: GetIt.instance(),
      )..add(ExampleGetPostEvent()),
      child: const _ExamplePageView(),
    );
  }
}

class _ExamplePageView extends StatelessWidget {
  const _ExamplePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ExampleBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: BlocConsumer<ExampleBloc, ExampleState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is ExampleLoadingState) {
              print('loading');
            }
          },
          builder: (context, state) {
            if (state is ExampleLoadingState) {
              return const CircularProgressIndicator();
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text('Value: ${state.data.incrementValue}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(const ExampleIncrementEvent(incremental: 2));
                    },
                    child: const Text('Increment'),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    itemCount: state.data.posts.length,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (ctx, idx) {
                      return ExampleQuoteItem(
                        post: state.data.posts[idx],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExampleQuoteItem extends StatelessWidget {
  final PostDto post;

  const ExampleQuoteItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(post.title),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
