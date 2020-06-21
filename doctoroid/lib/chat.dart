import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctoroid/info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String title;
String desc;

Future<http.Response> postData(List evid) async {
  await http.post(
    'https://api.infermedica.com/covid19/diagnosis',
    headers:  {
      'Content-Type': 'application/json',
      "App-Id" : "aefa5d35",
      "App-Key" : "46d80c8b505dc1f08c52492e324eace9"
    },
    body: json.encode(
{
  "sex": gender,
  "age": age,
  "evidence": evid
}    ),
  );

}




class Chat extends StatefulWidget {

  

String gender;

String username;
int age;


Chat({Key key, this.username, this.age, this.gender}) : super(key: key);

   
  @override
  State createState() => ChatWindow(); 
}

class ChatWindow extends State<Chat> with TickerProviderStateMixin {

Future<http.Response> triageData(List evid) async {
  var response = await http.post(
    'https://api.infermedica.com/covid19/triage',
    headers:  {
      'Content-Type': 'application/json',
      "App-Id" : "aefa5d35",
      "App-Key" : "46d80c8b505dc1f08c52492e324eace9"
    },
    body: json.encode(
{
  "sex": gender,
  "age": age,
  "evidence": evid
}    ),
  );
  Map data = await jsonDecode(response.body);
title = data["label"];
desc = data["description"];
dR("Recommendation: $title \n $desc");
}

int numb = 5;
String p_23 = "absent";
String p_17 = "absent";
String p_16 = "absent";
String p_18 = "absent";
String p_19 = "absent";
String p_24 = "absent";
String p_22 = "absent";
String p_20 = "absent";
String p_21 = "absent";
String s_0 = "absent";
String s_1 = "absent";
String s_2 = "absent";
String s_22 = "absent";
String s_23 = "absent";
String s_4 = "absent";
String s_5 = "absent";
String s_15 = "absent";
String s_16 = "absent";
String s_17 = "absent";
String s_18 = "absent";
String s_19 = "absent";
String s_20 = "absent";
String s_21 = "absent";
String s_24 = "absent";
String p_25 = "absent";
String p_26 = "absent";
String p_27 = "absent";
String p_11 = "absent";
String p_15 = "absent";
String s_12 = "absent";
String s_13 = "absent";
String s_14 = "absent";

int first = 0;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
    void value1Changed(bool value) { setState(() {
                     value1 = value;
                          }); } 
  void value2Changed(bool value) { 
                         setState(() {
                     value2 = value;
                          });   
  }
      void value3Changed(bool value) { setState(() {
                     value3 = value;
                          }); } 
  void value4Changed(bool value) { 
                         setState(() {
                     value4 = value;
                          });   
  }
    void value5Changed(bool value) { 
                         setState(() {
                     value5 = value;
                          });   
  }
     void setValue(value) { 
                         setState(() {
                     numb = value;
                          });   
  }




  ScrollController scrollController = ScrollController();
   final TextEditingController _textController = TextEditingController();
  bool _isWriting = false;

  


   Future<void> callback(String txt) async {
    if (txt.length > 0) {
      await firestore.collection(widget.username).add({
        'text': txt,
        'from': widget.username,
        'date': DateTime.now().toIso8601String().toString(),
      });
      
           scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
        setState(() {
    _isWriting = false;
  });


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversation"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 0.6,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
            child: StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection(widget.username)
                    .orderBy('date')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  List<DocumentSnapshot> docs = snapshot.data.documents;

                  List<Widget> messages = docs
                      .map((doc) => Message(
                            from: doc.data['from'],
                            txt: doc.data['text'],
                            me: widget.username == doc.data['from'],
                          ))
                      .toList();

                  return ListView.builder(
                    controller: scrollController,
              itemBuilder: (_, int index) => messages[index],
              itemCount: messages.length,
              padding: EdgeInsets.all(6.0),
                       );
                    },
              ),
            ),
             (first == 0) ? Check(
              funcSo: () {        setState(() {
first = 1;
value1 ? p_18 = "present" :  p_18 = "absent";
value2 ? p_19 = "present" :  p_19 = "absent";
value3 ? p_24 = "present" :  p_24 = "absent";
value4 ? p_22 = "present" :  p_22 = "absent";
value1 = false;
value2 = false;
value3 = false;
value4 = false;
  }); 
                postData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                ]);},
value1: value1,
  value2: value2,
  value3: value3,
  value4: value4,
value1Changed: value1Changed,
value2Changed: value2Changed,
value3Changed: value3Changed,
value4Changed: value4Changed,
             ) : 
                          (first == 1) ? Check2(
              funcSo: () {        setState(() {
first = 2;
value1 ? p_23 = "present" :  p_23 = "absent";
value2 ? p_17 = "present" :  p_17 = "absent";
value3 ? p_16 = "present" :  p_16 = "absent";
value4 ? p_20 = "present" :  p_20 = "absent";
value5 ? p_21 = "present" :  p_21 = "absent";
value1 = false;
value2 = false;
value3 = false;
value4 = false;
value5 = false;
  }); 
                postData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                ]);
                dR("Do you have any of the following symptoms? Please only select new symptoms that are not related to your chronic diseases.\n Fever?");},
value1: value1,
  value2: value2,
  value3: value3,
    value4: value4,
      value5: value5,
value1Changed: value1Changed,
value2Changed: value2Changed,
value3Changed: value3Changed,
value4Changed: value4Changed,
value5Changed: value5Changed,
             ) : 
             (first == 2) ? Column(
               children: <Widget>[
                 CustomButton(
            text: "Yes",
            callback: () {
callback("Yes");
setState(() {
first = 3;
s_0 = "present";
  }); 
dR("Cough?");
                 }
                               ),
                               CustomButton(
            text: "N0",
            callback: () {
callback("No");
setState(() {
first = 3;
s_0 = "absent";
  }); 
  dR("Cough?");
             }
                           ) ,
               ],
             ) : (first == 3) ? Column(
               children: <Widget>[
                 CustomButton(
            text: "Yes",
            callback: () {
callback("Yes");
setState(() {
first = 4;
s_1 = "present";
  }); 
dR("Shortness of breath?");
                 }
                               ),
                               CustomButton(
            text: "N0",
            callback: () {
callback("No");
setState(() {
first = 4;
s_1 = "absent";
  }); 
  dR("Shortness of breath?");
             }
                           ) ,
               ],
             ) : (first == 4) ? Column(
               children: <Widget>[
                 CustomButton(
            text: "Yes",
            callback: () {
callback("Yes");
setState(() {
                         (s_0 == "present") ? first = 5 : (s_0 == "absent" && s_1 == "absent") ? first = 8 : first = 8 ;
                         
s_2 = "present";
  }); 
                postData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                  {"id": "s_0", "choice_id": s_0},
                  {"id": "s_1", "choice_id": s_1},
                  {"id": "s_2", "choice_id": s_2},
                ]);
                         (s_0 == "present") ?    dR("How high is your fever?") :  dR("Are your symptoms rapidly worsening?");
                 }
                               ),
                               CustomButton(
            text: "N0",
            callback: () {
callback("No");
setState(() {
(s_0 == "present") ? first = 5 : (s_0 == "absent" && s_1 == "absent") ? first = 6 : first = 8 ;

s_2 = "absent";
  }); 
                postData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                  {"id": "s_0", "choice_id": s_0},
                  {"id": "s_1", "choice_id": s_1},
                  {"id": "s_2", "choice_id": s_2},
                ]);
                         (s_0 == "present") ?    dR("How high is your fever?") :  null; 
                         (s_0 == "absent" && s_1 == "absent") ? dR("Do you have any of the following symptoms?") :   dR("Are your symptoms rapidly worsening?");
             }
                           ) ,
               ],
             ) :
             (s_0 == "present" && first == 5) ?  Rad(
              funcSo: () {        setState(() {
                first = 8;
numb == 1 ? s_22 = "present" :  s_22 = "absent";
numb == 2 ? s_23 = "present" :  s_23 = "absent";
numb == 3 ? s_4 = "present" :  s_4 = "absent";
numb == 4 ? s_5 = "present" :  s_5 = "absent";
  }); 
                postData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                  {"id": "s_0", "choice_id": s_0},
                  {"id": "s_1", "choice_id": s_1},
                  {"id": "s_2", "choice_id": s_2},
                  {"id": "s_22", "choice_id": s_22},
                  {"id": "s_23", "choice_id": s_23},
                  {"id": "s_4", "choice_id": s_4},
                  {"id": "s_5", "choice_id": s_5},
                ]);
                dR("Are your symptoms rapidly worsening?");

},
numb: numb,
setValue: setValue,
             ) : (first == 6) ? FinalCheck(
              funcSo: () {        setState(() {
                
first = 7;
value1 ? s_15 = "present" :  s_15 = "absent";
value2 ? s_16 = "present" :  s_16 = "absent";
value3 ? s_17 = "present" :  s_17 = "absent";
value4 ? s_18 = "present" :  s_18 = "absent";
value1 = false;
value2 = false;
value3 = false;
value4 = false;
  }); 
},
value1: value1,
  value2: value2,
  value3: value3,
  value4: value4,
value1Changed: value1Changed,
value2Changed: value2Changed,
value3Changed: value3Changed,
value4Changed: value4Changed,
             )
             : (first == 7) ? FinalCheck2(
              funcSo: () {        setState(() {
                
first = 20;
value1 ? s_19 = "present" :  s_19 = "absent";
value2 ? s_20 = "present" :  s_20 = "absent";
value3 ? s_21 = "present" :  s_21 = "absent";
value4 ? s_24 = "present" :  s_24 = "absent";
value1 = false;
value2 = false;
value3 = false;

                postData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                  {"id": "s_0", "choice_id": s_0},
                  {"id": "s_1", "choice_id": s_1},
                  {"id": "s_2", "choice_id": s_2},
                  {"id": "s_22", "choice_id": s_22},
                  {"id": "s_23", "choice_id": s_23},
                  {"id": "s_4", "choice_id": s_4},
                  {"id": "s_5", "choice_id": s_5},
                  {"id": "s_15", "choice_id": s_15},
                  {"id": "s_16", "choice_id": s_16},
                  {"id": "s_17", "choice_id": s_17},
                  {"id": "s_18", "choice_id": s_18},
                  {"id": "s_19", "choice_id": s_19},
                  {"id": "s_20", "choice_id": s_20},
                  {"id": "s_21", "choice_id": s_21},
                  {"id": "s_24", "choice_id": s_24},
                ]);
  }); 
},
value1: value1,
  value2: value2,
  value3: value3,
    value4: value4,
value1Changed: value1Changed,
value2Changed: value2Changed,
value3Changed: value3Changed,
value4Changed: value4Changed,
             ) :
             (first == 8) ?              Column(
               children: <Widget>[
                 CustomButton(
            text: "Yes",
            callback: () {
callback("Yes");
setState(() {
first = 9;
s_12 = "present";
  }); 
    dR("Are you breathing very fast?");

                 }
                               ),
                                                              CustomButton(
            text: "No",
            callback: () {
callback("No");
setState(() {
first = 9;
s_13 = "absent";

  }); 
  dR("Are you breathing very fast?");
             }
                           ) ,]) :
                      (first == 9) ?   Column(
                        children: <Widget>[ CustomButton(
            text: "Yes",
            callback: () {
callback("Yes");
setState(() {
first = 10;
s_13 = "present";
  }); 
  dR("Are you coughing up blood?");
             }
                           ) ,
                           CustomButton(
            text: "No",
            callback: () {
callback("No");
setState(() {
first = 10;
s_13 = "absent";
  }); 
  dR("Are you coughing up blood?");
             }
                           ) ,
               ],
             ) :                        (first == 10) ?   Column(
                        children: <Widget>[ CustomButton(
            text: "Yes",
            callback: () {
callback("Yes");
setState(() {
s_14 = "present";
first = 50;
                triageData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                  {"id": "s_0", "choice_id": s_0},
                  {"id": "s_1", "choice_id": s_1},
                  {"id": "s_2", "choice_id": s_2},
                  {"id": "s_22", "choice_id": s_22},
                  {"id": "s_23", "choice_id": s_23},
                  {"id": "s_4", "choice_id": s_4},
                  {"id": "s_5", "choice_id": s_5},
                  {"id": "s_15", "choice_id": s_15},
                  {"id": "s_16", "choice_id": s_16},
                  {"id": "s_17", "choice_id": s_17},
                  {"id": "s_18", "choice_id": s_18},
                  {"id": "s_19", "choice_id": s_19},
                  {"id": "s_20", "choice_id": s_20},
                  {"id": "s_21", "choice_id": s_21},
                  {"id": "s_24", "choice_id": s_24},
                  {"id": "s_12", "choice_id": s_12},
                  {"id": "s_13", "choice_id": s_13},
                  {"id": "s_14", "choice_id": s_14},
                ]);
  }); 
             }
                           ) ,
                           CustomButton(
            text: "No",
            callback: () {
callback("No");
setState(() {
s_14 = "absent";
(s_12 == "absent" && s_13 == "absent" && s_14 == "absent") ? first = 6 : first = 50;

                triageData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                  {"id": "s_0", "choice_id": s_0},
                  {"id": "s_1", "choice_id": s_1},
                  {"id": "s_2", "choice_id": s_2},
                  {"id": "s_22", "choice_id": s_22},
                  {"id": "s_23", "choice_id": s_23},
                  {"id": "s_4", "choice_id": s_4},
                  {"id": "s_5", "choice_id": s_5},
                  {"id": "s_15", "choice_id": s_15},
                  {"id": "s_16", "choice_id": s_16},
                  {"id": "s_17", "choice_id": s_17},
                  {"id": "s_18", "choice_id": s_18},
                  {"id": "s_19", "choice_id": s_19},
                  {"id": "s_20", "choice_id": s_20},
                  {"id": "s_21", "choice_id": s_21},
                  {"id": "s_24", "choice_id": s_24},
                  {"id": "s_12", "choice_id": s_12},
                  {"id": "s_13", "choice_id": s_13},
                  {"id": "s_14", "choice_id": s_14},
                ]);
  }); 
             }
                           ) ,
               ],
             ) :    
 (first == 20) ?  Rad2(
              funcSo: () {        setState(() {
numb == 1 ? p_25 = "present" :  p_25= "absent";
numb == 2 ? p_26 = "present" :  p_26 = "absent";
numb == 3 ? p_27 = "present" :  p_27 = "absent";
numb == 4 ? p_11 = "present" :  p_11 = "absent";
numb == 5 ? p_15 = "present" :  p_15 = "absent";
first = 50;
  }); 
                triageData([
                  {"id": "p_18", "choice_id": p_18},
                  {"id": "p_19", "choice_id": p_19},
                  {"id": "p_24", "choice_id": p_24},
                  {"id": "p_22", "choice_id": p_22},
                  {"id": "p_23", "choice_id": p_23},
                  {"id": "p_17", "choice_id": p_17},
                  {"id": "p_16", "choice_id": p_16},
                  {"id": "p_20", "choice_id": p_20},
                  {"id": "p_21", "choice_id": p_21},
                  {"id": "s_0", "choice_id": s_0},
                  {"id": "s_1", "choice_id": s_1},
                  {"id": "s_2", "choice_id": s_2},
                  {"id": "s_22", "choice_id": s_22},
                  {"id": "s_23", "choice_id": s_23},
                  {"id": "s_4", "choice_id": s_4},
                  {"id": "s_5", "choice_id": s_5},
                  {"id": "s_15", "choice_id": s_15},
                  {"id": "s_16", "choice_id": s_16},
                  {"id": "s_17", "choice_id": s_17},
                  {"id": "s_18", "choice_id": s_18},
                  {"id": "s_19", "choice_id": s_19},
                  {"id": "s_20", "choice_id": s_20},
                  {"id": "s_21", "choice_id": s_21},
                  {"id": "s_24", "choice_id": s_24},
                  {"id": "p_25", "choice_id": p_25},
                  {"id": "p_26", "choice_id": p_26},
                  {"id": "p_27", "choice_id": p_27},
                  {"id": "p_11", "choice_id": p_11},
                  {"id": "p_15", "choice_id": p_15},
                ]);
},
numb: numb,
setValue: setValue,
             ) : (first == 50) ? Divider() : Divider(),
          ],
        ),
      ),
    );
    
  }
}





class Message extends StatelessWidget {
  final String from;
  final String txt;

  final bool me;

  const Message({Key key, this.from, this.txt, this.me,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
       margin: EdgeInsets.symmetric(vertical: 0.8),
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
             Row(
       mainAxisAlignment:
            me ? MainAxisAlignment.end :  MainAxisAlignment.start,
        children: <Widget>[
         Expanded(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(from, style: Theme.of(context).textTheme.subhead,),
          Material(
            color: me ? Colors.white70 : Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
margin: EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                txt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
          )
        ],
      ),
       )
        ],
      )
        ],
      ),
    );
  }
}

class Check2 extends StatelessWidget {
final VoidCallback funcSo;
final  bool value1 ;
final  bool value2 ;
final  bool value3 ;
final  bool value4 ;
final  bool value5 ;
  var value1Changed;
  var value2Changed;
  var value3Changed;
  var value4Changed;
  var value5Changed;

Check2({Key key, this.funcSo, this.value1Changed, this.value2Changed, this.value3Changed,  this.value2, this.value1, this.value3, this.value4Changed,  this.value4, this.value5Changed,  this.value5, }) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                  value: value1,
                  onChanged: value1Changed,
                  title: Text('Diabetes'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value2,
                  onChanged: value2Changed,
                  title: Text('Cardiovascular disease'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value3,
                  onChanged: value3Changed,
                  title: Text('History of chronic lung disease'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value4,
                  onChanged: value4Changed,
                  title: Text('History of chronic liver disease'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
                            CheckboxListTile(
                  value: value5,
                  onChanged: value5Changed,
                  title: Text('History of chronic kidney disease'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              FlatButton(
                child: Text("Next",
                style: TextStyle(
                  fontSize: 20
                ),),
                color: Colors.blue,
                onPressed: funcSo,
              )
            ],
          ),
        ),
       );
  }
}


class Check extends StatelessWidget {
final VoidCallback funcSo;
final  bool value1 ;
final  bool value2 ;
final  bool value3 ;
final  bool value4 ;
  var value1Changed;
  var value2Changed;
  var value3Changed;
  var value4Changed;


Check({Key key, this.funcSo, this.value1Changed, this.value2Changed, this.value3Changed, this.value4Changed, this.value2, this.value1, this.value3, this.value4,}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                  value: value1,
                  onChanged: value1Changed,
                  title: Text('Current cancer'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value2,
                  onChanged: value2Changed,
                  title: Text('Diseases or drugs that weaken immune system'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value3,
                  onChanged: value3Changed,
                  title: Text('Obesity'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value4,
                  onChanged: value4Changed,
                  title: Text('Long-term stay at a care facility or nursing home'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              FlatButton(
                child: Text("Next",
                style: TextStyle(
                  fontSize: 20
                ),),
                color: Colors.blue,
                onPressed: funcSo,
              )
            ],
          ),
        ),
       );
  }
}

class Rad extends StatelessWidget {
final VoidCallback funcSo;
int numb;
  var setValue;


Rad({Key key, this.funcSo, this.setValue, this.numb,}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
             
                    RadioListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                      title: Text("Between 37.5°C and 38°C (99.5°F and 100.4°F)"),
                  value: 1,
                  groupValue: numb,
                  onChanged: setValue
              ),
              RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Between 38°C and 40°C (100.4°F and 104°F)"),
                  value: 2,
                  groupValue: numb,
                 onChanged: setValue
                  
                  ),              RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Over 40°C (104°F)"),
                  value: 3,
                  groupValue: numb,
                 onChanged: setValue
                  
                  ),
                                RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("I haven’t taken my temperature"),
                  value: 4,
                  groupValue: numb,
                 onChanged: setValue
                  
                  ),
              FlatButton(
                child: Text("Next",
                style: TextStyle(
                  fontSize: 20
                ),),
                color: Colors.blue,
                onPressed: funcSo,
              )
            ],
          ),
        ),
       );
  }
}

class FinalCheck extends StatelessWidget {
final VoidCallback funcSo;
final  bool value1 ;
final  bool value2 ;
final  bool value3 ;
final  bool value4 ;
  var value1Changed;
  var value2Changed;
    var value3Changed;
  var value4Changed;


FinalCheck({Key key, this.funcSo, this.value1Changed, this.value2Changed, this.value3Changed, this.value4Changed, this.value2, this.value1, this.value3, this.value4,}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                  value: value1,
                  onChanged: value1Changed,
                  title: Text('Fatigue'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value2,
                  onChanged: value2Changed,
                  title: Text('Muscle pain'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value3,
                  onChanged: value3Changed,
                  title: Text('Chills'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value4,
                  onChanged: value4Changed,
                  title: Text('Headache'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              FlatButton(
                child: Text("Next",
                style: TextStyle(
                  fontSize: 20
                ),),
                color: Colors.blue,
                onPressed: funcSo,
              )
            ],
          ),
        ),
       );
  }
}


class FinalCheck2 extends StatelessWidget {
final VoidCallback funcSo;
final  bool value1 ;
final  bool value2 ;
final  bool value3 ;
final  bool value4 ;
  var value1Changed;
  var value2Changed;
    var value3Changed;
  var value4Changed;


FinalCheck2({Key key, this.funcSo, this.value1Changed, this.value2Changed, this.value3Changed, this.value4Changed, this.value2, this.value1, this.value3, this.value4,}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                  value: value1,
                  onChanged: value1Changed,
                  title: Text('Diarrhea'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value2,
                  onChanged: value2Changed,
                  title: Text('Nausea'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                  value: value3,
                  onChanged: value3Changed,
                  title: Text('Sore throat'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
                            CheckboxListTile(
                  value: value4,
                  onChanged: value4Changed,
                  title: Text('Impaired taste or smell'),
                  controlAffinity: ListTileControlAffinity.leading,
              ),
              FlatButton(
                child: Text("Next",
                style: TextStyle(
                  fontSize: 20
                ),),
                color: Colors.blue,
                onPressed: funcSo,
              )
            ],
          ),
        ),
       );
  }
}

class Rad2 extends StatelessWidget {
final VoidCallback funcSo;
int numb;
  var setValue;


Rad2({Key key, this.funcSo, this.setValue, this.numb,}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Column(
            children: <Widget>[
             
                    RadioListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                      title: Text("I have provided direct care to such a person, without the use of a protective mask and gloves"),
                  value: 1,
                  groupValue: numb,
                  onChanged: setValue
              ),
              RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("I had direct physical contact with such a person"),
                  value: 2,
                  groupValue: numb,
                 onChanged: setValue
                  
                  ),              RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("I had face-to-face contact with such a person within 1 meter (3 feet) for longer than 15 minutes"),
                  value: 3,
                  groupValue: numb,
                 onChanged: setValue
                  
                  ),
                                RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Other type of contact"),
                  value: 4,
                  groupValue: numb,
                 onChanged: setValue
                  
                  ),
                                                  RadioListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("None of the above"),
                  value: 5,
                  groupValue: numb,
                 onChanged: setValue
                  
                  ),
              FlatButton(
                child: Text("Next",
                style: TextStyle(
                  fontSize: 20
                ),),
                color: Colors.blue,
                onPressed: funcSo,
              )
            ],
          ),
        ),
       );
  }
}