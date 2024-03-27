import 'package:flutter/material.dart';

class InstructionsPage extends StatefulWidget {
  const InstructionsPage({super.key, this.instructions});
  final String? instructions;

  @override
  State<InstructionsPage> createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  late final _instructionsController =
      TextEditingController(text: widget.instructions ?? "");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Instructions"),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
            BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel")
          ],
          onTap: (value) {
            if (value == 1) {
              Navigator.of(context).pop();
            } else if (value == 0) {
              Navigator.of(context).pop(_instructionsController.text);
            }
          },
        ),
        // body: Form(
        //   child: Column(
        //     children: [
        //       descriptionCard(),
        //       ingredientsCard(),
        //       instructionsCard(),
        //       cookAndPrepTimeCards(),
        //       recipesCard()
        //     ],
        //   ),
        // )
        body: Column(
          children: [
            Expanded(
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _instructionsController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(hintText: "Input")),
                  )),
            ),
          ],
        ));
  }
}
