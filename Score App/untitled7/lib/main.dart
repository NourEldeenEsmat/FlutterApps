import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/cubit/counter_cubit.dart';
import 'package:untitled7/cubit/counter_state.dart';

void main() {
  runApp(pointsCounter());
}

class pointsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(newObject()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  // int teamApoints = 0;
  // int teamBpoints = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit,CounterState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Points Counter'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Team A',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '${ BlocProvider.of<CounterCubit>(context).teamAPoints}',
                        style: TextStyle(
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(8),
                          primary: Colors.orange,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).TeamIncrement('A', 1);
                        },
                        child: Text(
                          'Add 1 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).TeamIncrement('A', 2);
                        },
                        child: Text(
                          'Add 2 Point',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).TeamIncrement('A', 3);
                        },
                        child: Text(
                          'Add 3 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  child: VerticalDivider(
                    indent: 50,
                    endIndent: 50,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Team B',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '${
                          BlocProvider.of<CounterCubit>(context).teamBPoints}',
                        style: TextStyle(
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(8),
                          primary: Colors.orange,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).TeamIncrement('B', 1);
                        },
                        child: Text(
                          'Add 1 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).TeamIncrement('B', 2);
                        },
                        child: Text(
                          'Add 2 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).TeamIncrement('B', 3);
                        },
                        child: Text(
                          'Add 3 Point ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8),
                primary: Colors.orange,
                minimumSize: Size(150, 50),
              ),
              onPressed: () {},
              child: Text(
                'Reset',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    }, listener: (context, state) {
      // if (state is CounterAIncrementState) {
      //   teamApoints = BlocProvider.of<CounterCubit>(context).teamAPoints;
      // }
      // else if (state is CounterBIncrementState){
      //   teamBpoints = BlocProvider.of<CounterCubit>(context).teamBPoints;
      // }
    });
  }
}
