import 'package:finance_app/const/colors.dart';
import 'package:finance_app/const/images.dart';
import 'package:finance_app/utils/sizes.dart';
import 'package:flutter/material.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorPath.appBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.screenHeight * 0.15,
            ),
            const ImageIcon(
              color: CustomColorPath.whiteColor,
              AssetImage(
                CustomImagePath.my_logo,
              ),
              size: 80,
            ),
            const Text(
              "FinWise",
              style: TextStyle(
                  color: CustomColorPath.whiteColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Do not save what is left after spending, but spend what is left after saving.  \n \n – Warren Buffett ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColorPath.whiteColor,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.15,
            ),
            const AuthButtonWidget(
              colors: CustomColorPath.whiteColor,
              title: "Log In",
              fontColor: CustomColorPath.blackColor,
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            const AuthButtonWidget(
              colors: CustomColorPath.blackColor,
              title: "Sign Up",
              fontColor: CustomColorPath.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AuthButtonWidget extends StatelessWidget {
  final Color colors;
  final String title;
  final Color fontColor;
  const AuthButtonWidget(
      {super.key,
      required this.colors,
      required this.title,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: colors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            fixedSize: Size(
              context.screenWidth,
              context.screenHeight * 0.06,
            ),
          ),
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(
                color: fontColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
