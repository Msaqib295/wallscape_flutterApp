import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FullScreen extends StatelessWidget {
  final String imgUrl;

  const FullScreen({super.key, required this.imgUrl});

  void showWallpaperOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Set Wallpaper"),
          content: Text("Choose where you want to set the wallpaper."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                setWallpaper(context, WallpaperManagerFlutter.homeScreen);
              },
              child: Text("Home Screen"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                setWallpaper(context, WallpaperManagerFlutter.lockScreen);
              },
              child: Text("Lock Screen"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Future<void> setWallpaper(BuildContext context, int location) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      try {
        File imageFile = await DefaultCacheManager().getSingleFile(imgUrl);
        bool result = await WallpaperManagerFlutter().setWallpaper(
          imageFile,
          location,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result ? 'Wallpaper set successfully!' : 'Failed to set wallpaper.',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 3),
            backgroundColor: result ? Colors.green : Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6.0,
            margin: EdgeInsets.all(16),
            action: result
                ? SnackBarAction(
              label: 'OK',
              textColor: Colors.white,
              onPressed: () {
                // Can be left empty or use to navigate somewhere
              },
            )
                : null,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error setting wallpaper: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission denied.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width * 0.25,
            child: ElevatedButton(
              onPressed: () => showWallpaperOptions(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.7),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'SET WALLPAPER',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
