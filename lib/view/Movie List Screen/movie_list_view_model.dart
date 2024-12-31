import 'dart:developer';

import '../../core/enums/status.dart';
import '../../core/models/models/movie_details_model.dart';
import '../../core/models/models/movie_images_model.dart';
import '../../core/models/models/movie_trailer_model.dart';
import '../../core/models/models/upcoming_movies_model.dart';
import '../../core/models/responses/movie_details_response.dart';
import '../../core/models/responses/movie_images_response.dart';
import '../../core/models/responses/movie_trailer_response.dart';
import '../../core/models/responses/upcoming_movies_response.dart';
import '../../core/services/database_services.dart';
import '../../core/utils/base_view_model.dart';
import '../../core/utils/locator.dart';

class MovieListViewModel extends BaseViewModel {
  final _databaseServices = locator<DatabaseServices>();

  /////////////////////////////// Get Upcoming Movies ///////////////////////////////
  late UpcomingMoviesResponse upcomingMoviesResponse;
  UpcomingMoviesModel? upcomingMoviesModel;

  Future<void> getUpcomingMovies() async {
    upcomingMoviesModel = null;
    // setState(ViewState.busy);
    try {
      final response = await _databaseServices.getUpcomingMovies();
      if (response != null) {
        upcomingMoviesResponse = response;
        upcomingMoviesModel = upcomingMoviesResponse.upcomingMoviesModel;
      }
    } catch (e) {
      log('An Unexpected Error Occurred in MoviesListViewModel: $e');
    }
    notifyListeners();
    // setState(ViewState.idle);
  }

  /////////////////////////////// Get Movie Details ///////////////////////////////
  late MovieDetailsResponse movieDetailsResponse;
  MovieDetailsModel? movieDetailsModel;

  Future<void> getMovieDetails({required int movieId}) async {
    setState(ViewState.busy);
    try {
      final response =
          await _databaseServices.getMovieDetails(movieId: movieId);
      if (response != null) {
        movieDetailsResponse = response;
        movieDetailsModel = movieDetailsResponse.movieDetailsModel;
      }
    } catch (e) {
      log('An Unexpected Error Occurred in MoviesListViewModel: $e');
    }
    setState(ViewState.idle);
  }

  /////////////////////////////// Get Movie Trailer ///////////////////////////////
  late MovieTrailerResponse movieTrailerResponse;
  MovieTrailerModel? movieTrailerModel;
  TrailerResults? trailerResults;

  Future<void> getMovieTrailer({required int movieId}) async {
    setState(ViewState.busy);
    try {
      final response =
          await _databaseServices.getMovieTrailer(movieId: movieId);
      if (response != null) {
        movieTrailerResponse = response;
        movieTrailerModel = movieTrailerResponse.movieTrailerModel;
        trailerResults = movieTrailerModel!.results!
            .where((element) => element.name == 'Official Trailer')
            .first;
        log('Trailer Key: ${trailerResults!.key}');
      }
    } catch (e) {
      log('An Unexpected Error Occurred in MoviesListViewModel: $e');
    }
    setState(ViewState.idle);
  }

  /////////////////////////////// Get Movie Images ///////////////////////////////
  late MovieImagesResponse movieImagesResponse;
  MovieImagesModel? movieImagesModel;

  Future<void> getMovieImages({required int movieId}) async {
    setState(ViewState.busy);
    try {
      final response = await _databaseServices.getMovieImages(movieId: movieId);
      if (response != null) {
        movieImagesResponse = response;
        movieImagesModel = movieImagesResponse.images;
      }
    } catch (e) {
      log('An Unexpected Error Occurred in MoviesListViewModel: $e');
    }
    setState(ViewState.idle);
  }
}
