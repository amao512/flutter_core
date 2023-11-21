import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  showSnackBar(String? message) {
    SnackBar snackBar = SnackBar(content: Text(message ?? ''));

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  showRoundedModalBottomSheet({
    required Widget Function(BuildContext) builder,
    bool isScrollControlled = false,
    Color backgroundColor = Colors.white,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: backgroundColor,
      context: this,
      builder: builder,
      useSafeArea: true,
      useRootNavigator: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }
}
