import 'package:flutter/material.dart'; // นำเข้าแพ็คเกจ material ของ Flutter
import 'package:get/get.dart'; // นำเข้า GetX สำหรับการจัดการสถานะ

extension PercentSized on double {
  double get hp => (Get.height * (this / 100)); // คำนวณความสูงเป็นเปอร์เซ็นต์ตามความสูงของหน้าจอ
  double get wp => (Get.width * (this / 100)); // คำนวณความกว้างเป็นเปอร์เซ็นต์ตามความกว้างของหน้าจอ
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3); // คำนวณขนาดตัวอักษรที่ปรับขนาดตามความกว้างหน้าจอ
}

extension HexColor on Color { 
  static Color fromHex(String hexString) { // แปลงสตริงสี Hex เป็นวัตถุ Color
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
