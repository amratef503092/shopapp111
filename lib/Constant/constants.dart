import 'package:flutter/material.dart';

String  token = "" ;
void navigatorPush(ctx , Widget screen){
  Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => screen
  ));

}
TextFormField buildTextFormField({
  required controller,
  required  FormFieldValidator <String>validator,
  required String lapel,
  required IconData iconData,
  required bool changeIcons,
  Function ?changeIcon,
  bool obscureText = false,
   bool displaySuffixIcon = false,
}) {
  return TextFormField(

      controller: controller,

      obscureText: obscureText,
      validator: validator,

      decoration: InputDecoration(
        label:  Text(
          lapel,
        ),
          suffixIcon:  (displaySuffixIcon)  ? IconButton(
            icon: (changeIcons)?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
            onPressed: () {
            changeIcon!();
          },
          ) : SizedBox()  ,
        prefixIcon:  Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ));
}
enum gender  {
 male , female
}

