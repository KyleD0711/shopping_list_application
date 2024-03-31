import 'package:flutter/material.dart';
import 'package:shopping_list_application/controllers/recipe_controller.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/add_recipe.dart';
import 'package:shopping_list_application/services/recipe_service.dart';

class ViewRecipePage extends StatefulWidget {
  ViewRecipePage({super.key, required this.recipe});

  Recipe recipe;

  static const cardPadding =
      EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0);

  @override
  State<ViewRecipePage> createState() => _ViewRecipePageState();
}

class _ViewRecipePageState extends State<ViewRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.recipe.name),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
            BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Delete")
          ],
          onTap: (value) async {
            if (value == 0) {
              await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddRecipePage(recipe: widget.recipe);
              }));
              Recipe? updatedRecipe = await RecipeController().getRecipe(widget.recipe.id);
              if (updatedRecipe != null){
                widget.recipe = updatedRecipe;
                setState((){});
              }
            } else if (value == 1) {
              RecipeService().removeRecipe(widget.recipe);
              Navigator.of(context).pop();
            }
          },
        ),
        body: Column(
          children: [
            descriptionWidget(),
            ingredientsWidget(),
            instructionsWidget(context),
            recipesWidget()
          ],
        ));
  }

  Widget descriptionWidget() {
    return Padding(
      padding: ViewRecipePage.cardPadding,
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
              widget.recipe.description,
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }

  Widget ingredientsWidget() {
    return Expanded(
      child: Padding(
        padding: ViewRecipePage.cardPadding,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Ingredients", style: TextStyle(fontSize: 16)),
              ),
              const Divider(height: 15.0, color: Colors.black),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) =>
                      _toIngredientWidget(widget.recipe.ingredients[index]),
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.transparent,
                  ),
                  itemCount: widget.recipe.ingredients.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget instructionsWidget(context) {
    return Expanded(
      child: Padding(
        padding: ViewRecipePage.cardPadding,
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Instructions'),
                    content: Text(widget.recipe.instructions),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                });
          },
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Instructions", style: TextStyle(fontSize: 16)),
                ),
                const Divider(height: 15.0, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.recipe.instructions,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 3,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Tap to expand"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recipesWidget() {
    return Expanded(
      child: Padding(
        padding: ViewRecipePage.cardPadding,
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
                      _toRecipeWidget(widget.recipe.recipes[index]),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: widget.recipe.recipes.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
