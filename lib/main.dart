
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  if(z!){
    screen  = const LoginScreen();
  }else{
    screen = OnBoardingScreen();
  }


  runApp(MyApp(screen: screen,));
}

class MyApp extends StatelessWidget {
   // ignore: use_key_in_widget_constructors
    MyApp({ required  this.screen});
   Widget screen;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (BuildContext context) {
        return AppCubit();
      },
        child: screen ,

      ),
    );
  }
}

