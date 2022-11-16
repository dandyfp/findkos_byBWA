// ignore_for_file: deprecated_member_use

import 'package:cozy1/pages/homePage.dart';
import 'package:cozy1/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/error404.png',
              width: 300,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'Where are you going?',
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Seems like the page that you were \n requested is already gone',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 210,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Purplecolor),
                ),

                // color: Purplecolor,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homePage(),
                      ),
                      (route) => false);
                },
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(17),
                // ),
                child: Text(
                  'Back to Home',
                  style: whiteTextStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
