import 'package:flutter/material.dart';

/// A spinning loading indicator with gradient effect.
///
/// This widget displays a rotating circular spinner with a gradient effect
/// to indicate loading state. The size and color can be customized.
class AsLoadingSpinner extends StatefulWidget {
  /// Creates a spinning loading indicator.
  ///
  /// [color] The primary color for the spinner (uses theme primary color if null)
  /// [size] The diameter of the spinner (auto-calculated if null)
  const AsLoadingSpinner({
    super.key,
    this.color,
    this.size,
  });

  /// The primary color for the spinner (uses theme primary color if null)
  final Color? color;

  /// The diameter of the spinner (auto-calculated if null)
  final double? size;

  @override
  State<AsLoadingSpinner> createState() => _AsLoadingSpinnerState();
}

class _AsLoadingSpinnerState extends State<AsLoadingSpinner>
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
        final effectiveSize = widget.size ??
            (constraints.hasBoundedWidth && constraints.hasBoundedHeight
                ? (constraints.maxWidth < constraints.maxHeight
                        ? constraints.maxWidth
                        : constraints.maxHeight)
                    .clamp(12.0, 48.0)
                : 16.0);

        // Calculate stroke width based on size (responsive)
        final strokeWidth = (effectiveSize * 0.125).clamp(1.5, 4.0);

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
                      color:
                          Theme.of(context).primaryColor.withValues(alpha: 0.3),
                      width: strokeWidth,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(strokeWidth * 0.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withValues(alpha: 0.1),
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
