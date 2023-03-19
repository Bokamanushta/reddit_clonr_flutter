import 'package:flutter/widgets.dart';
import 'package:routemaster/routemaster.dart';

class NavigationHelper {
  static void createCommunity(final BuildContext context) {
    Routemaster.of(context).push('/community_create');
  }

  static void back(final BuildContext context) {
    Routemaster.of(context).pop();
  }
}
