import 'package:flutter/material.dart';

class demo3 extends StatefulWidget {
  const demo3({Key? key}) : super(key: key);

  @override
  State<demo3> createState() => _demo3State();
}

class _demo3State extends State<demo3> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: cnt,
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(onTap: (value) => cnt = value, tabs: [
                Tab(
                  icon: Text("Chat"),
                ),
                Tab(
                  icon: Text("status"),
                ),
                Tab(
                  icon: Text("Call"),
                )
              ]),
            ),
            body: TabBarView(children: [chat(), status(), call()])));
  }
}

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,);
  }
}

class status extends StatefulWidget {
  const status({Key? key}) : super(key: key);

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}

class call extends StatefulWidget {
  const call({Key? key}) : super(key: key);

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}
