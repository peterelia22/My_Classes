import 'package:flutter/material.dart';

import 'widgets/students_view_body_bloc_consumer.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StudentsViewBodyBlocConsumer());
  }
}
