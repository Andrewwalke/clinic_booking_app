import 'dart:async';

import 'package:clinic_doctor_interview/core/usecases/Usecaseabstract.dart';
import 'package:clinic_doctor_interview/features/auth/domain/entity/user_entity.dart';
import 'package:clinic_doctor_interview/features/auth/domain/usecases/currentuser_usecase.dart';
import 'package:clinic_doctor_interview/features/auth/domain/usecases/signupwithemail.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Signupwithemail _usersignupusecase;
  final CurrentuserUsecase _currentuserUsecase;
  AuthBloc({
    required Signupwithemail signupwithemail,
    required CurrentuserUsecase currentuserusecase,
  }) : _usersignupusecase = signupwithemail,
       _currentuserUsecase = currentuserusecase,
       super(AuthInitial()) {
    on<Sentemailotpevent>(_sentemailotpevent);
    on<Getcurrentuserevent>(_getcurrentuser);
  }

  FutureOr<void> _sentemailotpevent(
    Sentemailotpevent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _usersignupusecase(
      Usersignupparams(email: event.email),
    );
    result.match(
      (failure) => emit(OtpsentFailure(failure.message)),
      (successMessage) => emit(Otpsentsuccess(successMessage)),
    );
  }

  FutureOr<void> _getcurrentuser(
    Getcurrentuserevent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _currentuserUsecase(Noparams());
    result.match(
      (failure) => emit(UnAuthenticated()),
      (user) => emit(Authenticated(user)),
    );
  }
}
