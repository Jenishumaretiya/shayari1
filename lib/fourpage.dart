import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shayari/shayridata.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:external_path/external_path.dart';

class four extends StatefulWidget {
  List shayri = [];
  int index;

  four(this.shayri, this.index, {super.key});

  @override
  State<four> createState() => _fourState();
}

// ignore: camel_case_types
class _fourState extends State<four> {
  double l = 10;
  double fontsize = 15;
  bool clrtemp = false;
  bool mclr = true;
  int clrind = 0;
  Color j = Colors.white;
  Color u = Colors.orange;
  String emj = "🦁🦁🦁";

  List fontdata = [
    "f1",
    "f2",
    "f3",
    "f4",
    "f5",
    "f6",
    "f7",
    "f7",
    "f8",
    "f9",
    "f10",
  ];
  String ff = "f1";
  WidgetsToImageController controller = WidgetsToImageController();

// to save image bytes of widget
  Uint8List? bytes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_permission();
  }

  get_permission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      print(statuses[Permission.location]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var statusbarheight = MediaQuery.of(context).viewPadding.top;
    double appbarheight = kToolbarHeight;
    double total = statusbarheight + appbarheight;
    double height = MediaQuery.of(context).size.height - total;
    return Scaffold(
      appBar: AppBar(
        title: Text("फोटो पे शायरी लिखे"),
      ),
      body: Column(
        children: [
          WidgetsToImage(
            controller: controller,
            child: Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: (clrtemp == false) ? j : Colors.teal,
                gradient: (clrtemp == true)
                    ? LinearGradient(colors: [
                        data.mycolor[clrind],
                        data.mycolor[clrind + 1]
                      ])
                    : null,
              ),
              child: Text(
                "${emj}${widget.shayri[widget.index]}${emj}",
                style: TextStyle(fontSize: l, fontFamily: ff, color: u),
              ),
              alignment: Alignment.center,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  margin: EdgeInsets.only(left: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      image: DecorationImage(
                          image: AssetImage("assests/images/reload.png.jpeg"))),
                ),
              ),
              Text("      "),
              InkWell(
                onTap: () {
                  int t = Random().nextInt(data.mycolor.length - 1);
                  clrtemp = true;
                  clrind = t;
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      image: DecorationImage(
                          image:
                              AssetImage("assests/images/expande.png.jpeg"))),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 100,
                        child: GridView.builder(
                          itemCount: data.mycolor.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 10,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                j = data.mycolor[index];
                                setState(() {});
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                color: data.mycolor[index],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 90,
                  height: 50,
                  color: Colors.red,
                  child: Text("Background"),
                  alignment: Alignment.center,
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 100,
                        child: GridView.builder(
                          itemCount: data.mycolor.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 10,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                u = data.mycolor[index];
                                setState(() {});
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                color: data.mycolor[index],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 90,
                  height: 50,
                  color: Colors.red,
                  child: Text("Text Color"),
                  alignment: Alignment.center,
                ),
              ),
              InkWell(
                onTap: () async {
                  bytes = await controller.capture();
                  var path =
                      await ExternalPath.getExternalStoragePublicDirectory(
                              ExternalPath.DIRECTORY_DOWNLOADS) +
                          "/syimage";
                  Directory dir = Directory(path);
                  if (!await dir.exists()) ;
                  {
                    dir.create();
                  }
                  int r = Random().nextInt(10000);
                  String img_name = "img_jpg";
                  File f = File("${path}/${img_name}");
                  await f.writeAsBytes(bytes!);

                  Share.shareFiles(['${f.path}'], text: 'Great picture');
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 90,
                  height: 50,
                  color: Colors.red,
                  child: Text("Share"),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 60,
                        color: Colors.cyanAccent,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: fontdata.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                ff = fontdata[index];
                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                color: Colors.cyan,
                                margin: EdgeInsets.all(10),
                                height: 50,
                                alignment: Alignment.center,
                                child: Text(
                                  "Shayri",
                                  style: TextStyle(fontFamily: fontdata[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 90,
                  height: 50,
                  color: Colors.red,
                  child: Text("Font"),
                  alignment: Alignment.center,
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 100,
                        child: ListView.builder(
                          itemCount: data.emoji.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                emj = data.emoji[index];
                                setState(() {});
                              },
                              title: Text("${data.emoji[index]}"),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 90,
                  height: 50,
                  color: Colors.red,
                  child: Text("Emoji"),
                  alignment: Alignment.center,
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState1) {
                          return Container(
                            height: 70,
                            child: Slider(
                              value: l,
                              max: 40,
                              min: 4,
                              onChanged: (value) {
                                l = value;
                                fontsize = value;
                                setState1(() {
                                  setState(() {});
                                });
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 90,
                  height: 50,
                  color: Colors.red,
                  child: Text("Text Size"),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
