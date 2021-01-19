import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 36,
                      bottom: 78,
                      left: 90,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 24,
                          ),
                          child: FittedBox(
                            child: Text(
                              'Create your account',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 28,
                  right: -100,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.orange[400],
                  ),
                ),
                Positioned(
                  top: -8,
                  left: -128,
                  child: CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                ),
                Positioned(
                  top: 48,
                  left: 24,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextField(
                hint: 'Email',
                icon: Icon(
                  Icons.email,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextField(
                hint: 'User Name',
                icon: Icon(
                  Icons.person,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextField(
                hint: 'Password',
                icon: Icon(
                  Icons.lock,
                  color: Colors.deepOrange,
                ),
                pass: true,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 30,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildTextField({
    String hint,
    Icon icon,
    bool pass = false,
    Icon suffixIcon,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: pass ? true : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
