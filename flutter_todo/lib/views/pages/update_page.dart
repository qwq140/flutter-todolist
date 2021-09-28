import 'package:flutter/material.dart';
import 'package:flutter_todo/controller/task_controller.dart';
import 'package:flutter_todo/util/validators_util.dart';
import 'package:flutter_todo/views/components/custom_elevated_button.dart';
import 'package:flutter_todo/views/components/custom_text_area.dart';
import 'package:flutter_todo/views/components/custom_text_field.dart';
import 'package:flutter_todo/views/pages/home_page.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TaskController t = Get.find();
    _title.text = "${t.task.value.title}";
    _content.text = "${t.task.value.content}";

    return Scaffold(
      appBar: AppBar(
        title: Text("오늘 할 일"),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextField(
                    hint: "작업 추가",
                    controller: _title,
                    funValidator: validateTitle(),
                  ),
                  CustomTextArea(
                    hint: "메모 추가",
                    controller: _content,
                    funValidator: validateContent(),
                  ),
                  CustomElevatedButton(
                    text: "수정",
                    funPageRoute: () async {
                      if (_formKey.currentState!.validate()) {
                        await t.updateById(t.task.value.id!,
                            title: _title.text, content: _content.text);
                        Get.off(() => HomePage());
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
