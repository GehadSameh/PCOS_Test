import 'package:flutter/material.dart';
import 'package:firebase_project/views/widgets/custom_text_form_field.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var emailcontroller=TextEditingController();

  var passwordcontroller=TextEditingController();

  var confirmpasswordcontroller=TextEditingController();
  var namecontroller=TextEditingController();

  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register screen'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 600),
        child: Form(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
                 SizedBox(height: 30),
              CustomTextFormField(controller: emailcontroller, hint: 'enter your email', iSscure: false,),
              SizedBox(height: 30),
              CustomTextFormField(controller: passwordcontroller, hint: 'enter your password',iSscure:true,),
              SizedBox(height: 30),
          
            
              
          
              ElevatedButton(onPressed: (){
                Navigator.of(
                  context).pushNamed('home');
              }, child: Text('Register',style: TextStyle(fontSize: 20,color: Colors.black),),
              ),
          
              SizedBox(height: 20,),
          
              
              
          
          
          
          
            ],
          
            
          ),
        ),
      ),
 




    );
  }
}