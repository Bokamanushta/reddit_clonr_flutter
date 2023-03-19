import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/navigation_helper.dart';

class CommunityDrawerWidget extends ConsumerWidget {
  const CommunityDrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Create a new community'),
              leading: const Icon(Icons.add),
              onTap: () => NavigationHelper.createCommunity(context),
            ),
          ],
        ),
      ),
    );
  }
}
