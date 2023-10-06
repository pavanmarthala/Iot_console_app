import 'package:flutter/material.dart';
import 'package:iot_console/Auth/singin.dart';
import 'package:iot_console/pages/Home_page.dart';

// Existing ForgotPasswordPage code...

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void _updatePassword() {
    // You can implement your own logic here to update the password.
    // For this example, we'll just simulate the update.
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Success'),
        content: Text('Password updated successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Homepage(),
                                ),
                              ); 
              // Navigate back to the sign-in page or any other page as needed.
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter New Password",
                          labelText: "New Password",
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: confirmNewPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm New Password",
                          labelText: "Confirm New Password",
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: _updatePassword,
                          child: Text("Update Password"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            fixedSize: Size(650, 50),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Go Back to SignIn?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SingIN(),
                                ),
                              );
                            },
                            child: Text(
                              "Click Here",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
