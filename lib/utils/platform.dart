import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';

/// The platform type.
enum PlatformType {
  /// The iOS platform.
  cupertino,

  /// The Android platform.
  material;

  /// Returns the platform type from the nearest [AsPlatformProvider].
  ///
  /// Falls back to [currentPlatform] when no provider is found.
  static PlatformType of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<AsPlatformProvider>();
    return provider?.platformType ?? currentPlatform();
  }

  /// Returns the current platform type based on the OS.
  static PlatformType currentPlatform() {
    if (kIsWeb) {
      return PlatformType.material;
    }

    return switch (Platform.operatingSystem) {
      'ios' => PlatformType.cupertino,
      'macos' => PlatformType.cupertino,
      _ => PlatformType.material,
    };
  }
}

/// Inherited widget that provides the resolved [PlatformType]
/// to the widget tree.
class AsPlatformProvider extends InheritedWidget {
  /// Creates a platform provider.
  const AsPlatformProvider({
    required this.platformType,
    required super.child,
    super.key,
  });

  /// The resolved platform type for this subtree.
  final PlatformType platformType;

  @override
  bool updateShouldNotify(AsPlatformProvider oldWidget) {
    return platformType != oldWidget.platformType;
  }
}
