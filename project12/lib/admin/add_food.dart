// import 'dart:io';
// import 'dart:math';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery/Services/database.dart';
// import 'package:food_delivery/Widget/support_widget.dart';
// import 'package:image_picker/image_picker.dart';

// class AddFood extends StatefulWidget {
//   const AddFood({super.key});

//   @override
//   State<AddFood> createState() => _AddFoodState();
// }

// class _AddFoodState extends State<AddFood> {
//   final List<String> items = ["Ice-cream", "Burger", "Salad", "Pizza"];
//   String? value;
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController pricecontroller = TextEditingController();
//   TextEditingController detailscontroller = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   File? selectedImage;

//   Future getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   String generateRandomString(int length) {
//     const chars =
//         'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
//     Random rnd = Random();
//     return String.fromCharCodes(Iterable.generate(
//         length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
//   }

//   void uploadItem() async {
//     if (selectedImage != null &&
//         namecontroller.text.isNotEmpty &&
//         pricecontroller.text.isNotEmpty &&
//         detailscontroller.text.isNotEmpty) {
//       String addId = generateRandomString(10);

//       Reference firebaseStorageRef =
//           FirebaseStorage.instance.ref().child("blogImages").child(addId);
//       final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

//       var downloadUrl = await {await task}.ref.getDownloadURL();

//       // Upload file code goes here

//       Map<String, dynamic> addItem = {
//         "Image": downloadUrl,
//         "Name": namecontroller.text,
//         "Price": pricecontroller.text,
//         "Detail": detailscontroller.text,
//       };
//       await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Food Item has been added Successfually",
//               style: TextStyle(fontSize: 18),
//             )));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new_outlined,
//             color: Color(0xFF373866),
//           ),
//         ),
//         centerTitle: true,
//         title: Text(
//           "Add Item",
//           style: AppWidget.HeadlineTextFeildStyle(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin:
//               const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Upload the Item Picture",
//                 style: AppWidget.HeadlineTextFeildStyle(),
//               ),
//               const SizedBox(height: 20),
//               selectedImage == null
//                   ? GestureDetector(
//                       onTap: () {
//                         getImage();
//                       },
//                       child: Center(
//                         child: Material(
//                           elevation: 4,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             width: 150,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: Colors.black, width: 1.5),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: const Center(
//                               child: Icon(Icons.camera_enhance_sharp),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   : Center(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.file(
//                           selectedImage!,
//                           width: 150,
//                           height: 150,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//               const SizedBox(height: 30),
//               Text(
//                 "Item Name",
//                 style: AppWidget.SemiBoldTextFeildStyle(),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFececf8),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextField(
//                   controller: namecontroller,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter item Name",
//                       hintStyle: AppWidget.LightTextFeildStyle()),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Text(
//                 "Item Price",
//                 style: AppWidget.SemiBoldTextFeildStyle(),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFececf8),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextField(
//                   controller: pricecontroller,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter item Price",
//                       hintStyle: AppWidget.LightTextFeildStyle()),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Text(
//                 "Item Details",
//                 style: AppWidget.SemiBoldTextFeildStyle(),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFececf8),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextField(
//                   maxLines: 6,
//                   controller: detailscontroller,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter item Details",
//                       hintStyle: AppWidget.LightTextFeildStyle()),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFececf8),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     items: items.map((String item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(
//                           item,
//                           style: const TextStyle(
//                               fontSize: 18, color: Colors.black),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         value = newValue;
//                       });
//                     },
//                     dropdownColor: Colors.white,
//                     hint: const Text("Select Category"),
//                     iconSize: 36,
//                     icon: const Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black,
//                     ),
//                     value: value,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     uploadItem();
//                   },
//                   child: Material(
//                     elevation: 5,
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: const Center(
//                           child: Text(
//                         "Add",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Services/database.dart';
import 'package:food_delivery/Widget/support_widget.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> items = ["Ice-cream", "Burger", "Salad", "Pizza"];
  String? value;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController detailscontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  String generateRandomString(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  void uploadItem() async {
    if (selectedImage != null &&
        namecontroller.text.isNotEmpty &&
        pricecontroller.text.isNotEmpty &&
        detailscontroller.text.isNotEmpty) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          throw Exception("User is not signed in");
        }

        String addId = generateRandomString(10);

        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child("blogImages").child(addId);
        final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

        await task.whenComplete(() async {
          try {
            var downloadUrl = await firebaseStorageRef.getDownloadURL();

            Map<String, dynamic> addItem = {
              "Image": downloadUrl,
              "Name": namecontroller.text,
              "Price": pricecontroller.text,
              "Detail": detailscontroller.text,
            };
            await DatabaseMethods().addFoodItem(addItem, value!).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text(
                    "Food Item has been added successfully",
                    style: TextStyle(fontSize: 18),
                  )));
            });
          } catch (e) {
            print(e.toString());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  "Failed to upload image",
                  style: TextStyle(fontSize: 18),
                )));
          }
        });
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "An faild image upload",
              style: TextStyle(fontSize: 18),
            )));
      }
    }
  }

  // void uploadItem() async {
  //   if (selectedImage != null &&
  //       namecontroller.text.isNotEmpty &&
  //       pricecontroller.text.isNotEmpty &&
  //       detailscontroller.text.isNotEmpty) {
  //     String addId = generateRandomString(10);

  //     Reference firebaseStorageRef =
  //         FirebaseStorage.instance.ref().child("blogImages").child(addId);
  //     final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

  //     await task.whenComplete(() async {
  //       try {
  //         var downloadUrl = await firebaseStorageRef.getDownloadURL();

  //         Map<String, dynamic> addItem = {
  //           "Image": downloadUrl,
  //           "Name": namecontroller.text,
  //           "Price": pricecontroller.text,
  //           "Detail": detailscontroller.text,
  //         };
  //         await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //               backgroundColor: Colors.orangeAccent,
  //               content: Text(
  //                 "Food Item has been added successfully",
  //                 style: TextStyle(fontSize: 18),
  //               )));
  //         });
  //       } catch (e) {
  //         print(e.toString());
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //             backgroundColor: Colors.redAccent,
  //             content: Text(
  //               "Failed to upload image",
  //               style: TextStyle(fontSize: 18),
  //             )));
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: AppWidget.HeadlineTextFeildStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload the Item Picture",
                style: AppWidget.HeadlineTextFeildStyle(),
              ),
              const SizedBox(height: 20),
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
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(Icons.camera_enhance_sharp),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          selectedImage!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              const SizedBox(height: 30),
              Text(
                "Item Name",
                style: AppWidget.SemiBoldTextFeildStyle(),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter item Name",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Item Price",
                style: AppWidget.SemiBoldTextFeildStyle(),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: pricecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter item Price",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Item Details",
                style: AppWidget.SemiBoldTextFeildStyle(),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailscontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter item Details",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                    dropdownColor: Colors.white,
                    hint: const Text("Select Category"),
                    iconSize: 36,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    uploadItem();
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
