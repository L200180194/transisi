import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
      height: 40.h,
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () {},
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 11.w),
              width: 16.h,
              height: 16.h,
              child: const CircularProgressIndicator(color: Colors.white),
            ),
            Text(
              'Loading',
              style: primaryTS.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
