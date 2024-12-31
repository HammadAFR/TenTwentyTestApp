import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ten_twenty_test_project/core/constants/styles.dart';

import '../../../core/models/models/movie_images_model.dart';

class MovieImagesScreen extends StatelessWidget {
  const MovieImagesScreen({super.key, required this.backdrops});
  final List<Backdrops> backdrops;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: poppinsMediumText(
          text: "Movie Images",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: backdrops.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${image.filePath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: poppinsMediumText(
                text: "Swipe to view more images",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
