import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';

class ShoppingListMainPage extends StatefulWidget {
  const ShoppingListMainPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ShoppingListMainPage> createState() => _ShoppingListMainPageState();
}

class _ShoppingListMainPageState extends State<ShoppingListMainPage> {
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
      ),
      body: Column(
        children: [displayItems()],
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

        List<ShoppingListItemQueryDocumentSnapshot> shoppingListItems = snapshot.requireData.docs;
        
        return Expanded(
              child: snapshot.hasData
                  ? ListView.separated(
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (_, index) => _toWidget(shoppingListItems[index]),
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
          setState((){});
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      );
  }

  // Widget _toWidget( task) {
  //   return CheckboxListTile(
  //     title: Text(task.description),
  //     value: task.isCompleted,
  //     subtitle: Text(
  //       task.dueDate != null
  //           ? DateFormat('MM/dd/yyyy').format(task.dueDate!)
  //           : "",
  //       style: task.dueDate != null
  //           ? (task.dueDate!.isBefore(DateTime.now())
  //               ? const TextStyle(color: Colors.red)
  //               : null)
  //           : null,
  //     ),
  //     onChanged: (bool? value) => {
  //       setState(() {
  //         if (value != null) {
  //           task.isCompleted = !task.isCompleted;
  //         }
  //       })
  //     },
  //   );
  // }
}
