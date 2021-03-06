import 'package:bloc_counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, int state) {
              return Text(
                "Count Value : $state",
                style: TextStyle(fontSize: 30.0),
              );
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text(
                  "Increment",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  _counterBloc.add(CounterEvents.increment);
                },
              ),
              RaisedButton(
                child: Text(
                  "Decrement",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  _counterBloc.add(CounterEvents.decrement);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
