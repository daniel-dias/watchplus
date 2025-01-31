import 'package:flutter/material.dart';

class Source extends StatelessWidget {
  const Source({
    super.key,
    this.source,
    this.sourceUrl,
  });

  final String? source;
  final String? sourceUrl;

  // SourceWidget({this.source, this.sourceUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 150,
      height: 150,
      child: const Text('1'),
    );

    // return Container(
    //   child: Row(
    //     children: <Widget>[
    //       Icon(Icons.link),
    //       SizedBox(width: 5),
    //       InkWell(
    //         child: Text(
    //           source,
    //           style: TextStyle(
    //             color: Colors.blue,
    //             decoration: TextDecoration.underline,
    //           ),
    //         ),
    //         // onTap: () {
    //         //   launch(sourceUrl);
    //         // },
    //       ),
    //     ],
    //   ),
    // );
  }
}
