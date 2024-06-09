import 'package:flutter/material.dart';
import 'package:shopping_list_application/router/RouterErrorPage.dart';

class PageRouter extends StatelessWidget {
  int destinationIndex;
  List<Widget> destinations;

  PageRouter(
      {super.key, required this.destinationIndex, required this.destinations});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => destinations.isEmpty
            ? RouterErrorPage(errorMessage: "No routes provided")
            : destinations[destinationIndex]);
  }
}
