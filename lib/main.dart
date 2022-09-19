import 'package:counter_app_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<CounterProvider>(context).counter;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App using Provider"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NextPage();
                }));
              },
              child: const Text("Next Page"),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              Provider.of<CounterProvider>(context, listen: false).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () {
              // TODO: call decrement method from CounterProvider
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Page"),
      ),
      body: Center(
        child: Text(
          Provider.of<CounterProvider>(context).counter.toString()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterProvider>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
