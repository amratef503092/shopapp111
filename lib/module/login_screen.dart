import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shopapp111/Constant/constants.dart';
import 'package:shopapp111/Constant/validate.dart';
import 'package:shopapp111/layout/home.dart';
import 'package:shopapp111/module/rigisterscreen.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp111/shared/shared_prefrance.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool changeIcons  = true;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(listener: (context, state) {
        if(state is LoginSuccessState){
          if(AppCubit.get(context).loginModel.status){
            token = AppCubit.get(context).loginModel.data.token;
            CacheHelper.saveData(key: 'token', value: AppCubit.get(context).loginModel.data.token);
            Fluttertoast.showToast(
                msg: AppCubit.get(context).loginModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );

          }else{
            Fluttertoast.showToast(
                msg: AppCubit.get(context).loginModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        }
        

      },builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const Text(
                    "welcome in Fucking social App",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextFormField(
                    controller: emailController, validator:  EmailValidator(errorText: 'enter a valid email address') ,
                    iconData: Icons.email,
                    changeIcons: false,
                    lapel: "email",
                    displaySuffixIcon: false,

                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  buildTextFormField(
                      lapel:"password",
                      changeIcons: cubit.isPassword2,
                      iconData: Icons.lock,
                      controller: passController,
                      validator: passwordValidator,
                      displaySuffixIcon: true,
                      obscureText: cubit.isPassword2,
                   changeIcon: (){
                     cubit.visibilityPassword2();
                   }
                      
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (state is!LoginLoadingState)  ?  MaterialButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      cubit.login(email: emailController.text, password: passController.text);
                      navigatorPush(context , HomeScreen());
                    }

                  },height: 50,elevation: 10,color: Colors.blueAccent,child: const Text(
                    "SigIn",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )) :  const Center(
                    child: CircularProgressIndicator(

                    ),
                  ) ,
                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                  mainAxisAlignment:MainAxisAlignment.center,children:  [
                    const Text(
                      "If you do not have Account ? ",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,

                    ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );                  }, child: const Text(
                      "Register here"

                    ))

                  ],)
                ],
              ),
              key: formKey,
            ),
          ),
        );
      },),
    );
  }
}
