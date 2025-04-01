import 'dart:io';
import 'package:deliveryapp/widgets/widget_support.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> items = ['Ice-Cream', 'Burger', 'Salad', 'Pizza'];
  String? value;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {
      
    });
  }


  uploadImage() {
    if(selectedImage != null&& nameController.text!=""&&priceController.text!=""&&detailController.text!="") {
      String addId =randomAlphaNumeric(10);

      Reference FirebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child(addId);
      // Upload image to Firebase Storage or any other storage service
      // Use the selectedImage variable to get the file path
    } else {
      // Show an error message if no image is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text('Add Food', style: AppWidget.headlineTextFeildStyle()),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView to avoid overflow error when keyboard is opened
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload the Item Picture',
                style: AppWidget.semiBoldTextFeildStyle(),
              ),
              SizedBox(height: 10),
              selectedImage == null
                  ? GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Center(
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                  : Center(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
              SizedBox(height: 40),
              Text('Item Name', style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Item Name",
                    hintStyle: AppWidget.lightTextFeildStyle(),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text('Item Price', style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Item Price",
                    hintStyle: AppWidget.lightTextFeildStyle(),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text('Item Detail', style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Item Detail",
                    hintStyle: AppWidget.lightTextFeildStyle(),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Select Category',
                style: AppWidget.semiBoldTextFeildStyle(),
              ),
              SizedBox(height: 35),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items:
                        items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                    onChanged:
                        ((value) => setState(() {
                          this.value = value;
                        })),
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    value: value,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Add Food',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
