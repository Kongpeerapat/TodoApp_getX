import 'package:todolist/app/data/models/task.dart'; // นำเข้าโมเดล Task
import 'package:todolist/app/data/providers/task/prvider.dart'; // นำเข้า TaskProvider สำหรับจัดการข้อมูล

class TaskRepository { 
  TaskProvider taskProvider; // ประกาศอินสแตนซ์ TaskProvider

  TaskRepository({required this.taskProvider}); // คอนสตรัคเตอร์ที่รับ TaskProvider

  List<Task> readTasks() => taskProvider.readTasks(); // อ่านรายการงานจาก TaskProvider
  void writeTasks(List<Task> task) => taskProvider.writeTasks(task); // เขียนรายการงานลง TaskProvider
}
