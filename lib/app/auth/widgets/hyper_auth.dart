import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/app/auth/pages/signup_page.dart';
import 'package:test_app/app/todo/widgets/todo_text_field.dart';

import 'auth_button.dart';

class HyperAuth extends StatelessWidget {
  HyperAuth(
    this._usernameController,
    this._passwordController,
    this.onTap, {
    Key key,
    this.isLogin = true,
  })  : buttonTitle = isLogin ? 'Login' : 'Signup',
        super(key: key);

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final String buttonTitle;
  final VoidCallback onTap;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buttonTitle),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TodoTextField('Username', _usernameController, v: 20, h: 35),
            TodoTextField('Password', _passwordController, v: 20, h: 35),
            AuthButton(buttonTitle, onTap),
            Divider(
              indent: 40,
              endIndent: 40,
              thickness: 2,
              color: Colors.black12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('or'),
                if (isLogin) ...{
                  _hyperButton(
                    'Signup',
                    () {
                      Navigator.of(context).push(SignupPage.route(context));
                    },
                  )
                } else ...{
                  _hyperButton(
                    'Login',
                    () {
                      print('hey2');
                      Navigator.of(context).pop();
                    },
                  )
                }
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _hyperButton(String label, VoidCallback callback) {
    return Center(
      child: FlatButton(
        child: Text(label),
        onPressed: callback,
      ),
    );
  }
}
