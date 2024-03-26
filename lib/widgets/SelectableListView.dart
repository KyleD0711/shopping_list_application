import 'package:flutter/material.dart';

class SelectableListView extends StatefulWidget {
  const SelectableListView(
      {super.key, required this.itemStream, required this.screenName, required this.selectedItems});

  final Stream<List<dynamic>> itemStream;
  final String screenName;
  final List<Map<String, String>> selectedItems;

  @override
  State<SelectableListView> createState() => _SelectableListViewState();
}

class _SelectableListViewState extends State<SelectableListView> {

  final _searchController = TextEditingController();
  String pageName = "";
  final Map<String, TextEditingController> _controllers = {};

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
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel")
        ],
        onTap: (value) {
          if (value == 1) {
            Navigator.of(context).pop();
          }
          else if (value == 0){
            Navigator.of(context).pop(widget.selectedItems);
          }
        },
      ),
      body: Center(
        child: Column(children: [
          /** 
           * Search bar
          */
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
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
          ),
          /** 
           * List view
          */
          StreamBuilder<List<dynamic>>(
              stream: widget.itemStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Text("No Results");
                }

                // Get items from item stream
                List<Map<String, String>> items =
                    snapshot.data!.map((e) => {"name": e.toString(), "qty": ""}).toList();

                // Set selected items 
                for (var element in widget.selectedItems) {
                  for (Map<String, String> item in items) {
                    if (item['name'] == element['name']){
                      item['qty'] = element['qty'] ?? "No Quantity";
                    }
                  }
                }

                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) => _toWidget(items[index]),
                    separatorBuilder: (_, __) => const Divider(height: 5, color: Colors.transparent),
                    itemCount: items.length,
                  ),
                );
              }),
        ]),
      ),
    );
  }

  Widget _toWidget(Map<String, String> item) {
    String itemName = item["name"] ?? "No Name";
    print(item);
    if (!_controllers.keys.contains(itemName)) {
      _controllers[itemName] = TextEditingController(text: item['qty']);
    }
    return StatefulBuilder(
      builder: (context, setState) => Card(
        color: widget.selectedItems.any((element) => element['name'] == item['name'])
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.tertiary,
        child: Stack(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.selectedItems.any((element) => element['name'] == item['name'])) {
                          widget.selectedItems.removeWhere((element) => element['name'] == item['name']);
                          print("In remove: ${widget.selectedItems}");
                        }
                        else {
                          item['qty'] = _controllers[itemName]!.text;
                          widget.selectedItems.add(item);
                          print("In add: ${widget.selectedItems}");
                        }
                      });
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.add)),
              Text(
                itemName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
              ],),
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
                  enabled: !widget.selectedItems.any((element) => element['name'] == item['name']),
                  controller: _controllers[itemName],
                  style: TextStyle(color: widget.selectedItems.any((element) => element['name'] == item['name']) ? Colors.white: Colors.black),
                  decoration: InputDecoration(
                      filled: !widget.selectedItems.any((element) => element['name'] == item['name']),
                      fillColor: Colors.white,
                      labelText: "Qty:", 
                      floatingLabelBehavior: FloatingLabelBehavior.never)
                ),
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
