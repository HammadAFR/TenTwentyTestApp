import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';
import '../../core/utils/base_view_model.dart';

class MovieSearchViewModel extends BaseViewModel {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool _searchComplete = false;
  bool get searchComplete => _searchComplete;
  void setSearchComplete(bool value) {
    _searchComplete = value;
    notifyListeners();
  }

  List<String> genres = [
    comedy,
    crime,
    family,
    documentaries,
    drama,
    fantasy,
    holiday,
    horror,
    scifi,
    thriller,
  ];
  List<String> titles = [
    'Comedies',
    'Crime',
    'Family',
    'Documentaries',
    'Drama',
    'Fantasy',
    'Holidays',
    'Horror',
    'Sci-Fi',
    'Thriller',
  ];

  List<String> searchedResults = [
    timeless,
    inTime,
    timeToKill,
  ];

  List<String> searchTitles = [
    'Timeless',
    'In Time',
    'A Time to Kill',
  ];

  List<String> searchedGenres = [
    'Fantasy',
    'Sci-Fi',
    "Crime",
  ];
}
