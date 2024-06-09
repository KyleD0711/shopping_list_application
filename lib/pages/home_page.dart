import 'package:flutter/material.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/recipe_home_page.dart';
import 'package:shopping_list_application/pages/maintenance/shoppinglist/shopping_list_home.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/week_home_page.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';
import 'package:shopping_list_application/router/PageRouter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> destinations = const [
      RecipeHomePage(),
      ShoppingListHomePage(),
      WeekHomePage()
    ];

    List<String> pageNames = ["Recipes", "Meal Planning", "Shopping Lists"];

    NavigationDestinationLabelBehavior labelBehavior =
        NavigationDestinationLabelBehavior.onlyShowSelected;

    Color primary = Theme.of(context).colorScheme.primary;
    Color tertiary = Theme.of(context).colorScheme.tertiary;

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
        title: Text(pageNames[pageIndex]),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
        },
      ),
      body: PageRouter(
        destinationIndex: pageIndex,
        destinations: destinations,
      ),
    );
  }
}
