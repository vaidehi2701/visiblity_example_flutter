import 'package:flutter_radio_button_group/flutter_radio_button_group.dart';
import 'package:flutter/material.dart';

class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {

  bool visibilityEmail = false;
  bool visibilityCall = false;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('RadioButton with click Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(' Click Any Button To visible TextFormField' ,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
              ),),
            ),
             SafeArea(
               child: Padding(
                 padding: const EdgeInsets.all(25.0),
                 child: FlutterRadioButtonGroup(
                   textStyle: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w400
                   ),
                      items: [
                        "None",
                        "Call",
                        "Email"
                          ],
                      onSelected: (String selected) {
              print("Selected: $selected");
              if(selected == "Call") {
              setState(() {
                  visibilityCall =true;
              });
                  }
              else if(selected == "Email"){
                  setState(() {
                    visibilityEmail =true;
                  });
              }
              }),
               ),
             ),
             Container(
                margin: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new Column(
                  children: <Widget>[
                    visibilityCall ?  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          flex: 11,
                          child: new TextFormField(
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mobile No',
                              hintText: 'Enter Your Mobile Number',
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: new IconButton(
                            color: Colors.grey[400],
                            icon: const Icon(Icons.cancel, size: 22.0,),
                            onPressed: () {
                              setState(() {
                                visibilityCall=false;
                              });
                            },
                          ),
                        ),
                      ],
                    ) : new Container(),
                    SizedBox(height: 20),

                    visibilityEmail ? new Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new Expanded(
                          flex: 11,
                          child: TextFormField(
                            textInputAction: TextInputAction.done,

                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Your Email-id',
                                labelText: 'Email'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: new IconButton(
                            color: Colors.grey[400],
                            icon: const Icon(Icons.cancel, size: 22.0,),
                            onPressed: () {
                              setState(() {
                                visibilityEmail=false;
                              });
                            },
                          ),
                        ),
                      ],
                    ) : new Container(),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}