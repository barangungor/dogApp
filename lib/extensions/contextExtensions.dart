import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get size => MediaQuery.of(this).size;

  showDialogFromBottom({required Widget dialogContent}) {
    showGeneralDialog(
      transitionDuration: const Duration(milliseconds: 300),
      context: this,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          child: dialogContent,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
