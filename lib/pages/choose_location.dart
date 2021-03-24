import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count = 0;

  void getData1() async{

    // simulate network request for username
    String username = await Future.delayed(Duration(seconds: 3),(){
      return 'dhananjay';
    });

    String loves = await Future.delayed(Duration(seconds: 2),(){
      return 'loves to code';
    });

    print('$username - $loves');
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init');
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: TextButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Text('clicked $count'),
      ),
    );
  }
}

/*
context obj keep track where in widget tree we are



* */
