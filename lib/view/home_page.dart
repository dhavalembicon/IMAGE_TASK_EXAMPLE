import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_task_example/view/image_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  XFile? logo, background;
  String? logoName, backgroundName;
  ImagePicker picker = ImagePicker();

  Future pickImage({required bool isLogo}) async {
    try {
      var pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        if (isLogo == false) {
          setState(() {
            logo = pickedImage;
            logoName = File(logo!.path).path.split('/').last;
          });
        } else {
          setState(() {
            background = pickedImage;
            backgroundName = File(logo!.path).path.split('/').last;
          });
        }
      }
    } catch (error) {
      //ignore: avoid_print
      print('Exception:- $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF26A69A),
        title: const Text(
          'Pick Data',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFFFFFFF)
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            title: const Text(
              'Pick Logo',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF78909C)
              ),
            ),
            subtitle: Text(
              logoName ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF90CAF9)
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                pickImage(isLogo: false);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFF00897B))
              ),
            ),
          ),
          const SizedBox(height: 10,),
          ListTile(
            title: const Text(
              'Pick Background',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF78909C)
              ),
            ),
            subtitle: Text(
              backgroundName ?? '',
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF90CAF9)
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                pickImage(isLogo: true);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF00897B))
              ),
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: nameController,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF78909C),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF78909C), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF80DEEA), width: 2),
              ),
              labelText: 'Name',
              labelStyle: const TextStyle(
                fontSize: 18,
                color: Color(0xFF78909C)
              )
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF78909C),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF78909C), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF80DEEA), width: 2),
              ),
              labelText: 'Email',
              labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF78909C)
              )
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF78909C),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF78909C), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF80DEEA), width: 2),
              ),
              labelText: 'Phone No.',
              labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF78909C)
              )
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: addressController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF78909C),
            ),
            maxLines: 4,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF78909C), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF80DEEA), width: 2),
              ),
              labelText: 'Address',
              labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF78909C)
              )
            ),
          ),
          const SizedBox(height: 20,),
          Align(
            child: SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () => Get.to(() => ImagePage(
                  logoImage: File(logo!.path),
                  backgroundImage: File(background!.path),
                  name: nameController.text,
                  email: emailController.text,
                  phoneNo: phoneController.text,
                  address: addressController.text,
                )),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF00897B)),
                  minimumSize: MaterialStateProperty.all(const Size(100, 40))
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
