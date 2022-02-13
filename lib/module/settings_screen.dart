import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shopapp111/Constant/constants.dart';
import 'package:shopapp111/Constant/validate.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';
import 'package:shopapp111/shared/shared_prefrance.dart';

import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is GetHomeDataSuccessState){

        }
      },
      builder: (context, state) {

     var cubit = AppCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              child: Column(
                children: [
                  buildTextFormField(
                      lapel: 'email',
                      changeIcons: false,
                      controller: emailController,
                      iconData: Icons.alternate_email_sharp,
                      validator: EmailValidator(
                          errorText: 'enter a valid email address'),
                      changeIcon: () {},
                      displaySuffixIcon: false,
                      obscureText: false),
                  const SizedBox(
                    height: 20,
                  ),
                  buildTextFormField(
                      lapel: "name",
                      changeIcons: false,
                      iconData: Icons.lock,
                      controller: nameController,
                      validator: passwordValidator,

                      obscureText:false,
                      changeIcon: () {

                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  buildTextFormField(
                      lapel: 'phone',
                      changeIcons: true,
                      controller: phoneController,
                      iconData: Icons.phone,
                      validator: EmailValidator(
                          errorText: 'enter a valid phone address'),
                      changeIcon: () {},
                      displaySuffixIcon: false,
                      obscureText: false),
                  SizedBox(height: 20,),
                  MaterialButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      AppCubit.get(context).logout(token: token);
                      CacheHelper.sharedPreferences!.remove("token");
                      print(token);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                    }

                  },height: 50,elevation: 10,color: Colors.blueAccent,child: const Text(
                    "SigOut",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )),
                  SizedBox(height: 20,),
                ],
              )) ,
        );
      },
    );
  }
}
