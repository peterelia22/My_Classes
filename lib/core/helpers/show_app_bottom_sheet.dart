import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showAppBottomSheet({
  required BuildContext context,
  required Widget child,
  List<BlocProvider>? providers,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      if (providers != null && providers.isNotEmpty) {
        return MultiBlocProvider(providers: providers, child: child);
      }
      return child;
    },
  );
}
