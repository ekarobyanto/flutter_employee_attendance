import 'package:flutter/material.dart';
import 'package:user_attendance/widgets/text_field.dart';

class UsernameInputDialog extends StatelessWidget {
  const UsernameInputDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();

    return AlertDialog(
      title: const Text("Input Username"),
      content: AppTextField(
        controller: usernameController,
      ),
      actionsPadding: const EdgeInsets.all(5),
      actions: [
        TextButton(
          onPressed: () {
            final username = usernameController.text;
            if (username.isNotEmpty) {
              Navigator.pop(context, username);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Username cannot be empty")),
              );
            }
          },
          child: const Text("Save"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
