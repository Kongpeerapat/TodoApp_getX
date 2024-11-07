import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist/app/core/utils/extensions.dart';
import 'package:todolist/app/modules/home/controller.dart';

class AddDialog extends StatelessWidget {
  final homeCtl = Get.find<HomeController>();
  AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Form(
          key: homeCtl.formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(3.0.wp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                        homeCtl.editCtrl.clear();
                        homeCtl.changTask(null);
                      },
                      icon: Icon(Icons.close),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        if (homeCtl.formKey.currentState!.validate()) {
                          if (homeCtl.task.value == null) {
                            EasyLoading.showError("Please select a task type");
                          } else {
                            var success = homeCtl.updateTask(
                              homeCtl.task.value!,
                              homeCtl.editCtrl.text,
                            );

                            if (success) {
                              EasyLoading.showSuccess(
                                  "Todo item added successfully");
                              Get.back();
                              homeCtl.changTask(null);
                              homeCtl.editCtrl.clear();
                            } else {
                              EasyLoading.showError("Todo item already exists");
                            }
                          }
                        }
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 14.0.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: Text(
                  "New Task",
                  style:
                      TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: TextFormField(
                  controller: homeCtl.editCtrl,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                  ),
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Pless enter your todo item";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 5.0.wp, left: 5.0.wp, right: 5.0.wp, bottom: 2.0.wp),
                child: Text(
                  "Add to",
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              ...homeCtl.tasks
                  .map(
                    (element) => Obx(
                      () => InkWell(
                        onTap: () => homeCtl.changTask(element),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0.wp, horizontal: 5.0.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconData(
                                      element.icon,
                                      fontFamily: "MaterialIcons",
                                    ),
                                    color: HexColor.fromHex(element.color),
                                  ),
                                  Text(
                                    element.title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              if (homeCtl.task.value == element)
                                const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
