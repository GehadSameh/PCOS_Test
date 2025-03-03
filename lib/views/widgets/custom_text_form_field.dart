import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {


  CustomTextFormField({super.key,required this.controller,required this.hint,required this.iSscure});

  TextEditingController controller;
  String hint;
  bool iSscure;
  
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
                
                hintText: hint,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
              
                
                
              ),
              obscureText: iSscure,);
        
  }
}