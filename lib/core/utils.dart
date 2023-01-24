import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showSnackBar(final BuildContext context, final String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}
