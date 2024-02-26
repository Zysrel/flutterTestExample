import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertestexample/task_repository.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late TaskRepository taskRepository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    taskRepository = TaskRepository(client: mockHttpClient);
  });

  test(
    'Given Task Repository is instantiated, when fetchTasks is called and return is 200, then a Tasks object should be returned',
    () async {
      String url = 'https://jsonplaceholder.typicode.com/todos';

      when(() => mockHttpClient.get(Uri.parse(url))).thenAnswer(
        (_) => Future.delayed(
          Duration.zero,
          () => Response('''
[
  {
    "userId": 1,
    "id": 1,
    "title": "Sample Task 1",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "Sample Task 2",
    "completed": false
  }
]
''', 200),
        ),
      );

      Tasks tasks = await taskRepository.fetchTasks();
      expect(tasks, isA<Tasks>());

      verify(() => mockHttpClient.get(Uri.parse(url))).called(1);
    },
  );

  test(
    'Given Task Repository is instantiated, when fetchTasks is called and return is 404, then an Exception should be thrown',
    () async {
      String url = 'https://jsonplaceholder.typicode.com/todos';

      when(() => mockHttpClient.get(Uri.parse(url))).thenAnswer(
        (_) => Future.delayed(
          Duration.zero,
          () => Response('', 404),
        ),
      );

      expect(taskRepository.fetchTasks(), throwsException);
    },
  );
}