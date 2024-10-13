import 'package:flutter/material.dart';
import 'package:flutter_cardmatch/game.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => _list[index].goto));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: _list[index].secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black45,
                              spreadRadius: 0.5,
                              offset: Offset(3, 4))
                        ]),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _list[index].primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            spreadRadius: 0.3,
                            offset: Offset(5, 3))
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            _list[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    blurRadius: 2,
                                    offset: Offset(0.5, 2),
                                  ),
                                  Shadow(
                                      color: Colors.green,
                                      blurRadius: 2,
                                      offset: Offset(0.5, 2))
                                ]),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: generateStar(_list[index].noOfStar),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> generateStar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primaryColor;
  Color secondaryColor;
  Widget goto;
  int noOfStar;
  Details(
      {required this.name,
      required this.primaryColor,
      required this.secondaryColor,
      required this.noOfStar,
      required this.goto});
}

List<Details> _list = [
  Details(
      name: "Start Game!!!",
      primaryColor: const Color.fromARGB(255, 128, 234, 128),
      secondaryColor: Colors.green,
      noOfStar: 0,
      goto: CardGame(Level.Hard)),
  Details(
      name: "MEDIUM",
      primaryColor: const Color.fromARGB(255, 255, 193, 100),
      secondaryColor: Colors.orange,
      noOfStar: 2,
      goto: CardGame(Level.Medium)),
  Details(
      name: "HARD",
      primaryColor: const Color.fromARGB(255, 255, 55, 40),
      secondaryColor: Colors.red,
      noOfStar: 15,
      goto: CardGame(Level.Hard)),
];
