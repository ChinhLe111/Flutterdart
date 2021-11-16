import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Flutter News"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body:Container(
        child:SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "OTHERS NEWS",
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 13,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index) => Container(
                    height: 4,
                    width: 200,
                    margin: EdgeInsets.all(1),
                    child: Center(
                      child: Text("Alo $index "),

                    ),
                    color: Colors.green[700],
                  ),
                ),
              ),
        Image.asset('assets/1.png'),
              Flexible(
                child: ListView.builder(
                  itemCount: 20,
                  physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(" List  $index"),
                  ),
                ),
              ),
              Image.network(
                'https://picsum.photos/250?image=9',
              )
            ],
          ),
        ),
      ),
    );
  }
}