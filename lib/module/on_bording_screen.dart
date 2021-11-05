import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp111/layout/home.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';
import 'package:shopapp111/shared/shared_prefrance.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
List<String> image =[
  'images/vector-payment-icon.jpg',
  'images/2.jpg',
  'images/3.jpg'
];
bool onBordingEnd = false;

bool last = false;

var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
             TextButton(onPressed: (){

                 setState(() {
                   onBordingEnd = true;
                   CacheHelper.saveData(value: onBordingEnd, key: 'onbording',
                   ) ;

                 });

                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => HomeScreen()),
                 );



        }, child: const Text(
        "Skip"
        )),
        ],
        ),
        body: Column(
        children: [
        Expanded(
        child: PageView.builder(itemBuilder:(context, index) {
        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(image[index]),
        const Text("Fuck world"),
        ],
        ),
        );

        },itemCount: 3,physics: const BouncingScrollPhysics(
      ),controller: boardController,
                  onPageChanged: (index){
                    if(index == image.length-1){
                      setState(() {
                        last = true;
                      });
                    }
                    else{
                      setState(() {
                        last  =false;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count:  image.length,
                      axisDirection: Axis.horizontal,
                      effect:  const SlideEffect(
                          spacing:  8.0,
                          radius:  4.0,
                          dotWidth:  24.0,
                          dotHeight:  16.0,
                          paintStyle:  PaintingStyle.stroke,
                          strokeWidth:  1.5,
                          dotColor:  Colors.grey,
                          activeDotColor:  Colors.indigo
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(onPressed: (){
                      boardController.nextPage(duration:const Duration(
                        milliseconds: 750,
                      ) , curve: Curves.fastLinearToSlowEaseIn);
                      if(last){
                        setState(() {
                          onBordingEnd = true;
                          CacheHelper.saveData(value: onBordingEnd, key: 'onbording',
                          );
                          print(onBordingEnd);
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  HomeScreen()),
                        );
                      }else{
                        setState(() {
                          onBordingEnd =false;
                        });
                      }

                    },
                      child: const Icon(
                        Icons.arrow_forward,
                      ),
                    )
                  ],
                ),
              )

            ],
          ),


        );
      },
    );
  }
}
