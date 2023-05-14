library webcopy;

import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

/// A Calculator.
class WebCopy {
  Future<List<String>> getInternalLinks(String websiteUrl) async {
    List<String> internalLinks = [];

    // Make a GET request to the websi̥te URL
    final response = await http.get(Uri.parse(websiteUrl));

    // Parse the HTML response
    final document = parse(response.body);

    // Extract all the anchor tags from the parsed HTML
    final List<Element> aTags = document.getElementsByTagName('a');

    // Loop through each anchor tag and check if it's an internal link
    aTags.forEach((element) {
      final href = element.attributes['href'];

      if (href != null && !href.startsWith('http')) {
        // If the href attribute is not null and does not start with 'http', it's an internal link
        internalLinks.add(websiteUrl + href);
      }
    });

    // Use the internal links as needed in your Flutter app
    print(internalLinks);
    return internalLinks;
  }
}
