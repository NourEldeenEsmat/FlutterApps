import 'package:crime/consts/crime_types.dart';
import 'package:flutter/material.dart';

class TypeSelection extends StatefulWidget {
  const TypeSelection({Key? key}) : super(key: key);

  @override
  State<TypeSelection> createState() => _TypeSelectionState();
}

class _TypeSelectionState extends State<TypeSelection> {
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => HomePage(),
          ),
          title: Text(
            '     Select Crime Type',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          color: Colors.black,
          child: Column(
            children: [
              Text(
                'ther can be several different types of crimes reported',
                style: TextStyle(color: Colors.white),
              ),
              Text('Select the type of crime you want to reprt',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: CrimeType(icon: Icons.add,text: 'hello',color: color,),
                onTap: (){
                  setState(() {
                    if(color == Colors.grey){
                      color = Colors.black;
                    }
                    else{
                      color = Colors.grey;
                    }
                  });

                  },
              ),
              GestureDetector(
                child: CrimeType(icon: Icons.rectangle,text: 'hello',color: color,),
                onTap: (){
                  setState(() {
                    if(color == Colors.grey){
                      color = Colors.black;
                    }
                    else{
                      color = Colors.grey;
                    }
                  });

                },
              ),
              GestureDetector(
                child: CrimeType(icon: Icons.add,text: 'hello',color: color,),
                onTap: (){
                  setState(() {
                    if(color == Colors.grey){
                      color = Colors.black;
                    }
                    else{
                      color = Colors.grey;
                    }
                  });

                },
              ),
              GestureDetector(
                child: CrimeType(icon: Icons.add,text: 'hello',color: color,),
                onTap: (){
                  setState(() {
                    if(color == Colors.grey){
                      color = Colors.black;
                    }
                    else{
                      color = Colors.grey;
                    }
                  });

                },
              ),
              GestureDetector(
                child: CrimeType(icon: Icons.add,text: 'hello',color: color,),
                onTap: (){
                  setState(() {
                    if(color == Colors.grey){
                      color = Colors.black;
                    }
                    else{
                      color = Colors.grey;
                    }
                  });

                },
              ),
              GestureDetector(
                child: CrimeType(icon: Icons.add,text: 'hello',color: color,),
                onTap: (){
                  setState(() {
                    if(color == Colors.grey){
                      color = Colors.black;
                    }
                    else{
                      color = Colors.grey;
                    }
                  });

                },
              ),

            ],
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}