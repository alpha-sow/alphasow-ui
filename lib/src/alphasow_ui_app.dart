import 'package:alphasow_ui/src/alert/alert_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The main application widget for Alphasow UI apps.
/// 
/// This widget wraps Flutter's WidgetsApp and provides integrated banner
/// notification support, consistent theming, and Material Design components.
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
  /// [theme] The theme to use for the app (defaults to blue theme)
  /// [locale] The locale to use for the app
  /// [supportedLocales] The list of locales supported by the app
  /// 
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
  
  /// The theme to use for the app (defaults to blue theme if null)
  final ThemeData? theme;
  
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

  @override
  Widget build(BuildContext context) {
    final appTheme = theme ?? ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: const Color(0xFF2196F3),
    );
    
    return Theme(
      data: appTheme,
      child: Builder(
        builder: (context) {
          return WidgetsApp(
            key: key,
            navigatorKey: navigatorKey,
            home: home != null ? Material(child: home) : null,
            routes: _wrapRoutesWithMaterial(routes),
            initialRoute: initialRoute,
            onGenerateRoute: _wrapRouteWithMaterial(onGenerateRoute),
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            onUnknownRoute: _wrapRouteWithMaterial(onUnknownRoute),
            navigatorObservers: navigatorObservers,
            builder: builder != null ? (context, child) {
              final wrappedChild = child != null ? Material(child: child) : null;
              return ScaffoldMessenger(
                child: BannerOverlay(
                  child: builder!(context, wrappedChild),
                ),
              );
            } : (context, child) => ScaffoldMessenger(
              child: BannerOverlay(
                child: Material(child: child ?? Container()),
              ),
            ),
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: appTheme.primaryColor,
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
            pageRouteBuilder: pageRouteBuilder ?? _defaultPageRouteBuilder,
          );
        },
      ),
    );
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

  /// Wraps all route builders with Material widgets for consistent theming.
  /// 
  /// [routes] The original routes map to wrap
  Map<String, WidgetBuilder> _wrapRoutesWithMaterial(Map<String, WidgetBuilder> routes) {
    return routes.map((key, builder) => MapEntry(
      key,
      (context) => Material(child: builder(context)),
    ));
  }

  /// Wraps a route factory to ensure all generated routes use Material theming.
  /// 
  /// [routeFactory] The original route factory to wrap
  RouteFactory? _wrapRouteWithMaterial(RouteFactory? routeFactory) {
    if (routeFactory == null) return null;
    return (settings) {
      final route = routeFactory(settings);
      if (route is PageRoute && route is MaterialPageRoute) {
        return PageRouteBuilder(
          settings: route.settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return Material(child: route.builder(context));
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      }
      return route;
    };
  }

  /// Default page route builder with fade transition and Material theming.
  /// 
  /// [settings] The route settings
  /// [builder] The widget builder for the route
  static PageRoute<T> _defaultPageRouteBuilder<T extends Object?>(
    RouteSettings settings,
    WidgetBuilder builder,
  ) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => Material(child: builder(context)),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
