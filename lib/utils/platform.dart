import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

/// The platform type.
enum PlatformType {
  /// The iOS platform.
  cupertino,

  /// The Android platform.
  material;

  /// Returns the current platform type.
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
