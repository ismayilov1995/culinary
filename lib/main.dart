import 'package:culinary_app/logic/blocs/blocs.dart';
import 'package:culinary_app/core/themes/app_theme.dart';
import 'package:culinary_app/logic/debug/app_bloc_observer.dart';
import 'package:culinary_app/presentation/router/app_router.dart';
import 'package:culinary_app/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubits/cubits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = AppBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
      ],
      child: CulinaryApp(),
    );
  }
}

class CulinaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinary app',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.select((ThemeCubit cubit) => cubit.state.themeMode),
      initialRoute: HomeScreen.pageID,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
