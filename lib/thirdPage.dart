

import 'package:counter_app_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
             heroTag: "increment",
            onPressed: () {
               Provider.of<CounterProvider>(context, listen: false).increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 18,),
           FloatingActionButton(
             heroTag: "decrement",
            onPressed: () {
            Provider.of<CounterProvider>(context, listen: false).decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Text(Provider.of<CounterProvider>(context).counter.toString()),
        ),
      ),
    );
  }
}
