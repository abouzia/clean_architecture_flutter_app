import 'package:clean_architecture_app/core/app_theme.dart';
import 'package:clean_architecture_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:clean_architecture_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:clean_architecture_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<PostsBloc>(),
        ),
        BlocProvider(create: (_) => locator<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Demo'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
