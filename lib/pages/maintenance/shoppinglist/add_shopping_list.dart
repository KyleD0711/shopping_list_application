import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/builderPages/isLoadingPage.dart';
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

  bool isGenerating = false;
  @override
  void initState() {
    super.initState();
    yearsList = List.generate(
        (currentYear + 3) - currentYear + 1, (index) => currentYear + index);
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    if (isGenerating) {
      return generatingList();
    } else {
      return Column(
        children: [
          potentialNameField(),
          filters(),
          displayWeeks(),
          generateShoppingListsButton()
        ],
      );
    }
  }

  Widget generatingList() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Generating Shopping List..."),
        CircularProgressIndicator()
      ],
    );
  }

  Widget generateShoppingListsButton() {
    TextStyle buttonStyle = const TextStyle(color: Colors.white, fontSize: 20);
    MaterialStateProperty<Color> backgroundColor =
        MaterialStateProperty.all(Theme.of(context).colorScheme.secondary);

    return Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: backgroundColor),
            onPressed: () async {
              if (selectedWeeks.isEmpty) {
                errorDialog("No Weeks Selected!");
              } else {
                ShoppingListService()
                    .generateShoppingList(selectedWeeks, _nameController.text)
                    .then((value) async {
                  context.goNamed("shoppingListHome");
                });
                isGenerating = true;
                setState(() {});
              }
            },
            child: Text("Generate Shopping Lists", style: buttonStyle)));
  }

  void successDialog(String message) {
    const titlePadding = EdgeInsets.all(16);
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(
                message,
                textAlign: TextAlign.center,
              ),
              titlePadding: titlePadding,
            ));
  }

  void errorDialog(String message) {
    const errorTitleTextStyle = TextStyle(color: Colors.red);
    const errorMessageTextStyle = TextStyle(fontSize: 25);
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              backgroundColor: Colors.white,
              title: const Text("Error", style: errorTitleTextStyle),
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(message, style: errorMessageTextStyle))
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
          children: [monthFilter(), yearFilter()],
        ),
      ),
    );
  }

  Widget monthFilter() {
    const cardColor = Colors.white;
    const dropDownPadding = EdgeInsets.only(left: 8.0, right: 8.0);
    const dropDownColor = Colors.white;
    const shownValueTextStyle = TextStyle(color: Colors.black);
    final dropDownBorderRadius = BorderRadius.circular(10);
    const dropDownOptionTextStyle = TextStyle(color: Colors.black);
    return Card(
      color: cardColor,
      child: Padding(
        padding: dropDownPadding,
        child: DropdownButton(
            dropdownColor: dropDownColor,
            style: shownValueTextStyle,
            borderRadius: dropDownBorderRadius,
            items: months
                .map((month) => DropdownMenuItem(
                      value: month,
                      child:
                          Text(getMonth(month), style: dropDownOptionTextStyle),
                    ))
                .toList(),
            value: monthFilterValue,
            onChanged: ((value) => setState(() => monthFilterValue = value))),
      ),
    );
  }

  Widget yearFilter() {
    const cardColor = Colors.white;
    const dropDownPadding = EdgeInsets.only(left: 8.0, right: 8.0);
    const dropDownColor = Colors.white;
    const shownValueTextStyle = TextStyle(color: Colors.black);
    final dropDownBorderRadius = BorderRadius.circular(10);
    const dropDownOptionTextStyle = TextStyle(color: Colors.black);
    return Card(
      color: cardColor,
      child: Padding(
        padding: dropDownPadding,
        child: DropdownButton(
            dropdownColor: dropDownColor,
            style: shownValueTextStyle,
            borderRadius: dropDownBorderRadius,
            items: yearsList
                .map((year) => DropdownMenuItem(
                      value: year,
                      child:
                          Text(year.toString(), style: dropDownOptionTextStyle),
                    ))
                .toList(),
            value: yearFilterValue,
            onChanged: ((value) => setState(() => yearFilterValue = value))),
      ),
    );
  }

  Widget displayWeeks() {
    return FirestoreBuilder(
        ref: weeksRef,
        builder: (BuildContext context,
            AsyncSnapshot<WeekQuerySnapshot> snapshot, Widget? child) {
          if (snapshot.hasError) {
            throw GoException(
                "An error has occurred while trying to retrieve your data");
          }
          if (!snapshot.hasData) return const IsLoadingPage();
          List<WeekQueryDocumentSnapshot> weeks = snapshot.requireData.docs
              .where((element) =>
                  element.data.beginDate.month == monthFilterValue &&
                  element.data.beginDate.year == yearFilterValue)
              .toList();

          if (weeks.isEmpty) {
            return const Expanded(child: Text("No meals found for this month"));
          }

          const padding = EdgeInsets.all(10.0);

          return Expanded(
              child: ListView.separated(
            padding: padding,
            itemBuilder: (_, index) => _toWidget(weeks[index].data),
            separatorBuilder: (_, __) => const Divider(
              height: 5,
              color: Colors.transparent,
            ),
            itemCount: weeks.length,
          ));
        });
  }

  Widget potentialNameField() {
    const padding = EdgeInsets.all(8.0);
    const fillColor = Colors.white;
    const filled = true;
    const hintText = "Optional Name:";
    final border =
        OutlineInputBorder(borderRadius: BorderRadius.circular(10.0));

    return Stack(
      children: [
        Padding(
          padding: padding,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
                decoration: InputDecoration(
                  fillColor: fillColor,
                  filled: filled,
                  hintText: hintText,
                  border: border,
                ),
                controller: _nameController,
                textAlign: TextAlign.left),
          ),
        ),
      ],
    );
  }

  Widget _toWidget(Week week) {
    final isSelected = selectedWeeks.contains(week.id);
    final primaryColor = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      child: Card(
        color: isSelected ? primaryColor : Colors.white,
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
