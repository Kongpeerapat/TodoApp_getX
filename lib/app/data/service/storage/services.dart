import 'package:get/get.dart'; // นำเข้าแพ็คเกจ GetX
import 'package:get_storage/get_storage.dart'; // นำเข้า GetStorage สำหรับการเก็บข้อมูล
import 'package:todolist/app/core/utils/keys.dart'; // นำเข้าค่าคงที่ต่างๆ

class StorageService extends GetxService {
  late GetStorage _box; // ประกาศตัวแปรสำหรับเก็บ GetStorage

  Future<StorageService> init() async {
    _box = GetStorage(); // สร้างอินสแตนซ์ GetStorage
    // await _box.write(taskKey, []);
    await _box.writeIfNull(taskKey, []); // ถ้ายังไม่มีข้อมูลเก็บไว้ ให้เริ่มต้นเป็นลิสต์ว่าง
    return this;
  }

  T read<T>(String key) {
    return _box.read(key); // อ่านข้อมูลจาก storage ด้วย key ที่กำหนด
  }

  void write(String key, dynamic value) async {
    await _box.write(
        key, value); // เขียนข้อมูลลง storage ด้วย key และค่า value ที่กำหนด
  }
}
