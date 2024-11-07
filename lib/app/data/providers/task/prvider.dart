import 'dart:convert'; // นำเข้า json encoder และ decoder
import 'package:get/get.dart'; // นำเข้าแพ็คเกจ GetX
import 'package:get/get_core/src/get_main.dart'; // นำเข้า core functions ของ GetX
import 'package:todolist/app/core/utils/keys.dart'; // นำเข้าค่าคงที่ต่างๆ
import 'package:todolist/app/data/models/task.dart'; // นำเข้าโมเดล Task
import 'package:todolist/app/data/service/storage/services.dart'; // นำเข้า StorageService

class TaskProvider {
  final _storage = Get.find<StorageService>(); // เรียกใช้ StorageService

  // {'task': [{
  //   'title' : 'Work',
  //   'color' : '#ff123456',
  //   'icon': 0xe123
  // }]}

  List<Task> readTasks() {
    var tasks = <Task>[]; // กำหนดลิสต์งานว่างๆ
    jsonDecode(_storage.read(taskKey).toString()).forEach((e) =>
        tasks.add(Task.fromJson(e))); // แปลงข้อมูล JSON ที่เก็บไว้เป็นลิสต์งาน
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    //  _storage.write(taskKey, jsonEncode(tasks)); // แปลงลิสต์งานเป็น JSON และเก็บลง storage
    _storage.write(
        taskKey, jsonEncode(tasks.map((task) => task.tojson()).toList()));
  }
}
