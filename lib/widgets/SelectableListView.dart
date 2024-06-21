import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';

class SelectableListView extends StatefulWidget {
  SelectableListView({
    super.key,
    required this.itemRef,
    required this.screenName,
    required this.selectedItems,
    required this.bottomActions,
    required this.itemValidator,
  });

  // final Stream<List<dynamic>> itemStream;
  final FirestoreCollectionReference itemRef;
  final String screenName;
  final List<Map<String, String>> selectedItems;
  final List<Widget> bottomActions;
  final String? Function(String value) itemValidator;

  @override
  State<SelectableListView> createState() => _SelectableListViewState();
}

class _SelectableListViewState extends State<SelectableListView> {
  final _searchController = TextEditingController();
  String pageName = "";
  String searchFilter = "";
  dynamic dropDownValue;
  @override
  void initState() {
    super.initState();
    pageName = widget.screenName;
  }

  @override
  Widget build(BuildContext context) {
    Color cardBackgroundColor = Theme.of(context).colorScheme.background;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 20),
      child: Card(
        color: cardBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [titleRow(), searchBar(), itemBuilder(), buttonRow()],
          ),
        ),
      ),
    );
  }

  Widget titleRow() {
    Color textColor = Theme.of(context).colorScheme.tertiary;
    TextStyle titleStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor);

    return Text(
      pageName,
      style: titleStyle,
    );
  }

  Widget searchBar() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    searchFilter = value;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search:",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                controller: _searchController,
                textAlign: TextAlign.left),
          ),
        ),
      ],
    );
  }

  Widget itemBuilder() {
    return FirestoreBuilder(
      ref: widget.itemRef,
      builder: (BuildContext context,
          AsyncSnapshot<FirestoreQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return const Text('Loading data...');

        List<FirestoreDocumentSnapshot> snapshots = snapshot.requireData.docs;

        List<Map<String, String>> items =
            formatStreamData(snapshots, searchFilter);

        return Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => _toWidget(items[index]),
            separatorBuilder: (_, __) => const Divider(
              color: Colors.transparent,
              height: 5,
            ),
            itemCount: items.length,
          ),
        );
      },
    );
  }

  List<Map<String, String>> formatStreamData(
      List<FirestoreDocumentSnapshot>? snapshots, String searchFilter) {
    List<Map<String, String>> items =
        List<Map<String, String>>.empty(growable: true);

    for (dynamic element in snapshots!) {
      dynamic item = element.data;
      if (searchFilter == "") {
        items.add({"name": item.name, "qty": ""});
      } else {
        if (item.toString().contains(searchFilter)) {
          items.add({"name": item.name, "qty": ""});
        }
      }
    }

    // Set selected items
    for (var element in widget.selectedItems) {
      for (Map<String, String>? item in items) {
        if (item == null) {
          continue;
        }
        if (item['name'] == element['name']) {
          item['qty'] = element['qty'] ?? "No Quantity";
        }
      }
    }

    return putSelectedMapsAtBeginning(items);
  }

  List<Map<String, String>> putSelectedMapsAtBeginning(
      List<Map<String, String>> list) {
    List<Map<String, String>> matched = [];
    List<Map<String, String>> unmatched = [];

    for (var map in list) {
      if (widget.selectedItems
          .any((element) => element['name'] == map['name'])) {
        matched.add(map);
      } else {
        unmatched.add(map);
      }
    }

    return [...matched, ...unmatched];
  }

  Widget _toWidget(Map<String, String> item) {
    String itemName = item["name"] ?? "No Name";
    Color tertiaryColor = Theme.of(context).colorScheme.tertiary;
    Color white = Colors.white;
    bool widgetIsSelected =
        widget.selectedItems.any((element) => element['name'] == item['name']);
    return StatefulBuilder(
      builder: (context, setState) => GestureDetector(
        onTap: () {
          if (widgetIsSelected) {
            widget.selectedItems
                .removeWhere((element) => element['name'] == item['name']);
            item['qty'] = "";
            setState(() {});
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return toWidgetDialog(item);
                });
          }
        },
        child: Card(
          color: !widgetIsSelected ? white : tertiaryColor,
          child: Stack(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    !widgetIsSelected
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.add,
                              color: tertiaryColor,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.remove, color: white),
                          ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          item['qty'] == "" || item['qty'] == null
                              ? itemName
                              : "$itemName: ${item['qty']}",
                          style: TextStyle(
                              color: widgetIsSelected ? white : tertiaryColor,
                              fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget toWidgetDialog(Map<String, String> item) {
    TextEditingController widgetTextController = TextEditingController();
    final key = GlobalKey<FormState>();
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Align(
          alignment: Alignment.center, child: Text(item['name'] ?? "No Name")),
      content: Form(
        key: key,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Quantity",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  controller: widgetTextController,
                  validator: (value) => widget.itemValidator(value ?? ""),
                ),
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
              item['qty'] = widgetTextController.text;
              widget.selectedItems.add(item);
              setState(() {});
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }

  Widget buttonRow() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: widget.bottomActions,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
