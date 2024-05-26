import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/counter_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BlocPatternApp());
}

class BlocPatternApp extends StatelessWidget {
  const BlocPatternApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 55, 239, 129)),
        useMaterial3: true,
      ),
      home: CounterPage(title: 'Counter Page'),
    );
  }
}


class CounterPage extends StatelessWidget {
  CounterPage({super.key, required String title});

  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern"),
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 55, 239, 129),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  tooltip: "Decrement",
                  focusColor: Colors.greenAccent.shade700,
                  onPressed: () => _counterBloc.counterEventSink.add(DecrementEvent()),
                  child: const Icon(Icons.remove)),
                const SizedBox(width: 20),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _counterBloc.counterStateStream, 
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(fontSize: 18),
                    );
                  }
                ),
                const SizedBox(width: 20),
                FloatingActionButton.small(
                  tooltip: "Increment",
                  focusColor: Colors.greenAccent.shade700,
                  onPressed: ()=> _counterBloc.counterEventSink.add(IncrementEvent()),
                  child: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ), // 
      );
  }
}