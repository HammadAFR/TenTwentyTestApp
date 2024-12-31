import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/helper widgets/custom_search_field.dart';
import '../../core/constants/styles.dart';
import '../Custom Bottom Nav Bar/index_provider.dart';
import 'movie_search_view_model.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  late MovieSearchViewModel movieSearchViewModel;

  @override
  void initState() {
    movieSearchViewModel =
        Provider.of<MovieSearchViewModel>(context, listen: false);
    super.initState();
    movieSearchViewModel.searchController.addListener(_updateSearchResults);
  }

  @override
  void dispose() {
    movieSearchViewModel.searchController.removeListener(_updateSearchResults);
    super.dispose();
  }

  void _updateSearchResults() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    return Consumer<MovieSearchViewModel>(builder: (context, model, child) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: offWhiteColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            toolbarHeight: 80.h,
            automaticallyImplyLeading: false,
            leading: model.searchComplete
                ? GestureDetector(
                    onTap: () {
                      model.setSearchComplete(false);
                      model.searchController.text = '';
                      indexProvider.toggleIsWatchScreen(true);
                    },
                    child: Icon(Icons.arrow_back_ios))
                : null,
            centerTitle: model.searchComplete ? false : true,
            title: model.searchComplete
                ? poppinsMediumText(text: '3 Results Found')
                : CustomTextField(
                    controller: model.searchController,
                    focusNode: model.searchFocusNode,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Icon(
                        Icons.search,
                        color: textColor,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        model.setSearchComplete(false);
                        model.searchController.text = '';

                        indexProvider.toggleIsWatchScreen(true);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: SvgPicture.asset(
                          closeIcon,
                          fit: BoxFit.contain,
                          colorFilter:
                              ColorFilter.mode(textColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    onComplete: (val) {
                      model.setSearchComplete(true);
                    },
                  ),
          ),
          body: model.searchComplete
              ? ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              model.searchedResults[index],
                              width: 130.w,
                              height: 100.h,
                            ),
                          ),
                          SizedBox(width: 21.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              poppinsMediumText(
                                  text: model.searchTitles[index],
                                  fontSize: 16.sp,
                                  color: textColor),
                              SizedBox(height: 8.h),
                              poppinsMediumText(
                                text: model.searchedGenres[index],
                                fontSize: 12.sp,
                                color: lightGreyColor,
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(detailsIcon)),
                        ],
                      ),
                    );
                  },
                )
              : model.searchController.text.isEmpty
                  ? GridView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 30.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        mainAxisExtent: 100.h,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 163.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.asset(
                                  model.genres[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 10.w,
                                bottom: 20.h,
                                child: poppinsMediumText(
                                  text: model.titles[index],
                                  color: whiteColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: poppinsMediumText(
                              text: 'Top Results',
                              fontSize: 12.sp,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          const Divider(color: textColor),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 20.h),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: Image.asset(
                                          model.searchedResults[index],
                                          width: 130.w,
                                          height: 100.h,
                                        ),
                                      ),
                                      SizedBox(width: 21.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          poppinsMediumText(
                                              text: model.searchTitles[index],
                                              fontSize: 16.sp,
                                              color: textColor),
                                          SizedBox(height: 8.h),
                                          poppinsMediumText(
                                            text: model.searchedGenres[index],
                                            fontSize: 12.sp,
                                            color: lightGreyColor,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                          onTap: () {
                                            // Get.to(() => MovieDetailsScreen());
                                          },
                                          child: SvgPicture.asset(detailsIcon)),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
        ),
      );
    });
  }
}
