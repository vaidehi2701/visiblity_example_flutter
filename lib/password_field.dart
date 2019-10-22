import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  bool isHidden = true;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Visiblity"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Text("Code Flash Example" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),)),
              SizedBox(height: 40.0,),
              Text('Enter Your Email Id'),
              SizedBox(height: 10),
              buildTextField("Email"),
              SizedBox(height: 20.0,),
              Text('Enter Your Password'),
              SizedBox(height: 10),
              buildTextField("Password"),
              SizedBox(height: 20.0,),

            ],
          ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == "Password" ? IconButton(
          onPressed: toggleVisibility,
          icon: isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ) : null,
      ),
      obscureText: hintText == "Password" ? isHidden : false,
    );
  }
}

