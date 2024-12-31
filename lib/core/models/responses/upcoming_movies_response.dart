import 'dart:developer';

import '../models/upcoming_movies_model.dart';

class UpcomingMoviesResponse {
  UpcomingMoviesModel? upcomingMoviesModel;

  UpcomingMoviesResponse.fromJson(json) {
    if (json != null) {
      upcomingMoviesModel = UpcomingMoviesModel.fromJson(json);
    } else {
      log('json is null in UpcomingMoviesResponse');
    }
  }
}
