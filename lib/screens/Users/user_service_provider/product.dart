import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late TextEditingController descriptionController;
  late File? image;
  late DateTime timestamp;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    timestamp = DateTime.now();
    //String formattedDate = "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  setState(() {
                    image = File(pickedImage.path);
                  });
                }
              },
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Product Description'),
            ),
            SizedBox(height: 16.0),
            Text('Timestamp: $timestamp'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Store data in Firebase (or your preferred database)
                // Navigate to the home screen
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
