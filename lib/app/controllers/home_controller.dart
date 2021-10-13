import 'package:flutter/cupertino.dart';
import 'package:todo_app/app/models/todo_model.dart';
import 'package:todo_app/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository repository;
  final states = ValueNotifier<HomeStates>(HomeStates.start);

  HomeController([TodoRepository repository])
      : repository = repository ?? TodoRepository();

  Future<void> init() async {
    states.value = HomeStates.loading;
    try {
      todos = await repository.fetchTodos();
      states.value = HomeStates.success;
    } catch (e) {
      states.value = HomeStates.error;
    }
  }
}

enum HomeStates { start, loading, success, error }
