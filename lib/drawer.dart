import 'package:flutter/material.dart';

class demo1 extends StatefulWidget {
  const demo1({Key? key}) : super(key: key);

  @override
  State<demo1> createState() => _demo1State();
}

class _demo1State extends State<demo1> {
  int cnt = 0;
  List<Widget> l = [first(), second(), third()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            cnt = value;
            setState(() {});
          },
          currentIndex: cnt,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "first"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "second"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "third"),
          ]),
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                )
              ],
              currentAccountPictureSize: Size(80, 80),
              accountName: Text("kaushik"),
              accountEmail: Text("kaushik@gmail.com")),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              cnt = 0;
              setState(() {});
            },
            leading: Icon(Icons.add),
            title: Text("First"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text("Second"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                cnt = 1;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.add_call),
            title: Text("Third"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                cnt = 2;
              });
            },
          )
        ]),
      ),
      body: l[cnt],
    );
  }
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
    );
  }
}
