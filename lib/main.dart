import 'package:flutter/cupertino.dart';
import './models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'emailField.dart';
import 'nameField.dart';
import 'passwordField.dart';
import 'phoneNumberField.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _user = User();
  String errorText;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'SIGN UP',
            style: GoogleFonts.openSans(fontSize: MediaQuery.of(context).size.height / 25, fontWeight: FontWeight.bold, color: CupertinoColors.white),
          ),
        )
      ],
    );
  }

  Widget _buildRememberSwitch() {
    return Padding(
      padding: EdgeInsets.only(right: 5, left: 135),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Remember Me',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height/60,
                ),),
              ),
              CupertinoSwitch(
                value: _user.remember,
                onChanged: (bool value) {
                  setState(() => _user.remember = value);
                },
              ),
            ],
          ),
        ]
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.2* (MediaQuery.of(context).size.height / 20),
          width: 4.9 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(top: 40, bottom: 30),
          child: CupertinoButton.filled(
            onPressed: () {
              if(_user.name == null || _user.email == null || _user.phoneNumber == null || _user.password == null ){
                showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
                  title: Text('Error', style: GoogleFonts.roboto(fontSize: 21, color: CupertinoColors.systemRed)),
                  content: Text('All the fields are Required', style: GoogleFonts.roboto(fontSize: 14, color: CupertinoColors.black)),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text("OK"),
                      onPressed: (){
                        print("OK");
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                 )
                );
              } else {
                    Fluttertoast.showToast(
                    msg: "Registered Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.lightBlue,
                    textColor: Colors.black,
                    fontSize: 16.0
                );
              }
              print(_user.name);
              print(_user.email);
              print(_user.phoneNumber);
              print(_user.remember);
            },
            child: Text(
              "Register",
              style: TextStyle(
                color: CupertinoColors.white,

                fontSize: MediaQuery.of(context).size.height / 47,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child:Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.82,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  nameField(),
                  emailField(),
                  phoneNumberField(),
                  passwordField(),
                  _buildSignUpButton(),
                  _buildRememberSwitch(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color gradientStart = CupertinoColors.activeBlue;
    Color gradientEnd = CupertinoColors.lightBackgroundGray;
    return SingleChildScrollView(
      child: SafeArea(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Arudito', style: GoogleFonts.roboto(fontSize: 21, color: CupertinoColors.black), ),
          ),
          backgroundColor: Color(0xfff2f3f7),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [gradientStart, gradientEnd],
                        begin: FractionalOffset(0.5, 0.0),
                        end: FractionalOffset(0.0, 0.5),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(),
                  _buildContainer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



