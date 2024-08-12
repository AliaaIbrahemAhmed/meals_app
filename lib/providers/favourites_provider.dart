import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouritesProviderNotifier extends StateNotifier<List<Meal>> {
  FavouritesProviderNotifier() : super([]);

  bool toggle(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesProviderNotifier, List<Meal>>(
        (ref) => FavouritesProviderNotifier());
