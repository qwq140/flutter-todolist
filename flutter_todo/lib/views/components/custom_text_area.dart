import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final controller;
  final funValidator;

  const CustomTextArea({
    required this.hint,
    required this.funValidator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: 10,
        controller: controller, // null도 받을 수 있는 타입이라 required를 안해도 오류 안남
        validator: funValidator,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
