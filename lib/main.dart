import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider_Todo.dart';

import 'addtext.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProviderTodo>(
      create: (_) => ProviderTodo(),
      child: const MaterialApp(
        home: Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Center(
                child: Text(
                  context.watch<ProviderTodo>().todos[index].title!,
                ),
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
          ]);
        },
        itemCount: context.watch<ProviderTodo>().todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddTodo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
