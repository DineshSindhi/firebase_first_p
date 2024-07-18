import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first/notes_page.dart';
import 'package:firebase_first/on_board/sign_up.dart';
import 'package:flutter/material.dart';

import '../ui_helper.dart';

class LoginPage extends StatelessWidget {
  var emailController=TextEditingController();
  var passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'),centerTitle: true,backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Expense',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400)),
            mySizeBox(),
            myTextFiled(controllerName: emailController, label: 'Email',hint: 'Enter your Email',suffixText: '@gmail.com'),
            mySizeBox(),
            myTextFiled(controllerName: passController, label: 'Password',hint: 'Enter your Password',suffixIcon: Icon(Icons.visibility_off),obscureText: true),
            mySizeBox(),
            ElevatedButton(onPressed: () async {
              try{
                await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.toString(), password: passController.text.toString());
              }on FirebaseAuthException catch(e){
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              }, child: Text('Login')),
            mySizeBox(),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignPage(),));
            },
                child: Text('New User? Create Account now',style: TextStyle(fontSize: 22,color: Colors.purple.shade600),)),


          ],
        ),
      ),
    );
  }
}