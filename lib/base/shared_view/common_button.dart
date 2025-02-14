import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/base/constants/ui/app_colors.dart';
import 'package:flutter_bloc_template/base/constants/ui/app_text_styles.dart';

enum CommonButtonSize { small, medium, large }

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.size = CommonButtonSize.medium,
    this.enable = true,
    this.backgroundColor,
  });

  final String title;
  final VoidCallback onPressed;
  final CommonButtonSize size;
  final bool enable;
  final Color? backgroundColor;

  factory CommonButton.small({
    required String title,
    bool enable = true,
    required VoidCallback onPressed,
  }) {
    return CommonButton(
      title: title,
      size: CommonButtonSize.small,
      enable: enable,
      onPressed: onPressed,
    );
  }

  factory CommonButton.large({
    required String title,
    bool enable = true,
    required VoidCallback onPressed,
  }) {
    return CommonButton(
      title: title,
      size: CommonButtonSize.large,
      enable: enable,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(_backgroundColor()),
        padding: _padding(),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      ),
      child: Text(
        title,
        style: AppTextStyles.bodyLargeBold.copyWith(color: _getTitleColor()),
      ),
    );
  }

  Color _backgroundColor() {
    if (!enable) return AppColors.current.disable;
    return backgroundColor ?? AppColors.current.primary500;
  }

  WidgetStateProperty<EdgeInsetsGeometry?>? _padding() {
    final val = switch (size) {
      CommonButtonSize.small => const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
      CommonButtonSize.medium => const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      CommonButtonSize.large => const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    };
    return WidgetStateProperty.all(val);
  }

  Color _getTitleColor() {
    if (enable) return AppColors.current.otherWhite;
    return AppColors.current.primary500;
  }
}
