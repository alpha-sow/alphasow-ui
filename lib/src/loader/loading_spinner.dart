import 'package:flutter/material.dart';

class LoadingSpinner extends StatefulWidget {
  const LoadingSpinner({
    super.key, 
    required this.color,
    this.size,
  });

  final Color color;
  final double? size;

  @override
  State<LoadingSpinner> createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<LoadingSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
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
        // Determine the size based on available space or explicit size
        final double effectiveSize = widget.size ?? 
            (constraints.hasBoundedWidth && constraints.hasBoundedHeight
                ? (constraints.maxWidth < constraints.maxHeight 
                    ? constraints.maxWidth 
                    : constraints.maxHeight).clamp(12.0, 48.0)
                : 16.0);
        
        // Calculate stroke width based on size (responsive)
        final double strokeWidth = (effectiveSize * 0.125).clamp(1.5, 4.0);
        
        return SizedBox(
          width: effectiveSize,
          height: effectiveSize,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 6.283185307179586, // 2 * pi
                child: Container(
                  width: effectiveSize,
                  height: effectiveSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.color.withValues(alpha: 0.3),
                      width: strokeWidth,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(strokeWidth * 0.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          widget.color,
                          widget.color.withValues(alpha: 0.1),
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
