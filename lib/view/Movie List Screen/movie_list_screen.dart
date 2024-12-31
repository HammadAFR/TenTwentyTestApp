import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_test_project/core/constants/styles.dart';

import '../../core/constants/colors.dart';
import '../Custom Bottom Nav Bar/index_provider.dart';
import '../Movie Details Screen/movie_details_screen.dart';
import 'movie_list_view_model.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen>
    with SingleTickerProviderStateMixin {
  late MovieListViewModel movieListViewModel;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    movieListViewModel =
        Provider.of<MovieListViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      log("Fetching upcoming movies...");
      movieListViewModel.getUpcomingMovies();
      log("Completed fetching upcoming movies.");
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    return Consumer<MovieListViewModel>(builder: (context, model, child) {
      return model.upcomingMoviesModel != null
          ? Scaffold(
              backgroundColor: offWhiteColor,
              appBar: AppBar(
                leading: Center(
                    child: poppinsMediumText(text: 'Watch', color: textColor)),
                leadingWidth: 80.w,
                actions: [
                  IconButton(
                    onPressed: () {
                      indexProvider.toggleIsWatchScreen(false);
                    },
                    icon: Icon(
                      Icons.search,
                      color: textColor,
                    ),
                  ),
                ],
                backgroundColor: whiteColor,
              ),
              body: SizedBox(
                child: ListView.builder(
                  itemCount: model.upcomingMoviesModel!.results!.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 30.h),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await model.getMovieDetails(
                            movieId:
                                model.upcomingMoviesModel!.results![index].id!);
                        Get.to(() => MovieDetailsScreen());
                      },
                      child: Center(
                        child: Container(
                          width: 335.w,
                          height: 180.h,
                          margin: EdgeInsets.only(bottom: 20.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w780${model.upcomingMoviesModel!.results![index].backdropPath}',
                                ),
                              ),
                              Positioned(
                                left: 20.w,
                                bottom: 20.h,
                                child: SizedBox(
                                  width: 290.w,
                                  child: poppinsMediumText(
                                    text: model.upcomingMoviesModel!
                                        .results![index].originalTitle!,
                                    color: whiteColor,
                                    fontSize: 18.sp,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          : Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: poppinsMediumText(
                  text: 'Fetching Data',
                  color: textColor,
                  fontSize: 18.sp,
                ),
              ),
            );
    });
  }
}
