import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/app_color.dart';

class SliverAppbarImage extends StatelessWidget {
  const SliverAppbarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 350.h,
      surfaceTintColor: Colors.blue,

      backgroundColor: AppColor.deepOrange.withValues(alpha: 0.5),

      // leading: Padding(
      //   padding: EdgeInsetsDirectional.only(start: 10.w),
      //   child: const CircleAvatar(
      //     backgroundColor: Colors.white,
      //     child: Icon(Icons.close),
      //   ),
      // ),
      // actionsPadding: EdgeInsetsDirectional.only(end: 10.w),
      // actions: [
      //   CircleAvatar(
      //     backgroundColor: AppColor.white,
      //     child: IconButton(
      //       onPressed: () {

      //       },
      //       icon: Icon(
      //         Icons.bookmark_border,
      //         color: Theme.of(context).iconTheme.color,
      //       ),
      //     ),
      //   ),
      // ],
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl:
              "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=2048x2048&w=is&k=20&c=KTpY1O4d7-EuX-R_GR_44Upc-n9esJOZFpcqvA4CM0E=",
          placeholder:
              (context, url) =>
                  const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),

      //  Stack(
      //   children: [
      //     Positioned.fill(
      //       child: CachedNetworkImage(
      //         fit: BoxFit.cover,
      //         imageUrl:
      //             "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=2048x2048&w=is&k=20&c=KTpY1O4d7-EuX-R_GR_44Upc-n9esJOZFpcqvA4CM0E=",
      //         placeholder:
      //             (context, url) =>
      //                 const Center(child: CircularProgressIndicator()),
      //         errorWidget: (context, url, error) => const Icon(Icons.error),
      //       ),
      //     ),

      //     Positioned(
      //       top: 40.h,
      //       left: 20.w,
      //       child: CircleAvatar(
      //         backgroundColor: Colors.white,
      //         child: IconButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: const Icon(Icons.close),
      //           style: Theme.of(context).iconButtonTheme.style,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       top: 40.h,
      //       right: 20.w,
      //       child: CircleAvatar(
      //         backgroundColor: AppColor.white,
      //         child: IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             Icons.bookmark_border,
      //             color: Theme.of(context).iconTheme.color,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
