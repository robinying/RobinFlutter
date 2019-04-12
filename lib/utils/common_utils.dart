/**
 * @desc   常用基础工具类的功能方法
 */
import 'package:flutter/material.dart';
class CommonUtil {

  /// 判断对象[string/map/list/object]是否为空
  static bool isEmpty(Object obj){
    if (obj == null) return true;
    if (obj is String && obj.isEmpty){
      return true;
    } else if (obj is Map && obj.isEmpty){
      return true;
    } else if (obj is List && obj.isEmpty){
      return true;
    }
    return false;
  }

  /// 获取手机状态栏的高度
  static double getStatusBarHeight(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }


}