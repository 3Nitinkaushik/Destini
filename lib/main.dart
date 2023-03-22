import 'package:flutter/material.dart';
import 'storybrain.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quiz()
    );
  }
}

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('images/back.jpg'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(child: Text("DESTINI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),)),

        ),
        body: const Destinibody(),
      ),
    );
  }
}

class Destinibody extends StatefulWidget {
  const Destinibody({Key? key}) : super(key: key);

  @override
  State<Destinibody> createState() => _DestinibodyState();
}

class _DestinibodyState extends State<Destinibody> {
  Storybrain storyb= Storybrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Expanded(flex:5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(storyb.getstorytitle(),style: TextStyle(fontSize: 25,color: Colors.white),
              textAlign: TextAlign.center,),
            ),
          )
          ,),
         Expanded(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(onPressed: (){setState(() {
            storyb.nextstory(1);

          });},
            child: Text(storyb.getstorychoice1(),
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
            style: TextButton.styleFrom(backgroundColor: Colors.teal),
          ),
        ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Visibility(
            visible: storyb.buttonvis(),
            child: TextButton(onPressed: (){setState(() {
              storyb.nextstory(2);

            });}, child: Text(storyb.getstorychoice2(),
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),

          ),
        ),
        ),
      ],
    );
  }
}
