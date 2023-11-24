import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //initilizing and methods needed
  FavoriteMealsNotifier() : super([]);

  // here we are only allowed to create new list we can't add or remove item
  bool toggleMealFavoriteStatus(Meal meal) {
    final favoriteMeal = state.contains(meal);
    if (favoriteMeal) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
