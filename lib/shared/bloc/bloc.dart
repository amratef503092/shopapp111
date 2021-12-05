import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/models/login_model.dart';
import 'package:shopapp111/module/categorie_screen.dart';
import 'package:shopapp111/module/favorite_screen.dart';
import 'package:shopapp111/module/home_page.dart';
import 'package:shopapp111/module/settings_screen.dart';
import 'package:shopapp111/shared/remote/api.dart';
import 'package:shopapp111/shared/remote/end point.dart';

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

bool isPassword = true ;
  bool isPassword2 = true ;
  void  visibilityPassword(){

    isPassword = ! isPassword;

  emit(VisibilityState());
}
  void  visibilityPassword2(){

    isPassword2 = ! isPassword2;

    emit(VisibilityState2());
  }
  late LoginModel loginModel;
  void login({
  required String email,
    required String password,
}){
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, query: {
      "email" : email,
      "password" : password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.message);
      emit(LoginSuccessState());
      print(value);
    }

    ).catchError((onError){
      emit(LoginErrorState());
    });


  }

}

