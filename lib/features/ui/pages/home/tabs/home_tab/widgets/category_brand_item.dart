import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryBrandItem extends StatelessWidget {
  final String dataName ;
  final String imageUrl ;
  const CategoryBrandItem({super.key,required this.dataName,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.h,
          child: CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(height: 5.h,),
        Text(dataName,style:Theme.of(context).textTheme.bodyMedium ,)
      ],
    );
  }
}
