import 'package:flutter/material.dart';
import 'package:shopping_list_application/controllers/recipe_controller.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:modals/modals.dart';

class RecipeHomePage extends StatefulWidget {
  const RecipeHomePage({super.key});

  @override
  State<RecipeHomePage> createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  final _stream = RecipeController().getStream();

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
            ),
            body: snapshot.hasData
                ? ListView.separated(
                    itemBuilder: (_, index) => _toWidget(recipes[index]),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: recipes.length,
                  )
                : const Center(
                    child: Text("No results"),
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ViewRecipePage()))
              },
              child: const Icon(Icons.add),
            ),
          );
        }));
  }

  Widget _toWidget(Recipe recipe) {
    return ListTile(
      title: Text(recipe.name),
      titleAlignment: ListTileTitleAlignment.center,
      onTap: () => {
        showModal(ModalEntry.aligned(context,
            tag: recipe.id,
            alignment: Alignment.center,
            barrierColor: const Color.fromARGB(149, 212, 221, 226),
            barrierDismissible: true,
            child: SizedBox(
              width: 300,
              height: 300,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListView(
                  children: [
                    Center(child: Text(recipe.name)),
                    Text("Prep Time: ${recipe.prepTime}"),
                    Text("Cook Time: ${recipe.cookTime}")
                  ],
                ),
              ),
            )))
      },
    );
  }
}
