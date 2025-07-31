import 'package:flutter/material.dart';

enum AlertType { info, success, warning, error }

class AlertBanner extends StatelessWidget {
  const AlertBanner({
    super.key,
    required this.message,
    this.type = AlertType.info,
    this.onDismiss,
    this.isDismissible = true,
    this.action,
  });

  final String message;
  final AlertType type;
  final VoidCallback? onDismiss;
  final bool isDismissible;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = _getColorsForType(context, type);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: colors.borderColor,
          width: 1.0,
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
          textColor: theme.colorScheme.onSurface,
          iconColor: theme.colorScheme.primary,
        );
      case AlertType.success:
        return _AlertColors(
          backgroundColor: Colors.green,
          borderColor: Colors.green,
          textColor: theme.colorScheme.onSurface,
          iconColor: Colors.green,
        );
      case AlertType.warning:
        return _AlertColors(
          backgroundColor: Colors.orange,
          borderColor: Colors.orange,
          textColor: theme.colorScheme.onSurface,
          iconColor: Colors.orange,
        );
      case AlertType.error:
        return _AlertColors(
          backgroundColor: theme.colorScheme.error,
          borderColor: theme.colorScheme.error,
          textColor: theme.colorScheme.onSurface,
          iconColor: theme.colorScheme.error,
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
