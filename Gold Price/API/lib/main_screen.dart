import 'package:api/cubit/cubit.dart';
import 'package:api/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context)=>MainCubit()..getGoldPrice()..getSilverPrice(),
    child: BlocConsumer<MainCubit,States>(
        listener:(context,state){

        },
      builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.yellow[300]!.withOpacity(.5),
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Center(child: Text('TODAY PRICE')),
            ),
            body: Container(
              color: Colors.black,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/R.png'),
                        height: 160,
                        width: 160,
                      ),
                      Text(
                        'Gold',
                        style: TextStyle(
                          color: Colors.yellow[700]!.withOpacity(.7),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('${MainCubit.get(context).goldi} ₤',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/R (1).png'),
                        height: 160,
                        width: 160,
                      ),
                      Text('Selver',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),),
                      Text('${MainCubit.get(context).Selveri} ₤',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  ),
                ],
              ),
            ),
          );
      },

    ),

    );
  }


}


// https://www.goldapi.io/api/XAU/USD/
// goldapi-2epa1rlj5ibazi-io