import 'package:flutter/material.dart';
import 'package:test_app/app/auth/widgets/auth_button.dart';

class TodoErrorDialog extends StatelessWidget {
  final String message;

  const TodoErrorDialog(this.message, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Ops')),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 20,
      content: Text(message),
      actions: [
        Center(
          child: AuthButton('Ok', () {
            Navigator.of(context).pop();
          }),
        )
      ],
    );
  }

  static Future<void> show(BuildContext context, String message) async {
    return showGeneralDialog<void>(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, child) {
        final scaleTween = CurveTween(curve: Curves.fastOutSlowIn);
        final sclaeAnimation = scaleTween.animate(a1);
        return ScaleTransition(
          scale: sclaeAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 250),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (_, animation1, animation2) {
        return TodoErrorDialog(message);
      },
    );
  }
}
