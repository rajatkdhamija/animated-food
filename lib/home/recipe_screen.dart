import 'package:animated_food/model/recipe_details.dart';
import 'package:animated_food/recipes.dart';
import 'package:animated_food/utils/text_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/transition_index.dart';

class RecipeScreen extends ConsumerStatefulWidget {
  final RecipeDetails recipeDetails;
  final PageController pageController;

  const RecipeScreen(this.recipeDetails, this.pageController, {super.key});

  @override
  ConsumerState<RecipeScreen> createState() => _RecipeScreenState();
}

late AnimationController _controller;
int? reverseIndex;

class _RecipeScreenState extends ConsumerState<RecipeScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: 1);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reverseIndex = ref.watch(textAnimationIndex);
    if (reverseIndex != null && reverseIndex == widget.pageController.page) {
      _controller.reverse().then((value) => _controller.forward());
    }
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextAnimator(
              text: "DAILY COOKING CHALLENGE",
              style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
              controller: _controller,
              autoPlay: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Hero(
                tag: widget.recipeDetails.name!,
                child: Material(
                  type: MaterialType.transparency,
                  child: TextAnimator(
                    text: widget.recipeDetails.name!,
                    style: GoogleFonts.ibmPlexSerif().copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: widget.recipeDetails.colorScheme!.primary,
                    ),
                    controller: _controller,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ...widget.recipeDetails.properties!.map(
              (property) =>
                  AnimatedTile(controller: _controller, property: property),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: TextAnimator(
                    text: widget.recipeDetails.description!,
                    style: TextStyle(
                      fontSize: 12,
                      color: widget.recipeDetails.colorScheme!.primary,
                    ),
                    controller: _controller,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedTile extends StatelessWidget {
  final Property property;
  final bool animate;
  final AnimationController? controller;

  const AnimatedTile(
      {super.key,
      required this.property,
      this.controller,
      this.animate = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        leading: Hero(tag: property.icon, child: property.icon),
        title: Hero(
          tag: property.title,
          child: Material(
            type: MaterialType.transparency,
            child: animate
                ? TextAnimator(
                    text: property.title,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                    controller: controller!,
                  )
                : Text(
                    property.title,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
