import 'dart:developer';

import '../models/movie_images_model.dart';

class MovieImagesResponse {
  MovieImagesModel? images;

  MovieImagesResponse.fromJson(json) {
    if (json != null) {
      images = MovieImagesModel.fromJson(json);
    } else {
      log('json is null in MovieImagesResponse');
    }
  }
}
