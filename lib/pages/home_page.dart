import 'package:flutter/material.dart';
import 'package:shopping_list_application/pages/recipe_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
              child: SafeArea(
            child: Column(children: [
              ListTile(
                title: const Text("Shopping Lists"),
                onTap: () {
                  // TODO Implement Shopping List screen
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //         builder: (context) => RecipeHomePage()));
                },
              ),
              ListTile(
                title: const Text("Recipes"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => RecipeHomePage()));
                },
              ),
              ListTile(
                title: const Text("Ingredients"),
                onTap: () {
                  // TODO Implement Ingredients Screen
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //         builder: (context) => RecipeHomePage()));
                },
              )
            ]),
          )),
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecipeHomePage())),
              child: const Text("Recipes")),
          // ElevatedButton(
          //     onPressed: () => Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => ShoppingListsHomePage())),
          //     child: const Text("Recipes"))
        ],
      ),
    );
  }
}
