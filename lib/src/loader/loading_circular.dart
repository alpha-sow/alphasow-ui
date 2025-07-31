import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingCircular extends StatefulWidget {
  const LoadingCircular({
    super.key,
    this.size,
    this.color,
    this.strokeWidth = 2.0,
  });

  final double? size;
  final Color? color;
  final double strokeWidth;

  @override
  State<LoadingCircular> createState() => _LoadingCircularState();
}

class _LoadingCircularState extends State<LoadingCircular>
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
        final double effectiveSize = widget.size ??
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

class _CircularLoaderPainter extends CustomPainter {
  const _CircularLoaderPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final double strokeWidth;

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

  @override
  bool shouldRepaint(_CircularLoaderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
