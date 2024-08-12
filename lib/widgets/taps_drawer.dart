import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class TapsDrawer extends StatelessWidget {
  const TapsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: theme.colorScheme.primary,
                  size: 50,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text("Cooking Up!",
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: theme.colorScheme.primary))
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text("Meals"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Filters"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FiltersScreen()));
            },
          ),
        ],
      ),
    );
  }
}
