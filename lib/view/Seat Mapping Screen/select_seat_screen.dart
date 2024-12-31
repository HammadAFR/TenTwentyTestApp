import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ten_twenty_test_project/core/constants/styles.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';

class SelectSeatsScreen extends StatefulWidget {
  const SelectSeatsScreen({super.key, required this.title, required this.date});
  final String title;
  final String date;

  @override
  State<SelectSeatsScreen> createState() => _SelectSeatsScreenState();
}

class _SelectSeatsScreenState extends State<SelectSeatsScreen> {
  var mapping = [
    [0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0],
    [0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0],
    [0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0],
    [0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 69.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Column(
                    children: [
                      poppinsMediumText(
                        text: widget.title,
                        fontSize: 16.sp,
                      ),
                      poppinsMediumText(
                        text: "In theaters ${widget.date}",
                        fontSize: 12.sp,
                        color: turquoiseColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 680.h,
                width: 375.w,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 380.h,
                      width: 330.w,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      color: offWhiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Image.asset(screen),
                          Center(
                            child: SizedBox(
                              height: 189.h,
                              width: 328.w,
                              child: Column(
                                children: [
                                  for (int i = 0; i < 10; i++)
                                    _getRows(
                                      i: i,
                                      cols: 24,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: whiteColor,
                                  child: const Icon(
                                    Icons.add,
                                    color: darkPurpleColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: whiteColor,
                                  child: const Icon(
                                    Icons.remove,
                                    color: darkPurpleColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _seatsDetailsWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _seatsDetailsWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 252.h,
      child: Column(
        children: [
          SizedBox(
            height: 26.h,
          ),
          Row(
            children: [
              _seatMetaData(imagePath: selectedSeat, text: "Selected"),
              _seatMetaData(imagePath: notAvailableSeat, text: "Not Available"),
            ],
          ),
          SizedBox(
            height: 21.h,
          ),
          Row(
            children: [
              _seatMetaData(imagePath: vipSeat, text: "VIP (\$150)"),
              _seatMetaData(imagePath: regularSeat, text: "Regular"),
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 30.h,
              width: 97.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: lightGreyColor,
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "4/",
                          style: poppinsStyle(
                              color: darkPurpleColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: "3 row",
                          style: poppinsStyle(
                              color: darkPurpleColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.close,
                    size: 15.73.sp,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          Row(
            children: [
              Container(
                height: 50.h,
                width: 108.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: lightGreyColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      poppinsNormalText(
                        text: "Total Price",
                        fontSize: 10.sp,
                      ),
                      poppinsMediumText(
                        text: "\$50",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                height: 50.h,
                width: 216.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: turquoiseColor,
                ),
                child: Center(
                  child: Text(
                    "Proceed to pay",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _seatMetaData({
    required String imagePath,
    required String text,
  }) {
    return SizedBox(
      height: 20.h,
      width: 130.w,
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(
            width: 12.8.w,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  _getRows({
    required int i,
    required cols,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int j = 0; j < cols; j++)
          mapping[i][j] == 0
              ? SizedBox(
                  height: 6.63.h,
                  width: 6.98.h,
                )
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.4.h),
                  child: Image.asset(
                    regularSeat,
                    height: 6.63.h,
                    width: 6.98.h,
                  ),
                )
      ],
    );
  }
}
