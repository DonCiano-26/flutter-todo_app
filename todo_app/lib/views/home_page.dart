import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../widgets/todo_list.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController()); 
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Errands', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task...',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                todoController.addTodo(_controller.text);
                _controller.clear();
              },
              child: const Icon(Icons.add, size: 24, color: Colors.white),
            ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: TodoList()),           ],
        ),
      ),
    );
  }
}
