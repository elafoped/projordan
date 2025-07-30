// features/discover/presentation/widgets/category_grid.dart
import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final void Function(String title)? onCategoryTap;

  const CategoryGrid({
    super.key,
    required this.items,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, i) => CategoryItem(
        icon: items[i]["icon"],
        title: items[i]["title"],
        onTap: () {
          if (onCategoryTap != null) {
            onCategoryTap!(items[i]["title"]);
          }
        },
      ),
    );
  }
}
