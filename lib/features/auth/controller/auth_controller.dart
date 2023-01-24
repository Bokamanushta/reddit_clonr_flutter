import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/utils.dart';
import 'package:reddit_clone/features/auth/dal/auth_dal.dart';
import 'package:reddit_clone/models/user_model.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(authDAL: ref.watch(authDALProvider), ref: ref));

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthController extends StateNotifier<bool> {
  final AuthDAL _authDAL;
  final Ref _ref;

  AuthController({required AuthDAL authDAL, required Ref ref})
      : _authDAL = authDAL,
        _ref = ref,
        super(false);

  void googleSignIn(final BuildContext context) async {
    state = true;
    final user = await _authDAL.signInWithGoogle();
    state = false;
    user.fold(
        (failure) => showSnackBar(context, failure.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }
}
