import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostCardBottomBar extends StatelessWidget {
  const PostCardBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 32,
                )),
            IconButton(
                onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.comment)),
            const Text(
              "${20} comments",
            )
          ],
        ),
        IconButton(
            onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bookmark))
      ],
    );
  }
}