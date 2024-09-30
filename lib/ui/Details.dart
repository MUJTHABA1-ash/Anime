import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled7/main.dart';

class Details extends StatefulWidget {
  final String image;
  final String title;
  final List<dynamic> genres;
  final String description;
  const Details({super.key, required this.image, required this.title, required this.genres, required this.description});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> name = ['HORROR', 'MYSTERY', 'THRILLER'];
  List<String> img = [
    "assets/ac.png",
    "assets/ac1.png",
    "assets/ac2.png",
    "assets/ac3.png"
  ];
  List<String> cast = [
    'Tom Holland',
    'Zendaya',
    'Benedict\nCumberbatch',
    'Jacon\nBatalon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: 250.h,
                    width:double.infinity,
                    child: Image.network(widget.image,fit: BoxFit.cover,)),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 30.h),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 20.sp,
                            color: Colors.white,
                          )),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Icon(
                          Icons.menu,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 445.h,
              width: double.infinity.w,
              decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          topLeft: Radius.circular(10.r)))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: Row(
                        children: [
                          SizedBox(height: 70.h,
                            width: 250.w,
                            child: SizedBox(height: 200.h,width: 200.w,
                              child: Text(
                                widget.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:  EdgeInsets.only(right: 20.w),
                            child: Icon(
                              Icons.bookmark_outline,
                              size: 25.sp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '9.1/10 IMDb',
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 12.sp,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 20.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.genres.length,
                          itemBuilder: (BuildContext context, int position) {
                            return Container(
                              height: 50.h,
                              decoration: ShapeDecoration(
                                  color: Color(0xFFDBE3FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r))),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  widget.genres[position].toString(),
                                  style: TextStyle(
                                    color: Color(0xFF87A3E8),
                                    fontSize: 8.sp,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )),
                            );
                          },
                          separatorBuilder: (BuildContext context, int position) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Length',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 12.sp,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '2h 28min',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 70.w,
                          ),
                          Column(
                            children: [
                              Text(
                                'Language',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 12.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'English',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 70.w,
                          ),
                          Column(
                            children: [
                              Text(
                                'Rating',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 12.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'PG-13',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            widget.description,
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 12.sp,
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        children: [
                          Text(
                            'Cast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Container(
                              width: 61.w,
                              height: 21.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.w, color: Color(0xFFE5E4EA)),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'See more',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFAAA8B0),
                                    fontSize: 10.sp,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 120.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: img.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  height: 80.h,
                                  child: Image.asset(img[index],height: 80.h,width: 80.w,),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  cast[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int position) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
