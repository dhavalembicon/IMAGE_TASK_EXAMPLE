import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_task_example/controller/image_controller.dart';
import 'package:get/get.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key, this.logoImage, this.backgroundImage, this.name, this.email, this.phoneNo, this.address}) : super(key: key);

  final File? logoImage, backgroundImage;
  final String? name, email, phoneNo, address;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  GlobalKey globalKey = GlobalKey();
  ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF26A69A),
        title: const Text(
          'Download Image',
          style: TextStyle(
              fontSize: 18,
              color: Color(0xFFFFFFFF)
          ),
        ),
        actions: [
          IconButton(
            onPressed: !imageController.isDownload.value ? () {
              imageController.capture(globalKey);
            } : () {},
            icon: Obx(() => Icon(Icons.download_outlined, color: !imageController.isDownload.value ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF).withOpacity(0.4), size: 30,),)
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          RepaintBoundary(
            key: globalKey,
            child: Stack(
             children: [
               Container(
                 height: 400,
                 width: double.infinity,
                 alignment: Alignment.topLeft,
                 padding: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: FileImage(widget.backgroundImage!),
                     fit: BoxFit.contain
                   )
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           widget.name ?? '',
                           style: const TextStyle(
                               fontSize: 18,
                               color: Colors.white
                           ),
                         ),
                         Text(
                           widget.email ?? '',
                           style: const TextStyle(
                               fontSize: 18,
                               color: Colors.white
                           ),
                         ),
                         Text(
                           widget.phoneNo ?? '',
                           style: const TextStyle(
                               fontSize: 18,
                               color: Colors.white
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       width: 150,
                       child: Text(
                         widget.address ?? '',
                         textAlign: TextAlign.justify,
                         style: const TextStyle(
                             fontSize: 18,
                             color: Colors.white
                         ),
                       ),
                     ),
                   ],
                 )
               ),
               Positioned(
                 top: 0.0,
                 child: SizedBox(
                   height: 100,
                   width: 100,
                   child: Image.file(widget.logoImage!, fit: BoxFit.contain,),
                 ),
               ),
             ],
            ),
          ),
        ],
      ),
    );
  }
}
