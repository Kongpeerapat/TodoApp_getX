import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/data/service/storage/services.dart';
import 'package:todolist/app/modules/home/binding.dart';
import 'package:todolist/app/modules/home/view.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  await GetStorage.init(); // เริ่มต้น GetStorage สำหรับการเก็บข้อมูลแบบถาวร
  await Get.putAsync(() => StorageService()
      .init()); // เริ่มต้นใช้งาน StorageService และเพิ่มเข้าไปใน GetX
  runApp(const MyApp()); // เริ่มต้นแอป Flutter โดยใช้ MyApp เป็นวิดเจ็ตหลัก
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // กำหนดวิดเจ็ต MyApp เป็น Stateless

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // ใช้ GetMaterialApp เพื่อการจัดการเส้นทางและสถานะใน GetX
        title: 'To do List using GatX',
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        initialBinding: HomeBinding(),
        builder: EasyLoading.init(),
        );
  }
}
