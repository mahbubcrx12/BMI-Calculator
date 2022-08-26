import 'package:day21/detail_page.dart';

import 'package:flutter/material.dart';


import 'model_page.dart';

class HomePageDemo extends StatefulWidget {
  HomePageDemo({Key? key}) : super(key: key);
   List homeList=ModelPage.amarList;

  @override
  State<HomePageDemo> createState() => _HomePageDemoState();
}

class _HomePageDemoState extends State<HomePageDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: ListView.builder(
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    itemCount: widget.homeList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(
                                model: widget.homeList[index],
                              )));
                            },
                            tileColor: Colors.black,
                            minVerticalPadding: 20,
                            title: Text(
                              "${widget.homeList[index].name}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${widget.homeList[index].details}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.teal),
                            ),
                            trailing: Text(
          widget.homeList[index].gender == true
                                  ? "Female"
                                  : widget.homeList[index].gender == false
                                      ? "Male"
                                      : "Others",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage("${widget.homeList[index].img}")),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 5,
                child: GridView.builder(
                 // scrollDirection: Axis.horizontal,

                  shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5
                    ),
                    itemCount: widget.homeList.length,
                    itemBuilder: (context,index){
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(
                          model: widget.homeList[index],
                        )
                        )
                        );
                      },
                      child: Container(
                        color: Colors.green,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("${widget.homeList[index].img}",
                            ),
                              fit: BoxFit.cover
                            )
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("${widget.homeList[index].name}",style: TextStyle(
                              color: Colors.yellowAccent
                            ),),
                          ),
                        ),
                      ),
                    );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
