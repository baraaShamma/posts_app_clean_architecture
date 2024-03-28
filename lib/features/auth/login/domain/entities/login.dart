import 'package:equatable/equatable.dart';

class Login extends Equatable {
    String email;
   String password;

   Login({required this.email, required this.password});

  @override
  List<Object?> get props => [email , password];
}
