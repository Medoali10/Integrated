import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctoroid/chat.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';




Future<http.Response> getSymptoms() async {
  var response = await http.get(
    'https://api.infermedica.com/covid19/symptoms',
    headers:  {
      'Content-Type': 'application/json',
      "App-Id" : "aefa5d35",
      "App-Key" : "46d80c8b505dc1f08c52492e324eace9"
    },
    
  );
  print(response.body);

  List symptoms = jsonDecode(response.body);
    print(symptoms);

}



String gender = "male";
String userName;
int age;

  final _nameController = TextEditingController();
    final _ageController = TextEditingController();
      bool _nameValidate = false;
        bool _ageValidate = false;

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  void dispose() {
    _ageController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                                  TextField( controller: _nameController,
                                    decoration:  InputDecoration(labelText: "Enter your Username",
                                     errorText: _nameValidate ? 'Value Can\'t Be Empty' : null,)),
                                  SizedBox(height: 10,),
                    TextField(
                       controller: _ageController,
                  decoration:  InputDecoration(labelText: "Enter your Age",
                   errorText: _ageValidate ? 'Value Can\'t Be Empty' : null,),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
    WhitelistingTextInputFormatter.digitsOnly
                  ],
                    ),
                                                      SizedBox(height: 20,),
                  Center(
                    child: Text("Gender",
                    style: TextStyle(
                      fontSize: 20
                    ),),
                  ),
                    RadioListTile(
                      title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
              ),
              RadioListTile(
                title: Text("female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  ),
                                                    SizedBox(height: 10,),
                    CustomButton(
            text: "Done",
            callback: () {
                        setState(() {
                  _nameController.text.isEmpty ? _nameValidate = true : _nameValidate = false;
                  _ageController.text.isEmpty ? _ageValidate = true : _ageValidate = false;
                  userName = _nameController.text;
                  age = int.parse( _ageController.text);
                });
                 _nameController.text.isEmpty ? null : Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(
          username: userName,
          age: age,
          gender: gender,
        ),
      ),
    );
                  dR("Please select all statements that apply to you");
            },
          )
                  ]),
          );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Material(
        shadowColor: Colors.blue,
        color: Colors.white,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          highlightColor: Colors.blue,
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(text),
        ),
      ),
    );
  }
}

final Firestore firestore = Firestore.instance;
Future<void> dR(String txt) async {
      await firestore.collection(userName).add({
        'text': txt,
        'from': "Doctor droid",
        'date': DateTime.now().toIso8601String().toString(),
      });
}