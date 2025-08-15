import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  final String countryCode;

  PhoneNumberInputFormatter(this.countryCode);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // เอาเฉพาะตัวเลข
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    // เติม country code ด้านหน้า
    if (!digits.startsWith(countryCode.replaceAll('+', ''))) {
      digits = countryCode.replaceAll('+', '') + digits;
    }

    // จัดรูปแบบ (ตัวอย่าง: +66 123-456-789)
    String formatted = '+${digits.substring(0, countryCode.length - 1)} ';
    String numberPart = digits.substring(countryCode.length - 1);

    for (int i = 0; i < numberPart.length; i++) {
      if (i == 3 || i == 6) formatted += '-';
      formatted += numberPart[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
