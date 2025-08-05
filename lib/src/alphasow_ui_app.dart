import 'package:alphasow_ui/src/alert/as_alert_banner.dart';
import 'package:alphasow_ui/utils/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The main application widget for Alphasow UI apps.
///
/// This widget wraps Flutter's WidgetsApp and provides integrated banner
/// notification support, consistent theming, and adaptive Material/Cupertino components.
/// Automatically adapts to platform conventions (Material on Android, Cupertino on iOS).
/// Use this as the root widget of your application to enable all Alphasow UI features.
class AlphasowUiApp extends StatelessWidget {
  /// Creates an Alphasow UI application.
  ///
  /// Most parameters correspond directly to WidgetsApp parameters.
  /// The app automatically includes Material Design theming and banner overlay support.
  ///
  /// [navigatorKey] A key to use when building the Navigator
  /// [home] The widget for the home page of the app
  /// [routes] The application's top-level routing table
  /// [initialRoute] The name of the first route to show
  /// [routerConfig] Router configuration for declarative routing (e.g., GoRouter)
  /// [theme] The Material theme to use for the app (defaults to blue theme)
  /// [cupertinoTheme] The Cupertino theme to use for iOS (optional)
  /// [locale] The locale to use for the app
  /// [supportedLocales] The list of locales supported by the app
  ///
  /// When [routerConfig] is provided, it takes precedence over traditional routing parameters.
  /// All other parameters follow standard Flutter app configuration.
  const AlphasowUiApp({
    super.key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.theme,
    this.cupertinoTheme,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.pageRouteBuilder,
    this.routerConfig,
  });

  /// A key to use when building the Navigator
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The widget for the home page of the app
  final Widget? home;

  /// The application's top-level routing table
  final Map<String, WidgetBuilder> routes;

  /// The name of the first route to show
  final String? initialRoute;

  /// Route generator for dynamic routes
  final RouteFactory? onGenerateRoute;

  /// Generator for the app's initial route list
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// Handler for unknown routes
  final RouteFactory? onUnknownRoute;

  /// List of Navigator observers
  final List<NavigatorObserver> navigatorObservers;

  /// A builder for inserting widgets above the Navigator
  final TransitionBuilder? builder;

  /// A one-line description used by the device to identify the app
  final String title;

  /// Generates the app title based on the current locale
  final GenerateAppTitle? onGenerateTitle;

  /// The Material theme to use for the app (defaults to blue theme if null)
  final ThemeData? theme;

  /// The Cupertino theme to use for iOS (optional)
  final CupertinoThemeData? cupertinoTheme;

  /// The initial locale for the app
  final Locale? locale;

  /// Delegates for app localization
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// Callback for resolving locale from supported locales list
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// Callback for resolving locale conflicts
  final LocaleResolutionCallback? localeResolutionCallback;

  /// The list of locales that the app supports
  final Iterable<Locale> supportedLocales;

  /// Whether to show the performance overlay
  final bool showPerformanceOverlay;

  /// Whether to show the semantics debugger
  final bool showSemanticsDebugger;

  /// Whether to show the debug banner in debug mode
  final bool debugShowCheckedModeBanner;

  /// Application keyboard shortcuts
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// Application-wide actions
  final Map<Type, Action<Intent>>? actions;

  /// Restoration ID for state restoration
  final String? restorationScopeId;

  /// Factory for creating page routes
  final PageRouteFactory? pageRouteBuilder;

  /// Router configuration for declarative routing (e.g., GoRouter)
  final RouterConfig<Object>? routerConfig;

  @override
  Widget build(BuildContext context) {
    final platformType = PlatformType.currentPlatform();
    final isCupertino = platformType == PlatformType.cupertino;

    final appTheme = theme ??
        ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2196F3),
        );

    final appCupertinoTheme = cupertinoTheme ??
        const CupertinoThemeData(
          primaryColor: Color(0xFF2196F3),
        );

    final Widget app = routerConfig != null
        ? WidgetsApp.router(
            key: key,
            routerConfig: routerConfig,
            builder: builder != null
                ? (context, child) {
                    final wrappedChild = child != null
                        ? _wrapWithPlatformWidget(child, isCupertino)
                        : null;
                    return _buildScaffoldMessenger(
                      BannerOverlay(
                        child: builder!(context, wrappedChild),
                      ),
                      isCupertino,
                    );
                  }
                : (context, child) => _buildScaffoldMessenger(
                      BannerOverlay(
                        child: _wrapWithPlatformWidget(
                            child ?? Container(), isCupertino),
                      ),
                      isCupertino,
                    ),
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: isCupertino
                ? appCupertinoTheme.primaryColor
                : appTheme.primaryColor,
            locale: locale,
            localizationsDelegates: _buildLocalizationsDelegates(),
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            showPerformanceOverlay: showPerformanceOverlay,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            shortcuts: shortcuts,
            actions: actions,
            restorationScopeId: restorationScopeId,
          )
        : WidgetsApp(
            key: key,
            navigatorKey: navigatorKey,
            home: home != null
                ? _wrapWithPlatformWidget(home!, isCupertino)
                : null,
            routes: _wrapRoutesWithPlatformWidget(routes, isCupertino),
            initialRoute: initialRoute,
            onGenerateRoute:
                _wrapRouteWithPlatformWidget(onGenerateRoute, isCupertino),
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            onUnknownRoute:
                _wrapRouteWithPlatformWidget(onUnknownRoute, isCupertino),
            navigatorObservers: navigatorObservers,
            builder: builder != null
                ? (context, child) {
                    final wrappedChild = child != null
                        ? _wrapWithPlatformWidget(child, isCupertino)
                        : null;
                    return _buildScaffoldMessenger(
                      BannerOverlay(
                        child: builder!(context, wrappedChild),
                      ),
                      isCupertino,
                    );
                  }
                : (context, child) => _buildScaffoldMessenger(
                      BannerOverlay(
                        child: _wrapWithPlatformWidget(
                            child ?? Container(), isCupertino),
                      ),
                      isCupertino,
                    ),
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: isCupertino
                ? appCupertinoTheme.primaryColor
                : appTheme.primaryColor,
            locale: locale,
            localizationsDelegates: _buildLocalizationsDelegates(),
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            showPerformanceOverlay: showPerformanceOverlay,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            shortcuts: shortcuts,
            actions: actions,
            restorationScopeId: restorationScopeId,
            pageRouteBuilder: pageRouteBuilder ??
                <T extends Object?>(RouteSettings settings,
                        WidgetBuilder builder) =>
                    _defaultPageRouteBuilder<T>(settings, builder, isCupertino),
          );

    if (isCupertino) {
      return CupertinoTheme(
        data: appCupertinoTheme,
        child: app,
      );
    } else {
      return Theme(
        data: appTheme,
        child: app,
      );
    }
  }

  /// Builds the complete list of localization delegates.
  ///
  /// Includes default Material, Widgets, and Cupertino delegates,
  /// plus any custom delegates provided by the user.
  List<LocalizationsDelegate<dynamic>> _buildLocalizationsDelegates() {
    final delegates = <LocalizationsDelegate<dynamic>>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];

    if (localizationsDelegates != null) {
      delegates.addAll(localizationsDelegates!);
    }

    return delegates;
  }

  /// Wraps a widget with the appropriate platform widget (Material or Cupertino).
  ///
  /// [child] The widget to wrap
  /// [isCupertino] Whether to use Cupertino styling
  Widget _wrapWithPlatformWidget(Widget child, bool isCupertino) {
    return isCupertino ? child : Material(child: child);
  }

  /// Builds a ScaffoldMessenger that works with both platforms.
  ///
  /// [child] The child widget
  /// [isCupertino] Whether to use Cupertino styling
  Widget _buildScaffoldMessenger(Widget child, bool isCupertino) {
    return isCupertino ? child : ScaffoldMessenger(child: child);
  }

  /// Wraps all route builders with appropriate platform widgets.
  ///
  /// [routes] The original routes map to wrap
  /// [isCupertino] Whether to use Cupertino styling
  Map<String, WidgetBuilder> _wrapRoutesWithPlatformWidget(
      Map<String, WidgetBuilder> routes, bool isCupertino) {
    return routes.map((key, builder) => MapEntry(
          key,
          (context) => _wrapWithPlatformWidget(builder(context), isCupertino),
        ));
  }

  /// Wraps a route factory to ensure all generated routes use appropriate platform theming.
  ///
  /// [routeFactory] The original route factory to wrap
  /// [isCupertino] Whether to use Cupertino styling
  RouteFactory? _wrapRouteWithPlatformWidget(
      RouteFactory? routeFactory, bool isCupertino) {
    if (routeFactory == null) return null;
    return (settings) {
      final route = routeFactory(settings);
      if (route is MaterialPageRoute) {
        return PageRouteBuilder(
          settings: route.settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return _wrapWithPlatformWidget(route.builder(context), isCupertino);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            if (isCupertino) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                linearTransition: false,
                child: child,
              );
            } else {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
          },
        );
      } else if (route is CupertinoPageRoute) {
        return PageRouteBuilder(
          settings: route.settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return _wrapWithPlatformWidget(route.builder(context), isCupertino);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            if (isCupertino) {
              return CupertinoPageTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                linearTransition: false,
                child: child,
              );
            } else {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
          },
        );
      }
      return route;
    };
  }

  /// Default page route builder with platform-appropriate transitions.
  ///
  /// [settings] The route settings
  /// [builder] The widget builder for the route
  /// [isCupertino] Whether to use Cupertino styling
  static PageRoute<T> _defaultPageRouteBuilder<T extends Object?>(
    RouteSettings settings,
    WidgetBuilder builder,
    bool isCupertino,
  ) {
    if (isCupertino) {
      return CupertinoPageRoute<T>(
        settings: settings,
        builder: builder,
      );
    } else {
      return PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) =>
            Material(child: builder(context)),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    }
  }
}
