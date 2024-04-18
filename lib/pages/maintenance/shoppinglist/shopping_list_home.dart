import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/recipe_home_page.dart';
import 'package:shopping_list_application/pages/maintenance/shoppinglist/add_shopping_list.dart';
import 'package:shopping_list_application/pages/maintenance/shoppinglist/view_shopping_list.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/week_home_page.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';

class ShoppingListHomePage extends StatefulWidget {
  const ShoppingListHomePage({super.key});

  @override
  State<ShoppingListHomePage> createState() => _ShoppingListHomePageState();
}

class _ShoppingListHomePageState extends State<ShoppingListHomePage> {
  
  final ShoppingListCollectionReference shoppingListRef = ShoppingListService().getShoppingLists();

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Shopping Lists"),
              automaticallyImplyLeading: false,
              actions: [ProfilePicture()],
            ),
            body: Column(
              children: [displayShoppingLists(), addButton()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: [
                const BottomNavigationBarItem(
              icon: Icon(Icons.tab_outlined), label: "Recipes"),
          const BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Meal Planning"),
          BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Theme.of(context).colorScheme.primary,), label: "Home"),
                
              ],
              onTap: (value) {
                if (value == 0) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RecipeHomePage()));
                }
                else if (value == 1){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const WeekHomePage()));
                }
                else if (value == 2){
                  Navigator.of(context).pop();
                }
              },
            ),
          );
  }

  Widget displayShoppingLists() {
      return FirestoreBuilder(ref: shoppingListRef, builder: (BuildContext context, AsyncSnapshot<ShoppingListQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return const Text('Loading data...');

        List<ShoppingListQueryDocumentSnapshot> shoppingLists = snapshot.requireData.docs;

        return Expanded(
              child: snapshot.hasData
                  ? ListView.separated(
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (_, index) => _toWidget(shoppingLists[index].data),
                      separatorBuilder: (_, __) => const Divider(
                        height: 5,
                        color: Colors.transparent,
                      ),
                      itemCount: shoppingLists.length,
                    )
                  : const Center(
                      child: Text("No results"),
                    ));
      });
  }

  Widget addButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
                fixedSize: MaterialStateProperty.all(
                    Size.fromWidth(MediaQuery.of(context).size.width))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddShoppingListPage()));
            },
            child: const Text("Create Shopping List",
                style: TextStyle(color: Colors.white))));
  }

  Widget _toWidget(ShoppingList shoppingList) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        child:
            Text(textAlign: TextAlign.center, shoppingList.name, style: const TextStyle(fontSize: 25),),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewShoppingListPage(id: shoppingList.id,)));
      },
    );
  }
}
