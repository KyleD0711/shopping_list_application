import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/builderPages/isLoadingPage.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';

class ShoppingListHomePage extends StatefulWidget {
  const ShoppingListHomePage({super.key});

  @override
  State<ShoppingListHomePage> createState() => _ShoppingListHomePageState();
}

class _ShoppingListHomePageState extends State<ShoppingListHomePage> {
  final ShoppingListCollectionReference shoppingListRef =
      ShoppingListService().getShoppingLists();

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
      ref: shoppingListRef,
      builder: (BuildContext context,
          AsyncSnapshot<ShoppingListQuerySnapshot> snapshot, Widget? child) {
        return getBody(snapshot);
      },
    );
  }

  Widget getBody(AsyncSnapshot<ShoppingListQuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      throw GoException(
          "An error has occurred while trying to retrieve your data");
    } else if (!snapshot.hasData) {
      return const IsLoadingPage();
    }

    List<ShoppingListQueryDocumentSnapshot>? data = snapshot.data?.docs;

    if (data == null) {
      throw GoException("No data found");
    }

    List<ShoppingList> shoppingLists = data
        .map(
          (e) => e.data,
        )
        .toList();

    return Column(
      children: [displayShoppingLists(shoppingLists), addButton()],
    );
  }

  Widget displayShoppingLists(List<ShoppingList> shoppingLists) {
    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (_, index) => _toWidget(shoppingLists[index]),
      separatorBuilder: (_, __) => const Divider(
        height: 5,
        color: Colors.transparent,
      ),
      itemCount: shoppingLists.length,
    ));
  }

  Widget addButton() {
    //Style properties
    TextStyle buttonStyle = const TextStyle(color: Colors.white, fontSize: 20);
    MaterialStateProperty<Color> backgroundColor =
        MaterialStateProperty.all(Theme.of(context).colorScheme.secondary);

    return Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: backgroundColor),
            onPressed: () {
              context.go("/shoppinglists/generate");
            },
            child: Text("Create Shopping List", style: buttonStyle)));
  }

  Widget _toWidget(ShoppingList shoppingList) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        child: Text(
          textAlign: TextAlign.center,
          shoppingList.name,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      onTap: () {
        context.go("/shoppinglists/shoppinglist", extra: shoppingList.id);
      },
    );
  }
}
