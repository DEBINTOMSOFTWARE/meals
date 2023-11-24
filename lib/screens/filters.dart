import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_providers.dart';

class FlitersScreen extends ConsumerWidget {
  const FlitersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: availableFilters[Filter.glutenFree]!,
            onChanged: (isToggled) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isToggled);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          ),
          SwitchListTile(
            value: availableFilters[Filter.lactoseFree]!,
            onChanged: (isToggled) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isToggled);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          ),
          SwitchListTile(
            value: availableFilters[Filter.vegetarian]!,
            onChanged: (isToggled) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isToggled);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          ),
          SwitchListTile(
            value: availableFilters[Filter.vegan]!,
            onChanged: (isToggled) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isToggled);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
          )
        ],
      ),
    );
  }
}
