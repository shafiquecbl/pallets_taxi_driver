import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    var selectionIndex = newValue.selection.end;

    var newTextWithSpaces = '';
    for (int i = 0; i < newText.length; i++) {
      if (i != 0 && i % 4 == 0) {
        newTextWithSpaces += ' ';
        if (i < selectionIndex) {
          selectionIndex++;
        }
      }
      newTextWithSpaces += newText[i];
    }

    return TextEditingValue(
      text: newTextWithSpaces,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final List<int> dateText = newValue.text.runes.toList();

    if (dateText.length > 8) {
      return oldValue; // Don't allow more than 8 digits (DDMMYYYY)
    }

    String formattedDate = '';

    for (int i = 0; i < dateText.length; i++) {
      if (i == 2 || i == 4) {
        formattedDate += '-'; // Add '-' after the 2nd and 4th digits
      }
      formattedDate += String.fromCharCode(dateText[i]);
    }

    return TextEditingValue(
      text: formattedDate,
      selection: TextSelection.collapsed(offset: formattedDate.length),
    );
  }
}
