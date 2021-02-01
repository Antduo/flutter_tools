//
//  root
//  flutter_tools
//
//  Created by mac on 2/1/21.
//  Copyright ©2/1/21 flutter_tools. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_tools/models/menu_model.dart';
import 'package:flutter_tools/pages/button/button_page.dart';
import 'package:flutter_tools/utils/navigator.dart';

class CYRoot extends StatefulWidget {
  @override
  _CYRootState createState() => _CYRootState();
}

class _CYRootState extends State<CYRoot> {
  List<CYMenuModel> _dataSource = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('目录'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          CYMenuModel model = _dataSource[index];
          return CYMenuItemWidget(
            model: model,
            onTap: () {
              _onTap(model);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: _dataSource.length,
      ),
    );
  }

  _initData() {
    _dataSource.add(CYMenuModel(title: 'Button', type: 'button'));
    _dataSource.add(CYMenuModel(title: '其他', type: 'other'));
  }

  _onTap(CYMenuModel model) {
    if (model.type == 'button') {
      CYNavigator.push(context, CYButtonPage());
    } else if (model.type == 'other') {}
  }
}

class CYMenuItemWidget extends StatelessWidget {
  final CYMenuModel model;
  final Function onTap;

  const CYMenuItemWidget({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                model?.title ?? '',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: Theme.of(context).textTheme.subtitle2.color,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
