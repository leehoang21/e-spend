import 'package:flutter/material.dart';
import 'package:flutter_e_spend/presentation/widgets/image_app_widget/image_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/assets/assets.gen.dart';

class BigUserCard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? settingColor;
  final double? cardRadius;
  final Color? backgroundMotifColor;
  final Widget? cardActionWidget;
  final String? userName;
  final Widget? userMoreInfo;
  final String? userProfilePic;

  const BigUserCard({
    super.key,
    this.backgroundColor,
    this.settingColor,
    this.cardRadius = 30,
    required this.userName,
    this.backgroundMotifColor = Colors.white,
    this.cardActionWidget,
    this.userMoreInfo,
    required this.userProfilePic,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius:
            BorderRadius.circular(double.parse(cardRadius!.toString())),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: (cardActionWidget != null)
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // User profile
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: AppImageWidget(
                    path: userProfilePic,
                    height: 80.w,
                    width: 80.w,
                    fit: BoxFit.cover,
                    defultImage: Assets.images.defaultAvatar.image(),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userName!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: mediaQueryHeight / 30,
                          color: Colors.white,
                        ),
                      ),
                      if (userMoreInfo != null) ...[
                        userMoreInfo!,
                      ],
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: settingColor ?? Theme.of(context).cardColor,
              ),
              child:
                  (cardActionWidget != null) ? cardActionWidget : Container(),
            )
          ],
        ),
      ),
    );
  }
}
