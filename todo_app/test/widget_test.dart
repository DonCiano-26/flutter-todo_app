import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/controllers/todo_controller.dart';

void main() {
  testWidgets('Add and remove a to-do', (WidgetTester tester) async {
    // Initialize the controller
    Get.put(TodoController());

    // Build the app
    await tester.pumpWidget(const TodoApp());

    // Verify the list is empty initially
    expect(find.byType(ListTile), findsNothing);

    // Enter a new task
    await tester.enterText(find.byType(TextField), 'Buy groceries');

    // Tap the 'Add Task' button
    await tester.tap(find.text('Add Task'));
    await tester.pump(); // Rebuild UI

    // Verify the new task is added
    expect(find.text('Buy groceries'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);

    // Delete the task
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify the task is removed
    expect(find.text('Buy groceries'), findsNothing);
    expect(find.byType(ListTile), findsNothing);
  });
}
