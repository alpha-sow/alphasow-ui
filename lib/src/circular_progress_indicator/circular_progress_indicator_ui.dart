import 'package:flutter/material.dart';

class CircularProgressIndicatorUI extends StatelessWidget {
  const CircularProgressIndicatorUI({
    super.key,
    this.size,
    this.strokeWidth,
  });

  final double? size;
  final double? strokeWidth;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SizedBox(
      width: size ?? 14.0,
      height: size ?? 14.0,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 2.0,
        color: theme.colorScheme.primary,
      ),
    );
  }
}
