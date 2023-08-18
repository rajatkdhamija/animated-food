import 'package:animated_food/model/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

List<RecipeDetails> recipesList = [
  RecipeDetails(
    name: 'Chef John\'s Chicken Kiev',
    image: 'Plate-Black.png',
    outlineImage: 'Plate-Black-Outlined.png',
    description:
        'This is a simple recipe for authentic Mexican chicken. Serve with rice, beans, tortillas, or chips.',
    ingredients: [
      '1/2 cup Mexican red chile sauce',
      '1/4 cup olive oil',
      '1/4 cup fresh lime juice',
      '1/4 cup chopped fresh cilantro',
      '1/2 teaspoon salt',
      '1/2 teaspoon ground black pepper',
      '4 skinless, boneless chicken breast halves',
    ],
    properties: [
      Property(
          icon: const Icon(UniconsLine.brain, color: Color(0xff2ED8CC)),
          title: "Medium"),
      Property(
          icon: const Icon(UniconsLine.clock, color: Color(0xff2ED8CC)),
          title: "50 mins"),
      Property(
          icon: const Icon(UniconsLine.heart, color: Color(0xff2ED8CC)),
          title: "Healthy"),
      Property(
          icon: const Icon(
            UniconsLine.award,
            color: Color(0xff2ED8CC),
          ),
          title: "3+ exp"),
      Property(
          icon: const Icon(UniconsLine.restaurant, color: Color(0xff2ED8CC)),
          title: "Non Veg"),
    ],
    colorScheme: const ColorScheme.light(
      primary: Color(0xff000000),
    ),
  ),
  RecipeDetails(
    name: 'Burek sa sirom',
    image: 'Plate-Lemon.png',
    outlineImage: 'Plate-Lemon-Outlined.png',
    description:
        'Burek sa sirom is a phyllo pastry that is round or coil-shaped with a filling of either cheese, spinach, or meat. It is made by filling a phyllo dough with the desired filling and then rolling it into a spiral shape. It is then baked in the oven until the phyllo dough turns golden brown and crispy. It is usually served with yogurt or sour cream.',
    ingredients: [
      '1 cup Paneer',
      '1/2 cup Mexican red chile sauce',
      '1/4 cup olive oil',
      '1/4 cup fresh lime juice',
      '1/4 cup chopped fresh cilantro',
      '1/2 teaspoon salt',
      '1/2 teaspoon ground black pepper',
    ],
    properties: [
      Property(
          icon: const Icon(UniconsLine.brain, color: Color(0xff2ED8CC)),
          title: "Easy"),
      Property(
          icon: const Icon(UniconsLine.clock, color: Color(0xff2ED8CC)),
          title: "25 mins"),
      Property(
          icon: const Icon(UniconsLine.heart, color: Color(0xff2ED8CC)),
          title: "Healthy"),
      Property(
          icon: const Icon(
            UniconsLine.award,
            color: Color(0xff2ED8CC),
          ),
          title: "3+ exp"),
      Property(
          icon: const Icon(UniconsLine.pagelines, color: Color(0xff2ED8CC)),
          title: "Veg"),
    ],
    colorScheme: const ColorScheme.dark(
      background: Color(0xff223242),
      primary: Color(0xffFFFFFF),
    ),
  ),
  RecipeDetails(
    name: 'Poulet de Provencal',
    image: 'Plate-White.png',
    outlineImage: 'Plate-White-Outlined.png',
    description:
        'Chicken fajitas are a very popular meal in restaurants, and now you can make them yourself at home. The key is to marinate the chicken before cooking. This version is served with onions, red and green peppers, and flour tortillas.',
    ingredients: [
      '1/2 red bell pepper, sliced',
      '1/2 green bell pepper, sliced',
      '8 (6 inch) flour tortillas',
      '1 tomato, diced',
      '1/4 cup shredded lettuce',
      '1/4 cup shredded Monterey Jack cheese',
      '1/4 cup salsa',
      '1/4 cup sour cream',
    ],
    properties: [
      Property(
          icon: const Icon(UniconsLine.brain, color: Color(0xff2ED8CC)),
          title: "Hard"),
      Property(
          icon: const Icon(UniconsLine.clock, color: Color(0xff2ED8CC)),
          title: "45 mins"),
      Property(
          icon: const Icon(UniconsLine.heart, color: Color(0xff2ED8CC)),
          title: "Healthy"),
      Property(
          icon: const Icon(
            UniconsLine.award,
            color: Color(0xff2ED8CC),
          ),
          title: "5+ exp"),
      Property(
          icon: const Icon(UniconsLine.restaurant, color: Color(0xff2ED8CC)),
          title: "Non Veg"),
    ],
    colorScheme: const ColorScheme.light(
      primary: Color(0xff000000),
    ),
  ),
];
