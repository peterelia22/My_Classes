import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال كلمة المرور';
        }
        return null;
      },
      labelText: 'كلمة المرور',
      hintText: '********',
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscured,
      onSaved: (value) {
        widget.onSaved!(value);
      },
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscured = !isObscured;
          });
        },
        child: isObscured
            ? const Icon(Icons.remove_red_eye, color: AppColors.textHintColor)
            : const Icon(Icons.visibility_off, color: AppColors.textHintColor),
      ),
    );
  }
}
