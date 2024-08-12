import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/filters_screen.dart';

class FiltersProviderNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersProviderNotifier()
      : super({
          Filters.isGlutenFree: false,
          Filters.isLactoseFree: false,
          Filters.isVegan: false,
          Filters.isVegeterian: false,
        });

  void setFilters(Map<Filters, bool> mp) {
    state = mp;
  }

  void setFilter(Filters f, bool isActive) {
    state = {...state, f: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProviderNotifier, Map<Filters, bool>>(
        (ref) => FiltersProviderNotifier());

final filteredMealsProvider = Provider((ref) {
  var filteredMeals = ref.watch(mealsProvider);
  var chosenFilters = ref.watch(filtersProvider);
  if (chosenFilters[Filters.isGlutenFree]!) {
    filteredMeals =
        filteredMeals.where((meal) => meal.isGlutenFree == true).toList();
  }
  if (chosenFilters[Filters.isLactoseFree]!) {
    filteredMeals =
        filteredMeals.where((meal) => meal.isLactoseFree == true).toList();
  }
  if (chosenFilters[Filters.isVegeterian]!) {
    filteredMeals =
        filteredMeals.where((meal) => meal.isVegetarian == true).toList();
  }
  if (chosenFilters[Filters.isVegan]!) {
    filteredMeals =
        filteredMeals.where((meal) => meal.isVegan == true).toList();
  }
  return filteredMeals;
});
