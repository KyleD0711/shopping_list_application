import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/add_recipe.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/view_recipe.dart';
import 'package:shopping_list_application/pages/maintenance/shoppinglist/shopping_list_home.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/week_home_page.dart';
import 'package:shopping_list_application/services/recipe_service.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';

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
          if (snapshot.hasError) return const Text('Something went wrong!');

          RecipeQuerySnapshot? querySnapshot = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Recipes"),
              automaticallyImplyLeading: false,
              actions: [ProfilePicture()],
            ),
            body: Column(
              children: [
                Expanded(
                    child: querySnapshot != null
                        ? ListView.separated(
                            padding: const EdgeInsets.all(10.0),
                            itemBuilder: (_, index) {
                              Recipe recipe = querySnapshot.docs[index].data;
                              return _toWidget(recipe);
                            },
                            separatorBuilder: (_, __) => const Divider(
                              color: Colors.transparent,
                            ),
                            itemCount: querySnapshot.docs.length,
                          )
                        : const Text("Loading Data..")),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.secondary),
                            fixedSize: MaterialStateProperty.all(Size.fromWidth(
                                MediaQuery.of(context).size.width))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddRecipePage()));
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
                    icon: Icon(Icons.set_meal), label: "Meal Planning"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt), label: "Shopping Lists")
              ],
              onTap: (value) {
                if (value == 0) {
                  Navigator.of(context).pop();
                } else if (value == 1) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const WeekHomePage()));
                } else if (value == 2) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ShoppingListHomePage()));
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
            Text(
                "Prep Time: ${recipe.prepTime}\nCook Time: ${recipe.cookTime}"),
          ],
        )),
      ),
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewRecipePage(id: recipe.id)))
      },
    );
  }
}
