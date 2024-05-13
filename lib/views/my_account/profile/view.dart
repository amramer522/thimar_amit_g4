import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: image != null
                  ? FileImage(File(image!.path)) as ImageProvider
                  : NetworkImage(
                      "https://th.bing.com/th/id/OIP.leRaZskYpTKA55a0St0tZgHaJa?rs=1&pid=ImgDetMain"),
            ),
            IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.red,
              ),
              onPressed: () async {
                image =
                await ImagePicker().pickImage(source: ImageSource.camera);
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.image,
                color: Colors.green,
              ),
              onPressed: () async {
                image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
            ),
            SizedBox(height: 24),
            TextFormField()
          ],
        ),
      ),
    );
  }
}
