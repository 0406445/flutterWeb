import 'package:flutter_screenutil/flutter_screenutil.dart';
extension DpUtils on double{
  double get wDp{
    // return ScreenUtil().setWidth(this);
    return this;
  }
  double get hDp{
    // return ScreenUtil().setHeight(this);
    return this;
  }



}

extension SpUtils on int{
  double get sp{
    // return ScreenUtil().setSp(this);
    return this.toDouble();
  }
}


