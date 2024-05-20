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
          
          bool hasError = snapshot.hasError;
          bool hasData = snapshot.hasData;
          List<RecipeQueryDocumentSnapshot>? querySnapshot = snapshot.data?.docs;

          return Scaffold(
            appBar: getAppBar(),
            body: getBody(querySnapshot, hasError, hasData),
            bottomNavigationBar: getBottomNavigationBar(),
          );
        }));
  }

  PreferredSizeWidget getAppBar(){
    return AppBar(
              centerTitle: true,
              title: const Text("Recipes"),
              automaticallyImplyLeading: false,
              actions: [ProfilePicture()],
            );
  }

  Widget getBody( List<RecipeQueryDocumentSnapshot>? snapshot, bool hasError, bool hasData) {
    if (hasError) {
      return const Column(
        children: [
          Text("An error has occurred when trying to retrieve your data.")
        ],
      );
    } else if (!hasData) {
      return const Column(
        children: [Text("Loading Data...")],
      );
    } else if (snapshot == null) {
      return const Column(
        children: [Text("No data available")],
      );
    }
    return Column(
      children: [
        Expanded(
            child: 
                  ListView.separated(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (_, index) {
                      Recipe recipe = snapshot[index].data;
                      return _toWidget(recipe);
                    },
                    separatorBuilder: (_, __) => const Divider(
                      color: Colors.transparent,
                    ),
                    itemCount: snapshot.length,
                  )),
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
    );

  } 

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
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
            );
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
