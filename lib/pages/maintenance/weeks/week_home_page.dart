import 'package:flutter/material.dart';
import 'package:shopping_list_application/controllers/week_controller.dart';
import 'package:shopping_list_application/models/week.dart';
import './plan_week.dart';

class WeekHomePage extends StatefulWidget {
  const WeekHomePage({super.key});

  @override
  State<WeekHomePage> createState() => _WeekHomePageState();
}

class _WeekHomePageState extends State<WeekHomePage> {
  final Stream<List<Week>> _stream = WeekController().getStream();

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
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.set_meal), label: "Meal Planning")
              ],
              onTap: (value) {
                if (value == 0) {
                  Navigator.of(context).pop();
                }
              },
            ),
          );
  }

  Widget displayWeeks() {
    return StreamBuilder<List<Week>>(
        stream: _stream,
        builder: ((context, snapshot) {
          print("Snapshot data: ${snapshot.data}");
          final weeks = snapshot.data ?? [];
          return Expanded(
              child: snapshot.hasData
                  ? ListView.separated(
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (_, index) => _toWidget(weeks[index]),
                      separatorBuilder: (_, __) => const Divider(
                        color: Colors.transparent,
                      ),
                      itemCount: weeks.length,
                    )
                  : const Center(
                      child: Text("No results"),
                    ));
        }));
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
        child:
            Text("${week.beginDate.toString()} - ${week.endDate.toString()}"),
      ),
      onTap: () {},
    );
  }
}
