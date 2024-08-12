import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreenBody extends StatelessWidget {
  const MealScreenBody(this.meals, {super.key});
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Widget bodyWidget = meals.isNotEmpty
        ? ListView(
            children: meals
                .map((meal) => MealItem(
                      meal,
                    ))
                .toList(),
          )
        : Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off,
                    size: 100, color: theme.colorScheme.onSurface),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Sorry, No Meals Found!",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
              ],
            ));
    return bodyWidget;
  }
}
