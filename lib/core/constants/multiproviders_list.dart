import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../view/Custom Bottom Nav Bar/index_provider.dart';
import '../../view/Movie List Screen/movie_list_view_model.dart';
import '../../view/Movie Search Screen/movie_search_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => IndexProvider()),
  ChangeNotifierProvider(create: (_) => MovieListViewModel()),
  ChangeNotifierProvider(create: (_) => MovieSearchViewModel()),
];
