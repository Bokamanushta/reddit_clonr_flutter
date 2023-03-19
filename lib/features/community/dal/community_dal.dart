// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/constants/firebase_constants.dart';
import 'package:reddit_clone/core/failure.dart';
import 'package:reddit_clone/core/providers/firebase_providers.dart';
import 'package:reddit_clone/core/type_def.dart';
import 'package:reddit_clone/models/community_model.dart';

final communityDALProvider = Provider((ref) {
  return CommunityDAL(ref.watch(firestoreProvider));
});

class CommunityDAL {
  final FirebaseFirestore _firestore;
  CommunityDAL(this._firestore);

  FutureVoid createCommunity(final CommunityModel model) async {
    try {
      var communityDoc = await _communities.doc(model.name).get();

      if (communityDoc.exists) {
        throw 'Community with the same name already exists';
      }

      return right(_communities.doc(model.name).set(model.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  CollectionReference get _communities =>
      _firestore.collection(FirebaseConstants.communitiesCollection);
}
