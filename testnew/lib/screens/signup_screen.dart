import 'package:chattest/cubit/auth/cubit/auth_cubit_cubit.dart';
import 'package:chattest/screens/chat_screen.dart';
import 'package:chattest/screens/login_screen.dart';
import 'package:chattest/widgets/custom_text_field.dart';
import 'package:chattest/widgets/snak_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static String id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final _confirmPasswordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  String? email, password;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _confirmPasswordController.dispose();
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(),

      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: false,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple.shade400,
                  Colors.blue.shade400,
                  Colors.pink.shade300,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Card(
                        elevation: 16,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.purple.shade50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.person_add_outlined,
                                    size: 48,
                                    color: Colors.purple.shade700,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Sign up to get started',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                CustomTextFormField(
                                  labelText: 'Full Name',
                                  hintText: 'Enter your full name',
                                  iconData: Icons.person_outline,
                                ),

                                const SizedBox(height: 16),
                                CustomTextFormField(
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  labelText: 'Email',
                                  hintText: 'Enter your email',
                                  iconData: Icons.email_outlined,
                                ),

                                const SizedBox(height: 16),
                                CustomTextFormField(
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  iconData: Icons.lock_outline,
                                  obscureText: true,
                                ),

                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
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
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple.shade600,
                                      foregroundColor: Colors.white,
                                      elevation: 4,
                                      shadowColor: Colors.purple.shade200,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.purple.shade600,
                                      ),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
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
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        //  BlocConsumer<AuthCubitCubit, AuthCubitState>(
        //   listener: (context, state) {
        //     if (state is AuthCubitSuccess) {
        //       showSnakbar(context, 'Account created successfully');
        //       Navigator.pushReplacementNamed(context, ChatScreen.id);
        //     } else if (state is AuthCubitError) {
        //       showSnakbar(context, state.message);
        //     }
        //   },
        //   builder: (context, state) {
        //     return
        //   },
        // ),
      ),
    );
  }
}
