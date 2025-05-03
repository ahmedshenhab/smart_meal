import 'package:equatable/equatable.dart';

// sealed class MealDetailStatess extends Equatable {
//   const MealDetailStatess();

//   @override
//   List<Object?> get props => [];
// }

// final class MealDetailInitial extends MealDetailStates {
//   const MealDetailInitial();
// }

// final class MealDetailTitleButtonChangeState extends MealDetailStates {
//   const MealDetailTitleButtonChangeState({required this.title});
//   final String title;

//   @override
//   List<Object?> get props => [title];
// }

class MealDetailStates extends Equatable {
  const MealDetailStates({required this.selectedCategory});
  final String selectedCategory;

  MealDetailStates copyWith({String? selectedCategory}) {
    return MealDetailStates(
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [selectedCategory];
}
