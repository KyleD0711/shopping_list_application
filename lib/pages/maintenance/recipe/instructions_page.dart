import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/widgets/saveCancelButtonRow.dart';

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
    return Column(
      children: [instructionsInput(), saveCancelRow()],
    );
  }

  Widget instructionsInput() {
    return Expanded(
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
    );
  }

  Widget saveCancelRow() {
    return SaveCancelRow(handleSave: () {
      context.pop(_instructionsController.text);
    }, handleCancel: () {
      context.pop();
    });
  }
}
