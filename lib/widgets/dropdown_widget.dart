import 'package:flutter/material.dart';

// ignore: use_function_type_syntax_for_parameters
Widget customDropDown(List<String>? items, String? value, void onChange(val)) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(5)),
    child: DropdownButton<String>(
      value: value,
      onChanged: (val) {
        onChange(val);
      },
      items: items?.map<DropdownMenuItem<String>>(
            (String val) {
              return DropdownMenuItem(
                child: Text(val),
                value: val,
              );
            },
          ).toList() ??
          [],
    ),
  );
}
