import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/builderPages/isLoadingPage.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/add_recipe.dart';
import 'package:shopping_list_application/services/recipe_service.dart';

class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({super.key});

  @override
  State<RecipeHomePage> createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  // final Stream<List<Recipe>> _stream = RecipeController().getStream();
  final RecipeCollectionReference recipeRef = RecipeService().recipes;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<RecipeQuerySnapshot>(
        ref: recipeRef,
        builder: ((context, AsyncSnapshot<RecipeQuerySnapshot> snapshot,
            Widget? child) {
          return getBody(snapshot);
        }));
  }

  Widget getBody(AsyncSnapshot<RecipeQuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      throw GoException(
          "An error has occurred while trying to retrieve your data");
    } else if (!snapshot.hasData) {
      return const IsLoadingPage();
    }

    List<RecipeQueryDocumentSnapshot>? data = snapshot.data?.docs;

    if (data == null) {
      throw GoException("No data found");
    }

    return Column(
      children: [
        Expanded(
            child: ListView.separated(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (_, index) {
            Recipe recipe = data[index].data;
            return _toWidget(recipe);
          },
          separatorBuilder: (_, __) => const Divider(
            color: Colors.transparent,
          ),
          itemCount: data.length,
        )),
        Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondary),
                    fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(MediaQuery.of(context).size.width))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddRecipePage()));
                },
                child: const Text("Add Recipe",
                    style: TextStyle(color: Colors.white))))
      ],
    );
  }

  Widget _toWidget(Recipe recipe) {
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
            Text(
                "Prep Time: ${recipe.prepTime}\nCook Time: ${recipe.cookTime}"),
          ],
        )),
      ),
      onTap: () => {context.go("/recipes/recipe", extra: recipe.id)},
    );
  }
}
