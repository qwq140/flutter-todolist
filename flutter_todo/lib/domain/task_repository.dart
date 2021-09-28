import 'package:flutter_todo/controller/dto/cmRespDto.dart';
import 'package:flutter_todo/controller/dto/saveReqDto.dart';
import 'package:flutter_todo/controller/dto/updateReqDto.dart';
import 'package:flutter_todo/domain/task.dart';
import 'package:flutter_todo/domain/task_provider.dart';
import 'package:get/get.dart';

class TaskRepository {
  final TaskProvider _taskProvider = TaskProvider();

  Future<Task> save(String title, String content) async {
    SaveReqDto saveReqDto = SaveReqDto(title: title, content: content);

    Response response = await _taskProvider.save(saveReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.statusCode == 1) {
      Task task = Task.fromJson(cmRespDto.data);
      return task;
    } else {
      return Task();
    }
  }

  Future<List<Task>> findAll() async {
    Response response = await _taskProvider.findAll();
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.statusCode == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Task> tasks = temp.map((task) => Task.fromJson(task)).toList();
      return tasks;
    } else {
      return <Task>[];
    }
  }

  Future<Task> updateById(
      {required int id,
      String? title,
      String? content,
      bool? completed}) async {
    UpdateReqDto updateReqDto = UpdateReqDto(
        title: title,
        content: content,
        completed: completed == null ? null : !completed);
    Response response =
        await _taskProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.statusCode == 1) {
      Task task = Task.fromJson(cmRespDto.data);
      return task;
    } else {
      return Task();
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _taskProvider.deleteById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.statusCode == 1) {
      return 1;
    } else {
      return -1;
    }
  }

  Future<Task> findById(int id) async {
    Response response = await _taskProvider.findById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.statusCode == 1) {
      print(cmRespDto.data);
      Task task = Task.fromJson(cmRespDto.data);
      return task;
    } else {
      return Task();
    }
  }
}
