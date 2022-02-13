import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/Constant/constants.dart';
import 'package:shopapp111/models/home_model.dart';
import 'package:shopapp111/models/home_model.dart';
import 'package:shopapp111/models/home_model.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';

class HomePage extends StatelessWidget {
  @override
  bool change = false;
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHomeData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return (cubit.GetHomeData)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      buildCarouselSlider(cubit),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const Divider(color: Colors.black),
                      Container(
                          color: Colors.grey[300],
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                            children: List.generate(
                                cubit.homeModel.data.products.length, (index) {
                              return Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(cubit.homeModel.data
                                          .products[index].image),
                                      height: 200,
                                      width: double.infinity,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              cubit.homeModel.data
                                                  .products[index].name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              cubit.homeModel.data
                                                  .products[index].oldPrice
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              cubit.homeModel.data
                                                  .products[index].price
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                 ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(onPressed: (){

                                          cubit.deleteOrAddFavourite(id: cubit.homeModel.data
                                              .products[index].id);


                                          },
                                              icon:( cubit.favourite[cubit.homeModel.data
                                                  .products[index].id]!)? Icon(Icons.favorite) : const Icon(Icons.favorite_outline))

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            }),
                          )),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  CarouselSlider buildCarouselSlider(AppCubit cubit) {
    return CarouselSlider(
        items: cubit.homeModel.data.banners
            .map((e) => Image.network(
                  e.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 2.0,
          initialPage: 1,
        ));
  }
}
