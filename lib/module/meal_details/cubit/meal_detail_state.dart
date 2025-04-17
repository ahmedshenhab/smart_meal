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


   const MealDetailStates({
    required this.selectedCategory,
    this.isLoading = false,
    this.error,
    // this.meal,
  });
  final String selectedCategory;
  final bool isLoading;
  final String? error;
  // final MealModel? meal;

  MealDetailStates copyWith({
    String? selectedCategory,
    bool? isLoading,
    String? error,
    // MealModel? meal,
  }) {
    return MealDetailStates(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      // meal: meal ?? this.meal,
    );

  }

  @override
  List<Object?> get props => [selectedCategory, isLoading, error];
}
