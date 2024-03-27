import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:shopping_list_application/services/recipe_service.dart';

class ViewRecipePage extends StatelessWidget {
  const ViewRecipePage({super.key, required this.recipe});

  final Recipe recipe;

  static const cardPadding = EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(recipe.name),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
            BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Delete")
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.of(context).pop();
            }
            else if (value == 1){
              RecipeService().removeRecipe(recipe);              
              Navigator.of(context).pop();
            }
          },
        ),
        body: Column(
          children: [
            Padding(
              padding: cardPadding,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Descrption",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(height: 15.0, color: Colors.black),
                    Text(
                      recipe.description,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: cardPadding,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Text("Ingredients", style: TextStyle(fontSize: 16)),
                      ),
                      const Divider(height: 15.0, color: Colors.black),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) =>
                              _toIngredientWidget(recipe.ingredients[index]),
                          separatorBuilder: (_, __) => const Divider(
                            color: Colors.transparent,
                          ),
                          itemCount: recipe.ingredients.length,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: cardPadding,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Instructions", style: TextStyle(fontSize: 16)),
                      ),
                      const Divider(height: 15.0, color: Colors.black),
                      Text(recipe.instructions, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12),)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: cardPadding,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Recipes", style: TextStyle(fontSize: 16)),
                      ),
                      const Divider(height: 15.0, color: Colors.black),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(10.0),
                          itemBuilder: (_, index) =>
                              _toRecipeWidget(recipe.recipes[index]),
                          separatorBuilder: (_, __) => const Divider(),
                          itemCount: recipe.recipes.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _toIngredientWidget(Map<String, String> ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text("${ingredient['name']}: ${ingredient['qty']}"),
    );
  }

  Widget _toRecipeWidget(Map<String, String> recipe) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${recipe['name']}: ${recipe['qty']}",
                style: const TextStyle(fontSize: 18),
              )),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Go To",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    );
  }
}
