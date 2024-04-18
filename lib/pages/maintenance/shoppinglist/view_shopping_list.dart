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
  late ShoppingListItemCollectionReference shoppingListItemsRef;

  @override
  void initState() {
    super.initState();
    shoppingListItemsRef =
        ShoppingListService().getShoppingList(widget.id).shoppinglistitems;
  }

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
        children: [displayItems()],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return toWidgetDialog();
              });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            Navigator.of(context).pop();
          } else if (value == 1) {
            ShoppingListService().getShoppingList(widget.id).delete();
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Widget displayItems() {
    return FirestoreBuilder(
      ref: shoppingListItemsRef,
      builder: ((BuildContext context,
          AsyncSnapshot<ShoppingListItemQuerySnapshot> snapshot,
          Widget? child) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return const Text("No data available");

        List<ShoppingListItemQueryDocumentSnapshot> shoppingListItems =
            snapshot.requireData.docs;
        shoppingListItems = sortSelectedNotSelected(shoppingListItems);

        return Expanded(
            child: snapshot.hasData
                ? ListView.separated(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (_, index) =>
                        _toWidget(shoppingListItems[index]),
                    separatorBuilder: (_, __) => const Divider(
                      height: 5,
                      color: Colors.transparent,
                    ),
                    itemCount: shoppingListItems.length,
                  )
                : const Center(
                    child: Text("No results"),
                  ));
      }),
    );
  }

  Widget _toWidget(ShoppingListItemQueryDocumentSnapshot itemSnapshot) {
    ShoppingListItem item = itemSnapshot.data;
    return GestureDetector(
      onTap: () {
        item.isSelected = !item.isSelected;
        setState(() {
          itemSnapshot.reference.set(item);
        });
      },
      child: Card(
        color: item.isSelected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.tertiary,
        child: Stack(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  !item.isSelected
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
                      "${item.item} - Qty: ${item.quantity}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (item.isSelected)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: () => shoppingListItemsRef.doc(item.id).delete(),
              ),
            )
        ]),
      ),
    );
  }

  Widget toWidgetDialog() {
    TextEditingController itemNameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    dynamic dropDownValue;
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
              shoppingListItemsRef.add(ShoppingListItem(
                  item: itemNameController.text,
                  quantity: quantityController.text));
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }

  List<ShoppingListItemQueryDocumentSnapshot> sortSelectedNotSelected(
      List<ShoppingListItemQueryDocumentSnapshot> numbers) {
    var isSelected =
        numbers.where((element) => element.data.isSelected).toList();
    var isNotSelected =
        numbers.where((element) => !element.data.isSelected).toList();
    return isNotSelected + isSelected;
  }
}
