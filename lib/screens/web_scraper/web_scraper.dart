import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';

class WebScraperApp extends StatefulWidget {
  const WebScraperApp({Key? key}) : super(key: key);

  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://biblembang.ditjenpkh.pertanian.go.id');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>>? productNames;
  late List<Map<String, dynamic>> productDescriptions;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('/product/category/simental')) {
      {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        productNames = webScraper.getElement(
            'div.row.loop-posts > div.col-md-4 > div.thumbnail.no-border > div.caption > h4 > a',
            ['href', 'title']);
        productDescriptions = webScraper.getElement(
            'div.thumbnail > div.caption > p.description', ['class']);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
      ),
      body: SafeArea(
        child: productNames == null
            ? const Center(
                child:
                    CircularProgressIndicator(), // Loads Circular Loading Animation
              )
            : ListView.builder(
                itemCount: productNames!.length,
                itemBuilder: (BuildContext context, int index) {
                  // Attributes are in the form of List<Map<String, dynamic>>.
                  Map<String, dynamic> attributes =
                      productNames![index]['attributes'];
                  return ExpansionTile(
                    title: Text(productNames![index]['title']),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(productNames![index]['title']),
                              margin: const EdgeInsets.only(bottom: 10.0),
                            ),
                            InkWell(
                              onTap: () {
                                // uses UI Launcher to launch in web browser & minor tweaks to generate url
                                launch(
                                    webScraper.baseUrl! + attributes['href']);
                              },
                              child: const Text(
                                'View Product',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
      ),
    );
  }
}
