import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/Constant/constants.dart';
import 'package:shopapp111/models/add_delete_favourite.dart';
import 'package:shopapp111/models/banner_model.dart';
import 'package:shopapp111/models/categories.dart';
import 'package:shopapp111/models/favourite.dart';
import 'package:shopapp111/models/home_model.dart';
import 'package:shopapp111/models/login_model.dart';
import 'package:shopapp111/models/logout_model.dart';
import 'package:shopapp111/models/rigister_model.dart';
import 'package:shopapp111/module/categorie_screen.dart';
import 'package:shopapp111/module/favorite_screen.dart';
import 'package:shopapp111/module/home_page.dart';
import 'package:shopapp111/module/settings_screen.dart';
import 'package:shopapp111/shared/remote/api.dart';
import 'package:shopapp111/shared/remote/end point.dart';
import 'package:shopapp111/shared/shared_prefrance.dart';

import 'appstates.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int countBottomNavigationBar = 0;

  List<Widget> screen = [
    HomePage(),
    const CategoriesScreen(),
    const FavoriteScreen(),
     SettingsScreen(),
  ];
  void changeBottomNavigationBar(int index) {
    countBottomNavigationBar = index;
    emit(ChangeState());
  }

  bool isPassword = true;
  bool isPassword2 = true;
  bool isPassword3 = true;
  void visibilityPassword() {
    isPassword2 = !isPassword2;

    emit(VisibilityState());
  }
  void visibilityPassword3() {
    isPassword3 = !isPassword3;

    emit(VisibilityState());
  }

  void visibilityPassword2() {
    isPassword2 = !isPassword2;

    emit(VisibilityState2());
  }
  Map<int,bool>favourite ={};
  late LoginModel loginModel;
  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, query:
    {
      "email": email,
      "password": password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel.message);
      emit(LoginSuccessState());
      print(value);
    }).catchError((onError) {
      emit(LoginErrorState());
    });
  }
String ?tokenbloc;
  late LogoutModel logoutModel;
  void logout({
    required String? token,
  }) {
    emit(LogoutLoadingState());
    DioHelper.postData(
            url: LOGOUT, token: CacheHelper.getDataString(key: 'token'))
        .then((value) {
      logoutModel = LogoutModel.fromJson(value.data);

      print(value);
      emit(LogoutSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(LogoutErrorState());
    });
  }

  late RegisterModel registerModel;
  void register({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: "register",
      query: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(value);
      emit(RegisterSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(RegisterErrorState());
    });
  }
  late BannersModel bannersModel;
  void getBanners() {
    emit(LoginLoadingState());
    DioHelper.getData(url: "banners", query: {}).then((value) {
      bannersModel = BannersModel.fromJson(value.data);
      print(bannersModel.message);
      emit(GetBannerSuccessState());
      print(value);
    }).catchError((onError) {
      emit(GetBannerErrorState());
    });
  }
    late HomeModel homeModel;

   bool GetHomeData = false;
  void getHomeData() {

    DioHelper.getData(url: "home" ,
    token: CacheHelper.getDataString(key: 'token')).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(CacheHelper.getDataString(key: 'token'));
     print(homeModel.data.products[0].inFavorites);
      print(homeModel.data.products[0].id);
      homeModel.data.products.forEach((element) { 
        favourite.addAll(
            {
              element.id:element.inFavorites
            });
      });

      emit(GetHomeDataSuccessState());
      GetHomeData = true;
      print(value);
    }).catchError((onError) {
      print(onError);
      emit(GetHomeDataErrorState());
    });
  }
  late DeleteOrAddFavourite deleteOrAddF;
  void deleteOrAddFavourite({
         required int id ,

  }) {
    print(id);


    favourite[id] =!favourite[id]!;

    DioHelper.postData(
      url: "favorites",
      query: {
        "product_id" : id,

      },token: CacheHelper.getDataString(key: 'token')
    ).then((value) {



      deleteOrAddF = DeleteOrAddFavourite.fromJson(value.data);
      if(!deleteOrAddF.status){
        favourite[id] =!favourite[id]!;
      }else{
        getFavouriteData();
      }
      print(value);

      emit(GetFavouriteDataSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(GetFavouriteDataErrorState());
    });
  }
  late Categories categories ;
  void getCategories() {

    DioHelper.getData(url: "categories" ,
      ).then((value) {
      categories = Categories.fromJson(value.data);
      emit(GetCategoriesDataSuccessState());
      print(value);
    }).catchError((onError) {
      print(onError);
      emit(GetCategoriesDataErrorState());
    });
  }
  late Favourite favouriteData ;
  void getFavouriteData() {
    emit(GetFavouriteDataSLoadingState());
    DioHelper.getData(url: "favorites" ,
      token:  CacheHelper.getDataString(key: 'token')
    ).then((value) {
      favouriteData = Favourite.fromJson(value.data);
      emit(GetFavourite2DataSuccessState());
      print(value);
    }).catchError((onError) {
      print(onError);
      emit(GetFavourite2DataErrorState());
    });
  }
  void deleteOrAddFavourite2({
    required int id ,

  }) {
    print(id);




    DioHelper.postData(
        url: "favorites",
        query: {
          "product_id" : id,

        },token: CacheHelper.getDataString(key: 'token')
    ).then((value) {



      deleteOrAddF = DeleteOrAddFavourite.fromJson(value.data);
      if(deleteOrAddF.status){
        getFavouriteData();
      }
      print(value);

      emit(GetFavouriteDataSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(GetFavouriteDataErrorState());
    });
  }
}
