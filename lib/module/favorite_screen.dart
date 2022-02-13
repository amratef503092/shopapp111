import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getFavouriteData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return (state is GetFavourite2DataSuccessState)
              ? SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        cubit.favouriteData.data!.data!.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 120,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(
                                  cubit.favouriteData.data!.data![index]
                                      .product!.image
                                      .toString(),
                                ),
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        cubit.favouriteData.data!.data![index]
                                            .product!.name
                                            .toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            cubit.favouriteData.data!
                                                .data![index].product!.price
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {

                                                print(  cubit.favouriteData.data!
                                                    .data![index].product!.id);
                                                cubit.deleteOrAddFavourite2(
                                                    id:  cubit.favouriteData.data!.data![index].product!.id);


                                              },
                                              icon: const Icon(Icons.favorite))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
