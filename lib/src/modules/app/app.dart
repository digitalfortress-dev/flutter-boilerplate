import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/l10n/res.dart';
import 'package:flutter_clean_architecture/src/core/config/constants.dart';
import 'package:flutter_clean_architecture/src/core/config/themes.dart';
import 'package:flutter_clean_architecture/src/core/di/dependency_injection.dart';
import 'package:flutter_clean_architecture/src/modules/app/bloc/language_bloc.dart';
import 'package:flutter_clean_architecture/src/modules/home/domain/usecases/film_usecases.dart';
import 'package:flutter_clean_architecture/src/modules/home/presentation/bloc/film_bloc/film_bloc.dart';

import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //TODO: Provider all BLOC here
        BlocProvider(
          create: (_) => LanguageBloc(),
        ),
        BlocProvider(
          create: (_) => FilmBloc(getIt<FetchFilmUseCase>()),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Clean Architecture Flutter',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      localizationsDelegates: Resource.localizationsDelegates,
      supportedLocales: Resource.supportedLocales,
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        if (supportedLocales.any((element) =>
            locale?.languageCode.contains(element.toString()) == true)) {
          context
              .read<LanguageBloc>()
              .add(UpdateLocaleCodeEvent(localeCode: locale!.languageCode));
          return locale;
        }
        return const Locale('en', '');
      },
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();

        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor =
            min(smallestSize / AppConstants.designScreenSize.width, 1.0);

        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: child,
        );
      },
    );
  }
}
