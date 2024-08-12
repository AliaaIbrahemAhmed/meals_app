import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/categories_list_screen.dart';
import 'package:meals_app/widgets/meal_screen_body.dart';
import 'package:meals_app/widgets/taps_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<String> labels = ["Categories", "Favourites"];
  List<Meal> filteredMeals = [];
  late Widget activeScreen;
  int selectedIndex = 0;
  late final Map<Filters, bool> chosenFilters;

  @override
  void initState() {
    super.initState();
    filteredMeals = ref.read(filteredMealsProvider);
    chosenFilters = ref.read(filtersProvider);
    activeScreen = CategoriesList(availableCategories);
  }

  @override
  Widget build(BuildContext context) {
    final favourites = ref.watch(favouritesProvider);
    if (selectedIndex == 1) {
      activeScreen = MealScreenBody(favourites);
    } else {
      activeScreen = CategoriesList(availableCategories);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(labels[selectedIndex]),
      ),
      drawer: const TapsDrawer(),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favourites',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
