//
//  button_page
//  flutter_tools
//
//  Created by mac on 2/1/21.
//  Copyright ©2/1/21 flutter_tools. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CYButtonPage extends StatefulWidget {
  @override
  _CYButtonPageState createState() => _CYButtonPageState();
}

class _CYButtonPageState extends State<CYButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                child: Text('RaisedButton'),
                onPressed: () {},
              ),
              /************************** FlatButton start **************************/
              FlatButton(
                // shape: StadiumBorder(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                // padding: EdgeInsets.zero,
                // 去除padding
                height: 0,
                minWidth: 0,
                child: Text(
                  'FlatButton',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.redAccent,
                // highlightColor: Colors.orange,
                disabledColor: Colors.grey,
                onPressed: () {},
              ),
              /************************** FlatButton end **************************/
              OutlineButton(
                padding: EdgeInsets.zero,
                child: Text('OutlineButton'),
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    iconSize: 30,
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  Text('IconButton'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackButton(),
                  Text('BackButton'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CloseButton(),
                  Text('CloseButton'),
                ],
              ),
              CupertinoButton(
                child: Text('ios 风格按钮'),
                onPressed: () {},
              ),
              Text(
                '*****Flutter 1.22版本新增的按钮*****',
                style: TextStyle(color: Colors.redAccent),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.orange,
                child: TextButton(
                  onPressed: () {},
                  child: Text('TextButton'),
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all(Size(0, 0)),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.red[200],
                child: OutlinedButton(
                  child: Text(
                    'OutlinedButton',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    minimumSize: MaterialStateProperty.all(Size(0, 0)),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.pinkAccent,
                child: ElevatedButton(
                  child: Text('ElevatedButton'),
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(0, 0)),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
