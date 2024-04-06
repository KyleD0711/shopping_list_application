import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/recipe_home_page.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/view_week.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';
import './plan_week.dart';

class WeekHomePage extends StatefulWidget {
  const WeekHomePage({super.key});

  @override
  State<WeekHomePage> createState() => _WeekHomePageState();
}

class _WeekHomePageState extends State<WeekHomePage> {
  // final Stream<List<Week>> _stream = WeekController().getStream();
  
  final WeekCollectionReference weeksRef = WeekService().getWeeks();

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Meal Planning"),
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [displayWeeks(), addButton()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.tab_outlined), label: "Recipes"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Theme.of(context).colorScheme.primary,), label: "Home")
              ],
              onTap: (value) {
                if (value == 0) {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecipeHomePage()));
                }
                else if (value == 1){
                  Navigator.of(context).pop();
                }
              },
            ),
          );
  }

  Widget displayWeeks() {
      return FirestoreBuilder(ref: weeksRef, builder: (BuildContext context, AsyncSnapshot<WeekQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return const Text('Loading data...');

        List<WeekQueryDocumentSnapshot> weeks = snapshot.requireData.docs;

        return Expanded(
              child: snapshot.hasData
                  ? ListView.separated(
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (_, index) => _toWidget(weeks[index].data),
                      separatorBuilder: (_, __) => const Divider(
                        color: Colors.transparent,
                      ),
                      itemCount: weeks.length,
                    )
                  : const Center(
                      child: Text("No results"),
                    ));
      });
  }

  Widget addButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary),
                fixedSize: MaterialStateProperty.all(
                    Size.fromWidth(MediaQuery.of(context).size.width))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PlanWeekPage()));
            },
            child: const Text("Plan Week",
                style: TextStyle(color: Colors.white))));
  }

  Widget _toWidget(Week week) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        child:
            Text(textAlign: TextAlign.center, "${formatDate(week.beginDate)} - ${formatDate(week.endDate)}", style: const TextStyle(fontSize: 25),),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewWeekPage(id :week.id)));
      },
    );
  }
}
