import 'package:flutter/material.dart';

class RepoNameText extends StatelessWidget {
  const RepoNameText({super.key, required this.repoName});
  final String repoName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        repoName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          overflow: TextOverflow.ellipsis,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
