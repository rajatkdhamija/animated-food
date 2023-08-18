import 'dart:math';

import 'package:animated_food/home/recipe_image.dart';
import 'package:animated_food/home/recipe_screen.dart';
import 'package:animated_food/recipes.dart';
import 'package:animated_food/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../utils/precache_service.dart';
import '../utils/transition_index.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;
late PageController _pageController;


class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    PreCacheImages.preCacheImages(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 20),
        child: Transform(
          transform: Matrix4.identity()..rotateZ(pi / 4),
          alignment: Alignment.center,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: const Color(0xff2ED8CC),
            onPressed: () =>
                navigateScreen(recipesList[selectedIndex], context),
            child: Transform(
              transform: Matrix4.identity()..rotateZ(-pi / 4),
              alignment: Alignment.center,
              child: Icon(
                UniconsLine.arrow_right,
                size: 36,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: recipesList[selectedIndex].colorScheme!.primary,
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              setState(() {
                selectedIndex = value;
              });
              ref.read(textAnimationIndex.notifier).state = null;
            },
            itemBuilder: (context, index) {
              return Container(
                color: recipesList[index].colorScheme!.background,
              );
            },
            itemCount: recipesList.length,
          ),
          RecipeScreen(recipesList[selectedIndex], _pageController),
          Positioned(
            top: height / 2 - (width * 0.88) / 2,
            left: width / 2 - 20,
            child: RecipeImage(
              _pageController,
              selectedIndex,
              width,
            ),
          )
        ],
      ),
    );
  }
}
