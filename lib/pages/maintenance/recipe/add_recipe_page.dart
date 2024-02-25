import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shopping_list_application/controllers/recipe_controller.dart';
import 'package:shopping_list_application/models/ingredient.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:shopping_list_application/utils/form_validators.dart';

class AddRecipePage extends StatefulWidget {
  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  static final _recipeStream = RecipeController().getStream();
  // static final _ingredientStream = IngredientController().getStream();

  // All data required to insert a recipe
  List<Recipe> _selectedRecipes = List<Recipe>.empty();
  List<Ingredient> _selectedIngredients = List<Ingredient>.empty();
  final _nameController = TextEditingController();
  final _prepTimeController = TextEditingController();
  final _cookTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Recipe"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Recipe Name"),
              controller: _nameController,
              validator: (value) => validateNonEmptyMessage(value),
            ),
            StreamBuilder(
                stream: _recipeStream,
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("No results returned for recipes");
                  }

                  return MultiSelectDialogField<Recipe>(
                    items: snapshot.data!
                        .map((e) => MultiSelectItem<Recipe>(e, e.name))
                        .toList(),
                    onConfirm: (values) => _selectedRecipes = values,
                  );
                })),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: "Prep Time (Minutes)"),
              controller: _prepTimeController,
              validator: (value) =>
                  validateNonEmptyMessage(value) ?? validateInteger(value!),
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: "Cook Time (Minutes)"),
              controller: _cookTimeController,
              validator: (value) =>
                  validateNonEmptyMessage(value) ?? validateInteger(value!),
            ),
            ElevatedButton(
              child: const Text("Create"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // create the account and store the result
                  // If the result is null, navigate back a page
                  // Otherwise, show the error message on the screen using _errorMessage
                  await RecipeController().insertRecipe(
                      _selectedIngredients,
                      _selectedRecipes,
                      int.parse(_prepTimeController.text),
                      int.parse(_cookTimeController.text),
                      _nameController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ]),
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _prepTimeController.dispose();
    _cookTimeController.dispose();
    super.dispose();
  }
}
