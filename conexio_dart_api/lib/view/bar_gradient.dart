import 'package:flutter/material.dart';

class BarGradient extends StatelessWidget {
  String name;
  IconData icon;
  BarGradient(this.name, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      height: 250,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.topLeft,
              colors: [
                Color.fromARGB(255, 22, 78, 23),
                Color.fromARGB(255, 22, 78, 2).withOpacity(0.70)
              ]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))),
      child: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Icon(
              this.icon,
              size: 150,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Align(
            //  alignment: Alignment.bottomRight,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 42, right: 42),
              child: Text(
                this.name,
                style: TextStyle(
                    color: Colors.white, fontSize: 30, letterSpacing: 5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
