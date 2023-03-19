import 'package:flutter/material.dart';

void showSnackBar(final BuildContext context, final String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}
