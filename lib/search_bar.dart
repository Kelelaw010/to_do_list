import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'yooo cari tugasmu disini......',
        // prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
