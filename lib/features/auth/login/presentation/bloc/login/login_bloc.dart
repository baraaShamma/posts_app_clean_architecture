import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/entities/login.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:posts_app_clean_architecture/resources/error/failures.dart';
import 'package:posts_app_clean_architecture/resources/strings/failure.dart';
import 'package:posts_app_clean_architecture/resources/strings/messages.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is ClickButtonLoginEvent) {
        emit(LoadingLoginState());

        final failureOrDone = await loginUseCase(event.login);
        emit(
          _eitherDoneMessageOrErrorState(failureOrDone),
        );
      }
    });
  }

  LoginState _eitherDoneMessageOrErrorState(Either<Failure, Unit> either) {
    return either.fold(
      (failure) => ErrorLoginState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => const SuccessLoginState(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case WrongDataFailure:
        return Error_FAILURE_MESSAGE;
      default:
        return "Unexpected Error,Please try again later .";
    }
  }
}
