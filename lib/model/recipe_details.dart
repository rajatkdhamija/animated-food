import 'package:flutter/material.dart';

class RecipeDetails {
  String? name;
  String? image;
  String? outlineImage;
  String? description;
  List<String>? ingredients;
  List<Property>? properties;
  ColorScheme? colorScheme;

  RecipeDetails({
    this.name,
    this.image,
    this.outlineImage,
    this.description,
    this.ingredients,
    this.properties,
    this.colorScheme,
  });

  @override
  String toString() {
    return 'RecipeDetails(name: $name, image: $image, outlineImage: $outlineImage, description: $description, recipe: $ingredients, properties: $properties, colorScheme: $colorScheme)';
  }

  factory RecipeDetails.fromJson(Map<String, dynamic> json) => RecipeDetails(
        name: json['name'] as String?,
        image: json['image'] as String?,
        outlineImage: json['outlineImage'] as String?,
        description: json['description'] as String?,
        ingredients: json['recipe'] as List<String>?,
        properties: json['properties'] as List<Property>?,
        colorScheme: json['colorScheme'] as ColorScheme?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'outlineImage': outlineImage,
        'description': description,
        'recipe': ingredients,
        'properties': properties,
        'colorScheme': colorScheme,
      };
}

class Property {
  final Icon icon;
  final String title;

  Property({required this.icon, required this.title});
}
