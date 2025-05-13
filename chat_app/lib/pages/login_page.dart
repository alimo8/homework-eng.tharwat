import 'package:chatapp/constans.dart';
import 'package:chatapp/cubit/auth/cubit/auth_cubit_cubit.dart';
import 'package:chatapp/helper/show_snak_bar.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:chatapp/widgets/custom_Text_field.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'loginpage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(),
      child: BlocConsumer<AuthCubitCubit, AuthCubitState>(
        listener: (context, state) {
          if (state is AuthCubitSuccess) {
            showSnakbar(context, 'Login successful');
            Navigator.pushReplacementNamed(context, ChatPage.id,
                arguments: email);
          } else if (state is AuthCubitError) {
            showSnakbar(context, state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: kPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      Image.asset('assets/images/scholar.png', height: 100),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WhatsApp Chat',
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'pacifico',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Row(
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomFormTextField(
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            if (email != null && password != null) {
                              BlocProvider.of<AuthCubitCubit>(
                                context,
                              ).login(email!, password!);
                            } else {
                              showSnakbar(
                                context,
                                'Please enter email and password',
                              );
                            }
                          }
                        },
                        text: 'LOGIN',
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Color(0xffC7EDE6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
