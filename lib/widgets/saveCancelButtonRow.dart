import 'package:flutter/material.dart';

class SaveCancelRow extends StatelessWidget {
  final void Function() handleSave;
  final void Function() handleCancel;

  const SaveCancelRow(
      {super.key, required this.handleSave, required this.handleCancel});

  @override
  Widget build(BuildContext context) {
    TextStyle saveButtonStyle = const TextStyle(color: Colors.black);
    TextStyle cancelButtonStyle = const TextStyle(color: Colors.black);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
              onPressed: handleSave,
              child: Text(
                "Save",
                style: saveButtonStyle,
              )),
          ElevatedButton(
              onPressed: handleCancel,
              child: Text(
                "Cancel",
                style: cancelButtonStyle,
              ))
        ],
      ),
    );
  }
}
