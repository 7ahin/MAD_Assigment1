import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  var _name;
  var _age;
  var _image;

  get child => null;
  

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  void _submitProfile() {
    setState(() {
      _name = _nameController.text;
      _age = int.tryParse(_ageController.text);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Simple Profile Page')),
        backgroundColor: Colors.blueAccent,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(hintText: 'Enter name'),
                      ),
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: 'Enter age'),
                        
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.deepOrange),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(20)),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: 14, color: Colors.white))),
                          onPressed: () async {
                            _pickImage();
                            setState(() {});
                          },
                          child: const Text('Upload')),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints:
                            const BoxConstraints(minWidth: double.infinity),
                        child: ElevatedButton(
                            onPressed: () async {}, child: Text("Submit")),
                      ),
                      Image.asset('Dev/projects/first_app/.dart_tool/assets/images/profile.png'),
                      Text("$_name",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold),
                        
                      ),
                      Text("$_age",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.normal)
                      ),
                      
                      const CircleAvatar(
                          radius: 25, // Change this radius for the width of the circular border
                          backgroundColor: Colors.white,

                         
                        ),
                        
                  
          
                      
                    ]))));
  }
}
