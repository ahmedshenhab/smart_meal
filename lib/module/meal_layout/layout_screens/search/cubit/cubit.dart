import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_meal/module/meal_layout/data/model/meals_model.dart';
import 'package:smart_meal/module/meal_layout/layout_screens/search/repo/repo.dart';

part 'states.dart';

class SearchByMealCubit extends Cubit<SearchByMealStates> {
  SearchByMealCubit({required SearchByMealRepo searchByMealRepo})
    : _searchByMealRepo = searchByMealRepo,
      super(SearchByMealInitial());

      static SearchByMealCubit get(context) => BlocProvider.of(context);
      

  final SearchByMealRepo _searchByMealRepo;
  
  final categorys = ['Breakfast', 'Lunch', 'Dinner'];
  String selectedCategory = 'Lunch';

   search() async {
    if (searchController.text.isEmpty) {
      return;
    }
    emit(SearchByMealLoading());

    final result = await _searchByMealRepo.searchByMeal(searchController.text);
    result.fold(
      (l) => emit(SearchByMealError(error: l.message!)),

      (r) => emit(SearchByMealSuccess(searchByMealResponseModel: r)),
    );
  }

  void changeCategory(String e) {
    if (selectedCategory == e) {
      return;
    }
    selectedCategory = e;

    emit(SearchByMealChangeBottomCategoryState(title: e));
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Future<void> close() {
    searchController.dispose();

    return super.close();
  }
}
