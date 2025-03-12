import 'package:finance_app/const/colors.dart';
import 'package:finance_app/const/images.dart';
import 'package:finance_app/provider/onbarding_provider.dart';
import 'package:finance_app/screen/auth_selection_screen.dart';
import 'package:finance_app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorPath.appBackgroundColor,
      body: Column(
        children: [
          Consumer<OnboardingProvider>(builder: (context, snap, _) {
            return Container(
              height: context.screenHeight * 0.33,
              child: Center(
                child: Text(
                  snap.allOnboardingText[snap.currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
          Expanded(
            child: Container(
              width: context.screenWidth,
              decoration: const BoxDecoration(
                  color: CustomColorPath.whiteColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(35))),
              child: Consumer<OnboardingProvider>(builder: (context, snap, _) {
                return OnBoardingPageViewWidget();
              }),
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardingPageViewWidget extends StatelessWidget {
  const OnBoardingPageViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(builder: (context, snap, _) {
      return PageView.builder(
          onPageChanged: (val) {
            snap.pageChange(val);
          },
          itemCount: snap.allOnboardingImages.length,
          itemBuilder: (ctx, indexs) {
            return Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.04,
                ),
                CircleAvatar(
                  radius: 120,
                  backgroundColor:
                      CustomColorPath.appBackgroundColor.withOpacity(0.2),
                  child: Image.asset(snap.allOnboardingImages[indexs]),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                const Text(
                  "Next",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(snap.allOnboardingImages.length, (index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      height: context.screenHeight * 0.02,
                      width: context.screenWidth * 0.02,
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColorPath.blackColor),
                        color: snap.currentIndex == index
                            ? CustomColorPath.blackColor
                            : CustomColorPath.whiteColor,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                snap.allOnboardingImages.length - 1 == snap.currentIndex
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: CustomColorPath
                                  .appBackgroundColor
                                  .withOpacity(0.2),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const AuthSelectionScreen()));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios)),
                            ),
                          )
                        ],
                      )
                    : Container()
              ],
            );
          });
    });
  }
}
