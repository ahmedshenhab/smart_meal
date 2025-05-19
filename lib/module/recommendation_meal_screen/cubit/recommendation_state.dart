part of 'recommendation_cubit.dart';

sealed class RecommendationStates  {
  const RecommendationStates();


}

final class RecommendationInitial extends RecommendationStates {}

final class RecommendationLoading extends RecommendationStates {}
final class RecommendationSuccess extends RecommendationStates {
  RecommendationSuccess({required this.meals});
  final List<MealsModel> meals;
}


final class RecommendationError extends RecommendationStates {
  RecommendationError({required this.error});
  final String error;
}

