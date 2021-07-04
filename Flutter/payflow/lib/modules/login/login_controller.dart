import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../shared/auth/auth_controller.dart';
import '../../shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(
          context,
          UserModel(
              name: response!.displayName!, photoURL: response.photoUrl!));
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
