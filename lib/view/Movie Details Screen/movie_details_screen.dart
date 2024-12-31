import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_test_project/core/constants/styles.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/helper widgets/custom_button.dart';
import '../../core/constants/helper widgets/genre_container.dart';
import '../../core/enums/status.dart';
import '../Movie List Screen/movie_list_view_model.dart';
import '../Seat Mapping Screen/cinema_details_screen.dart';
import 'Widgets/movie_images_carousel_slider.dart';
import 'Widgets/movie_trailer_player.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key});

  final List<Color> colors = [
    tealColor,
    pinkColor,
    purpleColor,
    orangeColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListViewModel>(builder: (context, model, child) {
      DateTime parsedDate =
          DateTime.parse(model.movieDetailsModel!.releaseDate!);
      String formattedDate = DateFormat('MMMM d, yyyy').format(parsedDate);
      return ModalProgressHUD(
        inAsyncCall: model.state == ViewState.busy,
        child: Scaffold(
          backgroundColor: offWhiteColor,
          body: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 465.h,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await model.getMovieImages(
                            movieId: model.movieDetailsModel!.id!);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return MovieImagesScreen(
                                backdrops: model.movieImagesModel!.posters!,
                              );
                            });
                      },
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w780${model.movieDetailsModel!.posterPath}',
                        fit: BoxFit.fill,
                        height: 465.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 59.h,
                      child: Container(
                        width: 98.w,
                        height: 30.h,
                        margin: EdgeInsets.only(left: 13.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: whiteColor,
                              ),
                            ),
                            poppinsMediumText(
                                text: 'Watch',
                                color: whiteColor,
                                fontSize: 16.sp),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.w,
                      right: 0.w,
                      bottom: 34.h,
                      child: SizedBox(
                        child: Column(
                          children: [
                            poppinsMediumText(
                                text: 'In Theater $formattedDate',
                                color: whiteColor,
                                fontSize: 16.sp),
                            SizedBox(height: 15.h),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => CinemaDetailsScreen(
                                      title: model.movieDetailsModel!.title!,
                                      date:
                                          model.movieDetailsModel!.releaseDate!,
                                    ));
                              },
                              child: CustomButton(
                                text: 'Get Tickets',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            GestureDetector(
                              onTap: () async {
                                await model.getMovieTrailer(
                                    movieId: model.movieDetailsModel!.id!);
                                if (model.trailerResults!.key != null) {
                                  Get.to(
                                    () => MovieTrailerPlayer(
                                      videoId: model.trailerResults!.key!,
                                    ),
                                  );
                                }
                              },
                              child: CustomIconButton(
                                text: 'Watch Trailer',
                                color: Colors.transparent,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    SizedBox(height: 27.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: poppinsMediumText(
                          text: 'Genre', fontSize: 16.sp, color: textColor),
                    ),
                    SizedBox(height: 14.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: Row(
                  children: List.generate(
                    model.movieDetailsModel!.genres!.length,
                    (index) => GenreContainer(
                      color: colors[index % colors.length],
                      genre: model.movieDetailsModel!.genres![index].name!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    SizedBox(height: 22.h),
                    Divider(color: blackColor.withOpacity(0.05)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: poppinsMediumText(
                          text: 'Overview', fontSize: 16.sp, color: textColor),
                    ),
                    SizedBox(height: 14.h),
                    poppinsNormalText(
                        text: model.movieDetailsModel!.overview!,
                        fontSize: 12.sp,
                        color: anotherTextColor,
                        maxLines: 20)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
