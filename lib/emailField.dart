import 'package:flutter/cupertino.dart';
import './models/user.dart';

class emailField extends StatelessWidget {
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: CupertinoTextField(
        keyboardType: TextInputType.emailAddress,
        prefix: Icon(
          CupertinoIcons.mail_solid,
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
        placeholder: 'Email Address',
        onChanged: (String value) {
          _user.email = value;
        },
      ),
    );
  }
}
