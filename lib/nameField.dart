import 'package:flutter/cupertino.dart';
import './models/user.dart';

class nameField extends StatelessWidget {
  final _user = User();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>  [
          CupertinoTextField(
            keyboardType: TextInputType.text,
            prefix: Icon(
              CupertinoIcons.person_solid,
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
            placeholder: 'Name',
            onChanged: (String value) {
              _user.name = value;
            },
          ),
        ],
      ),
    );;
  }
}
