import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_my_web/utils/StringUtils.dart';




class ImageLoadUtils extends StatelessWidget {
  String? url;

  String? asset;
  File? file;
  String? defAsset; //默认图标
  String? errAsset; //错误时候的图标
  BoxFit fit;
  bool isNeedInkWell;
  double radius = 0;
  Function? function;
 
  ImageLoadUtils(
      {Key? key,
      this.url,
      this.asset,
      this.file,
      this.fit = BoxFit.cover,
      this.defAsset,
      this.errAsset,
      this.radius = 6,
      this.isNeedInkWell = false, 
        this.function,
      })
      : super(key: key) {}




  @override
  Widget build(BuildContext context) {
    Widget widget = Container();

    if (!StringUtils.isEmpty(url)) {
      // widget = CachedNetworkImage(
      //   imageUrl: url,
      //   placeholder: (context, url) => CircularProgressIndicator(),
      //   // errorWidget: (context, url, error) => Icon(Icons.error),
      //   errorWidget: (context, url, error) =>
      //       errAsset != null ? Image.asset(errAsset) : Container(),
      //   fit: fit,
      // );
 

      widget = Image.network(url!,fit: fit,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress,) {
             if (loadingProgress == null)
               return child;
             return Center(
               child: CircularProgressIndicator(
                 value: loadingProgress.expectedTotalBytes != null
                     ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                     : null,
               ),
             );
           },
          errorBuilder: (context,err,stackTrace){
        return Center(child: errAsset != null ? Image.asset(errAsset!) : Icon(Icons.error),);
      },);


    } else if (!StringUtils.isEmpty(asset)) {
      widget = Image.asset(asset!, fit: fit);
    } else if (file != null) {
      widget = Image.file(
        file!,
        fit: fit,
      );
    }
    if (isNeedInkWell) {
      return Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(radius), child: widget),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              customBorder: StadiumBorder(),
              onTap: () {
                function?.call();
              },
            ),
          ),
        ],
      );
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius), child: widget);
  }
}
