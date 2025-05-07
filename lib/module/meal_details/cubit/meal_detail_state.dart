sealed class MealDetailStatess {
  const MealDetailStatess();
}



final class MealDetailTitleButtonChangeState extends MealDetailStatess {
  const MealDetailTitleButtonChangeState({required this.title});
  final String title;

 
}

final class MealDetailQuanttyUpdateState extends MealDetailStatess {
  
}


class MealDetailToggleIngredientCartState extends MealDetailStatess {
  
}
class MealDetailAddSuccessToCartState extends MealDetailStatess {
  
}