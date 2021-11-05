import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/module/categorie_screen.dart';
import 'package:shopapp111/module/favorite_screen.dart';
import 'package:shopapp111/module/home_page.dart';
import 'package:shopapp111/module/settings_screen.dart';

import 'appstates.dart';
class AppCubit extends  Cubit<AppStates>{
  AppCubit() : super(InitialState());
  static AppCubit get(context) =>BlocProvider.of(context);

  int countBottomNavigationBar = 0;

  List<Widget> screen = [
    HomePage(),
    const CategoriesScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
void changeBottomNavigationBar(int index){
  countBottomNavigationBar = index;
  emit(ChangeState());


}


}

