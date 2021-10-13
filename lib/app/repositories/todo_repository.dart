import 'package:dio/dio.dart';
import 'package:todo_app/app/models/todo_model.dart';

class TodoRepository {
  Dio dio;
  final String url = "https://jsonplaceholder.typicode.com/todos";

  TodoRepository({Dio client}) {
    dio = client ?? Dio();
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((item) => TodoModel.fromJson(item)).toList();
  }
}
