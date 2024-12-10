import 'package:counter_getx/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final counterC = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
          theme: counterC.isDark.value ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  final c = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Counter"),
      ),
      body: Center(
          child: Obx(
        () => Text(
          "ANGKA ${c.counter}",
          style: TextStyle(fontSize: 35),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.changeTheme(),
      ),
    );
  }
}
