import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ImageController extends GetxController {
  var isDownload = false.obs;

  capture(GlobalKey key) async {
    try {
      isDownload.value = true;
      RenderRepaintBoundary? boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      final image = await boundary!.toImage(pixelRatio: 1248);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final uInt8List = byteData!.buffer.asUint8List();
      var directory2 = await getExternalStorageDirectory();
      var path = directory2!.path.split('/');
      var finalPath = '${path[0]}/${path[1]}/${path[2]}/${path[3]}/Download';
      var file = File('$finalPath/IMG ${DateTime.now()}.jpg');
      await file.writeAsBytes(uInt8List);
      //ignore: avoid_print
      print(file.writeAsBytes(uInt8List));
      //ignore: avoid_print
      print(file.path);
      //ignore: avoid_print
      print(directory2);
      isDownload.value = false;
      return file.path;
    } catch (error) {
      //ignore: avoid_print
      print('Exception:- $error');
    }
  }
}