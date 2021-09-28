import 'package:flutter_todo/domain/task.dart';
import 'package:flutter_todo/domain/task_repository.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final TaskRepository _taskRepository = TaskRepository();
  final task = Task().obs;
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> save(String title, String content) async {
    Task task = await _taskRepository.save(title, content);
    if (task.id != null) {
      this.tasks.add(task);
    }
  }

  Future<void> findAll() async {
    List<Task> tasks = await _taskRepository.findAll();
    this.tasks.value = tasks;
  }

  Future<void> updateById(int id,
      {String? title, String? content, bool? completed}) async {
    print(id);
    Task task = await _taskRepository.updateById(
        id: id, title: title, content: content, completed: completed);
    if (task.id != null) {
      this.task.value = task;
      this.tasks.value = this.tasks.map((e) => e.id == id ? task : e).toList();
    }
  }

  Future<void> deleteById(int id) async {
    int result = await _taskRepository.deleteById(id);
    if (result == 1) {
      List<Task> tasks = this.tasks.where((task) => task.id != id).toList();
      this.tasks.value = tasks;
    }
  }

  Future<void> findById(int id) async {
    Task task = await _taskRepository.findById(id);
    if (task.id != null) {
      this.task.value = task;
    }
  }
}
