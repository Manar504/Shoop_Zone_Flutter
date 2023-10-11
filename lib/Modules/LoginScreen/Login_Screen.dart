import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_zone/Modules/LoginScreen/LoginCubit/cubit.dart';
import 'package:shop_zone/Modules/LoginScreen/LoginCubit/states.dart';
import 'package:shop_zone/Shared/Componenets/Componentes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 70,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Login and see our hot Offers now !!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                          emailcontroller: emailcontroller,
                          label: 'Email address',
                          prefixIcon: Icons.email_rounded,
                          keyboardtype: TextInputType.emailAddress,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                          emailcontroller: passwordcontroller,
                          label: 'password',
                          prefixIcon: Icons.security_rounded,
                          keyboardtype: TextInputType.visiblePassword,
                          isPassword: LoginCubit.get(context).isPasswordShown,
                          suffixIcon: LoginCubit.get(context).isPasswordShown
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixfunction: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            elevation: 0.0,
                            onPressed: (){
                              LoginCubit.get(context).userLogin(emailcontroller.text, passwordcontroller.text);

                            },
                            child: Text('Login'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('don\'t have an account?'),
                            TextButton(onPressed: () {}, child: Text('SignUp')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
