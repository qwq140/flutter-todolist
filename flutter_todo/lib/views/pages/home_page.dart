import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/task_controller.dart';
import 'package:flutter_todo/views/pages/save_page.dart';
import 'package:flutter_todo/views/pages/update_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TaskController t = Get.put(TaskController());

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("오늘 할 일"),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SavePage());
        },
        child: Icon(Icons.add),
      ),
      body: Obx(
        () => RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            await t.findAll();
          },
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    await t.findById(t.tasks[index].id!);
                    Get.to(() => UpdatePage());
                  },
                  leading: Checkbox(
                    value: t.tasks[index].completed,
                    onChanged: (value) async {
                      await t.updateById(t.tasks[index].id!,
                          completed: t.tasks[index].completed);
                    },
                  ),
                  title: Text("${t.tasks[index].title}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      AlertDialog dialog = AlertDialog(
                        title: Text(
                          "작업 삭제하기",
                          style: TextStyle(fontSize: 15),
                        ),
                        content: Text(
                          "정말로 삭제하겠습니까?",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                await t.deleteById(t.tasks[index].id!);
                                Navigator.pop(context);
                              },
                              child: Text('예')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('아니요'))
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: t.tasks.length),
        ),
      ),
    );
  }
}
