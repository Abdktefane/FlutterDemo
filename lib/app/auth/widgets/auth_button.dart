import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
    this._title,
    this._onTab, {
    Key key,
  }) : super(key: key);

  final String _title;
  final VoidCallback _onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
          color: Theme.of(context).accentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: _onTab,
          child: Text(_title)),
    );
  }
}
