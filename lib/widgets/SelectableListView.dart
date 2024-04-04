import 'package:flutter/material.dart';

class SelectableListView extends StatefulWidget {
  SelectableListView(
      {super.key,
      required this.itemStream,
      required this.screenName,
      required this.selectedItems,
      required this.bottomActions,
      this.actionTap});

  final Stream<List<dynamic>> itemStream;
  final String screenName;
  final List<Map<String, String>> selectedItems;
  final List<BottomNavigationBarItem> bottomActions;
  void Function(int value)? actionTap;

  @override
  State<SelectableListView> createState() => _SelectableListViewState();
}

class _SelectableListViewState extends State<SelectableListView> {
  final _searchController = TextEditingController();
  String pageName = "";
  final Map<String, TextEditingController> _controllers = {};
  String searchFilter = "";

  @override
  void initState() {
    super.initState();
    pageName = widget.screenName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(pageName),
          automaticallyImplyLeading: false),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: widget.bottomActions,
          onTap: widget.actionTap),
      body: Center(
        child: Column(children: [searchBar(), itemStreamBuilder()]),
      ),
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

  Widget itemStreamBuilder() {
    return StreamBuilder<List<dynamic>>(
        stream: widget.itemStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Text("No Results");
          }

          List<Map<String, String>> items =
              formatStreamData(snapshot.data, searchFilter);

          return Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => _toWidget(items[index]),
              separatorBuilder: (_, __) =>
                  const Divider(color: Colors.transparent),
              itemCount: items.length,
            ),
          );
        });
  }

  List<Map<String, String>> formatStreamData(
      List<dynamic>? data, String searchFilter) {
    List<Map<String, String>> items =
        List<Map<String, String>>.empty(growable: true);

    for (dynamic element in data!) {
      if (searchFilter == "") {
        items.add({"name": element.toString(), "qty": ""});
      } else {
        if (element.toString().contains(searchFilter)) {
          items.add({"name": element.toString(), "qty": ""});
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
      if (widget.selectedItems.any(
                              (element) => element['name'] == map['name'])) {
        matched.add(map);
      } else {
        unmatched.add(map);
      }
    }

    return [...matched, ...unmatched];
  }

  Widget _toWidget(Map<String, String> item) {
    String itemName = item["name"] ?? "No Name";
    if (!_controllers.keys.contains(itemName)) {
      _controllers[itemName] = TextEditingController(text: item['qty']);
    }
    return StatefulBuilder(
      builder: (context, setState) => Card(
        color: widget.selectedItems
                .any((element) => element['name'] == item['name'])
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.tertiary,
        child: Stack(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.selectedItems.any(
                              (element) => element['name'] == item['name'])) {
                            widget.selectedItems.removeWhere(
                                (element) => element['name'] == item['name']);
                          } else {
                            item['qty'] = _controllers[itemName]!.text;
                            widget.selectedItems.add(item);
                          }
                        });
                      },
                      color: Colors.white,
                      icon: !widget.selectedItems
                        .any((element) => element['name'] == item['name']) ? const Icon(Icons.add) : const Text("-")),
                  Text(
                    itemName,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    enabled: !widget.selectedItems
                        .any((element) => element['name'] == item['name']),
                    controller: _controllers[itemName],
                    style: TextStyle(
                        color: widget.selectedItems.any(
                                (element) => element['name'] == item['name'])
                            ? Colors.white
                            : Colors.black),
                    decoration: InputDecoration(
                        filled: !widget.selectedItems
                            .any((element) => element['name'] == item['name']),
                        fillColor: Colors.white,
                        labelText: "Qty:",
                        floatingLabelBehavior: FloatingLabelBehavior.never)),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _controllers.values.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }
}
