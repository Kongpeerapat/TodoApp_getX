import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist/app/core/utils/extensions.dart';
import 'package:todolist/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  DoingList({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
        ? Column(
            children: [
              Image.asset(
                "assets/images/task.jpg",
                fit: BoxFit.cover,
                width: 65.0.wp,
              ),
              Text(
                "Add Task",
                style:
                    TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.bold),
              )
            ],
          )
        : Expanded(
            // ใช้ Expanded ครอบ ListView
            child: ListView(
              shrinkWrap: true,
              children: [
                ...homeCtrl.doingTodos
                    .map(
                      (element) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.0.wp,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => const Color.fromARGB(
                                          255, 251, 251, 251)),
                                  value: element['done'],
                                  onChanged: (value) {
                                    homeCtrl.doneTodo(element['title']);
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0.wp, vertical: 4.0.wp),
                              child: Text(
                                element['title'],
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
                if (homeCtrl.doingTodos.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child: const Divider(thickness: 2),
                  )
              ],
            ),
          ));
  }
}
