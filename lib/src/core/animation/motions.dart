import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension MotionX on Widget {
  Widget fadeUp({double dy = .10, Duration? d}) => animate()
      .fadeIn(duration: d ?? 350.ms)
      .slideY(
        begin: dy,
        end: 0,
        duration: d ?? 350.ms,
        curve: Curves.easeOutCubic,
      );
  Widget slideX({double dx = .10, Duration? d}) => animate().slideX(
    begin: dx,
    end: 0,
    
    duration: d ?? 300.ms,
    curve: Curves.easeOutCubic,
  );
  Widget scaleIn({double s = .9, Duration? d}) =>
      animate()
          .scale(
            begin: Offset(s, s),
            end: const Offset(1, 1),
            duration: d ?? 240.ms,
            curve: Curves.easeOutBack,
          )
          .fadeIn();
  Widget ripple({Duration? d}) =>
      animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(
            begin: const Offset(.98, .98),
            end: const Offset(1.02, 1.02),
            duration: d ?? 900.ms,
          )
          .fadeIn();
}
