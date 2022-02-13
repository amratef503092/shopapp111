
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';
import 'package:shopapp111/shared/bloc/bloc_ob_server.dart';
import 'package:shopapp111/shared/remote/api.dart';
import 'package:shopapp111/shared/shared_prefrance.dart';

import 'layout/home.dart';
import 'module/login_screen.dart';
import 'module/on_bording_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();
  late  Widget screen;
bool? z= CacheHelper.getBoolean(key: 'onbording') ;
print(z);
  String? token = CacheHelper.getDataString(key: 'token');
  print(token);
  if(z!=null){
    if(token!=null) {
      screen = const HomeScreen();
    }else{
      screen = LoginScreen();
    }
  }else{
    screen = OnBoardingScreen();
  }


  runApp(MyApp(screen: screen,));
}

class MyApp extends StatelessWidget {
    MyApp({ required  this.screen});
   Widget screen;



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (_)=>AppCubit())
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {

        },builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: screen,
          );
        },
      )
    );
  }
}

