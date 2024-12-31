import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/helper widgets/bottom_nav_bar_widget.dart';
import '../../core/constants/styles.dart';
import '../Movie List Screen/movie_list_screen.dart';
import '../Movie Search Screen/movie_search_screen.dart';
import 'index_provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<IndexProvider>(context);
    final List screens = [
      Container(
        color: offWhiteColor,
        child: Center(
          child: poppinsMediumText(text: 'Dashboard'),
        ),
      ),
      indexProvider.isWatchScreen ? MovieListScreen() : MovieSearchScreen(),
      Container(
        color: offWhiteColor,
        child: Center(
          child: poppinsMediumText(text: 'Media Library'),
        ),
      ),
      Container(
        color: offWhiteColor,
        child: Center(
          child: poppinsMediumText(text: 'More'),
        ),
      ),
    ];
    return Consumer<IndexProvider>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: offWhiteColor,
        body: screens[model.index - 1],
        bottomNavigationBar: CustomBottomNavBarWidget(),
      );
    });
  }
}
