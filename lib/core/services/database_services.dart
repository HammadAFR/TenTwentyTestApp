import 'dart:developer';

import '../constants/api_endpoints.dart';
import '../constants/helper widgets/request_failed_dialogue.dart';
import '../models/responses/movie_details_response.dart';
import '../models/responses/movie_images_response.dart';
import '../models/responses/movie_trailer_response.dart';
import '../models/responses/upcoming_movies_response.dart';
import 'Base Api Service/base_api_service.dart';
import 'api_services.dart';

class DatabaseServices {
  final BaseApiServices _apiServices = ApiServices();

  /////////////////////////////// Get Upcoming Movies API ///////////////////////////////
  Future<dynamic> getUpcomingMovies() async {
    try {
      final response =
          await _apiServices.getApiService(url: EndPoints.upcomingMovies);
      if (response.statusCode == 200) {
        return UpcomingMoviesResponse.fromJson(response.data);
      } else {
        RequestFailedDialog(errorMessage: response['status_message']);
      }
    } catch (e) {
      log('An Unexpected Error Occurred in DatabaseServices: $e');
    }
  }

  /////////////////////////////// Getting Movie Details API ///////////////////////////////
  Future<dynamic> getMovieDetails({required int movieId}) async {
    try {
      final response = await _apiServices.getApiService(
          url: '${EndPoints.movieDetails}/$movieId');
      if (response.statusCode == 200) {
        return MovieDetailsResponse.fromJson(response.data);
      } else {
        RequestFailedDialog(errorMessage: response['status_message']);
      }
    } catch (e) {
      log('An Unexpected Error Occurred in DatabaseServices: $e');
    }
  }

  /////////////////////////////// Fetching Movie Trailer API ///////////////////////////////
  Future<dynamic> getMovieTrailer({required int movieId}) async {
    try {
      final response = await _apiServices.getApiService(
          url: '${EndPoints.movieDetails}/$movieId/videos');
      if (response.statusCode == 200) {
        return MovieTrailerResponse.fromJson(response.data);
      } else {
        RequestFailedDialog(errorMessage: response['status_message']);
      }
    } catch (e) {
      log('An Unexpected Error Occurred in DatabaseServices: $e');
    }
  }

  /////////////////////////////// Fetching Movie Images API ///////////////////////////////
  Future<dynamic> getMovieImages({required int movieId}) async {
    try {
      final response = await _apiServices.getApiService(
          url: '${EndPoints.movieDetails}/$movieId/images');
      if (response.statusCode == 200) {
        return MovieImagesResponse.fromJson(response.data);
      } else {
        RequestFailedDialog(errorMessage: response['status_message']);
      }
    } catch (e) {
      log('An Unexpected Error Occurred in DatabaseServices: $e');
    }
  }
}
