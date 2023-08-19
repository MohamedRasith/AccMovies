import 'package:flutter/material.dart';

class NoRecords extends StatelessWidget {
  const NoRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.not_interested, color: Colors.white,size: 40,),
        SizedBox(
          height: 20,
        ),
        Text("No Data",style: TextStyle()),
        ],
      )
    );
  }
}