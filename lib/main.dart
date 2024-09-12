import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/todo_page.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: const MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: ToDo(),
      ),
    );
  }
}
