import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/add_recipe.dart';
import 'package:shopping_list_application/services/recipe_service.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';
import 'package:shopping_list_application/utils/validators/forms/form_validators.dart';
import 'package:shopping_list_application/widgets/SelectableListView.dart';
import 'package:shopping_list_application/widgets/saveCancelButtonRow.dart';

class PlanWeekPage extends StatefulWidget {
  static const cardPadding =
      EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0);
  static const double dayCardSize = 150;

  const PlanWeekPage({super.key, this.week});

  final Week? week;

  @override
  State<PlanWeekPage> createState() => _PlanWeekPageState();
}

class _PlanWeekPageState extends State<PlanWeekPage> {
  final Map<DateTime, List<Map<String, String>>> days = {};
  DateTime? beginDate;
  DateTime? endDate;
  @override
  void initState() {
    super.initState();
    days.addAll(widget.week?.days ?? {});
    beginDate = widget.week?.beginDate;
    endDate = widget.week?.endDate;
  }

  final WeekCollectionReference weekRef = WeekService().getWeeks();

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    bool datesValid = areDatesValid(beginDate, endDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            dateCard(beginDate, "Begin Date"),
            dateCard(endDate, "End Date")
          ],
        ),
        Expanded(
          child: datesValid
              ? CarouselSlider(
                  items: getAllDayCards(days!),
                  options: CarouselOptions(
                      autoPlay: false,
                      enableInfiniteScroll:
                          days.entries.length > 1 ? true : false,
                      enlargeCenterPage: true,
                      height: 550,
                      enlargeFactor: .2),
                )
              : const Text(
                  "Please select valid dates",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
        ),
        saveCancelRow()
      ],
    );
  }

  bool areDatesValid(DateTime? beginDate, DateTime? endDate) {
    if (beginDate == null || endDate == null) {
      return false;
    }
    if (beginDate.isAfter(endDate)) {
      return false;
    }

    return true;
  }

  void calcDayCards(DateTime? startDate, DateTime? finishDate) {
    if (startDate == null || finishDate == null) {
      return;
    } else if (startDate.isAfter(finishDate)) {
      return;
    }

    Map<DateTime, List<Map<String, String>>> newDays = {};
    Duration difference = finishDate.difference(startDate);
    for (int i = 0; i <= difference.inDays; i++) {
      if (days.containsKey(startDate.add(Duration(days: i)))) {
        newDays.addEntries([
          MapEntry(startDate.add(Duration(days: i)),
              days[startDate.add(Duration(days: i))]!)
        ]);
      } else {
        newDays.addEntries([MapEntry(startDate.add(Duration(days: i)), [])]);
      }
    }
    days.clear();
    days.addAll(newDays);
  }

  List<Widget> getAllDayCards(Map<DateTime, List<Map<String, String>>> days) {
    List<Widget> dayCards = [];
    List<DateTime> keys = days.keys.toList();
    keys.sort((x, y) => x.compareTo(y));
    keys.forEach((element) {
      dayCards.add(dayCard(
          getDayOfWeek(element), formatDate(element), days[element] ?? []));
    });
    return dayCards;
  }

  Widget dayCard(String name, String date, List<Map<String, String>> weeks) {
    return Padding(
      padding: PlanWeekPage.cardPadding,
      child: SizedBox(
        height: PlanWeekPage.dayCardSize,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Add Recipe",
                      style: TextStyle(color: Colors.black)),
                  onPressed: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectableListView(
                            itemRef: RecipeService().getRecipes(),
                            screenName: name,
                            selectedItems: weeks,
                            bottomActions: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AddRecipePage()));
                                },
                              )
                            ],
                            itemValidator: (value) {
                              return validateNonEmptyMessage(value);
                            })));
                    setState(() {});
                  },
                ),
              )
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
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () async {
                      date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year),
                          lastDate: DateTime(DateTime.now().year + 1),
                          currentDate: DateTime.now(),
                          confirmText: "Confirm",
                          cancelText: "Cancel",
                          switchToCalendarEntryModeIcon:
                              const Icon(Icons.date_range));
                      setState(() {
                        if (title == "Begin Date") {
                          beginDate = date;
                        } else if (title == "End Date") {
                          endDate = date;
                        }
                        calcDayCards(beginDate, endDate);
                      });
                    },
                    icon: const Icon(Icons.add),
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
                    ? "${getDayOfWeek(date!)}\n${formatDate(date!)}"
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

  Widget saveCancelRow() {
    return SaveCancelRow(
      handleSave: handleSave,
      handleCancel: handleCancel,
    );
  }

  void handleSave() {
    if (beginDate == null || endDate == null) {
      showDialog(
          context: context,
          builder: (context) => errorPopUp("Dates can't be null"));
    } else {
      if (widget.week == null) {
        weekRef.add(Week(beginDate: beginDate!, endDate: endDate!, days: days));
      } else {
        weekRef
            .doc(widget.week!.id)
            .set(Week(beginDate: beginDate!, endDate: endDate!, days: days));
      }

      context.pop();
    }
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

  void handleCancel() {
    context.pop();
  }
}
