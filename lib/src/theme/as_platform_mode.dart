/// Controls which design language the app uses.
enum AsPlatformMode {
  /// Auto-detect based on the running platform
  /// (Cupertino on iOS/macOS, Material elsewhere).
  adaptive,

  /// Always use Material Design.
  material,

  /// Always use Cupertino (iOS-style) Design.
  cupertino,
}
