import 'package:flutter/material.dart';

import '../cubit/main_cubit.dart';

Widget goalItem(context, id, goalName) => Container(
      height: 80,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(2, 2))
          ],
          gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.blue,
            Colors.blue[900]!,
            Colors.blue,
          ])),
      child: InkWell(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.blue[900],
                            height: 30,
                            child: const Center(
                              child: Text(
                                'change',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // TextFormField(
                          //   controller: MainCubit.get(context)
                          //       .addTextController,
                          //   decoration: InputDecoration(
                          //     filled: true,
                          //     fillColor: Colors.white,
                          //     label: Text('write here...'),
                          //     // floatingLabelBehavior: FloatingLabelBehavior.never,
                          //     border: OutlineInputBorder(
                          //         borderRadius:
                          //         BorderRadius.circular(10)),
                          //     contentPadding: EdgeInsets.all(5),
                          //   ),
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                    onPressed: () {
                                      MainCubit.get(context).removeData(id);
                                      MainCubit.get(context).getData();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('remove')),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueGrey)),
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
        child: Center(
          child: Row(
            children: [
              Text(
                '$id',
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                ' : ',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '$goalName',
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
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
                                'change',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller:
                                MainCubit.get(context).addTextController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: const Text('write here...'),
                              // floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
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
                                                Colors.grey)),
                                    onPressed: () {
                                      MainCubit.get(context).updateData(
                                          MainCubit.get(context)
                                              .addTextController
                                              .text
                                              .toString(),
                                          id);
                                      MainCubit.get(context).getData();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('edit')),
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
      ),
    );
