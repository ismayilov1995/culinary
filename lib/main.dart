import 'package:culinary_app/logic/blocs/blocs.dart';
import 'package:culinary_app/core/themes/app_theme.dart';
import 'package:culinary_app/presentation/router/app_router.dart';
import 'package:culinary_app/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubits/cubits.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: CulinaryApp(),
    );
  }
}

class CulinaryApp extends StatefulWidget {
  const CulinaryApp({
    Key? key,
  }) : super(key: key);

  @override
  _CulinaryAppState createState() => _CulinaryAppState();
}

class _CulinaryAppState extends State<CulinaryApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().changeTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinary app',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: context.select((ThemeCubit cubit) => cubit.state.themeMode),
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.pageID,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
