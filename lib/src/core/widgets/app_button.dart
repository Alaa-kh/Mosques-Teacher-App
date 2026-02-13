import 'package:flutter/material.dart';
import 'package:mosques_teacher/src/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: loading,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: loading
                ? AppColors.secondaryClr.withValues(alpha: .7)
                : AppColors.secondaryClr,
            disabledBackgroundColor: AppColors.secondaryClr.withValues(alpha: .7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          onPressed: onPressed,
          child: loading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
