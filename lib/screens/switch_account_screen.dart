import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/constants/constants.dart';
import 'package:flutter_instagram_clone/screens/main_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/switch_account_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 36,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                      ),
                      child: Container(
                        width: 340.0,
                        height: 352.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 32.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: AssetImage('assets/images/profile.png'),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text('Mohammad Aghigh',
                                style: Theme.of(context).textTheme.bodyLarge),
                            SizedBox(height: 20.0),
                            SizedBox(
                              width: 129,
                              height: 46,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (index) {
                                    return MainScreen();
                                  }));
                                },
                                child: Text(
                                  'Confirm',
                                ),
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                              ),
                            ),
                            SizedBox(height: 32.0),
                            Text(
                              'switch account',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 63, top: 132),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account? / ",
                    style: TextStyle(
                        color: greyColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 16.0,
                        fontFamily: 'GB'),
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
              ))
        ],
      ),
    );
  }
}
