import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/Constant/constants.dart';
import 'package:shopapp111/module/login_screen.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';
import 'package:shopapp111/shared/shared_prefrance.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
   return  BlocProvider(
     create: (context)=>AppCubit(),
     child: BlocConsumer<AppCubit,AppStates>( listener: (context, state) {

     },builder: (context, state) {
       return Scaffold(
         appBar :   AppBar(
           leading: SizedBox(),
           centerTitle: true,
           title: const Text(
             'ShopApp',style: TextStyle(
             fontSize: 20,

           ),
           ),
           actions: [
             IconButton(onPressed: (){
               AppCubit.get(context).logout(token: token);
               CacheHelper.sharedPreferences!.remove("token");
               print(token);
               Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

             }, icon: const Icon(
               Icons.search, size: 25,
             )),

           ],
         ),

         body: AppCubit.get(context).screen[AppCubit.get(context).countBottomNavigationBar],
         bottomNavigationBar:   BottomNavigationBar(
           items: const [
             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
             BottomNavigationBarItem(
                 icon: Icon(Icons.category), label: "Category"),
             BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
             BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),


           ],
           currentIndex: AppCubit.get(context).countBottomNavigationBar,
           onTap: (index){
             AppCubit.get(context).changeBottomNavigationBar(index);
           },
           type: BottomNavigationBarType.fixed,

           backgroundColor: Colors.white,
           selectedItemColor: Colors.orangeAccent,
           unselectedItemColor: Colors.grey,


         ),

       );
     }, ),
   );
  }
}