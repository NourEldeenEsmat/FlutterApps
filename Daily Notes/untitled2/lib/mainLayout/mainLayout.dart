import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/mainLayout/componant/goalItem.dart';
import 'package:untitled2/mainLayout/cubit/main_cubit.dart';
import 'package:untitled2/mainLayout/cubit/main_state.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      MainCubit()
        ..inisql()
        ..getData(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Goals',
                  style: TextStyle(
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 37),
                ),
              ),
              backgroundColor: Colors.blue[900],
            ),
            body: ListView.builder(
                itemCount: MainCubit
                    .get(context)
                    .list
                    .length,
                itemBuilder: (context, index) =>
                    goalItem(
                      context,
                        MainCubit
                            .get(context)
                            .list[index]['id'],
                        MainCubit
                            .get(context)
                            .list[index]['name']
                    )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) =>
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.blue[900],
                                  height: 30,
                                  child: const Center(
                                    child: Text(
                                      'write your goal',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: MainCubit
                                      .get(context)
                                      .addTextController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    label: const Text('write here...'),
                                    // floatingLabelBehavior: FloatingLabelBehavior.never,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    contentPadding: const EdgeInsets.all(5),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green)),
                                          onPressed: () {
                                            MainCubit.get(context).insertData(
                                                MainCubit
                                                    .get(context)
                                                    .addTextController
                                                    .text
                                                    .toString());
                                            MainCubit.get(context).addTextController.text='';
                                            MainCubit.get(context).getData();
                                            Navigator.pop(context);
                                          },
                                          child: const Text('add')),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('cancel')),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
              },
              child: const Icon(
                Icons.add,
                size: 33,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
