import 'package:flutter/material.dart';

enum AlertType { info, success, warning, error }

class BannerManager extends ChangeNotifier {
  static final BannerManager _instance = BannerManager._internal();
  factory BannerManager() => _instance;
  BannerManager._internal();

  final List<BannerItem> _banners = [];
  List<BannerItem> get banners => List.unmodifiable(_banners);

  void showBanner({
    required String message,
    AlertType type = AlertType.info,
    Duration? duration,
    Widget? action,
    VoidCallback? onDismiss,
    double opacity = 0.5,
  }) {
    final banner = BannerItem(
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

  void dismissBanner(String id) {
    _banners.removeWhere((banner) => banner.id == id);
    notifyListeners();
  }

  void dismissAll() {
    _banners.clear();
    notifyListeners();
  }
}

class BannerItem {
  final String id;
  final String message;
  final AlertType type;
  final Widget? action;
  final VoidCallback? onDismiss;
  final double opacity;

  BannerItem({
    required this.id,
    required this.message,
    required this.type,
    this.action,
    this.onDismiss,
    this.opacity = 0.5,
  });
}

extension AlertBannerExtention on BuildContext {
  void showBanner({
    required String message,
    AlertType type = AlertType.info,
    Duration? duration,
    Widget? action,
    VoidCallback? onDismiss,
  }) {
    BannerManager().showBanner(
      message: message,
      type: type,
      duration: duration,
      action: action,
      onDismiss: onDismiss,
      opacity: 1.0,
    );
  }
}

class BannerOverlay extends StatelessWidget {
  const BannerOverlay({super.key, required this.child});

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
            listenable: BannerManager(),
            builder: (context, _) {
              final banners = BannerManager().banners;
              return Column(
                children: banners.map((banner) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: AlertBanner(
                        message: banner.message,
                        type: banner.type,
                        action: banner.action,
                        opacity: banner.opacity,
                        onDismiss: () {
                          banner.onDismiss?.call();
                          BannerManager().dismissBanner(banner.id);
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

class AlertBanner extends StatelessWidget {
  const AlertBanner({
    super.key,
    required this.message,
    this.type = AlertType.info,
    this.onDismiss,
    this.isDismissible = true,
    this.action,
    this.opacity = 0.5,
  });

  final String message;
  final AlertType type;
  final VoidCallback? onDismiss;
  final bool isDismissible;
  final Widget? action;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final colors = _getColorsForType(context, type);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colors.backgroundColor.withValues(alpha: opacity),
        borderRadius: BorderRadius.circular(8.0),
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
            size: 20.0,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: colors.textColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (action != null) ...[
            const SizedBox(width: 12.0),
            action!,
          ],
          if (isDismissible && onDismiss != null) ...[
            const SizedBox(width: 12.0),
            GestureDetector(
              onTap: onDismiss,
              child: Icon(
                Icons.close,
                color: colors.iconColor,
                size: 18.0,
              ),
            ),
          ],
        ],
      ),
    );
  }

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
        return _AlertColors(
          backgroundColor: Colors.green,
          borderColor: Colors.green,
          textColor: Colors.white,
          iconColor: Colors.white,
        );
      case AlertType.warning:
        return _AlertColors(
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

class _AlertColors {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;

  const _AlertColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
  });
}
