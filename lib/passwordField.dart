import 'package:flutter/cupertino.dart';
import './models/user.dart';

class passwordField extends StatelessWidget {
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: CupertinoTextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        prefix: Icon(
          CupertinoIcons.padlock_solid,
          color: CupertinoColors.activeBlue,
          size: 30,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0,
              color: CupertinoColors.inactiveGray,
            ),
          ),
        ),
        placeholder: 'Password',
        onChanged: (String value) {
          _user.password = value;
        },
      ),
    );
  }
}
