import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());

  Future<void> signUp(String email, String password) async {
    emit(AuthCubitLoading());

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(AuthCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthCubitError('The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthCubitError('The account already exists for that email.'));
      } else {
        emit(AuthCubitError(e.message ?? 'An error occurred during sign up'));
      }
    } catch (ex) {
      emit(AuthCubitError('There was an error during sign up'));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthCubitLoading());

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthCubitError('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthCubitError('Wrong password provided for that user.'));
      } else {
        emit(AuthCubitError(e.message ?? 'An error occurred during login'));
      }
    } catch (ex) {
      emit(AuthCubitError('There was an error during login'));
    }
  }
}
