import 'package:flutter/material.dart';

class SelectableListView extends StatefulWidget {
  const SelectableListView(
      {super.key,
      required this.items,
      required this.itemKey,
      required this.screenName});

  final List<Map<dynamic, String>> items;
  final String screenName;
  final dynamic itemKey;

  @override
  State<SelectableListView> createState() => _SelectableListViewState();
}

class _SelectableListViewState<E> extends State<SelectableListView> {
  final List<dynamic> _selectedItems = List.empty();

  final _searchController = TextEditingController();
  String pageName = "";
  List<Map<dynamic, String>> items = List.empty();
  late dynamic itemKey;

  @override
  void initState() {
    super.initState();
    pageName = widget.screenName;
    items = widget.items;
    itemKey = widget.itemKey;
    print(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pageName),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel")
        ],
        onTap: (value) {
          if (value == 0) {
            Navigator.of(context).pop();
          }
        },
      ),
      body: Column(children: [
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
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .62,
                  child: ListView.separated(
                    itemBuilder: (_, index) => _toWidget(items[index], itemKey),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: items.length,
                  )),
            ),
          ),
        ),

        // Stack(
        //   children: [
        //     const Align(alignment: Alignment.center, child: Text("Add Recipes")),
        //     Align(
        //       alignment: AlignmentDirectional.centerEnd,
        //       child: IconButton(onPressed: () {
        //         Navigator.of(context).pop(_selectedItems);
        //       }, icon: const Icon(Icons.close)),
        //     )
        //   ],
        // ),
        // SizedBox(
        //     height: MediaQuery.of(context).size.height * .7,
        //     width: MediaQuery.of(context).size.width * .3,
        //     child: ListView.separated(
        //         itemBuilder: (_, index) => _toWidget(widget.items[index]),
        //         separatorBuilder: (_, __) => const Divider(),
        //         itemCount: widget.items.length))
      ]),
    );
  }

  Widget _toWidget(Map<dynamic, String> item, dynamic itemKey) {
    String itemName =
        item.entries.firstWhere((element) => element.key == itemKey).value;
    final qtyController = TextEditingController();

    return Row(
      children: [
        IconButton(
            onPressed: () => throw UnimplementedError(),
            icon: const Icon(Icons.add)),
        Text(itemName),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .25),
          child: TextField(
            controller: qtyController,
            decoration: InputDecoration(
                hintText: "Qty:",
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .5)),
          ),
        ),
      ],
    );
  }
}
