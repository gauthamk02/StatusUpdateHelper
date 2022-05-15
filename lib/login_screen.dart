import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernamecontroller = TextEditingController();
  final _channelcontroller = TextEditingController();
  late final prefs;
  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _usernamecontroller.text = prefs.getString('lastusername') ?? '';
    _channelcontroller.text = prefs.getString('lastchannel') ?? '';
  }

  void _submit() async {
    bool? exist;
    prefs.setString('lastusername', _usernamecontroller.text);
    prefs.setString('lastchannel', _channelcontroller.text);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Flutter Chat App')),
      //backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Status Update Helper",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'User Name',
                hintText: 'Enter the display name',
                hintStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
              ),
              controller: _usernamecontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                border: OutlineInputBorder(),
                labelText: 'Channel',
                hintText: 'Enter the channel to join',
                hintStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
              ),
              controller: _channelcontroller,
            ),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Join"),
              )
            ],
          )
        ]),
      ),
    );
  }
}
