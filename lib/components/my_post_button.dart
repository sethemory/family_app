import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final void Function()? onTap;

  const PostButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(Icons.send),
        ),
      ),
    );
  }
}
