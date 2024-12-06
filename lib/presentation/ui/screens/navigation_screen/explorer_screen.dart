import 'package:flutter/material.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';
import 'package:socia_live/presentation/ui/widgets/profile_widgets/profile_photo_gallery_list_grid_view.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({super.key});

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        title: _searchTextField(),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(3.0),
        child: ProfilePhotoGalleryListGridView(imageList: AppAssetsPath().demoImageList,),
      ),
    );
  }

  Widget _searchTextField() {
    return TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blueAccent
            )
          ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Colors.blueAccent
                )
            )
        ),
      );
  }
}
