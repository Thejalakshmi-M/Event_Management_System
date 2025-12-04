//
// import 'dart:io';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'LoginScreen/login.dart';
// import 'login.dart';
//
// void main() {
//   runApp(const MyMySignup());
// }
//
// class MyMySignup extends StatelessWidget {
//   const MyMySignup({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MySignup',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//       home: const MyMySignupPage(title: 'MySignup'),
//     );
//   }
// }
//
// class MyMySignupPage extends StatefulWidget {
//   const MyMySignupPage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyMySignupPage> createState() => _MyMySignupPageState();
// }
//
// class _MyMySignupPageState extends State<MyMySignupPage> {
//   String gender = "Male";
//   String photo = "";
//   File? _selectedImage;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController placeController = TextEditingController();
//   TextEditingController postController = TextEditingController();
//   TextEditingController pinController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController eventdateController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmpasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Text(widget.title, style: TextStyle(color: Colors.white)),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Profile Image Selector
//             GestureDetector(
//               onTap: _checkPermissionAndChooseImage,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.grey[300],
//                 backgroundImage: _selectedImage != null
//                     ? FileImage(_selectedImage!)
//                     : null,
//                 child: _selectedImage == null
//                     ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[700])
//                     : null,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text('Select Profile Image',
//                 style: TextStyle(fontSize: 14, color: Colors.deepPurple)),
//             SizedBox(height: 20),
//
//             // Form Card
//             Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               elevation: 4,
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     _buildTextField("Name", nameController),
//
//
//                     Padding(
//
//                       padding: const EdgeInsets.all(8),
//                       child: TextFormField(
//                         onTap: () async {
//                           // Set an initial date
//                           DateTime initialDate = dobController.text.isEmpty
//                               ? DateTime.now()
//                               : DateTime.parse(dobController.text);
//
//                           // Open a date picker with the initial date
//                           DateTime? pickedDate = await showDatePicker(
//                             context: context,
//                             initialDate: initialDate,
//                             firstDate: DateTime(1900),
//                             lastDate: DateTime.now(),
//                           );
//
//                           if (pickedDate != null) {
//                             dobController.text =
//                             "${pickedDate.toLocal()}".split(' ')[0];
//                           }
//                         },
//
//                         controller: dobController,
//                         decoration: InputDecoration(
//                           labelText: "Date of Birth",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide.none),
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                         ),
//                       ),
//                     ),
//                     // _buildTextField("Date of Birth", dobController),
//                     // _buildGenderSelection(),
//
//                     Padding(
//
//                       padding: const EdgeInsets.all(8),
//                       child: TextFormField(
//                         onTap: () async {
//                           // Set an initial date
//                           DateTime initialDate = eventdateController.text
//                               .isEmpty
//                               ? DateTime.now()
//                               : DateTime.parse(eventdateController.text);
//
//                           // Open a date picker with the initial date
//                           DateTime? pickedDate = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime(2026),
//                           );
//
//                           if (pickedDate != null) {
//                             eventdateController.text =
//                             "${pickedDate.toLocal()}".split(' ')[0];
//                           }
//                         },
//
//                         controller: eventdateController,
//                         decoration: InputDecoration(
//                           labelText: "Event Date",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide.none),
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                         ),
//                       ),
//                     ),
//
//                     RadioListTile(
//                       value: "Male", groupValue: gender, onChanged: (value) {
//                       setState(() {
//                         gender = "Male";
//                       });
//                     }, title: Text("Male"),),
//                     RadioListTile(
//                       value: "Female", groupValue: gender, onChanged: (value) {
//                       setState(() {
//                         gender = "Female";
//                       });
//                     }, title: Text("Female"),),
//                     RadioListTile(
//                       value: "Other", groupValue: gender, onChanged: (value) {
//                       setState(() {
//                         gender = "Other";
//                       });
//                     }, title: Text("Other"),),
//                     _buildTextField("Email", emailController),
//                     _buildTextField("Phone", phoneController),
//                     _buildTextField("Place", placeController),
//                     _buildTextField("Post", postController),
//                     // _buildTextField("Event Date", eventdateController),
//                     _buildTextField("Pin Code", pinController),
//                     _buildTextField("District", districtController),
//                     _buildTextField(
//                         "Password", passwordController, obscureText: true),
//                     _buildTextField(
//                         "Confirm Password", confirmpasswordController,
//                         obscureText: true),
//                     SizedBox(height: 20),
//
//                     // Signup Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _send_data,
//                         child: Text("Sign Up"),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//
//                     // Login Button
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) => MyLoginScreen(),
//                         ));
//                       },
//                       child: Text("Already have an account? Login",
//                           style: TextStyle(color: Colors.deepPurple)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller,
//       {bool obscureText = false}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none),
//           filled: true,
//           fillColor: Colors.grey[200],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGenderSelection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Gender", style: TextStyle(fontSize: 16)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildRadio("Male"),
//             _buildRadio("Female"),
//             _buildRadio("Other"),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildRadio(String value) {
//     return Expanded(
//       child: RadioListTile(
//         title: Text(value),
//         value: value,
//         groupValue: gender,
//         onChanged: (val) {
//           setState(() {
//             gender = val!;
//           });
//         },
//       ),
//     );
//   }
//
//   Future<void> _checkPermissionAndChooseImage() async {
//     final status = await Permission.mediaLibrary.request();
//     if (status.isGranted) {
//       final picker = ImagePicker();
//       final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//       if (pickedImage != null) {
//         setState(() {
//           _selectedImage = File(pickedImage.path);
//           photo = base64Encode(_selectedImage!.readAsBytesSync());
//         });
//       }
//     }
//   }
//
//   void _send_data() async {
//     String uname = nameController.text;
//     String uphone = phoneController.text;
//     String uemail = emailController.text;
//     String udob = dobController.text;
//     String uplace = placeController.text;
//     String upost = postController.text;
//     String upin = pinController.text;
//     String udistrict = districtController.text;
//     String ueventdate = eventdateController.text;
//     String upassword = passwordController.text;
//     String uconfirmpassword = confirmpasswordController.text;
//
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//
//     final urls = Uri.parse('$url/signup_user/');
//     try {
//       final response = await http.post(urls, body: {
//         "photo": photo,
//         'name': uname,
//         'phone': uphone,
//         "gender":gender,
//         'email': uemail,
//         'dob': udob,
//         'place': uplace,
//         'post': upost,
//         'pin': upin,
//         'district': udistrict,
//         'eventdate': ueventdate,
//         'password': upassword,
//         'confirmpassword': uconfirmpassword,
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status == 'ok') {
//           Fluttertoast.showToast(msg: 'Registration Successfull');
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) => MyLoginScreen(),));
//         } else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       }
//       else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     }
//     catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
// }
//
//
//
//
//
//

import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen/login.dart';
import 'login.dart';

void main() {
  runApp(const MyMySignup());
}

class MyMySignup extends StatelessWidget {
  const MyMySignup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySignup',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const MyMySignupPage(title: 'MySignup'),
    );
  }
}

class MyMySignupPage extends StatefulWidget {
  const MyMySignupPage({super.key, required this.title});
  final String title;

  @override
  State<MyMySignupPage> createState() => _MyMySignupPageState();
}

class _MyMySignupPageState extends State<MyMySignupPage> {
  String gender = "Male";
  String photo = "";
  File? _selectedImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController eventdateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Image Selector
              GestureDetector(
                onTap: _checkPermissionAndChooseImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : null,
                  child: _selectedImage == null
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[700])
                      : null,
                ),
              ),
              SizedBox(height: 10),
              Text('Select Profile Image',
                  style: TextStyle(fontSize: 14, color: Colors.deepPurple)),
              SizedBox(height: 20),

              // Form Card
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildTextField("Name", nameController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Name should contain only alphabets';
                        }
                        return null;
                      }),

                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          onTap: () async {
                            DateTime initialDate = dobController.text.isEmpty
                                ? DateTime.now()
                                : DateTime.parse(dobController.text);

                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              dobController.text =
                              "${pickedDate.toLocal()}".split(' ')[0];
                            }
                          },
                          controller: dobController,
                          decoration: InputDecoration(
                            labelText: "Date of Birth",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          onTap: () async {
                            DateTime initialDate = eventdateController.text.isEmpty
                                ? DateTime.now()
                                : DateTime.parse(eventdateController.text);

                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2026),
                            );

                            if (pickedDate != null) {
                              eventdateController.text =
                              "${pickedDate.toLocal()}".split(' ')[0];
                            }
                          },
                          controller: eventdateController,
                          decoration: InputDecoration(
                            labelText: "Event Date",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the event date';
                            }
                            return null;
                          },
                        ),
                      ),

                      RadioListTile(
                        value: "Male", groupValue: gender, onChanged: (value) {
                        setState(() {
                          gender = "Male";
                        });
                      }, title: Text("Male"),),
                      RadioListTile(
                        value: "Female", groupValue: gender, onChanged: (value) {
                        setState(() {
                          gender = "Female";
                        });
                      }, title: Text("Female"),),
                      RadioListTile(
                        value: "Other", groupValue: gender, onChanged: (value) {
                        setState(() {
                          gender = "Other";
                        });
                      }, title: Text("Other"),),

                      _buildTextField("Email", emailController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }),

                      _buildTextField("Phone", phoneController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      }),

                      _buildTextField("Place", placeController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your place';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Place should contain only alphabets';
                        }
                        return null;
                      }),

                      _buildTextField("Post", postController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your post';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Post should contain only alphabets';
                        }
                        return null;
                      }),

                      _buildTextField("Pin Code", pinController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your pin code';
                        }
                        if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                          return 'Please enter a valid 6-digit pin code';
                        }
                        return null;
                      }),

                      _buildTextField("District", districtController, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your district';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'District should contain only alphabets';
                        }
                        return null;
                      }),

                      _buildTextField("Password", passwordController, obscureText: true, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      }),

                      _buildTextField("Confirm Password", confirmpasswordController, obscureText: true, validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      }),

                      SizedBox(height: 20),

                      // Signup Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _send_data();
                            }
                          },
                          child: Text("Sign Up"),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Login Button
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyLoginScreen(),
                          ));
                        },
                        child: Text("Already have an account? Login",
                            style: TextStyle(color: Colors.deepPurple)),
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

  Widget _buildTextField(String label, TextEditingController controller,
      {bool obscureText = false, String? Function(String?)? validator}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
      ),
    );
  }

  Future<void> _checkPermissionAndChooseImage() async {
    final status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
          photo = base64Encode(_selectedImage!.readAsBytesSync());
        });
      }
    }
  }

  void _send_data() async {
    String uname = nameController.text;
    String uphone = phoneController.text;
    String uemail = emailController.text;
    String udob = dobController.text;
    String uplace = placeController.text;
    String upost = postController.text;
    String upin = pinController.text;
    String udistrict = districtController.text;
    String ueventdate = eventdateController.text;
    String upassword = passwordController.text;
    String uconfirmpassword = confirmpasswordController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/signup_user/');
    try {
      final response = await http.post(urls, body: {
        "photo": photo,
        'name': uname,
        'phone': uphone,
        "gender": gender,
        'email': uemail,
        'dob': udob,
        'place': uplace,
        'post': upost,
        'pin': upin,
        'district': udistrict,
        'eventdate': ueventdate,
        'password': upassword,
        'confirmpassword': uconfirmpassword,
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Registration Successful');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyLoginScreen(),));
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}