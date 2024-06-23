import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/builderPages/isLoadingPage.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';

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
          if (snapshot.hasError) {
            throw GoException(
                "An error has occurred while trying to retrieve your data");
          } else if (!snapshot.hasData) {
            return const IsLoadingPage();
          }

          Week? week = snapshot.data?.data;

          if (week == null) {
            throw GoException("No data found");
          }

          return getBody(week);
        });
  }

  Widget getBody(Week? week) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            dateCard(week!.beginDate, "Begin Date"),
            dateCard(week.endDate, "End Date")
          ],
        ),
        Expanded(
          child: CarouselSlider(
            items: getAllDayCards(week),
            options: CarouselOptions(
                autoPlay: false,
                enableInfiniteScroll:
                    week.days.entries.length > 1 ? true : false,
                enlargeCenterPage: true,
                height: 550,
                enlargeFactor: .2),
          ),
        ),
        buttonRow(week)
      ],
    );
  }

  Widget buttonRow(Week week) {
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    TextStyle buttonTextStyle = const TextStyle(color: Colors.white);
    ButtonStyle deleteButtonStyle =
        ButtonStyle(backgroundColor: MaterialStateProperty.all(secondaryColor));
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              context.go("/mealplanning/plan", extra: week);
            },
            child: Text(
              "Edit",
              style: buttonTextStyle,
            )),
        ElevatedButton(
            style: deleteButtonStyle,
            onPressed: () {
              weekRef.delete();
              context.go("/mealplanning");
            },
            child: Text(
              "Delete",
              style: buttonTextStyle,
            ))
      ],
    );
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
