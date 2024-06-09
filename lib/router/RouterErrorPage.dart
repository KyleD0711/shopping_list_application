import 'package:flutter/material.dart';

class RouterErrorPage extends StatelessWidget {
  String? errorMessage;

  RouterErrorPage({super.key, String? errorMessage}) {
    errorMessage = errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle errorStyle = TextStyle(color: Colors.red, fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Error: ${errorMessage ?? 'Something went wrong'}",
            style: errorStyle,
          )
        ],
      ),
    );
  }
}
