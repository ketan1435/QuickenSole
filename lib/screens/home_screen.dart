import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quicknsole_assesment/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

import '../controller/home_controller.dart'; // Import HomeController
import '../utils/my_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController()); // Initialize HomeController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Home Screen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          ],
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> userMap = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      String documentId = snapshot.data!.docs[index].id;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Card(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name : ${userMap['name']}"),
                                  SizedBox(height: 5),
                                  Text("Email: ${userMap['email']}"),
                                  SizedBox(height: 5),
                                  Text("Address: ${userMap['add']}"),
                                  SizedBox(height: 5),
                                  Text("Password: ${userMap['Pass']}"),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          homeController.deleteUser(documentId);
                                        },
                                        child: Container(
                                          child: Icon(Icons.delete, color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          dilouge(context, documentId, userMap['email'], userMap['name'], userMap['Pass'], userMap['add']);
                                        },
                                        child: Container(
                                          child: Icon(Icons.edit, color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text("No Data"),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void dilouge(BuildContext context, String documentId, String currentEmail, String currentName, String currentPass, String currentAdd) {
    final TextEditingController emailController = TextEditingController(text: currentEmail);
    final TextEditingController nameController = TextEditingController(text: currentName);
    final TextEditingController passController = TextEditingController(text: currentPass);
    final TextEditingController addController = TextEditingController(text: currentAdd);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade300,
          title: Center(child: Text('Update Your Data',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: nameController,
                labelText: "New Name",
              ),
              SizedBox(height: 1.5.h),
              CustomTextField(
                controller: emailController,
                labelText: "New Email",
              ),
              SizedBox(height: 1.5.h),
              CustomTextField(
                controller: addController,
                labelText: "New Address",
              ),
              SizedBox(height: 1.5.h),
              CustomTextField(
                controller: passController,
                labelText: "New Password",
              ),
              SizedBox(height: 3.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.grey.shade400
                      ),
                      child: Center(child: Text("Cancel",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
                    ),
                  ),
                  SizedBox(width: 1.5.w,),
                  InkWell(
                    onTap: (){
                      String newEmail = emailController.text.trim();
                      String newName = nameController.text.trim();
                      String newPass = passController.text.trim();
                      String newAdd = addController.text.trim();

                      if (newEmail.isNotEmpty && newName.isNotEmpty && newPass.isNotEmpty) {
                        Map<String, dynamic> newData = {
                          'email': newEmail,
                          'name': newName,
                          'Pass': newPass,
                          'add': newAdd,
                        };
                        homeController.updateUser(documentId, newData);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: Center(child: Text("Save",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
