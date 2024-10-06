import 'package:flutter/material.dart';
import 'fibonacci.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late TextEditingController _datoController;
  final Fibonacci fib = Fibonacci();

  @override
  Widget build(BuildContext context) {
    _datoController = TextEditingController(text: '');
    getFibonacciSerie() {
      fib.fibonacciInit(1, 1); // Initialize the serie
      int current = fib.fibonacciCurrent(); // get the first number
      _datoController.text += ('${fib.fibonacciIndex()}: $current\n');
      while (fib.fibonacciNext() == 1) {
        current = fib.fibonacciCurrent(); // get all the other numbers
        _datoController.text += ('${fib.fibonacciIndex()}: $current\n');
        print('${fib.fibonacciIndex()}: $current');
      }
      _datoController.text +=
          ('${fib.fibonacciIndex() + 1} Fibonacci sequence values fit in an unsigned 64-bit integer');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Fibonacci with FFI')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  getFibonacciSerie();
                },
                child: const Text('Get Fibonacci Serie'),
              ),
              const SizedBox(height: 5),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _datoController,
                    maxLines: null,
                    expands: true,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: '',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
