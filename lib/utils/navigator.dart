import 'package:animated_food/details/recipe_detail_screen.dart';
import 'package:animated_food/model/recipe_details.dart';
import 'package:flutter/material.dart';

navigateScreen(RecipeDetails food, BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder<void>(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation.value,
                child: RecipeDetailScreen(
                  recipeDetails: food,
                ),
              );
            });
      },
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 500),
    ),
  );
}
