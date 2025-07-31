import 'package:flutter/material.dart';

/// Defines the different types of alerts available for banners and dialogs.
///
/// Each type determines the visual styling (colors, icons) of the alert.
enum AlertType {
  /// Information alert with blue styling and info icon
  info,

  /// Success alert with green styling and check icon
  success,

  /// Warning alert with orange styling and warning icon
  warning,

  /// Error alert with red styling and error icon
  error
}

/// A singleton manager for handling banner notifications throughout the app.
///
/// This class manages the display and dismissal of banner notifications,
/// ensuring only one instance exists across the entire application.
class _BannerManager extends ChangeNotifier {
  /// Factory constructor that returns the singleton instance
  factory _BannerManager() => _instance;

  /// Private constructor for singleton pattern
  _BannerManager._internal();

  /// The singleton instance of BannerManager
  static final _BannerManager _instance = _BannerManager._internal();

  /// Internal list storing all active banners
  final List<_BannerItem> _banners = [];

  /// Read-only access to the list of active banners
  List<_BannerItem> get banners => List.unmodifiable(_banners);

  /// Displays a new banner with the specified configuration.
  ///
  /// [message] The text content to display in the banner
  /// [type] The alert type determining visual styling (defaults to info)
  /// [duration] How long the banner stays visible (defaults to 4 seconds)
  /// [action] Optional widget to display as an action button
  /// [onDismiss] Callback executed when the banner is dismissed
  /// [opacity] Background opacity of the banner (0.0 to 1.0)
  void showBanner({
    required String message,
    AlertType type = AlertType.info,
    Duration? duration,
    Widget? action,
    VoidCallback? onDismiss,
    double opacity = 0.5,
  }) {
    final banner = _BannerItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: message,
      type: type,
      action: action,
      onDismiss: onDismiss,
      opacity: opacity,
    );

    _banners.add(banner);
    notifyListeners();

    if (duration != null) {
      Future.delayed(duration, () => dismissBanner(banner.id));
    } else {
      Future.delayed(
          const Duration(seconds: 4), () => dismissBanner(banner.id));
    }
  }

  /// Dismisses a specific banner by its unique identifier.
  ///
  /// [id] The unique identifier of the banner to dismiss
  void dismissBanner(String id) {
    _banners.removeWhere((banner) => banner.id == id);
    notifyListeners();
  }

  /// Dismisses all currently active banners at once.
  void dismissAll() {
    _banners.clear();
    notifyListeners();
  }
}

/// Represents a single banner item with all its configuration.
///
/// This class holds all the data needed to display and manage a banner,
/// including its content, styling, and behavior.
class _BannerItem {
  /// Creates a new banner item with the specified configuration.
  ///
  /// [id] Unique identifier for this banner
  /// [message] The text content to display
  /// [type] The alert type for styling
  /// [action] Optional action widget
  /// [onDismiss] Callback for dismissal
  /// [opacity] Background opacity (defaults to 0.5)
  _BannerItem({
    required this.id,
    required this.message,
    required this.type,
    this.action,
    this.onDismiss,
    this.opacity = 0.5,
  });

  /// Unique identifier for this banner instance
  final String id;

  /// The text message displayed in the banner
  final String message;

  /// The type of alert determining visual styling
  final AlertType type;

  /// Optional action widget (button, link, etc.)
  final Widget? action;

  /// Callback executed when banner is dismissed
  final VoidCallback? onDismiss;

  /// Background opacity of the banner (0.0 to 1.0)
  final double opacity;
}

/// Extension on BuildContext to provide convenient banner display methods.
///
/// This extension allows any widget to easily show banners by calling
/// `context.showBanner()` directly.
extension AlertBannerExtention on BuildContext {
  /// Shows a banner notification from any BuildContext.
  ///
  /// [message] The text content to display in the banner
  /// [type] The alert type determining visual styling (defaults to info)
  /// [duration] How long the banner stays visible
  /// [action] Optional widget to display as an action button
  /// [onDismiss] Callback executed when the banner is dismissed
  void showBanner({
    required String message,
    AlertType type = AlertType.info,
    Duration? duration,
    Widget? action,
    VoidCallback? onDismiss,
  }) {
    _BannerManager().showBanner(
      message: message,
      type: type,
      duration: duration,
      action: action,
      onDismiss: onDismiss,
      opacity: 1,
    );
  }
}

/// A widget that overlays banners on top of its child widget.
///
/// This widget should wrap your app's main content to enable banner
/// notifications to appear as overlays. It automatically listens to
/// the BannerManager and displays active banners.
class BannerOverlay extends StatelessWidget {
  /// Creates a banner overlay that wraps the given child.
  ///
  /// [child] The widget to display beneath the banner overlay
  const BannerOverlay({required this.child, super.key});

  /// The child widget that will be displayed beneath any banners
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          left: 16,
          right: 16,
          child: ListenableBuilder(
            listenable: _BannerManager(),
            builder: (context, _) {
              final banners = _BannerManager().banners;
              return Column(
                children: banners.map((banner) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: ASAlertBanner(
                        message: banner.message,
                        type: banner.type,
                        action: banner.action,
                        opacity: banner.opacity,
                        onDismiss: () {
                          banner.onDismiss?.call();
                          _BannerManager().dismissBanner(banner.id);
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// A customizable alert banner widget for displaying notifications.
///
/// This widget creates a styled banner with icon, message, and optional
/// action button. The styling automatically adapts based on the alert type.
class ASAlertBanner extends StatelessWidget {
  /// Creates an alert banner with the specified configuration.
  ///
  /// [message] The text content to display (required)
  /// [type] The alert type for styling (defaults to info)
  /// [onDismiss] Callback when dismiss button is tapped
  /// [isDismissible] Whether to show a dismiss button (defaults to true)
  /// [action] Optional action widget to display
  /// [opacity] Background opacity (defaults to 0.5)
  const ASAlertBanner({
    required this.message,
    super.key,
    this.type = AlertType.info,
    this.onDismiss,
    this.isDismissible = true,
    this.action,
    this.opacity = 0.5,
  });

  /// The text message displayed in the banner
  final String message;

  /// The type of alert determining visual styling
  final AlertType type;

  /// Callback executed when dismiss button is tapped
  final VoidCallback? onDismiss;

  /// Whether the banner can be dismissed by the user
  final bool isDismissible;

  /// Optional action widget (button, link, etc.)
  final Widget? action;

  /// Background opacity of the banner (0.0 to 1.0)
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final colors = _getColorsForType(context, type);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.backgroundColor.withValues(alpha: opacity),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colors.borderColor,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getIconForType(type),
            color: colors.iconColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: colors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (action != null) ...[
            const SizedBox(width: 12),
            action!,
          ],
          if (isDismissible && onDismiss != null) ...[
            const SizedBox(width: 12),
            GestureDetector(
              onTap: onDismiss,
              child: Icon(
                Icons.close,
                color: colors.iconColor,
                size: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Returns the appropriate color scheme for the given alert type.
  ///
  /// [context] The build context for accessing theme colors
  /// [type] The alert type to get colors for
  _AlertColors _getColorsForType(BuildContext context, AlertType type) {
    final theme = Theme.of(context);

    switch (type) {
      case AlertType.info:
        return _AlertColors(
          backgroundColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.primary,
          textColor: theme.colorScheme.onPrimary,
          iconColor: theme.colorScheme.onPrimary,
        );
      case AlertType.success:
        return const _AlertColors(
          backgroundColor: Colors.green,
          borderColor: Colors.green,
          textColor: Colors.white,
          iconColor: Colors.white,
        );
      case AlertType.warning:
        return const _AlertColors(
          backgroundColor: Colors.orange,
          borderColor: Colors.orange,
          textColor: Colors.white,
          iconColor: Colors.white,
        );
      case AlertType.error:
        return _AlertColors(
          backgroundColor: theme.colorScheme.error,
          borderColor: theme.colorScheme.error,
          textColor: theme.colorScheme.onError,
          iconColor: theme.colorScheme.onError,
        );
    }
  }

  /// Returns the appropriate icon for the given alert type.
  ///
  /// [type] The alert type to get an icon for
  IconData _getIconForType(AlertType type) {
    switch (type) {
      case AlertType.info:
        return Icons.info_outline;
      case AlertType.success:
        return Icons.check_circle_outline;
      case AlertType.warning:
        return Icons.warning_amber_outlined;
      case AlertType.error:
        return Icons.error_outline;
    }
  }
}

/// Internal class holding color scheme for alert banners.
///
/// This private class encapsulates all the colors needed to style
/// an alert banner consistently.
class _AlertColors {
  /// Creates a color scheme for alert styling.
  ///
  /// [backgroundColor] The background color of the banner
  /// [borderColor] The border color of the banner
  /// [textColor] The text color for content
  /// [iconColor] The color for icons
  const _AlertColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
  });

  /// Background color of the banner
  final Color backgroundColor;

  /// Border color of the banner
  final Color borderColor;

  /// Text color for the message content
  final Color textColor;

  /// Color used for icons in the banner
  final Color iconColor;
}
