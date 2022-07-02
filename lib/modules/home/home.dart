import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'widgets/cow_container_widget.dart';
import 'widgets/drawer.dart';
import 'widgets/monitoring_widget.dart';

// import 'package:hexcolor/hexcolor.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: green,
            actions: const [],
          )),
      backgroundColor: background,
      drawer: const drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Top_Container_Widget(),
            const SizedBox(height: 5),
            const CowContainer(),
            const SizedBox(height: 5),
            const monitoring_widget(),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: width / 40, right: width / 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Edukasi'),
                  Text('Edukasi'),
                ],
              ),
            ),
            SizedBox(
              height: 162.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: background,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 90,
                          child: SvgPicture.asset(
                            'assets/listcow/default.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 200,
                            color: Colors.grey,
                            child: Text('data'))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
