import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 15,
          decoration: const BoxDecoration(color: Colors.grey),
        ),
        Container(
          height: 80,
          width: 400,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text('Flutter Indonesia'),
              subtitle: Text('Safik'),
            ),
          ),
        ),
        Container(
          width: 400,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 8, 8),
            child: Text(
                'gimana cara membuat data menjadi realtime di flutter dengan menggunakan getx dan firebase gimana cara membuat data menjadi realtime di flutter dengan menggunakan getx dan firebase'),
          ),
        ),
        Container(
          height: 200,
          width: 400,
          decoration: const BoxDecoration(color: Colors.blue),
          child: Image.network(
            "https://www.duniasapi.com/media/k2/items/cache/75b44b0e9c2e5d305fa323c6c51d3476_XL.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 40,
          width: 400,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: const [
              Positioned(top: 10, left: 30, child: Text('5 like')),
              Positioned(top: 10, right: 30, child: Text('9 comment')),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.white,
        ),
        Container(
          height: 40,
          width: 400,
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                ),
                onPressed: () {},
              ),
              const Icon(
                Icons.chat_bubble_outline,
              ),
              const Icon(Icons.share_outlined)
            ],
          ),
        ),
      ],
    );
  }
}
