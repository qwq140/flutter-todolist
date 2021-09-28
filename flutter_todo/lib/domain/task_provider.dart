import 'package:get/get.dart';

const host = "http://172.30.1.45:8080";

class TaskProvider extends GetConnect {
  Future<Response> save(Map data) => post("$host/todo", data);
  Future<Response> findAll() => get("$host/todo");
  Future<Response> updateById(int id, Map data) => put("$host/todo/$id", data);
  Future<Response> deleteById(int id) => delete("$host/todo/$id");
  Future<Response> findById(int id) => get("$host/todo/$id");
}
