import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/WallPaper_Provider.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _urlController = TextEditingController();
    final wallpaperProvider = Provider.of<WallpaperProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Set Wallpaper'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'Enter Image URL'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_urlController.text.isNotEmpty) {
                      await wallpaperProvider.setWallpaperFromUrl(_urlController.text);
                    }
                  },
                  child: Text('Set from URL'),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await wallpaperProvider.setWallpaperFromFile();
                  },
                  child: Text('Set from File'),
                ),
              ],
            ),
            SizedBox(height: 30,),

            Text('Choose image to set your Wallpaper',style: TextStyle(
              fontSize: 18
            )),

            SizedBox(height: 10,),
            Expanded(
              child: Consumer<WallpaperProvider>(
                builder: (context, provider, child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: provider.imageUrls.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          await provider.setWallpaperFromUrl(provider.imageUrls[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage( provider.imageUrls[index],
                             ), fit: BoxFit.cover,)
                          ),

                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}