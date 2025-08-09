import 'package:flutter/material.dart';

@immutable
sealed class AuthEvent {}

class Sentemailotpevent extends AuthEvent {
  final String email;
  Sentemailotpevent(this.email);
}

class Getcurrentuserevent extends AuthEvent {}
