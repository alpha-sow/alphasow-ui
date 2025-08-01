import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A circular loading indicator with customizable appearance.
///
/// This widget displays an animated arc that rotates continuously to indicate
/// loading state. The size, color, and stroke width can be customized.
class AsLoadingCircular extends StatefulWidget {
  /// Creates a circular loading indicator.
  ///
  /// [size] The diameter of the loading circle (auto-calculated if null)
  /// [color] The color of the loading arc (uses theme primary color if null)
  /// [strokeWidth] The width of the loading arc line (defaults to 4.0)
  const AsLoadingCircular({
    super.key,
    this.size,
    this.color,
    this.strokeWidth = 4.0,
  });

  /// The diameter of the loading circle (auto-calculated if null)
  final double? size;

  /// The color of the loading arc (uses theme primary color if null)
  final Color? color;

  /// The width of the loading arc line
  final double strokeWidth;

  @override
  State<AsLoadingCircular> createState() => _AsLoadingCircularState();
}

class _AsLoadingCircularState extends State<AsLoadingCircular>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final effectiveSize = widget.size ??
            (constraints.hasBoundedWidth && constraints.hasBoundedHeight
                ? (constraints.maxWidth < constraints.maxHeight
                        ? constraints.maxWidth
                        : constraints.maxHeight)
                    .clamp(12.0, 48.0)
                : 24.0);

        return SizedBox(
          width: effectiveSize,
          height: effectiveSize,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _CircularLoaderPainter(
                  progress: _controller.value,
                  color: widget.color ?? Theme.of(context).primaryColor,
                  strokeWidth: widget.strokeWidth,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// Custom painter for drawing the animated circular loading arc.
///
/// This painter draws a partial circle arc that rotates based on the
/// animation progress to create the loading effect.
class _CircularLoaderPainter extends CustomPainter {
  /// Creates a circular loader painter.
  ///
  /// [progress] The animation progress (0.0 to 1.0) for rotation
  /// [color] The color to paint the loading arc
  /// [strokeWidth] The width of the arc stroke
  const _CircularLoaderPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  /// The current animation progress (0.0 to 1.0)
  final double progress;

  /// The color of the loading arc
  final Color color;

  /// The width of the arc stroke
  final double strokeWidth;

  /// Paints the circular loading arc on the canvas.
  ///
  /// [canvas] The canvas to draw on
  /// [size] The size of the drawing area
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final startAngle = -math.pi / 2 + (progress * 2 * math.pi);
    const sweepAngle = math.pi * 1.5;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  /// Determines whether the painter should repaint.
  ///
  /// Returns true if any visual properties have changed.
  @override
  bool shouldRepaint(_CircularLoaderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
