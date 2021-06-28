import 'package:flutter/material.dart';
import 'package:ivedigital/core/app_text_style.dart';

class InputText extends StatelessWidget {
  final String placeHolder;
  final String hint;

  const InputText({Key? key, required this.placeHolder, required this.hint})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            placeHolder,
            style: AppTextStyles.heading16,
          ),
          SizedBox(height: 3),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
            ),
          )
        ],
      ),
    );
  }
}
