import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PassengerScreen extends StatefulWidget {
  @override
  _PassengerScreenState createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _passportImage;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _passportImage = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ادخل بيانات المسافر'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField('الاسم الأول'),
              _buildTextField('الاسم الثاني'),
              _buildTextField('اللقب'),
              _buildTextField('رقم الهاتف'),
              _buildTextField('الميلاد'),
              _buildTextField('email', keyboardType: TextInputType.emailAddress),
              _buildTextField('تاريخ إصدار الجواز'),
              _buildTextField('تاريخ إنتهاء الجواز'),
              SizedBox(height: 20),
              _buildImagePicker(),
              if (_passportImage != null)
                Image.file(File(_passportImage!.path), height: 200),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey[200],
        child: Center(
          child: Text('صورة الجواز'),

        ),

      ),

    );

  }
}