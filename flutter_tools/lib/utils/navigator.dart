//
//  cy_navigator
//  register_flutter
//
//  Created by apple on 2020/10/15 .
//  Copyright ©2020/10/15 register_flutter. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_tools/utils/navigator_observer.dart';


/// Navigator工具类
/// fullscreenDialog : 是否模态弹出, 默认 false
class CYNavigator {
  static push(BuildContext context, Widget scene, {fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        settings: RouteSettings(name: scene.toString()),
        builder: (BuildContext context) => scene,
      ),
    );
  }

  /// 替换页面 当新的页面进入后，之前的页面将执行dispose方法
  static pushReplacement(BuildContext context, Widget scene) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          settings: RouteSettings(name: scene.toString()),
          builder: (BuildContext context) => scene,
        ));
  }

  /// 指定页面加入到路由中，然后将其他所有的页面全部pop
  static pushAndRemoveUntil(BuildContext context, Widget scene) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          settings: RouteSettings(name: scene.toString()),
          builder: (BuildContext context) => scene,
        ),
        (route) => route == null);
  }

  /// 接收下一级页面返回传递的参数
  static pushResult(BuildContext context, Widget scene, Function(Object) function) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: scene.toString()),
        builder: (BuildContext context) => scene,
      ),
    ).then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print('$error');
    });
  }

  /// 移除指定页面
  static removeRoute(BuildContext context, Widget scene) {
    // 获取路由栈
    List<Route> history = CYNavigatorObserver.history;
    // 查找出指定页面在栈中的索引
    int index = history.indexWhere((element) => element.settings.name == scene.toString());
    if (index != -1) {
      // 移除路由栈中指定的页面
      Navigator.of(context).removeRoute(history[index]);
    }
  }

  /// 返回
  static void goBack(BuildContext context, {int delayMillSecond = 0}) {
    Future.delayed(Duration(milliseconds: delayMillSecond), () {
      Navigator.pop(context);
    });
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }
}
