// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/navigation_helper.dart';
import 'package:reddit_clone/core/utils.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';

import 'package:reddit_clone/features/community/dal/community_dal.dart';
import 'package:reddit_clone/models/community_model.dart';

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  final communityDAL = ref.watch(communityDALProvider);
  return CommunityController(communityDAL, ref);
});

class CommunityController extends StateNotifier<bool> {
  final CommunityDAL _communityDAL;
  final Ref _ref;

  CommunityController(this._communityDAL, this._ref) : super(false);

  void createCommunity(final String name, final BuildContext context) async {
    final uid = _ref.read(userProvider)?.uid ?? '';

    state = true;
    final response = await _communityDAL.createCommunity(
      CommunityModel.asDefault(name, uid),
    );
    state = false;

    return response.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Community created successfully');
      NavigationHelper.back(context);
    });
  }
}
