import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/builderPages/isLoadingPage.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';
import 'package:shopping_list_application/utils/validators/forms/form_validators.dart';
import 'package:shopping_list_application/utils/validators/model/model_validator.dart';

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
        return getBody(snapshot);
      },
    );
  }

  Widget getBody(AsyncSnapshot<ShoppingListDocumentSnapshot> snapshot) {
    if (snapshot.hasError) {
      throw GoException(
          "An error has occurred while trying to retrieve your data");
    } else if (!snapshot.hasData) {
      return const IsLoadingPage();
    }

    ShoppingList? shoppingList = snapshot.data?.data;

    if (shoppingList == null) {
      return const Text("No data found");
    }

    shoppingList.shoppingListItems.replaceRange(
        0,
        shoppingList.shoppingListItems.length,
        sortSelectedNotSelected(shoppingList.shoppingListItems));

    return Column(
      children: [
        Expanded(
            child: shoppingList.shoppingListItems.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (_, index) => _toWidget(
                        shoppingList.shoppingListItems[index], shoppingList),
                    separatorBuilder: (_, __) => const Divider(
                      height: 5,
                      color: Colors.transparent,
                    ),
                    itemCount: shoppingList.shoppingListItems.length,
                  )
                : const Center(
                    child: Text("No shopping list items"),
                  )),
        buttonRow(shoppingList)
      ],
    );
  }

  Widget buttonRow(ShoppingList shoppingList) {
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    TextStyle buttonTextStyle = const TextStyle(color: Colors.white);
    ButtonStyle deleteButtonStyle =
        ButtonStyle(backgroundColor: MaterialStateProperty.all(secondaryColor));
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return toWidgetDialog(shoppingList);
                  });
            },
            child: Text(
              "Add item",
              style: buttonTextStyle,
            )),
        ElevatedButton(
            style: deleteButtonStyle,
            onPressed: () {
              context.go("/shoppinglists");
              handleDelete();
            },
            child: Text(
              "Delete list",
              style: buttonTextStyle,
            ))
      ],
    );
  }

  Widget _toWidget(
      Map<String, String> shoppingListItem, ShoppingList shoppingList) {
    Color tertiary = Theme.of(context).colorScheme.tertiary;
    Color white = Colors.white;

    Widget checkedBox = Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Icon(Icons.check_box, color: white),
    );
    Widget unCheckedBox = Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Icon(
        Icons.check_box_outline_blank,
        color: tertiary,
      ),
    );
    bool isSelected = shoppingListItem["isSelected"] == "false" ? false : true;

    TextStyle textStyle =
        TextStyle(color: isSelected ? white : tertiary, fontSize: 20);
    return GestureDetector(
      onTap: () {
        setState(() {
          !isSelected
              ? shoppingListItem["isSelected"] = "true"
              : shoppingListItem["isSelected"] = "false";
          shoppingListReference.update(
              shoppingListItems: shoppingList.shoppingListItems);
        });
      },
      child: Card(
        color: isSelected ? tertiary : white,
        child: Stack(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  isSelected ? checkedBox : unCheckedBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${shoppingListItem['name']} - Qty: ${shoppingListItem['qty']}",
                      style: textStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSelected)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: white,
                ),
                onPressed: () => setState(() {
                  shoppingList.shoppingListItems.remove(shoppingListItem);
                  shoppingListReference.update(
                      shoppingListItems: shoppingList.shoppingListItems);
                }),
              ),
            )
        ]),
      ),
    );
  }

  void handleDelete() {
    shoppingListReference.delete();
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
                validator: (value) => validateShoppingListItemName(
                    shoppingList.shoppingListItems, value),
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
                validator: (value) => validateQuantity(value),
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
              setState(() {
                shoppingListReference.update(
                    shoppingListItems: shoppingList.shoppingListItems);
              });
              Navigator.of(context, rootNavigator: true).pop();
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
