import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/logo_de_una_aplicaci_n_que_se_encarga_de_gestionar_eventos_porte_calendario_para_app_movil.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : const LoginEmailWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/logo_de_una_aplicaci_n_que_se_encarga_de_gestionar_eventos_porte_calendario_para_app_movil.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const LoginEmailWidget(),
        ),
        FFRoute(
          name: 'events',
          path: '/events',
          builder: (context, params) => const EventsWidget(),
        ),
        FFRoute(
          name: 'createEvent',
          path: '/createEvent',
          builder: (context, params) => const CreateEventWidget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            message: params.getParam(
              'message',
              ParamType.String,
            ),
            timezone: params.getParam(
              'timezone',
              ParamType.String,
            ),
            timeFormat: params.getParam(
              'timeFormat',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'calendarSync',
          path: '/calendarSync',
          builder: (context, params) => const CalendarSyncWidget(),
        ),
        FFRoute(
          name: 'addCalendar',
          path: '/addCalendar',
          builder: (context, params) => const AddCalendarWidget(),
        ),
        FFRoute(
          name: 'scheduledEvents',
          path: '/scheduledEvents',
          builder: (context, params) => const ScheduledEventsWidget(),
        ),
        FFRoute(
          name: 'editSingleSession',
          path: '/editSingleSession',
          builder: (context, params) => EditSingleSessionWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            duration: params.getParam(
              'duration',
              ParamType.String,
            ),
            mail: params.getParam(
              'mail',
              ParamType.String,
            ),
            nameUser: params.getParam(
              'nameUser',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'loginEmail',
          path: '/loginEmail',
          builder: (context, params) => const LoginEmailWidget(),
        ),
        FFRoute(
          name: 'Aniversario',
          path: '/aniversario',
          builder: (context, params) => AniversarioWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            duration: params.getParam(
              'duration',
              ParamType.String,
            ),
            mail: params.getParam(
              'mail',
              ParamType.String,
            ),
            nameUser: params.getParam(
              'nameUser',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Cuentaregresiva',
          path: '/cuentaRegresiva',
          builder: (context, params) => CuentaregresivaWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            duration: params.getParam(
              'duration',
              ParamType.String,
            ),
            mail: params.getParam(
              'mail',
              ParamType.String,
            ),
            nameUser: params.getParam(
              'nameUser',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
