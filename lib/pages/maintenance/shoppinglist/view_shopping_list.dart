import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';
import 'package:shopping_list_application/utils/validators/forms/form_validators.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';

class ViewShoppingListPage extends StatefulWidget {
  const ViewShoppingListPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ViewShoppingListPage> createState() => _ViewShoppingListPageState();
}

class _ViewShoppingListPageState extends State<ViewShoppingListPage> {
  late ShoppingListDocumentReference shoppingListReference;
  @override
  void initState() {
    super.initState();
    shoppingListReference = ShoppingListService().getShoppingList(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
      ref: shoppingListReference,
      builder: (BuildContext context,
          AsyncSnapshot<ShoppingListDocumentSnapshot> snapshot, Widget? child) {
          
          bool hasError = snapshot.hasError;
          bool hasData = snapshot.hasData;
          ShoppingList? shoppingList = snapshot.data?.data;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Shopping Lists"),
            automaticallyImplyLeading: false,
            actions: const [ProfilePicture()],
          ),
          body: Column(
            children: [getBody(shoppingList, hasError, hasData)],
          ),
          floatingActionButton: getFloatingAcionButton(shoppingList, hasError, hasData),
          bottomNavigationBar: getBottomNavigationBar(shoppingList, hasError, hasData)
        );
      },
    );
  }

  Widget getBody(ShoppingList? shoppingList, bool hasError, bool hasData){
    if (hasError) {
      return const Column(children: [Text("An error has occurred when trying to retrieve your data.")],);
    }
    else if (!hasData) {
      return const Column(children: [Text("Loading Data...")],);
    }
    else {
      if (shoppingList == null) {
        return const Column(children: [Text("No data available")],); 
      }

      shoppingList.shoppingListItems.replaceRange(
            0,
            shoppingList.shoppingListItems.length,
            sortSelectedNotSelected(shoppingList.shoppingListItems));

        return Expanded(
            child: shoppingList.shoppingListItems.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (_, index) => _toWidget(
                        shoppingList.shoppingListItems[index],
                        shoppingList),
                    separatorBuilder: (_, __) => const Divider(
                      height: 5,
                      color: Colors.transparent,
                    ),
                    itemCount: shoppingList.shoppingListItems.length,
                  )
                : const Center(
                    child: Text("No shopping list items"),
                  ));
    }
  }

  Widget? getFloatingAcionButton(ShoppingList? shoppingList, bool hasError, bool hasData){
    if (hasError || !hasData || shoppingList == null) {
      return null;
    }
    else {
      return FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () async {
              
              showDialog(
                  context: context,
                  builder: (context) {
                    return toWidgetDialog(shoppingList);
                  });
            },
          );
    }
  }

  Widget getBottomNavigationBar(ShoppingList? shoppingList, bool hasError, bool hasData) {
    return BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back), label: "Back"),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: "Delete List",
              )
            ],
            onTap: (value) {
              if (value == 0) {
                if (hasData && !hasError && shoppingList != null) {
                  shoppingListReference.set(shoppingList);
                }
                Navigator.of(context).pop();
              } else if (value == 1) {
                ShoppingListService().getShoppingList(widget.id).delete();
                Navigator.of(context).pop();
              }
            },
          );
  }

  Widget _toWidget(
      Map<String, String> shoppingListItem, ShoppingList shoppingList) {
    return GestureDetector(
      onTap: () {
        setState(() {
          shoppingListItem["isSelected"] == "false"
              ? shoppingListItem["isSelected"] = "true"
              : shoppingListItem["isSelected"] = "false";
        });
      },
      child: Card(
        color: shoppingListItem["isSelected"] == "true"
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.tertiary,
        child: Stack(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  shoppingListItem["isSelected"] != "true"
                      ? const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.white,
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.check_box, color: Colors.white),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${shoppingListItem['name']} - Qty: ${shoppingListItem['qty']}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (shoppingListItem["isSelected"] == "true")
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: () =>
                    setState(() => shoppingList.shoppingListItems.remove(shoppingListItem)),
              ),
            )
        ]),
      ),
    );
  }

  Widget toWidgetDialog(ShoppingList shoppingList) {
    TextEditingController itemNameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    final key = GlobalKey<FormState>();
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Align(
          alignment: Alignment.center, child: Text("Add Shopping List Item")),
      content: Form(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Item Name:",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: itemNameController,
                validator: (value) => validateNonEmptyMessage(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Quantity:",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: quantityController,
                validator: (value) => validateNonEmptyMessage(value),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text(
            "Add",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (key.currentState!.validate()) {
              shoppingList.shoppingListItems.add(<String, String>{
                "name": itemNameController.text,
                "qty": quantityController.text,
                "isSelected": "false"
              });
              setState(() {});
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }

  List<Map<String, String>> sortSelectedNotSelected(
      List<Map<String, String>> numbers) {
    var isSelected =
        numbers.where((element) => element["isSelected"] == "true").toList();
    var isNotSelected =
        numbers.where((element) => element["isSelected"] != "true").toList();
    return isNotSelected + isSelected;
  }
}
