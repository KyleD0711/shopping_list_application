import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/builderPages/isLoadingPage.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/recipe_home_page.dart';
import 'package:shopping_list_application/pages/maintenance/shoppinglist/shopping_list_home.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/view_week.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';
import './plan_week.dart';

class WeekHomePage extends StatefulWidget {
  const WeekHomePage({super.key});

  @override
  State<WeekHomePage> createState() => _WeekHomePageState();
}

class _WeekHomePageState extends State<WeekHomePage> {
  // final Stream<List<Week>> _stream = WeekController().getStream();

  final WeekCollectionReference weeksRef = WeekService().getWeeks();

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
    return FirestoreBuilder(
        ref: weeksRef,
        builder: (BuildContext context,
            AsyncSnapshot<WeekQuerySnapshot> snapshot, Widget? child) {
          return getBody(snapshot);
        });
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Meal Planning"),
      automaticallyImplyLeading: false,
      actions: const [ProfilePicture()],
    );
  }

  Widget getBody(AsyncSnapshot<WeekQuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      throw GoException(
          "An error has occurred while trying to retrieve your data");
    } else if (!snapshot.hasData) {
      return const IsLoadingPage();
    }

    List<WeekQueryDocumentSnapshot>? weeks = snapshot?.data?.docs
        .where((element) =>
            element.data.beginDate.month == monthFilterValue &&
            element.data.beginDate.year == yearFilterValue)
        .toList();

    if (weeks == null) {
      throw GoException("No data found");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [filters(), displayWeeks(weeks), addButton()],
    );
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      items: [
        const BottomNavigationBarItem(
            icon: Icon(Icons.tab_outlined), label: "Recipes"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Home"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.list_alt), label: "Shopping Lists")
      ],
      onTap: (value) {
        if (value == 0) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const RecipeHomePage()));
        } else if (value == 1) {
          Navigator.of(context).pop();
        } else if (value == 2) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const ShoppingListHomePage()));
        }
      },
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

  Widget displayWeeks(List<WeekQueryDocumentSnapshot> weeks) {
    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (_, index) => _toWidget(weeks[index].data),
      separatorBuilder: (_, __) => const Divider(
        height: 3,
        color: Colors.transparent,
      ),
      itemCount: weeks.length,
    ));
  }

  Widget addButton() {
    TextStyle buttonStyle = const TextStyle(color: Colors.white, fontSize: 20);
    MaterialStateProperty<Color> backgroundColor =
        MaterialStateProperty.all(Theme.of(context).colorScheme.secondary);

    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor,
        ),
        onPressed: () {
          context.go("/mealplanning/plan");
        },
        child: Text("Plan Week", style: buttonStyle));
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
      onTap: () {
        context.go("/mealplanning/viewplan", extra: week.id);
      },
    );
  }
}
