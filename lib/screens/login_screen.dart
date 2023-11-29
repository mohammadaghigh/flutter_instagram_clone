import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';
import 'package:flutter_instagram_clone/screens/switch_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {});
    negahban2.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff323A99), Color(0xffF98BFC)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getContainerBox(context),
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      top: 80,
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/rocket.png'),
          ),
        ],
      ),
    );
  }

  Widget _getContainerBox(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(
                          fontFamily: 'GB', fontSize: 20, color: whiteColor),
                    ),
                    Container(
                      child: Image(
                        image: AssetImage('assets/images/mood.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36),
                _getTextFiled('Email'),
                SizedBox(height: 32),
                _getTextFiled('Password'),
                SizedBox(height: 45),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (index) {
                      return SwitchAccountScreen();
                    }));
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: SizedBox(
                    width: 129,
                    height: 46,
                    child: Center(
                      child: Text('sign in'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account? / ",
                      style: TextStyle(
                          color: greyColor,
                          fontSize: 16.0,
                          fontFamily: 'GB',
                          fontWeight: FontWeight.w100),
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16.0,
                        fontFamily: 'GB',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _getTextFiled(String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: TextField(
        style: TextStyle(color: whiteColor),
        cursorColor: whiteColor,
        focusNode: _getFocusNodeSelector(labelText),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          labelText: labelText,
          labelStyle: TextStyle(
            color: negahban1.hasFocus ? pinkColor : whiteColor,
            fontFamily: 'GM',
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(color: greyColor, width: 3.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(color: pinkColor, width: 3.0),
          ),
        ),
      ),
    );
  }

  FocusNode _getFocusNodeSelector(String labelText) {
    var focus;
    if (labelText == 'Email') {
      focus = negahban1;
    } else
      focus = negahban2;
    return focus;
  }

  @override
  void dispose() {
    negahban1.dispose();
    negahban2.dispose();
    super.dispose();
  }
}
