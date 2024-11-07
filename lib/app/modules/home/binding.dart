import 'package:get/get.dart';
import 'package:todolist/app/data/providers/task/prvider.dart';
import 'package:todolist/app/data/service/storage/repository.dart';
import 'package:todolist/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
