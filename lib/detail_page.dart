

import 'package:day21/model_page.dart';
import 'package:flutter/material.dart';



class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key,this.model}) : super(key: key);
  final ModelPage? model;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Container(

          decoration: BoxDecoration(
            color: Colors.deepOrange,
            image: DecorationImage(image: NetworkImage("${widget.model!.img}",
            ),
            fit: BoxFit.cover
            )
          ),

            //child: Text("${widget.model!.details}"),
        ),


    ),
    ),
    );

  }
}
