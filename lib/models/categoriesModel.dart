import 'package:flutter/material.dart';

class CategoriesModel {
  final int id = UniqueKey().hashCode;
  final String categoryName;
  bool isSelected;
  CategoriesModel({required this.categoryName, this.isSelected = false});
}
