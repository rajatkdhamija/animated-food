import 'package:animated_food/recipes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/navigator.dart';
import '../utils/transition_index.dart';

class RecipeImage extends ConsumerStatefulWidget {
  final PageController pageController;
  final int currentIndex;
  final double width;

  const RecipeImage(this.pageController, this.currentIndex, this.width,
      {super.key});

  @override
  ConsumerState<RecipeImage> createState() => _RecipeImageState();
}

late AnimationController _rotationController;

double? lastAnimatedValue;
Curve animationType = Curves.easeOutBack;

class _RecipeImageState extends ConsumerState<RecipeImage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _rotationController =
        AnimationController(vsync: this, upperBound: 1, lowerBound: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _rotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateScreen(recipesList[widget.currentIndex], context),
      onVerticalDragUpdate: (details) async {
        if (details.delta.dy <= 0) {
          if (!_rotationController.isAnimating) {
            if (widget.currentIndex < recipesList.length - 1) {
              setState(() {
                animationType = Curves.easeOutBack;
              });
              Future.delayed(const Duration(milliseconds: 500), () {});

              ref.read(textAnimationIndex.notifier).state = widget.currentIndex;
              widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
              _rotationController.loop(count: 1, max: 1);
              lastAnimatedValue = 1;
            }
          }
        } else {
          if (!_rotationController.isAnimating) {
            if (widget.currentIndex > 0) {
              setState(() {
                animationType = Curves.easeInBack;
              });
              widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);

              if (widget.currentIndex > 0) {
                lastAnimatedValue = 1;
              }

              _rotationController.reverse(from: lastAnimatedValue);
              lastAnimatedValue = 0;
            }
          }
        }
      },
      child: Hero(
        tag: recipesList[widget.currentIndex].image!,
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          return Image.asset(
            flightDirection.name == "push"
                ? "lib/assets/${recipesList[widget.currentIndex].image}"
                : "lib/assets/${recipesList[widget.currentIndex].outlineImage}",
            width: flightDirection.name == "push"
                ? widget.width * 0.80
                : widget.width * 0.88,
          ).animate().rotate(
                begin: flightDirection.name == 'push' ? 1 : -1,
                end: 0,
                curve: flightDirection.name == 'push'
                    ? Curves.fastOutSlowIn
                    : Curves.fastEaseInToSlowEaseOut,
                duration: const Duration(milliseconds: 600),
              );
        },
        child: Image.asset(
          "lib/assets/${recipesList[widget.currentIndex].outlineImage}",
          width: widget.width * 0.88,
        )
            .animate(
              controller: _rotationController,
              autoPlay: false,
            )
            .rotate(
                duration: const Duration(milliseconds: 1200),
                alignment: Alignment.center,
                curve: animationType,
                begin: lastAnimatedValue == _rotationController.upperBound
                    ? -_rotationController.upperBound
                    : _rotationController.lowerBound,
                end: lastAnimatedValue == _rotationController.upperBound
                    ? 0
                    : _rotationController.upperBound),
      ),
    )
        .animate()
        .rotate(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
            begin: 0,
            end: 0.2)
        .then()
        .rotate(
            begin: 0,
            end: -0.2,
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 500));
  }
}
