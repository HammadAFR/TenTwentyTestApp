import 'dart:developer';

import '../models/movie_details_model.dart';

class MovieDetailsResponse {
  MovieDetailsModel? movieDetailsModel;

  MovieDetailsResponse.fromJson(json) {
    if (json != null) {
      movieDetailsModel = MovieDetailsModel.fromJson(json);
    } else {
      log('json is null in MovieDetailsResponse');
    }
  }
}
