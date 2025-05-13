import 'package:chatapp/constans.dart';
import 'package:chatapp/cubit/auth/cubit/auth_cubit_cubit.dart';
import 'package:chatapp/helper/show_snak_bar.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/widgets/custom_Text_field.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'registerpage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(),
      child: BlocConsumer<AuthCubitCubit, AuthCubitState>(
        listener: (context, state) {
          if (state is AuthCubitSuccess) {
            showSnakbar(context, 'Account created successfully');
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
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        'assets/images/scholar.png',
                        height: 100,
                      ),
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
                      const SizedBox(
                        height: 50,
                      ),
                      const Row(
                        children: [
                          Text(
                            'REGISTER',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            if (email != null && password != null) {
                              BlocProvider.of<AuthCubitCubit>(
                                context,
                              ).signUp(email!, password!);
                            } else {
                              showSnakbar(
                                context,
                                'Please enter email and password',
                              );
                            }
                          }
                        },
                        text: 'REGISTER',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'already have an account? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
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
