import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider_Todo.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo L!st'),
      ),
      body: Container(
        child: Column(children: <Widget>[
          TextField(
            controller: context.read<ProviderTodo>().title,
            decoration: const InputDecoration(
              hintText: "title",
            ),
          ),
          TextField(
            controller: context.read<ProviderTodo>().text,
            decoration: const InputDecoration(
              hintText: "Text",
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {
              // context.read<ProviderTodo>().addTodo(context);
              Provider.of<ProviderTodo>(context,listen: false).addTodo(context);
            },
          )
        ]),
      ),
    );
  }
}
