import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/meals_screen.dart';

class CategoryItem extends ConsumerWidget {
  const CategoryItem(this.category, {super.key});
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        List<Meal> meals = ref.watch(filteredMealsProvider);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MealsScreen(
            category.title,
            meals
                .where((meal) => meal.categories.contains(category.id))
                .toList(),
          );
        }));
      },
      splashColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          textAlign: TextAlign.left,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
