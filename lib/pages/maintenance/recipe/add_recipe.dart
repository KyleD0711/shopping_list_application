import 'package:flutter/material.dart';
import 'package:shopping_list_application/controllers/recipe_controller.dart';
import 'package:shopping_list_application/models/ingredient.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:modals/modals.dart';
import 'package:shopping_list_application/controllers/ingredient_controller.dart';
import 'package:shopping_list_application/services/ingredient_service.dart';
import 'package:shopping_list_application/services/recipe_service.dart';
import 'package:shopping_list_application/widgets/SelectableListView.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _instructionsController = TextEditingController();

  final List<Map<String, String>> ingredients = List.empty(growable: true);
  final List<Map<String, String>> recipes = List.empty(growable: true);

  final Future<List<Ingredient>> existingIngredient =
      IngredientController().getIngredients();
  String instructions = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TextField(
            textAlign: TextAlign.center,
            controller: _nameController,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(hintText: "Recipe Name"),
          ),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
            BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel")
          ],
          onTap: (value) {
            if (value == 1) {
              Navigator.of(context).pop();
            } else if (value == 0) {}
          },
        ),
        body: Form(
          child: Column(
            children: [
              descriptionCard(),
              ingredientsCard(),
              instructionsCard(),
              recipesCard()
            ],
          ),
        ));
  }

  void _saveRecipe(
      List<Map<String, String>> ingredients,
      List<Map<String, String>> recipes,
      int prepTimeInMinutes,
      int cookTimeInMinutes,
      String name) {
    RecipeService().insertRecipe(
        ingredients, recipes, prepTimeInMinutes, cookTimeInMinutes, name);
  }

  Widget descriptionCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Descrption"),
              ),
              const Divider(height: 15.0, color: Colors.black),
              TextFormField(controller: _descriptionController)
            ],
          )),
    );
  }

  Widget instructionsCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Text(
                      "Instructions",
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              const Divider(
                height: 15,
                color: Colors.black,
              ),
              Text(instructions)
            ],
          ),
        ),
      ),
    );
  }

  Widget recipesCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Recipes", style: TextStyle(fontSize: 16))),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectableListView(
                                    itemStream: RecipeController().getStream(),
                                    screenName: "Select Recipes",
                                    selectedItems: recipes,
                                  )));
                          setState(() {});
                        },
                        icon: const Icon(Icons.add)),
                  )
                ],
              ),
              const Divider(height: 15.0, color: Colors.black),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (_, index) =>
                      _toIngredientWidget(recipes[index]),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: recipes.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ingredientsCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Ingredients",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {
                          // final List<Map<String, String>> selectedIngredients =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectableListView(
                                    itemStream:
                                        IngredientController().getStream(),
                                    screenName: "Select Ingredients",
                                    selectedItems: ingredients,
                                  )));
                          print(ingredients);
                          setState(() {});
                        },
                        icon: const Icon(Icons.add)),
                  )
                ],
              ),
              const Divider(height: 15.0, color: Colors.black),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) =>
                      _toIngredientWidget(ingredients[index]),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: ingredients.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _toIngredientWidget(Map<String, String> ingredient) {
    return Text("${ingredient['name']}: ${ingredient['qty']}");
  }

  Widget _toRecipeWidget(Recipe recipe) {
    return Row(
      children: [
        Text(recipe.name),
        ElevatedButton(onPressed: () {}, child: const Text("Go To"))
      ],
    );
  }
}
