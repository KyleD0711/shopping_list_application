import 'package:flutter/material.dart';

class IsLoadingPage extends StatelessWidget {
  const IsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Loading Data"),
        CircularProgressIndicator(
          color: Colors.white,
        )
      ],
    );
  }
}
