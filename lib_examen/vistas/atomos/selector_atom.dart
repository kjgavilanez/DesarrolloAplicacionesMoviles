import 'package:flutter/material.dart';

class SelectorAtom extends StatelessWidget {
  const SelectorAtom({
    super.key,
    required this.value,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  final String? value;
  final String label;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}