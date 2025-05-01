import 'package:bloc/bloc.dart';
import 'package:grocery_app/models/sign_up_model.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  CheckSignUp(SignUpModel user) {
    if (user.fName.isEmpty ||
        user.lName.isEmpty ||
        user.email.isEmpty ||
        user.password.isEmpty) {}
  }
}
