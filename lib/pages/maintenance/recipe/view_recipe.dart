import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/add_recipe.dart';
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
    print(widget.id);
    recipeRef = RecipeService().getRecipe(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
      ref: recipeRef,
      builder: (BuildContext context, AsyncSnapshot<RecipeDocumentSnapshot> snapshot, Widget? child) {  
        if (snapshot.hasError) return const Text('Something went wrong!');
        if (!snapshot.hasData) return const Text('Loading data...');

        RecipeDocumentSnapshot querySnapshot = snapshot.requireData;
        Recipe? recipe = querySnapshot.data;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(recipe?.name ?? ""),
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
                  return AddRecipePage(recipe: recipe);
                }));
              } else if (value == 1) {
                recipeRef.delete();
                Navigator.of(context).pop();
              }
            },
          ),
          body: Column(
            children: [
              descriptionWidget(recipe),
              ingredientsWidget(recipe),
              instructionsWidget(context, recipe),
              recipesWidget(recipe)
            ],
          ));
      },
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
                  itemBuilder: (_, index) =>
                      _toIngredientWidget(recipe?.ingredients[index] ?? <String, String>{}),
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
                  itemBuilder: (_, index) =>
                      _toRecipeWidget(recipe?.recipes[index] ?? <String, String>{}),
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
}
