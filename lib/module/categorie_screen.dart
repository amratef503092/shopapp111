import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppCubit()..getCategories(),
      child: BlocConsumer<AppCubit,AppStates>( listener: (context, state) {

      },builder: (context, state) {
        var cubit = AppCubit.get(context);
        return  (state is GetCategoriesDataSuccessState )?
        SingleChildScrollView(

          child: Column(
            children:
              List.generate(cubit.categories.data!.data!.length,(index){

                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Image(image: NetworkImage(
                            cubit.categories.data!.data![index].image.toString(),
                          ),fit: BoxFit.cover,
                            width: 120,),
                          SizedBox(width: 20,),
                          Text(
                              cubit.categories.data!.data![index].name.toString(),
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  );


              }

              )



            ,
          ),
        ) : const Center(
          child: CircularProgressIndicator(),
        );
      }, ),
    );
  }
}
