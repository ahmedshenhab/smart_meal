import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout_screens/profile.dart';
import '../layout_screens/saved.dart';
import 'stataes.dart';

import '../layout_screens/home.dart';
import '../layout_screens/search.dart';

class MealCubit extends Cubit<MealStates> {
  MealCubit() : super(MealInitialState());
  final categorys = ['Breakfast', 'Lunch', 'Dinner'];
  String selectedCategory = 'Lunch';
 List<Widget> screens = const [
    Home(),
    Search(),
    Profile(),
    Saved(),
  ];



  void changeCategory( String e){


 selectedCategory = e;

  emit(MealChangeBottomCategoryState());



  }

 
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Saved',
    ),
  ];

  static MealCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBottomNavIndex(int index) {
    currentIndex = index;

    emit(MealChangeBottomNavState());
  }
}





  // void userGetData() {
  //   emit(SocialGetUserLoadingState());
  //   // Constant.uId = CachHelper.getData(key: 'uId');
  //   // log('uid from sociallayout = ${Constant.uId}');

  //   FirebaseFirestore.instance.collection('user').doc(Constant.uId!).get().then(
  //     (value) {
  //       log('user date');
  //       log(value.data().toString());

  //       socialUserModel = SocialUserModel.fromJson(value.data()!);
  //       emit(SocialGetUserSuccessState(
  //         socialUserModel: socialUserModel!,
  //       ));
  //       log('success get');
  //     },
  //   ).catchError((error) {
  //     log('SocialGetUserErrorState$error');
  //     emit(SocialGetUserErrorState(error: error.toString()));
  //   });
  // }
