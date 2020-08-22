import 'package:flutter/cupertino.dart';
import './models/user.dart';

class phoneNumberField extends StatelessWidget {
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: CupertinoTextField(
        keyboardType: TextInputType.phone,
        prefix: Icon(
          CupertinoIcons.phone_solid,
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
        placeholder: 'Phone Number',
        onChanged: (String value) {
          _user.phoneNumber = value;
        },
      ),
    );
  }
}
