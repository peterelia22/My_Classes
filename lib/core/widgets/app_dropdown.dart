import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.onSaved,
    this.validator,
    this.value,
    this.onChanged,
  });

  final String labelText;
  final String hintText;
  final List<String> items;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;
  final String? value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    const textColor = AppColors.textPrimaryColor;
    const hintColor = AppColors.textSecondaryColor;
    const borderColor = AppColors.borderColor;
    const focusedBorderColor = AppColors.primaryColor;
    const backgroundColor = AppColors.surfaceColor;

    final dropdownItems = List<String>.from(items);
    if (value != null && value!.isNotEmpty && !dropdownItems.contains(value)) {
      dropdownItems.add(value!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: AppTextStyles.labelLarge.copyWith(color: textColor),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 48),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                value: value,
                isExpanded: true,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTextStyles.bodyMedium.copyWith(
                    color: hintColor,
                  ),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: focusedBorderColor,
                      width: 1.4,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: borderColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppColors.errorColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.errorColor,
                      width: 1.4,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  errorStyle: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.errorColor,
                  ),
                ),
                style: AppTextStyles.bodyMedium.copyWith(color: textColor),
                dropdownColor: backgroundColor,
                items: dropdownItems
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: onChanged ?? (_) {},
                onSaved: onSaved,
                validator:
                    validator ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى اختيار $labelText';
                      }
                      return null;
                    },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
