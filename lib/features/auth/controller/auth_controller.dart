import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/dal/auth_dal.dart';

final authControllerProvider =
    Provider((ref) => AuthController(authDAL: ref.read(authDALProvider)));

class AuthController {
  final AuthDAL _authDAL;

  AuthController({required AuthDAL authDAL}) : _authDAL = authDAL;

  void googleSignIn() {
    _authDAL.signInWithGoogle();
  }
}
