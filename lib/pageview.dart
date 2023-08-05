import 'package:flutter/material.dart';
import 'package:shayari/shayridata.dart';

// void main() {
//   runApp(MaterialApp(
//     home: page(),
//   ));
// }

class page extends StatefulWidget {
  const page({Key? key}) : super(key: key);

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  int cur_id = 0;
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: cur_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  cur_id = value;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                  child: Text("${data.first[index]}"),
                );
              },
            ),
          )),
          Expanded(
              child: Container(
            child: Text("${cur_id + 1} ${data.first.length}"),
          )),
          Expanded(
              child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      cur_id--;
                    });
                    pageController!.jumpToPage(cur_id);
                  },
                  icon: Icon(Icons.arrow_forward_ios)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      cur_id++;
                    });
                    pageController!.jumpToPage(cur_id);
                  },
                  icon: Icon(Icons.arrow_back_ios_new))
            ],
          ))
        ],
      ),
    );
  }
}
