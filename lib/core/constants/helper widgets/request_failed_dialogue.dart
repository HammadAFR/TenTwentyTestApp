import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles.dart';

class RequestFailedDialog extends StatelessWidget {
  const RequestFailedDialog({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: poppinsNormalText(text: 'Request Failed'),
      content: Text(errorMessage),
      actions: [
        ElevatedButton(
          // style: ElevatedButton.styleFrom(
          //   primary: primaryBlueColor
          // ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('ok'.tr),
        ),
      ],
    );
  }
}
