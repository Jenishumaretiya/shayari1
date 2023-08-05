import 'package:flutter/material.dart';
import 'package:shayari/nextpage.dart';
import 'package:shayari/shayridata.dart';

// void main() {
//   runApp(MaterialApp(
//     home: view(),
//   ));
// }

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("view data"),
          backgroundColor: Colors.green,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return next(index);
                    },
                  ));
                },
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      "${data.first[index]}",
                      style: const TextStyle(color: Colors.green),
                    ),
                    leading: Image.asset(
                      data.images[index],
                      height: 50,
                      width: 50,
                    ),
                    trailing: const Icon(Icons.add),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 3,
                color: Colors.greenAccent,
              );
            },
            itemCount: data.first.length));
  }
}
