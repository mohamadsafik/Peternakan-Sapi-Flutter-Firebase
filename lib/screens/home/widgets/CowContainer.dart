import 'package:flutter/material.dart';

class cowContainer extends StatelessWidget {
  const cowContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 85,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              const Positioned(
                  left: 5,
                  child: SizedBox(
                      height: 85,
                      child: Image(image: AssetImage('assets/home/cow1.png')))),
              Positioned(
                top: 20,
                left: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'tores',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '15',
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.next_plan,
                      color: Colors.grey,
                      size: 35,
                    )),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 375,
          height: 85,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              const Positioned(
                  left: 5,
                  child: SizedBox(
                      height: 85,
                      child: Image(image: AssetImage('assets/home/cow2.png')))),
              Positioned(
                top: 20,
                left: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'tores',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '15',
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.next_plan,
                      color: Colors.grey,
                      size: 35,
                    )),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 375,
          height: 85,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              const Positioned(
                  left: 5,
                  child: SizedBox(
                      height: 85,
                      child: Image(image: AssetImage('assets/home/cow3.png')))),
              Positioned(
                top: 20,
                left: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'tores',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '15',
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.next_plan,
                      color: Colors.grey,
                      size: 35,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
