import 'package:flutter/material.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  Widget child;
  HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    NavigationDestinationLabelBehavior labelBehavior =
        NavigationDestinationLabelBehavior.alwaysShow;

    Color primary = Theme.of(context).colorScheme.primary;

    Icon recipesIcon = const Icon(
      Icons.tab_outlined,
    );
    Icon mealPlanningIcon = const Icon(
      Icons.set_meal,
    );
    Icon shoppingListIcon = const Icon(
      Icons.list_alt,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(getPageTitle(pageIndex)),
        centerTitle: true,
        actions: const [ProfilePicture()],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: primary,
        indicatorColor: primary,
        selectedIndex: pageIndex,
        labelBehavior: labelBehavior,
        destinations: [
          NavigationDestination(icon: recipesIcon, label: "Recipes"),
          NavigationDestination(icon: mealPlanningIcon, label: "Meal Planning"),
          NavigationDestination(icon: shoppingListIcon, label: "Shopping Lists")
        ],
        onDestinationSelected: (selectedIndex) {
          setState(() {
            pageIndex = selectedIndex;
          });
          context.go(getSelectedRoute(selectedIndex));
        },
      ),
      body: widget.child,
    );
  }

  String getSelectedRoute(int selectedIndex) {
    switch (selectedIndex) {
      case 2:
        return "/shoppinglists";
      case 1:
        return "/mealplanning";
      default:
        return "/recipes";
    }
  }

  String getPageTitle(int selectedIndex) {
    List<String> titles = ["Recipes", "Meal Planning", "Shopping List"];
    return titles[selectedIndex];
  }
}
