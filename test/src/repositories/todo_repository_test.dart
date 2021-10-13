import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/repositories/todo_repository.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repository = TodoRepository(client: dio);

  test("Deve trazer uma lista de TodoModel", () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: jsonDecode(jsonData),
      ),
    );

    final list = await repository.fetchTodos();
    print(list[0].title);
    expect(list[1].title, "quis ut nam facilis et officia qui");
  });
}

String jsonData = '''[
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  }
]''';
