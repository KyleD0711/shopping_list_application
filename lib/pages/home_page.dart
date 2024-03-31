import 'package:flutter/material.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/recipe_home_page.dart';
import 'package:shopping_list_application/services/recipe_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _recipeStream = RecipeService().getRecipes();
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
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Meals")
        ],
        onTap: (value){
          if (value == 0){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecipeHomePage()));
          }
        },
      ),
    );
  }
}
