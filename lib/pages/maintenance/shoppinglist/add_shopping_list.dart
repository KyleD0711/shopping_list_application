import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';

class AddShoppingListPage extends StatefulWidget {
  const AddShoppingListPage({super.key});

  @override
  State<AddShoppingListPage> createState() => _AddShoppingListPageState();
}

class _AddShoppingListPageState extends State<AddShoppingListPage> {
  final WeekCollectionReference weeksRef = WeekService().getWeeks();
  final List<String> selectedWeeks = List.empty(growable: true);
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
        actions: const [ProfilePicture()],
      ),
      body: Column(
        children: [
          potentialNameField(),
          filters(),
          displayWeeks(),
          generateShoppingListsButton()
        ],
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

  Widget generateShoppingListsButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
                fixedSize: MaterialStateProperty.all(
                    Size.fromWidth(MediaQuery.of(context).size.width))),
            onPressed: () async {
              if (selectedWeeks.isEmpty) {
                errorDialog("No Weeks Selected!");
              } else {
                await Future.delayed(const Duration(seconds: 3));
                ShoppingListService()
                    .generateShoppingList(selectedWeeks, _nameController.text)
                    .then((value) async {
                  await Future.delayed(const Duration(seconds: 2));
                  successDialog("Shopping list generated successfully!");
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              }
            },
            child: const Text("Generate Shopping Lists",
                style: TextStyle(color: Colors.white))));
  }

  void successDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(
                message,
                textAlign: TextAlign.center,
              ),
              titlePadding: const EdgeInsets.all(16),
            ));
  }

  void errorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              backgroundColor: Colors.white,
              title: const Text("Error", style: TextStyle(color: Colors.red)),
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(message, style: const TextStyle(fontSize: 25)))
              ],
            ));
  }

  void loadingDialog() {
    showDialog(
        context: context,
        builder: (context) => const SimpleDialog(
              title: Text("Generating Shopping List"),
              children: [
                SizedBox(
                    height: 20, width: 20, child: CircularProgressIndicator())
              ],
            ));
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Optional Name:",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                controller: _nameController,
                textAlign: TextAlign.left),
          ),
        ),
      ],
    );
  }

  Widget _toWidget(Week week) {
    return GestureDetector(
      child: Card(
        color: selectedWeeks.contains(week.id)
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
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
        if (selectedWeeks.contains(week.id)) {
          selectedWeeks.remove(week.id);
        } else {
          selectedWeeks.add(week.id);
        }

        setState(() {});
      },
    );
  }
}
