import 'package:flutter/material.dart';
import 'package:shopping_list_application/controllers/recipe_controller.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/add_recipe.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/view_recipe.dart';

class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({super.key});

  @override
  State<RecipeHomePage> createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  final Stream<List<Recipe>> _stream = RecipeController().getStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Recipe>>(
        stream: _stream,
        builder: ((context, snapshot) {
          final recipes = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Recipes"),
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                Expanded(
                    child: snapshot.hasData
                        ? ListView.separated(
                            padding: const EdgeInsets.all(10.0),
                            itemBuilder: (_, index) =>
                                _toWidget(recipes[index]),
                            separatorBuilder: (_, __) => const Divider(color: Colors.transparent,),
                            itemCount: recipes.length,
                          )
                        : const Center(
                            child: Text("No results"),
                          )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.secondary),
                            fixedSize: MaterialStateProperty.all(Size.fromWidth(
                                MediaQuery.of(context).size.width))),
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddRecipePage()));
                        },
                        child: const Text("Add Recipe",
                            style: TextStyle(color: Colors.white))))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.set_meal), label: "Meal Planning")
              ],
              onTap: (value) {
                if (value == 0) {
                  Navigator.of(context).pop();
                }
              },
            ),
          );
        }));
  }

  Widget _toWidget(Recipe recipe) {
    print(recipe.cookTime);
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      tileColor: Colors.white,
      title: Text(recipe.name),
      trailing: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Prep Time: ${recipe.prepTime}\nCook Time: ${recipe.cookTime}"),
          ],
        )),
      ),
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewRecipePage(recipe: recipe)))
      },
    );
  }
}
