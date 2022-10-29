import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:transisi/model/employee.dart';

import 'package:transisi/theme.dart';

class DetailPage extends StatelessWidget {
  final Employee em;
  const DetailPage({Key? key, required this.em}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        title: Center(
          child: Text(
            'Detail',
            style: primaryTS,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          Container(
            height: 150.h,
            color: primaryColor,
            child: Center(
              child: Container(
                height: 100.h,
                width: 100.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage('${em.avatar}'),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(12.w, 6.h, 12.h, 6.h),
            child: ListTile(
              title: Text('${em.first_name} ${em.last_name}',
                  style: primaryTS.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 16.sp)),
              leading: const Icon(Icons.person),
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(12.w, 6.h, 12.h, 6.h),
            child: ListTile(
              title: Text('${em.email}',
                  overflow: TextOverflow.ellipsis,
                  style: primaryTS.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 16.sp)),
              leading: const Icon(Icons.email),
            ),
          )
        ],
      ),
    );
  }
}
