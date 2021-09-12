import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var emailController=TextEditingController();

var passwordController=TextEditingController();

var formKey =GlobalKey<FormState>();

bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child:SingleChildScrollView(
              child: Column(
                children:
                [
                 Text(
                     'login',
                   style: TextStyle(
                     fontSize:40.00,
                     fontWeight: FontWeight.bold,
                     color: Colors.red,
                   ),
                 ),
                  SizedBox(
                    height:40.00,
                  ),
                 defaultFormField(controller: emailController, type:TextInputType.emailAddress , validate:(value){
            if(value.isEmpty)
            {
            return'email must not be empty';
            }
            return null;
            }, label: 'email', prefix:Icons.email),
                  SizedBox(
                    height:10.00,
                  ),
              defaultFormField(controller: passwordController, type:TextInputType.visiblePassword , validate:(value){
                if(value.isEmpty)
                {
                  return'password must not be empty';
                }
                return null;
              }, label: 'email', prefix:Icons.lock,
                  isPassword:isPassword,
                  suffix: isPassword?Icons.visibility:Icons.visibility_off,
                suffixpressed:()
                {
                    setState(()
                    {
                      isPassword=! isPassword;
                    });
                }
              ),
                  SizedBox(
                    height:20.00,
                  ),
                  SizedBox(
                    height:15.00,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                         Text(
                             'Don\'t have an account?',
                           style: TextStyle(
                             fontSize:20.00,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                          TextButton(onPressed: (){}, child:
                          Text
                            (
                            'Register Now',
                            style: TextStyle(
                             fontSize:20.00,

                            ),
                          ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
