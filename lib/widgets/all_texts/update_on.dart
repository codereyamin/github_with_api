import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateOnText extends StatelessWidget {
  const UpdateOnText({super.key, required this.updateDate, required this.isGridView});
  final String updateDate;
  final bool isGridView;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.tryParse(updateDate)!;
    String date = dateTime.toIso8601String().split("T").first;
    return isGridView
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Updated on :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                maxLines: 1,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                maxLines: 1,
              )
            ],
          )
        : Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SizedBox(
              width: 200.w,
              child: Text(
                "Updated on : $date",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          );
  }
}
