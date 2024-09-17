import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  final String title;
  final String subTitle;

  const MyPost({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
