import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/models/todo_model.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    final titleEditingController = TextEditingController();
    final descriptionEditingController = TextEditingController(text: '');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        titleSpacing: 2,
        centerTitle: true,
        bottomOpacity: 40,
        backgroundColor:  Colors.green[300],
        foregroundColor: Colors.black,
        title: const Text(
          'To Do App',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          showModalBottomSheet(
            shape: const LinearBorder(),
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Task Title',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      TextField(
                        autofocus: true,
                        controller: titleEditingController,
                        decoration: InputDecoration(
                          hintText: 'Add Task Name..',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        textAlign: TextAlign.left,
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      TextField(
                        
                        maxLines: null,
                        controller: descriptionEditingController,
                        decoration: InputDecoration(
                          hintText: 'Add Description..',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TodoCubit>().addTodo(
                                titleEditingController.text.trim(),
                                descriptionEditingController.text.trim(),
                              );
                          Navigator.of(context).pop();
                          titleEditingController.clear();
                          descriptionEditingController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const LinearBorder(),
                          backgroundColor: Colors.green[900],
                        ),
                        child: const Text('Create',style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: 'Add Task',
        backgroundColor:  Colors.green[300],
        foregroundColor: Colors.black,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200),
        ),
        child: const Icon(
          Icons.add,
          weight: 20,
        ),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Card(
                elevation: 8.0,
                shape: const LinearBorder(
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  titleTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  subtitleTextStyle:
                      TextStyle(color: Colors.grey[800], fontSize: 12),
                  title: Text(todo.name),
                  subtitle: Text(todo.description),
                ),
              );
            },
            itemCount: todos.length,
          );
        },
      ),
    );
  }
}
