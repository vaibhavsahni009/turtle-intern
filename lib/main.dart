import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent,
                            offset: Offset(10, 0), //(x,y)
                            blurRadius: 40.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 30,
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purpleAccent,
                              offset: Offset(35, 0), //(x,y)
                              blurRadius: 15.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(100),
                          // color: Colors.white,
                        ),
                        child: MyArc(diameter: 100)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                InputCard(),
                LoginAndRememberMe(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent,
                            offset: Offset(-35, 0), //(x,y)
                            blurRadius: 15.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.white,
                      ),
                      child: MyArc(
                        diameter: 100,
                        right: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent,
                            offset: Offset(-10, 0), //(x,y)
                            blurRadius: 40.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginAndRememberMe extends StatefulWidget {
  const LoginAndRememberMe({
    Key key,
  }) : super(key: key);

  @override
  _LoginAndRememberMeState createState() => _LoginAndRememberMeState();
}

class _LoginAndRememberMeState extends State<LoginAndRememberMe> {
  String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            groupValue: radioItem,
            activeColor: Colors.purple,
            title: Text(
              'Remember Me',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            value: 'Item 1',
            onChanged: (val) {
              setState(() {
                radioItem = val;
              });
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }
}

class MyArc extends StatelessWidget {
  final double diameter;
  final bool right;

  const MyArc({Key key, this.diameter = 200, this.right = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(right: right, context: context),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  MyPainter({this.right, this.context});
  final bool right;
  final BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.purple;
    canvas.drawArc(
      Rect.fromCenter(
        center: right
            ? Offset(size.height, size.width / 2)
            : Offset(0, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      (right ? (1 / 2) : (3 / 2)) * pi,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class InputCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.fromLTRB(25, 20, 25, 35),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5, 5.0), //(x,y)
            blurRadius: 15.0,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Username',
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.purple,
                )),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(
                  Icons.vpn_key_outlined,
                  color: Colors.purple,
                )),
          )
        ],
      ),
    );
  }
}
