import 'dart:math';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/shayridata.dart';
import 'fourpage.dart';

class third extends StatefulWidget {
  List shayri;
  int index;

  third(this.shayri, this.index);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  PageController? pageController;
  bool clrtemp = false;
  bool mclr = true;
  int clrind = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var statusbarheight = MediaQuery.of(context).viewPadding.top;
    double appbarheight = kToolbarHeight;
    double total = statusbarheight + appbarheight;
    double height = MediaQuery.of(context).size.height - total;
    return Scaffold(
        appBar: AppBar(
          title: Text("शायरी"),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height,
                          color: Colors.white,
                          child: GridView.builder(
                            itemCount: widget.shayri.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  clrtemp = true;
                                  clrind = index;
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    data.mycolor[index],
                                    data.mycolor[index + 1],
                                  ])),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assests/images/reload.png.jpeg"))),
                  ),
                ),
                Text("${widget.index + 1}/${widget.shayri.length}"),
                InkWell(onTap: () {
                  int t = Random().nextInt(data.mycolor.length-1);
                  clrtemp = true;
                  clrind = t;
                  setState(() {

                  });
                },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                            image:
                                AssetImage("assests/images/expande.png.jpeg"))),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.blueAccent,
              child: PageView.builder(
                controller: PageController(initialPage: widget.index),
                onPageChanged: (value) {
                  widget.index = value;
                  setState(() {});
                },
                itemCount: widget.shayri.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: (clrtemp == true)
                          ? LinearGradient(colors: [
                        data.mycolor[clrind],
                        data.mycolor[clrind + 1]
                      ])
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${widget.shayri[widget.index]}",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Container(
              height: 70,
              width: double.infinity,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        FlutterClipboard.copy('${widget.shayri[widget.index]}')
                            .then((value) => print('copied'));
                      },
                      icon: Icon(Icons.copy)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.index != 0) {
                            widget.index--;
                          }
                        });
                        pageController!.jumpToPage(widget.index);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return four(widget.shayri,widget.index);
                          },
                        ));
                      },
                      icon: Icon(Icons.edit_off)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.index < widget.shayri.length - 1) {
                            widget.index++;
                          }
                        });
                        pageController!.jumpToPage(widget.index);
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                  IconButton(
                      onPressed: () {
                        Share.share('${widget.shayri[widget.index]}');
                      },
                      icon: Icon(Icons.share)),
                ],
              ),
            )
          ],
        ));
  }
}
