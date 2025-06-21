import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/recommendation_meal_screen/data/repo.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationStates> {
  RecommendationCubit({required RepoRecommendation repo})
    : _repo = repo,
      super(RecommendationInitial());

  final RepoRecommendation _repo;

  static RecommendationCubit get(context) =>
      BlocProvider.of<RecommendationCubit>(context);

  double calories = 1000;
  double protein = 100;
  double sugar = 100;
  double fats = 100;
  double carbs = 100;

  Future<void> getRecommendation() async {
    emit(RecommendationLoading());
    final result = await _repo.getRecommendation();
    result.fold(
      (l) {
        emit(RecommendationError(error: l.message!));
      },
      (r) {
        emit(RecommendationSuccess(meals: r));
      },
    );
  }
}
