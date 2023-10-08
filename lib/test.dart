import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      /**
       * chaild gza el ui 
       * =>
       * Model => dh class mn no3 el changeNotofiar 
       */
      create: (context) => Model(), // creat function mn nw3 el context !
      child: Scaffold(
        // chaild bea5d  **
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title:
              const Center(child: Text('ChangeNotifierProvider And Consumer')),
        ),
        body: Consumer<Model>(builder: (context, model, child) {
          //  Consumer<Model>  gza el ui el het3mla refresh < hna el class el feh el code >
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  model.name,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all((Colors.teal))),
                onPressed: () {
                  model.changeName();
                },
                child: const Text(
                  "Change Name !",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";
  changeName() {
    name = "Mary";
    notifyListeners();
  }
}
