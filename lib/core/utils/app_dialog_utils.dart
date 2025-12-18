import 'dart:ui';

import 'package:flutter/material.dart';

class AppDialogUtils {
  // ─────────────────────────────────────────────
  // Show Loading Dialog
  // ─────────────────────────────────────────────
  static void showLoading({
    required BuildContext context,
    required Color colorCircle,
    required TextStyle style
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: colorCircle),
            const SizedBox(width: 20),
            Text(
              "Loading...",
              style: style,
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Hide Loading Dialog
  // ─────────────────────────────────────────────
  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  // ─────────────────────────────────────────────
  // Show Message Dialog
  // ─────────────────────────────────────────────
  static void showMessage({
    required BuildContext context,
    required String message,
    required TextStyle style,
    String? title,
    String? posActionName,
    VoidCallback? posActionCallBack,
    String? negActionName,
    VoidCallback? negActionCallBack,
  }) {
    List<Widget> actions = [];

    // Positive Action Button
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionCallBack?.call();
          },
          child: Text(posActionName, style: style),
        ),
      );
    }

    // Negative Action Button
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negActionCallBack?.call();
          },
          child: Text(negActionName, style: style),
        ),
      );
    }

    // Show Alert Dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: title != null
            ? Text(title, style: style)
            : null,
        content: Text(message, style: style),
        actions: actions,
      ),
    );
  }
}