import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_providers.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> combineFilters) {
    state = combineFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final availableFilters = ref.watch(filtersProvider);
 return meals.where((meal) {
    if (availableFilters[Filter.glutenFree]! && !meal.isGlutenFree) {return false;}
    
    if (availableFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {return false;}
      
    if (availableFilters[Filter.vegetarian]! && !meal.isVegetarian) {return false;}
      
    if (availableFilters[Filter.vegan]! && !meal.isVegan) {return false;}
    return true;
  }).toList();
});
