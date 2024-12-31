import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../view/Custom Bottom Nav Bar/index_provider.dart';
import '../assets.dart';
import '../colors.dart';
import '../styles.dart';

class CustomBottomNavBarWidget extends StatefulWidget {
  const CustomBottomNavBarWidget({super.key});

  @override
  State<CustomBottomNavBarWidget> createState() =>
      _CustomBottomNavBarWidgetState();
}

class _CustomBottomNavBarWidgetState extends State<CustomBottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IndexProvider>(builder: (context, model, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 75.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27.r),
            topRight: Radius.circular(27.r),
          ),
          color: darkPurpleColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: model.index == 1
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          dashboardIcon,
                          colorFilter:
                              ColorFilter.mode(whiteColor, BlendMode.srcIn),
                        ),
                        SizedBox(height: 8.h),
                        poppinsNormalText(
                            text: 'Dashboard',
                            fontSize: 10.sp,
                            color: whiteColor),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        model.setIndex(1);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            dashboardIcon,
                            colorFilter:
                                ColorFilter.mode(greyColor, BlendMode.srcIn),
                          ),
                          SizedBox(height: 8.h),
                          poppinsNormalText(
                              text: 'Dashboard',
                              fontSize: 10.sp,
                              color: greyColor),
                        ],
                      ),
                    ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: model.index == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          watchIcon,
                          colorFilter:
                              ColorFilter.mode(whiteColor, BlendMode.srcIn),
                        ),
                        SizedBox(height: 8.h),
                        poppinsNormalText(
                            text: 'Watch', fontSize: 10.sp, color: whiteColor),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        model.toggleIsWatchScreen(true);
                        model.setIndex(2);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            watchIcon,
                            colorFilter:
                                ColorFilter.mode(greyColor, BlendMode.srcIn),
                          ),
                          SizedBox(height: 8.h),
                          poppinsNormalText(
                              text: 'Watch', fontSize: 10.sp, color: greyColor),
                        ],
                      ),
                    ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: model.index == 3
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          mediaLibraryIcon,
                          colorFilter:
                              ColorFilter.mode(whiteColor, BlendMode.srcIn),
                        ),
                        SizedBox(height: 8.h),
                        poppinsNormalText(
                            text: 'Media Library',
                            fontSize: 10.sp,
                            color: whiteColor),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        model.setIndex(3);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            mediaLibraryIcon,
                            colorFilter:
                                ColorFilter.mode(greyColor, BlendMode.srcIn),
                          ),
                          SizedBox(height: 8.h),
                          poppinsNormalText(
                              text: 'Media Library',
                              fontSize: 10.sp,
                              color: greyColor),
                        ],
                      ),
                    ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: model.index == 4
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          moreIcon,
                          colorFilter:
                              ColorFilter.mode(whiteColor, BlendMode.srcIn),
                        ),
                        SizedBox(height: 8.h),
                        poppinsNormalText(
                            text: 'More', fontSize: 10.sp, color: whiteColor),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        model.setIndex(4);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            moreIcon,
                            colorFilter:
                                ColorFilter.mode(greyColor, BlendMode.srcIn),
                          ),
                          SizedBox(height: 8.h),
                          poppinsNormalText(
                              text: 'More', fontSize: 10.sp, color: greyColor),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
