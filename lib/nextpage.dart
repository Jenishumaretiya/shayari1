import 'package:flutter/material.dart';
import 'package:shayari/shayridata.dart';
import 'package:shayari/threepage.dart';

class next extends StatefulWidget {
  int index;
  next(this.index);

  @override
  State<next> createState() => _nextState();
}

class _nextState extends State<next> {
  List shayri=[];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index==0)
      {
        shayri.addAll(data.shubh);
      }else if(widget.index==1){
        shayri.addAll(data.dosti);
    }else if(widget.index==2){
        shayri.addAll(data.majedar);
    }else if(widget.index==3){
      shayri.addAll(data.bhagwan);
    }else if(widget.index==4){
      shayri.addAll(data.jivan);
    }else if(widget.index==5){
      shayri.addAll(data.mohbat);
    } else if(widget.index==6){
      shayri.addAll(data.yad);
    }else if(widget.index==7){
      shayri.addAll(data.prem);
    }else if(widget.index==8){
      shayri.addAll(data.any);
    }else if(widget.index==9){
      shayri.addAll(data.rajniti);
    }else if(widget.index==10){
      shayri.addAll(data.srab);
    }else if(widget.index==11){
      shayri.addAll(data.dard);
    } else if(widget.index==12){
      shayri.addAll(data.bevfa);
    }else if(widget.index==13){
      shayri.addAll(data.holi);
    }else if(widget.index==14){
      shayri.addAll(data.birthday);
    }else if(widget.index==15){
      shayri.addAll(data.perna);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("शायरी"),backgroundColor: Colors.green,),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return third(shayri,index);
                },
              ));
              },
              child: Container(
                color: Colors.pinkAccent,
                child: ListTile(
                  leading: Image.asset("${data.images[widget.index]}"),
                  title: Text("${shayri[index]}",
                    maxLines: 2,),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 3,
              color: Colors.black,
            );
          },
          itemCount: shayri.length)
    );
  }
}
