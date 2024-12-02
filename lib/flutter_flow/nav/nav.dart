import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const PhoneAuthWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const PhoneAuthWidget(),
        ),
        FFRoute(
          name: 'Status',
          path: '/status',
          builder: (context, params) => StatusWidget(
            ticketid: params.getParam(
              'ticketid',
              ParamType.int,
            ),
            pageName: params.getParam(
              'pageName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'History',
          path: '/history',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'History')
              : const NavBarPage(
                  initialPage: 'History',
                  page: HistoryWidget(),
                ),
        ),
        FFRoute(
          name: 'statusOfOrders',
          path: '/statusOfOrders',
          builder: (context, params) => StatusOfOrdersWidget(
            ticketid: params.getParam(
              'ticketid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Home')
              : const NavBarPage(
                  initialPage: 'Home',
                  page: HomeWidget(),
                ),
        ),
        FFRoute(
          name: 'Cancelled',
          path: '/cancelled',
          builder: (context, params) => const CancelledWidget(),
        ),
        FFRoute(
          name: 'medicineCart',
          path: '/medicineCart',
          builder: (context, params) => MedicineCartWidget(
            ticketId: params.getParam(
              'ticketId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'Location',
          path: '/location',
          builder: (context, params) => const LocationWidget(),
        ),
        FFRoute(
          name: 'PhoneAuth',
          path: '/phoneAuth',
          builder: (context, params) => const PhoneAuthWidget(),
        ),
        FFRoute(
          name: 'Otp',
          path: '/otp',
          builder: (context, params) => OtpWidget(
            number: params.getParam(
              'number',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'Ordermedicine',
          path: '/ordermedicine',
          builder: (context, params) => const OrdermedicineWidget(),
        ),
        FFRoute(
          name: 'PaymentSuccess',
          path: '/paymentSuccess',
          builder: (context, params) => PaymentSuccessWidget(
            ticketId: params.getParam(
              'ticketId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'PaymentFailed',
          path: '/paymentFailed',
          builder: (context, params) => PaymentFailedWidget(
            ticketid: params.getParam(
              'ticketid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'statusOfOrder',
          path: '/statusOfOrder',
          builder: (context, params) => StatusOfOrderWidget(
            ticketid: params.getParam(
              'ticketid',
              ParamType.int,
            ),
            pagename: params.getParam(
              'pagename',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'statusOfOrder3',
          path: '/statusOfOrder3',
          builder: (context, params) => const StatusOfOrder3Widget(),
        ),
        FFRoute(
          name: 'statusOfOrder4',
          path: '/statusOfOrder4',
          builder: (context, params) => const StatusOfOrder4Widget(),
        ),
        FFRoute(
          name: 'statusOfOrder5',
          path: '/statusOfOrder5',
          builder: (context, params) => const StatusOfOrder5Widget(),
        ),
        FFRoute(
          name: 'Userlogdata',
          path: '/userlogdata',
          builder: (context, params) => const UserlogdataWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          requireAuth: true,
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'changeLocation',
          path: '/changeLocation',
          builder: (context, params) => ChangeLocationWidget(
            lat: params.getParam(
              'lat',
              ParamType.String,
            ),
            lng: params.getParam(
              'lng',
              ParamType.String,
            ),
            orderRecordId: params.getParam(
              'orderRecordId',
              ParamType.String,
            ),
            pagename: params.getParam(
              'pagename',
              ParamType.String,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            tag: params.getParam(
              'tag',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'searchAndDiscoveryHome',
          path: '/searchAndDiscoveryHome',
          builder: (context, params) => const SearchAndDiscoveryHomeWidget(),
        ),
        FFRoute(
          name: 'searchAndDiscover2',
          path: '/searchAndDiscover2',
          builder: (context, params) => const SearchAndDiscover2Widget(),
        ),
        FFRoute(
          name: 'Addressbook',
          path: '/addressbook',
          builder: (context, params) => const AddressbookWidget(),
        ),
        FFRoute(
          name: 'PolicyWebview',
          path: '/policyWebview',
          builder: (context, params) => const PolicyWebviewWidget(),
        ),
        FFRoute(
          name: 'searchMedicine',
          path: '/searchMedicine',
          builder: (context, params) => const SearchMedicineWidget(),
        ),
        FFRoute(
          name: 'searchAndAutoSuggest',
          path: '/searchAndAutoSuggest',
          builder: (context, params) => const SearchAndAutoSuggestWidget(),
        ),
        FFRoute(
          name: 'productDescriptionPage',
          path: '/productDescriptionPage',
          builder: (context, params) => const ProductDescriptionPageWidget(),
        ),
        FFRoute(
          name: 'MedicineInformation',
          path: '/medicineInformation',
          builder: (context, params) => MedicineInformationWidget(
            productid: params.getParam(
              'productid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'searchMedicineCopy',
          path: '/searchMedicineCopy',
          builder: (context, params) => const SearchMedicineCopyWidget(),
        ),
        FFRoute(
          name: 'cartEmpty',
          path: '/cartEmpty',
          builder: (context, params) => const CartEmptyWidget(),
        ),
        FFRoute(
          name: 'SearchLocationCopy',
          path: '/searchLocationCopy',
          builder: (context, params) => SearchLocationCopyWidget(
            recordId: params.getParam(
              'recordId',
              ParamType.String,
            ),
            pagename: params.getParam(
              'pagename',
              ParamType.String,
            ),
            addLocation: params.getParam(
              'addLocation',
              ParamType.String,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            tag: params.getParam(
              'tag',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SearchLocation',
          path: '/searchLocation',
          builder: (context, params) => SearchLocationWidget(
            recordId: params.getParam(
              'recordId',
              ParamType.String,
            ),
            addLocation: params.getParam(
              'addLocation',
              ParamType.String,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            tag: params.getParam(
              'tag',
              ParamType.String,
            ),
            pagename: params.getParam(
              'pagename',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'searchMedicineCopy2',
          path: '/searchMedicineCopy2',
          builder: (context, params) => const SearchMedicineCopy2Widget(),
        ),
        FFRoute(
          name: 'UpdateApp',
          path: '/updateApp',
          builder: (context, params) => const UpdateAppWidget(),
        ),
        FFRoute(
          name: 'SearchLocationCopy2',
          path: '/searchLocationCopy2',
          builder: (context, params) => SearchLocationCopy2Widget(
            recordId: params.getParam(
              'recordId',
              ParamType.String,
            ),
            addLocation: params.getParam(
              'addLocation',
              ParamType.String,
            ),
            addressId: params.getParam(
              'addressId',
              ParamType.String,
            ),
            tag: params.getParam(
              'tag',
              ParamType.String,
            ),
            pagename: params.getParam(
              'pagename',
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
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

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

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
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
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
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
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/phoneAuth';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).primary,
                      child: Center(
                        child: Image.asset(
                          'assets/images/Plazza_Branding.png',
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
              : PushNotificationsHandler(child: page);

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
