import 'dart:developer';

import '../models/movie_trailer_model.dart';

class MovieTrailerResponse {
  MovieTrailerModel? movieTrailerModel;

  MovieTrailerResponse.fromJson(json) {
    if (json != null) {
      movieTrailerModel = MovieTrailerModel.fromJson(json);
    } else {
      log('json is null in MovieTrailerResponse');
    }
  }
}
