import 'dart:html';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/controllers/home_controller.dart';
import 'package:todo_app/app/models/todo_model.dart';
import 'package:todo_app/app/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);

  test('Deve preencher a variavel todo', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await controller.init();
    expect(controller.todos.isNotEmpty, true);
  });
}
