import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shopapp111/Constant/constants.dart';
import 'package:shopapp111/Constant/validate.dart';
import 'package:shopapp111/shared/bloc/appstates.dart';
import 'package:shopapp111/shared/bloc/bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
String dropdownValue = 'Male';
class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var confirmPassController = TextEditingController();

  var phoneController = TextEditingController();

  var nameController = TextEditingController();

  String initialCountry = 'EG';

  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(

            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),

                reverse: false,
                child: Form(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Register",
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
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "you must enter name";
                          }
                        },
                        iconData: Icons.perm_identity_outlined,
                        changeIcons: false,
                        lapel: "Name",
                        displaySuffixIcon: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextFormField(
                        controller: emailController,
                        validator: EmailValidator(
                            errorText: 'enter a valid email address'),
                        iconData: Icons.email,
                        changeIcons: false,
                        lapel: "email",
                        displaySuffixIcon: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.always,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: number,
                        textFieldController: phoneController,
                        formatInput: false,
                        keyboardType:
                        const TextInputType.numberWithOptions(signed: true, decimal: true),
                        inputBorder: OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      buildTextFormField(
                          lapel: "password",
                          changeIcons: cubit.isPassword,
                          iconData: Icons.lock,
                          controller: passController,
                          validator: passwordValidator,
                          displaySuffixIcon: true,
                          obscureText: cubit.isPassword,
                          changeIcon: (){
                            cubit.visibilityPassword();
                          }
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextFormField(
                          lapel: "confirm password",
                          changeIcons: cubit.isPassword2,
                          iconData: Icons.lock,
                          controller: confirmPassController,
                          validator: (val){
                            if(val!.isEmpty) {
                              return 'Empty';
                            }
                            if(val != passController.text) {
                              return 'Not Match';
                            }
                            return null;
                          },
                          displaySuffixIcon: true,
                          obscureText: cubit.isPassword2,
                      changeIcon: (){
                        cubit.visibilityPassword2();
                      }
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Gender" , style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          menuMaxHeight: 100,

                          style: const TextStyle(color: Colors.black , fontSize: 20),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              print(dropdownValue);
                            });
                          },
                          items: <String>['Male', 'Female']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )

                    ],
                  )
                    ,
                      MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print("خف عظمة ");
                            }
                          },
                          height: 50,
                          elevation: 10,
                          color: Colors.blueAccent,
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))
                    ],
                  ),
                  key: formKey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
