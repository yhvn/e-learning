import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../base/shared_view/common_app_bar.dart';
import '../../base/shared_view/common_scaffold.dart';

@RoutePage()
class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        text: 'Inbox',
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        leadingIcon: LeadingIcon.none,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
