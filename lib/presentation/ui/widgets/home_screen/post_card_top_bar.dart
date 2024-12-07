import 'package:flutter/material.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/circular_image.dart';

class PostCardTopBar extends StatelessWidget {
  const PostCardTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [

            CircularImage(),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nafiur Rahman"),
                Text("@nafiur"),
              ],
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}