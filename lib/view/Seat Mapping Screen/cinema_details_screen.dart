import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ten_twenty_test_project/core/constants/styles.dart';

import '../../core/constants/colors.dart';
import 'Widgets/cinema_booking_widget.dart';
import 'Widgets/date_container.dart';
import 'select_seat_screen.dart';

class CinemaDetailsScreen extends StatefulWidget {
  const CinemaDetailsScreen(
      {super.key, required this.title, required this.date});
  final String title;
  final String date;

  @override
  State<CinemaDetailsScreen> createState() => _CinemaDetailsScreenState();
}

class _CinemaDetailsScreenState extends State<CinemaDetailsScreen> {
  ValueNotifier<String> selectedValue = ValueNotifier("31 Dec");
  List<String> dates = [
    "31 Dec",
    "01 Jan",
    "02 Jan",
    "03 Jan",
    "04 Jan",
    "05 Jan",
    "06 Jan",
    "07 Jan",
    "08 Jan",
    "09 Jan",
    "10 Jan",
    "11 Jan",
  ];

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(widget.date);
    String formattedDate = DateFormat('MMMM d, yyyy').format(parsedDate);
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
                    onTap: () => {
                      Get.back(),
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Column(
                    children: [
                      poppinsMediumText(
                        text: widget.title,
                        fontSize: 16.sp,
                      ),
                      poppinsMediumText(
                        text: "In theaters $formattedDate",
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
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 680.h,
              width: 375.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              color: offWhiteColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 94.h,
                  ),
                  poppinsMediumText(
                    text: "Date",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  SizedBox(
                    height: 32.h,
                    width: 330.w,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: dates
                          .map(
                            (date) => DateContainer(
                              date: date,
                              selectedValue: selectedValue,
                              callback: () {
                                selectedValue.value = date;
                                setState(() {});
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  SizedBox(
                    height: 220.h,
                    width: 330.w,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CinemaDatesWidget(),
                        CinemaDatesWidget(),
                        CinemaDatesWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 180.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SelectSeatsScreen(
                            title: widget.title,
                            date: formattedDate,
                          ));
                    },
                    child: Container(
                      height: 50.h,
                      width: 243.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: turquoiseColor,
                      ),
                      child: Center(
                        child: poppinsMediumText(
                          text: "Get Tickets",
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
