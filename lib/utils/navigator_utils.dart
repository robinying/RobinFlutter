import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:robin_app/utils/common_utils.dart';

/**
 * 导航栏
 *
 */
class NavigatorUtils {
  static void intentToPage(BuildContext ctx, Widget page, {String pageName}) {
    if (ctx == null || page == null || CommonUtil.isEmpty(pageName)) return;
    Navigator.push(ctx, new CupertinoPageRoute<void>(builder: (ctx) => page));
  }

  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(
        context, new CupertinoPageRoute(builder: (context) => widget));
  }
}
