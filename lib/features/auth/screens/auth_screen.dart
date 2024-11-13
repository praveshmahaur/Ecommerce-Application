import 'package:ecommerce_application/common/widgets/custom_button.dart';
import 'package:ecommerce_application/common/widgets/custum_textfield.dart';
import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:flutter/material.dart';

enum Auth{
  signIn,
  signUp
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.greyBackgroundColor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Welcome",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
            ListTile(
              tileColor: _auth == Auth.signUp ? GlobalColors.backgroundColor : GlobalColors.greyBackgroundColor,
              title: Text("Create Account", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),),
              leading: Radio(
                activeColor: GlobalColors.secondaryColor,
                value: Auth.signUp, 
                groupValue: _auth, 
                onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                }),
            ),
            if(_auth == Auth.signUp)
                Container(
                  padding: EdgeInsets.all(8.0),
                  color: GlobalColors.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(controller: _nameController, hintText: 'Name'),
                        const SizedBox(height: 10,),
                        CustomTextFormField(controller: _emailController, hintText: 'Email',),
                        const SizedBox(height: 10,),
                        CustomTextFormField(controller: _passwordController, hintText: 'Password'),
                        const SizedBox(height: 10,),
                        CustomButton(text: 'Sign Up', onTap: (){

                        })
                      ],
                    ),
                  ),
                ),
            ListTile(
              tileColor: _auth == Auth.signIn ? GlobalColors.backgroundColor : GlobalColors.greyBackgroundColor,
              title: Text("Sign-In", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),),
              leading: Radio(
                activeColor: GlobalColors.secondaryColor,
                value: Auth.signIn, 
                groupValue: _auth, 
                onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                }),
            ),
            if(_auth == Auth.signIn)
              Container(
                  padding: EdgeInsets.all(8.0),
                  color: GlobalColors.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(controller: _emailController, hintText: 'Email',),
                        const SizedBox(height: 10,),
                        CustomTextFormField(controller: _passwordController, hintText: 'Password'),
                        const SizedBox(height: 10,),
                        CustomButton(text: 'Sign In', onTap: (){

                        })
                      ],
                    ),
                  ),
                ),
          ],
        ),
      )),
    );
  }
}