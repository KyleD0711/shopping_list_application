import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shopping_list_application/controllers/ingredient_controller.dart';
import 'package:shopping_list_application/controllers/recipe_controller.dart';
import 'package:shopping_list_application/models/ingredient.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:shopping_list_application/utils/form_validators.dart';

class ViewRecipePage extends StatelessWidget {
  const ViewRecipePage({super.key, required this.recipe});

  final Recipe recipe;
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
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
            BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel")
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.of(context).pop();
            }
          },
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(children: [
                Text("Description"),
                Divider(height: 15.0, color: Colors.black),
                Text(recipe.description == ""
                    ? "Etiam nunc justo, gravida et augue eu, feugiat finibus lectus. Aliquam aliquam scelerisque efficitur"
                    : recipe.description)
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(children: [
                Text("Ingredients"),
                Divider(height: 15.0, color: Colors.black),
                SizedBox(
                  child: ListView.separated(
                      itemBuilder: (_, index) => _toWidget(
                          recipe.ingredients.keys.elementAt(index),
                          recipe.ingredients.values.elementAt(index)),
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: recipe.ingredients.length),
                )
              ]),
            )
          ],
        ));
  }

  Widget _toWidget(Ingredient ingredient, String quantity) {
    return Text("${ingredient.name}: $quantity");
  }
}
