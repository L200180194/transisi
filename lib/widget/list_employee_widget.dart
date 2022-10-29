import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:transisi/model/employee.dart';
import 'package:transisi/page/detail_page.dart';

import '../theme.dart';

class ListEmployeeWidget extends StatelessWidget {
  final Employee em;
  const ListEmployeeWidget({
    Key? key,
    required this.em,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => DetailPage(
                      em: em,
                    )));
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(12.w, 6.h, 12.h, 6.h),
        child: ListTile(
          title: Text('${em.first_name} ${em.last_name}',
              style: primaryTS.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 16.sp)),
          subtitle: Text('${em.email}', style: primaryTS.copyWith()),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('${em.avatar}'),
          ),
        ),
      ),
    );
  }
}
