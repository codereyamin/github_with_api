import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/repo_item_view_controller.dart';

class RepoItemViewView extends GetView<RepoItemViewController> {
  const RepoItemViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RepoItemViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RepoItemViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
