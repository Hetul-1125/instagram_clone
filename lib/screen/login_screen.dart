import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resourses/authentication.dart';
import 'package:instagram_clone/screen/signin_screen.dart';
import 'package:instagram_clone/utils/image_utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

import 'homeScreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading=false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }
  void loginUser()async{

    setState(() {
      _isLoading=true;
    });
    String res=await AuthMethod().loginMethod(email: _emailController.text, password: _passwordController.text);
    setState(() {
      _isLoading=false;
    });
    if(res!='success')
    {
      showSnakbar(res, context);
      
    }else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homescreen()));
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Image.asset(
              "assets/instagram.jpeg",
              height: 50,
            ),
            const SizedBox(height: 64,),
            textFieldInput(
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
                hintext: "Enter your email"),
            const SizedBox(height: 24,),
            textFieldInput(
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
                hintext: "Enter your password"),
            const SizedBox(height: 24,),
            InkWell(
              onTap:(){
                if(_emailController.text.isEmpty){
                  showSnakbar("Enter the email address", context);
                }
                else if(_passwordController.text.isEmpty){
                  showSnakbar("Enter the password", context);
                }
                else{
                  loginUser();

                }


              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: ShapeDecoration(
                    color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )
                ),
                child: _isLoading?CircularProgressIndicator(color: Colors.white,):const Text("Log in"),
              ),
            ),
            const SizedBox(height: 24,),
            Flexible(flex: 1,child: Container(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:const  EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Don't have an account?"),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>signInScreen()));
                  },
                  child: Container(
                    padding:const  EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    ));
  }
}
