import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen(this.meal, {super.key});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    bool isAdded = false;
    List<Meal> favouriteMeals = ref.watch(favouritesProvider);
    bool isFavourite = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(Icons.arrow_back_sharp)),
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                String snackBarText = "";
                isAdded = ref.watch(favouritesProvider.notifier).toggle(meal);
                if (isAdded) {
                  snackBarText = "${meal.title} is Added to Favourites";
                } else {
                  snackBarText = "${meal.title} is Removed From Favourites";
                }
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text(snackBarText),
                  ),
                );
              },
              icon: Icon(
                isFavourite ? Icons.star : Icons.star_border,
                key: Key(isFavourite.toString()),
              ))
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
          ),
          Text(
            "Ingredients",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3,
          ),
          ...meal.ingredients.map((ingredient) => Text(
                ingredient,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Steps",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3,
          ),
          ...meal.steps.map((step) => Text(
                step,
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
