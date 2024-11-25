import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/types/direction_type.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';
import 'package:flutter_boilerplate/src/modules/home/presentation/detail_film_screen/detail_film_screen.dart';
import 'package:flutter_boilerplate/src/modules/home/presentation/home_screen/home_screen.dart';
import 'package:flutter_boilerplate/src/modules/splash/splash.dart';

enum Routes { splash, home, login, secondScreen }

class _Paths {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String secondScreen = '/home/secondScreen';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.login: _Paths.login,
    Routes.home: _Paths.home,
    Routes.secondScreen: _Paths.secondScreen,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case _Paths.secondScreen:
        return NavSlideCloseCustom(
          child: DetailFilmScreen(filmData: settings.arguments as FilmEntity),
          direction: DirectionType.left,
        );

      ///Defaul case
      case _Paths.home:
      default:
        return NavSlideCloseCustom(
          child: const HomeScreen(),
          direction: DirectionType.none,
        );
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}

class NavSlideCloseCustom extends PageRouteBuilder {
  final Widget child;
  DirectionType direction;
  NavSlideCloseCustom(
      {required this.child, this.direction = DirectionType.none})
      : super(
          transitionDuration: const Duration(milliseconds: 0),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  Tween<Offset> getPosition() {
    switch (direction) {
      case DirectionType.left:
        return Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        );
      case DirectionType.right:
        return Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        );
      case DirectionType.top:
        return Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        );
      case DirectionType.bottom:
        return Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        );
      default:
        Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        );
    }
    return Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
          position: getPosition().animate(animation), child: child),
    );
  }
}
