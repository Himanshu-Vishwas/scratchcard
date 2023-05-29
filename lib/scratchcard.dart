import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class scratchCard extends StatefulWidget {
  const scratchCard({Key? key}) : super(key: key);

  @override
  State<scratchCard> createState() => _scratchCardState();
}

class _scratchCardState extends State<scratchCard> {
  final scratchKey = GlobalKey<ScratcherState>();
  bool _enabled = true;
  bool _reveal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Scratcher(
              enabled: _enabled,
              brushSize: 30,
                key: scratchKey,
                color: Colors.green,
                image: Image(image: AssetImage("images/scratch.png")),
                accuracy: ScratchAccuracy.low,
                threshold: 75,
                onThreshold: (){
                print("Threshold Reached !");
                setState(() {
                  _enabled = false;
                });
                },
                onChange: (value){
                if(value>0.1){
                  print(value);
                }
                if(value>50){
                  setState(() {
                    _reveal = true;
                  });
                }
                },
                child: Container(
              height: 200,
              width: 200,
              child: Center(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _reveal ? 1.0 : 0.0,
                  child: Text(
                      "Himanshu"
                  ),
                ),
              ),
            ),
            ),
            GestureDetector(
              onTap: (){
                scratchKey.currentState?..reset(duration: Duration(milliseconds: 500));
              },
              child: Container(
                height: 40,
                width: 200,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "GET A NEW CARD"
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
