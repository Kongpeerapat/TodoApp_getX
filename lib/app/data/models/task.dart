import 'package:equatable/equatable.dart'; // นำเข้า Equatable เพื่อเปรียบเทียบวัตถุได้ง่าย

class Task extends Equatable { 
  final String title; // ชื่อของงาน
  final int icon; // ไอคอนของงาน
  final String color; // สีของงาน
  final List<dynamic>? todos; // รายการย่อยของงาน

  const Task(
      {required this.title,
      required this.color,
      required this.icon,
      this.todos});

  get value => null; // คอนสตรัคเตอร์ของ Task

 Task copyWith({
  String? title,
  int? icon,
  String? color,
  List<dynamic>? todos,
}) =>
    Task(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        todos: todos ?? this.todos);
 // สร้างสำเนา Task ใหม่โดยสามารถกำหนดฟิลด์บางฟิลด์ใหม่ได้

  factory Task.fromJson(Map<String, dynamic> json) => Task( 
        title: json['title'],
        icon: json['icon'],
        color: json['color'],
        todos: json['todos'],
      ); // ฟังก์ชันสร้าง Task จาก JSON

  Map<String, dynamic> tojson() => { 
        'title': title,
        'icon': icon,
        'color': color,
        'todos': todos,
      }; // แปลง Task เป็น JSON

  @override
  List<Object?> get props => [title, icon, color]; // กำหนดฟิลด์สำหรับการเปรียบเทียบ
}
