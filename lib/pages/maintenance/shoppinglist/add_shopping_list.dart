import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';

class AddShoppingListPage extends StatefulWidget {
  const AddShoppingListPage({super.key});

  @override
  State<AddShoppingListPage> createState() => _AddShoppingListPageState();
}

class _AddShoppingListPageState extends State<AddShoppingListPage> {
  final WeekCollectionReference weeksRef = WeekService().getWeeks();
  final _nameController = TextEditingController();
  static const months = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
  ];
  int? monthFilterValue = DateTime.now().month;
  int? yearFilterValue = DateTime.now().year;

  int currentYear = DateTime.now().year;
  List<int> yearsList = [];

  @override
  void initState() {
    yearsList = List.generate(
        (currentYear + 3) - currentYear + 1, (index) => currentYear + index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Shopping Lists"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [filters(), potentialNameField(),displayWeeks()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.tab_outlined), label: "Recipes"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: "Home")
        ],
        onTap: (value) {
          if (value == 0) {
            Navigator.of(context).pop();
          } else if (value == 1) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Widget filters() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    items: months
                        .map((month) => DropdownMenuItem(
                              value: month,
                              child: Text(getMonth(month),
                                  style: const TextStyle(color: Colors.black)),
                            ))
                        .toList(),
                    value: monthFilterValue,
                    onChanged: ((value) =>
                        setState(() => monthFilterValue = value))),
              ),
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: DropdownButton(
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    items: yearsList
                        .map((year) => DropdownMenuItem(
                              value: year,
                              child: Text(year.toString(),
                                  style: const TextStyle(color: Colors.black)),
                            ))
                        .toList(),
                    value: yearFilterValue,
                    onChanged: ((value) =>
                        setState(() => yearFilterValue = value))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayWeeks() {
    return FirestoreBuilder(
        ref: weeksRef,
        builder: (BuildContext context,
            AsyncSnapshot<WeekQuerySnapshot> snapshot, Widget? child) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (!snapshot.hasData) return const Text('Loading data...');

          List<WeekQueryDocumentSnapshot> weeks = snapshot.requireData.docs
              .where((element) =>
                  element.data.beginDate.month == monthFilterValue &&
                  element.data.beginDate.year == yearFilterValue)
              .toList();

          return Expanded(
              child: snapshot.hasData
                  ? ListView.separated(
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (_, index) => _toWidget(weeks[index].data),
                      separatorBuilder: (_, __) => const Divider(
                        height: 5,
                        color: Colors.transparent,
                      ),
                      itemCount: weeks.length,
                    )
                  : const Center(
                      child: Text("No results"),
                    ));
        });
  }

  Widget potentialNameField() {
    return Row(
      children: [
        Card(
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Optional Name"),
          ),
        )
      ],
    );
  }

  Widget _toWidget(Week week) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              "${formatDate(week.beginDate)} - ${formatDate(week.endDate)}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              textAlign: TextAlign.center,
              "${formatMonthAndDay(week.beginDate)} - ${formatMonthAndDay(week.endDate)}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) => const SimpleDialog(
                  title: Text("Generating Shopping List"),
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator())
                  ],
                ));
        await Future.delayed(const Duration(seconds: 3));
        ShoppingListService()
            .generateShoppingList(week.id, null)
            .then((value) async {
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) => const SimpleDialog(
                    title: Text(
                      "List created successfully!",
                      textAlign: TextAlign.center,
                    ),
                    titlePadding: EdgeInsets.all(16),
                  ));
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pop(context);
        });
      },
    );
  }
}
