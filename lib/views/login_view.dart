import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  final VoidCallback onclicksignin;
   const LoginView({super.key,required this.onclicksignin});
  


  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();

  Future login()async{
//instance
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text.trim(), password: passwordcontroller.text.trim());




  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('login'),
              SizedBox(height:20,),
              CustomTextFormField(controller:emailcontroller, hint: 'email', iSscure: false),
              SizedBox(height:20,),
              CustomTextFormField(controller:passwordcontroller, hint: 'password', iSscure: true),
              SizedBox(height: 20,)
              ,MaterialButton(onPressed: (){
                login();
              },
              child: Text('login')
              ,color: Colors.indigoAccent,
              minWidth: double.infinity,)
              
            ],
          ),
        ),
      ),
    );
  }
}