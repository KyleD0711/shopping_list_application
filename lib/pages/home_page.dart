import 'package:flutter/material.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/recipe_home_page.dart';
import 'package:shopping_list_application/pages/maintenance/shoppinglist/shopping_list_home.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/week_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.tab_outlined), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Meals"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Shopping Lists")
        ],
        onTap: (value){
          if (value == 0){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecipeHomePage()));
          }
          else if (value == 1){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WeekHomePage()));
          }
          else if (value == 2){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShoppingListHomePage()));
          }
        },
      ),
    );
  }
}
