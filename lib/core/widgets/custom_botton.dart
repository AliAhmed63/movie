// import 'package:bloc_weal/core/recourses/styles_manger/styles_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomBotton extends StatelessWidget {
//   const CustomBotton({
//     super.key,
//     this.radius,
//     required this.text,
//     required this.onPressed,
//     this.height,
//     this.textColor,
//     this.fontSize,
//     this.width,
//   });

//   final String? text;
//   final double? radius;
//   final double? width;
//   final double? height;
//   final Color? textColor;
//   final Function()? onPressed;
//   final double? fontSize;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? double.infinity,
//       height: height ?? 60.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(radius ?? 16.sp),
//         ),
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF153E73), // اللون الأساسي
//             Color(0xFF3A6BAA),
//             Color.fromARGB(255, 146, 189, 245), // لون أفتح
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: TextButton(
//         onPressed: onPressed,
//         child: Text(
//           text ?? "",
//           maxLines: 1,
//           textAlign: TextAlign.center,
//           style: getBoldStyle(
//             color: textColor ?? Colors.white,
//             fontSize: fontSize ?? 16.sp,
//           ),
//         ),
//       ),
//     );
//   }
// }
