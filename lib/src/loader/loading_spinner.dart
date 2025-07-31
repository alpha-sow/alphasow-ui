import 'package:flutter/material.dart';

class LoadingSpinner extends StatefulWidget {
  const LoadingSpinner({super.key, required this.color});

  final Color color;

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
    return SizedBox(
      width: 16,
      height: 16,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 6.283185307179586, // 2 * pi
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color.withValues(alpha: 0.3),
                  width: 2.0,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(1),
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
  }
}
