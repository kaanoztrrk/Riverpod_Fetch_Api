// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final bool? isLoading;
  final Widget child;

  const CircularLoading({
    Key? key,
    this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading == null
        ? Center(
            child: CircularProgressIndicator(color: Colors.purple.shade200))
        : isLoading == false
            ? const Center(
                child: Text("Something is wrong..."),
              )
            : child;
  }
}
