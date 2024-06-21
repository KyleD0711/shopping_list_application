import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/builderPages/isLoadingPage.dart';
import 'package:shopping_list_application/services/recipe_service.dart';

class ViewRecipePage extends StatefulWidget {
  ViewRecipePage({super.key, required this.id});

  String id;

  static const cardPadding =
      EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0);

  @override
  State<ViewRecipePage> createState() => _ViewRecipePageState();
}

class _ViewRecipePageState extends State<ViewRecipePage> {
  late final RecipeDocumentReference recipeRef;

  @override
  void initState() {
    super.initState();
    recipeRef = RecipeService().getRecipe(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
      ref: recipeRef,
      builder: (BuildContext context,
          AsyncSnapshot<RecipeDocumentSnapshot> snapshot, Widget? child) {
        return getBody(snapshot);
      },
    );
  }

  Widget getBody(AsyncSnapshot<RecipeDocumentSnapshot> snapshot) {
    if (snapshot.hasError) {
      throw GoException(
          "An error has occurred while trying to retrieve your data");
    } else if (!snapshot.hasData) {
      return const IsLoadingPage();
    }

    Recipe? recipe = snapshot.data?.data;

    if (recipe == null) {
      throw GoException("No data found");
    }

    return Column(
      children: [
        descriptionWidget(recipe),
        ingredientsWidget(recipe),
        instructionsWidget(context, recipe),
        recipesWidget(recipe),
        buttonRow(recipe)
      ],
    );
  }

  Widget descriptionWidget(Recipe? recipe) {
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
              recipe?.description ?? "",
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }

  Widget ingredientsWidget(Recipe? recipe) {
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
                  itemBuilder: (_, index) => _toIngredientWidget(
                      recipe?.ingredients[index] ?? <String, String>{}),
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.transparent,
                  ),
                  itemCount: recipe?.ingredients.length ?? 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget instructionsWidget(context, Recipe? recipe) {
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
                    content: Text(recipe?.instructions ?? ""),
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
                      recipe?.instructions ?? "",
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

  Widget recipesWidget(Recipe? recipe) {
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
                  itemBuilder: (_, index) => _toRecipeWidget(
                      recipe?.recipes[index] ?? <String, String>{}),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: recipe?.recipes.length ?? 0,
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

  Widget buttonRow(Recipe recipe) {
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    TextStyle buttonTextStyle = const TextStyle(color: Colors.white);
    ButtonStyle deleteButtonStyle =
        ButtonStyle(backgroundColor: MaterialStateProperty.all(secondaryColor));
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              context.go("/recipes/edit", extra: recipe);
            },
            child: Text(
              "Edit",
              style: buttonTextStyle,
            )),
        ElevatedButton(
            style: deleteButtonStyle,
            onPressed: () {
              recipeRef.delete();
              context.go("/recipes");
            },
            child: Text(
              "Delete",
              style: buttonTextStyle,
            ))
      ],
    );
  }
}
