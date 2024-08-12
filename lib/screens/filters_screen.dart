import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

enum Filters { isGlutenFree, isLactoseFree, isVegeterian, isVegan }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<Filters, bool> filters = ref.watch(filtersProvider);

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: PopScope(
        canPop: true,
        child: Column(
          children: [
            SwitchListTile(
                title: Text(
                  "Gluten-Free",
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                subtitle: Text(
                  "only include gluten-free meals",
                  style: theme.textTheme.labelSmall!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                value: filters[Filters.isGlutenFree]!,
                onChanged: (value) {
                  ref
                      .watch(filtersProvider.notifier)
                      .setFilter(Filters.isGlutenFree, value);
                }),
            SwitchListTile(
                title: Text(
                  "Lactose-Free",
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                subtitle: Text(
                  "only include lactose-free meals",
                  style: theme.textTheme.labelSmall!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                value: filters[Filters.isLactoseFree]!,
                onChanged: (value) {
                  ref
                      .watch(filtersProvider.notifier)
                      .setFilter(Filters.isLactoseFree, value);
                }),
            SwitchListTile(
                title: Text(
                  "Vegeterian",
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                subtitle: Text(
                  "only include vegeterian meals",
                  style: theme.textTheme.labelSmall!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                value: filters[Filters.isVegeterian]!,
                onChanged: (value) {
                  ref
                      .watch(filtersProvider.notifier)
                      .setFilter(Filters.isVegeterian, value);
                }),
            SwitchListTile(
                title: Text(
                  "Vegan",
                  style: theme.textTheme.titleLarge!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                subtitle: Text(
                  "only include vegan meals",
                  style: theme.textTheme.labelSmall!
                      .copyWith(color: theme.colorScheme.onSurface),
                ),
                value: filters[Filters.isVegan]!,
                onChanged: (value) {
                  ref
                      .watch(filtersProvider.notifier)
                      .setFilter(Filters.isVegan, value);
                }),
          ],
        ),
      ),
    );
  }
}
