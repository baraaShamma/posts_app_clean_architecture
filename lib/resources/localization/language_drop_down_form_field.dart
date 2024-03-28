import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'language_manager.dart';

class LanguageDropDownFormFieldWeb extends StatefulWidget {
  final List<LanguageType> items;
  final String label;
  final void Function(LanguageType selectedItem) onChanged;

  const LanguageDropDownFormFieldWeb({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
  });

  @override
  State<LanguageDropDownFormFieldWeb> createState() =>
      _LanguageDropDownFormFieldStateWeb();
}

class _LanguageDropDownFormFieldStateWeb
    extends State<LanguageDropDownFormFieldWeb> {
  LanguageType? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField2<LanguageType>(
        iconStyleData: const IconStyleData(
            icon: Visibility(
                visible: false, child: Icon(Icons.keyboard_arrow_down)),
            iconSize: 1,
            iconEnabledColor: Colors.red,
            iconDisabledColor: Colors.black),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        ),
        isExpanded: true,
        hint: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<LanguageType>(
                  value: item,
                  child: Text(
                    item.getName(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onChanged(value as LanguageType);
        },
        buttonStyleData: const ButtonStyleData(
          // height: AppSizeH.s48,
          height: 48,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
