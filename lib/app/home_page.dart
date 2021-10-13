import 'package:flutter/material.dart';
import 'package:todo_app/app/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  Widget _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) {},
            activeColor: Theme.of(context).primaryColor,
            checkColor: Theme.of(context).iconTheme.color,
          ),
          title: Text(todo.title),
        );
      },
    );
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _start() {
    return Container();
  }

  Widget _error() {
    return Center(
      child: RaisedButton(
        onPressed: () => controller.init(),
        child: Text("Buscar novamente"),
      ),
    );
  }

  Widget stateManager({HomeStates state}) {
    switch (state) {
      case HomeStates.error:
        return _error();
      case HomeStates.loading:
        return _loading();
      case HomeStates.start:
        return _start();
      case HomeStates.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Afazeres",
          style: Theme.of(context).appBarTheme.textTheme.bodyText1,
        ),
      ),
      body: AnimatedBuilder(
        animation: controller.states,
        builder: (context, child) {
          return stateManager(state: controller.states.value);
        },
      ),
    );
  }
}
