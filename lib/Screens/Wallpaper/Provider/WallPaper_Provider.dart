import 'package:flutter/material.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class WallpaperProvider with ChangeNotifier {
  final List<String> _imageUrls = [
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1504198453319-5ce911bafcde?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1503264116251-35a269479413?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1521747116042-5a810fda9664?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ];

  List<String> get imageUrls => _imageUrls;

  Future<void> setWallpaperFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/wallpaper.jpg';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        await setWallpaper(filePath);
      }
    } catch (e) {
      print("Error setting wallpaper from URL: $e");
    }
  }

  Future<void> setWallpaper(String filePath) async {
    try {
      bool result = await AsyncWallpaper.setWallpaperFromFile(
        filePath: filePath,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
      );
      if (!result) {
        print("Error setting wallpaper");
      }
    } catch (e) {
      print("Error setting wallpaper: $e");
    }
  }

  Future<void> setWallpaperFromFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null && result.files.single.path != null) {
        final filePath = result.files.single.path!;
        await setWallpaper(filePath);
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }
}
