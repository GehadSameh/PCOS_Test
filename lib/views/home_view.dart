import 'package:firebase_project/views/register_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_project/views/login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _result = '';
  Uint8List? _imageBytes;
  String? _imageName; // Store the image name

  // Function to upload an image
  Future<void> _uploadImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _imageBytes = result.files.single.bytes;
        _imageName = result.files.single.name;
      });
    }
  }

  // Function to remove the selected image
  void _removeImage() {
    setState(() {
      _imageBytes = null;
      _imageName = null;
      _result = ''; // Clear the result when image is removed
    });
  }

  // Function to send the image to the backend for prediction
  Future<void> _predict() async {
    if (_imageBytes == null) {
      setState(() {
        _result = 'Please select an image first';
      });
      return;
    }

    final uri = Uri.parse('http://127.0.0.1:5000/predict');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        _imageBytes!,
        filename: 'image.jpg',
      ));

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(responseBody);
        setState(() {
          _result = decodedResponse['result'].toString();
        });
      } else {
        setState(() {
          _result = 'Error: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Failed to connect to the server';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(135, 203, 215, 221),
        title: const Text("PCOS Classifier"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('HOME', style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: (){
              Navigator.of(
                context).pushNamed('login');
            },
            child: const Text('Login', style: TextStyle(color: Colors.black)),
          ),
          TextButton(

            onPressed: () {
              Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => RegisterView()),
             );},
            child: const Text('Register', style: TextStyle(color: Colors.black)),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40),
              ),
            ),
            
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Add logout functionality
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_imageBytes != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Selected Image: $_imageName",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Image with "Remove" button overlayed
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(_imageBytes!, height: 400),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: IconButton(
                          onPressed: _removeImage,
                          icon: const Icon(Icons.cancel, color: Colors.red, size: 30),
                          tooltip: "Remove Image",
                        ),
                      ),
                    ],
                  ),
                ] else
                  const Text('No image selected', style: TextStyle(fontSize: 16)),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _uploadImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[200],
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Upload Image'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _predict,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[400],
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Predict'),
                ),
                const SizedBox(height: 20),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
