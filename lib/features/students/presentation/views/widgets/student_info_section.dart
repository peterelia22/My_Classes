import 'package:flutter/material.dart';
import 'package:my_classes/core/widgets/custom_password_field.dart';
import 'package:my_classes/core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/section_title.dart';

class StudentInfoSection extends StatelessWidget {
  final FormFieldSetter<String> onNameSaved;
  final FormFieldSetter<String> onPhoneSaved;
  final FormFieldSetter<String> onEmailSaved;
  final FormFieldSetter<String>? onPasswordSaved;
  final String? initialName;
  final String? initialPhone;
  final String? initialEmail;
  final bool isEdit;

  const StudentInfoSection({
    super.key,
    required this.onNameSaved,
    required this.onPhoneSaved,
    required this.onEmailSaved,
    this.onPasswordSaved,
    this.initialName,
    this.initialPhone,
    this.initialEmail,
    required this.isEdit,
  });

  String? required(String? value, String label) =>
      (value == null || value.trim().isEmpty) ? 'يرجى إدخال $label' : null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle(
          title: 'بيانات الطالب',
          subtitle: 'المعلومات التعريفية الأساسية',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'اسم الطالب',
          hintText: 'مثال: أحمد محمد',
          obscureText: false,
          onSaved: onNameSaved,
          validator: (v) => required(v, 'اسم الطالب'),
          initialValue: initialName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'رقم الهاتف',
          hintText: 'مثال: 01012345678',
          obscureText: false,
          keyboardType: TextInputType.phone,
          onSaved: onPhoneSaved,
          validator: (v) => required(v, 'رقم الهاتف'),
          initialValue: initialPhone,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          labelText: 'البريد الإلكتروني',
          hintText: 'example@mail.com',
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          onSaved: onEmailSaved,
          validator: (v) {
            if (v == null || v.trim().isEmpty)
              return 'يرجى إدخال البريد الإلكتروني';
            if (!v.contains('@')) return 'يرجى إدخال بريد إلكتروني صحيح';
            return null;
          },
          initialValue: initialEmail,
        ),
        if (!isEdit) ...[
          const SizedBox(height: 16),
          CustomPasswordField(onSaved: onPasswordSaved),
        ],
      ],
    );
  }
}
