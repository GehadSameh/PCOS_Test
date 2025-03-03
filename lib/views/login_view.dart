import 'package:firebase_project/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
   LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailcontroller=TextEditingController();

  var passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: Text('Login screen'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 600),
              child: CustomTextFormField(controller: emailcontroller, hint: 'enter your email', iSscure: false,),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 600),
              child: CustomTextFormField(controller: passwordcontroller, hint: 'enter your password',iSscure:true,),
            ),
          
            SizedBox(height: 20),
            
        
            SizedBox(
              width: 300,
              height: 40,
            
              child: ElevatedButton(onPressed: (){
                Navigator.of(
                  context).pushNamed('home');
              }, child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.black),),),
            ),

            SizedBox(height: 20,),

            Container(
              
              width: 300
              ,
              child: TextButton(onPressed: (){
                Navigator.of(
                context).pushNamed('register');

              },child: Text("Don\'t have an account?"),))
        
        
        
        
          ],
        
          
        ),
      ),





    );
  }
}