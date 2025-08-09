import 'package:clinic_doctor_interview/core/constants/constants.dart';
import 'package:clinic_doctor_interview/core/errors/server_exception.dart';
import 'package:clinic_doctor_interview/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class Authsuperbase {
  Future<void> signupwithemailotp(String email);
  Future<UserModel> getcurrentuser();
}

class Authsuperbaseimpl implements Authsuperbase {
  final SupabaseClient supabaseClient;

  Authsuperbaseimpl(this.supabaseClient);
  @override
  Future<void> signupwithemailotp(String email) async {
    try {
      await supabaseClient.auth.signInWithOtp(
        email: email,
        emailRedirectTo: kEmailRedirect,
      );

      print("cameee");
    } catch (e) {
      throw SeverException(e.toString());
    }
  }

  @override
  Future<UserModel> getcurrentuser() async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) {
        throw SeverException("No user is currently logged in.");
      }
      print("cameee");

      return UserModel(email: user.email!, id: user.id);
    } catch (e) {
      throw SeverException("Failed to get current user: ${e.toString()}");
    }
  }
}
