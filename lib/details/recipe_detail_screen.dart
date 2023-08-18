import 'package:animated_food/details/tab_layout.dart';
import 'package:animated_food/model/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../home/recipe_screen.dart';

class RecipeDetailScreen extends StatefulWidget {
  final RecipeDetails recipeDetails;

  const RecipeDetailScreen({super.key, required this.recipeDetails});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

late AnimationController _animationController;

class _RecipeDetailScreenState extends State<RecipeDetailScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: widget.recipeDetails.colorScheme!.background,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            UniconsLine.arrow_left,
            size: 30,
            color: widget.recipeDetails.colorScheme!.primary,
          ),
          onPressed: () {
            _animationController.reverse();
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pop(context);
            });
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Hero(
                    tag: widget.recipeDetails.image!,
                    child: Image.asset(
                        'lib/assets/${widget.recipeDetails.image}')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Hero(
                tag: widget.recipeDetails.name!,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    widget.recipeDetails.name!,
                    style: GoogleFonts.ibmPlexSerif().copyWith(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: widget.recipeDetails.colorScheme!.primary,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: AnimatedTile(
                    property: widget.recipeDetails.properties![1],
                    animate: false,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    child: AnimatedTile(
                      property: widget.recipeDetails.properties![3],
                      animate: false,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: RecipeTabLayout(
                textColor: widget.recipeDetails.colorScheme!.primary,
                controller: _animationController,
                ingredients: widget.recipeDetails.ingredients ?? [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
