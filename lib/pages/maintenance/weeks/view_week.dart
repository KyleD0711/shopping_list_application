import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/plan_week.dart';
import 'package:shopping_list_application/services/shopping_list_service.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';
import 'package:shopping_list_application/widgets/profile_picture.dart';

class ViewWeekPage extends StatefulWidget {
  static const cardPadding =
      EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0);
  static const double dayCardSize = 150;

  const ViewWeekPage({super.key, required this.id});

  final String id;

  @override
  State<ViewWeekPage> createState() => _ViewWeekPageState();
}

class _ViewWeekPageState extends State<ViewWeekPage> {
  late final WeekDocumentReference weekRef;

  @override
  void initState() {
    super.initState();
    weekRef = WeekService().getWeek(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder(
        ref: weekRef,
        builder: (BuildContext context,
            AsyncSnapshot<WeekDocumentSnapshot> snapshot, Widget? child) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (!snapshot.hasData) return const Text('Loading data...');

          Week? week = snapshot.requireData.data;

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: week != null
                  ? Text(
                      "${formatDate(week.beginDate)} - ${formatDate(week.endDate)}")
                  : const Text(""),
              actions: [ProfilePicture()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.delete),
                  label: "Delete",
                ),
              ],
              onTap: (value) async {
                if (value == 0) {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlanWeekPage(week: week)));
                } else if (value == 1) {
                  weekRef.delete();
                  Navigator.of(context).pop();
                }
              },
            ),
            body: ListView(children: [
              Row(
                children: [
                  dateCard(week!.beginDate, "Begin Date"),
                  dateCard(week.endDate, "End Date")
                ],
              ),
              CarouselSlider(
                items: getAllDayCards(week),
                options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll:
                        week.days.entries.length > 1 ? true : false,
                    enlargeCenterPage: true,
                    height: 550,
                    enlargeFactor: .2),
              ),
            ]),
          );
        });
  }

  String? validateDates(DateTime? date, String errorMessage) {
    if (date == null) {
      return errorMessage;
    }

    return null;
  }

  Widget errorPopUp(String message) {
    return AlertDialog(
      title: Text(message),
      actions: [
        ElevatedButton(
          child: const Text(
            "Acknowledge",
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  List<Widget> getAllDayCards(Week week) {
    List<Widget> dayCards = [];
    List<DateTime> keys = week.days.keys.toList();
    keys.sort((x, y) => x.compareTo(y));
    keys.forEach((element) {
      dayCards.add(dayCard(getDayOfWeek(element), formatDate(element),
          week.days[element] ?? []));
    });
    return dayCards;
  }

  Widget dayCard(String name, String date, List<Map<String, String>> weeks) {
    return Padding(
      padding: ViewWeekPage.cardPadding,
      child: SizedBox(
        height: ViewWeekPage.dayCardSize,
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Divider(height: 15.0, color: Colors.black),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (_, index) {
                    if (weeks[index].isNotEmpty) {
                      return _nameWidget(weeks[index]);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("No Recipes for this day"),
                      );
                    }
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: weeks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dateCard(DateTime? date, String title) {
    return Expanded(
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const Divider(
              color: Colors.black,
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                date != null
                    ? "${getDayOfWeek(date)}\n${formatDate(date)}"
                    : "No Date",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameWidget(Map<String, String> name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child:
          Text("${name["name"] ?? "No Name"}: ${name['qty'] ?? "No Quantity"}"),
    );
  }
}
