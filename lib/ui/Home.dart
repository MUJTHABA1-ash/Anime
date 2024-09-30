import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled7/Repository/Model_Class/Anime_model.dart';
import 'package:untitled7/ui/Details.dart';

import '../Bloc/anime_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> name = ['HORROR', 'MYSTERY', 'THRILLER'];

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<AnimeBloc>(context).add(FetchAnime());
  }

  late AnimeModel Anime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30.sp,
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'FilmKu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 18.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Now Showing',
                      style: TextStyle(
                        color: Color(0xFF110E46),
                        fontSize: 16.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Container(
                        width: 61.w,
                        height: 21.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Color(0xFFE5E4EA)),
                            borderRadius: BorderRadius.circular(100.r),
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 300.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: BlocBuilder<AnimeBloc, AnimeState>(
                    builder: (context, state) {
                      if (state is Animeloading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is Animeerror) {
                        return RefreshIndicator(
                            onRefresh: () async {
                              return BlocProvider.of<AnimeBloc>(context)
                                  .add(FetchAnime());
                            },
                            child: Center(child: Text("Something went wrong")));
                      }
                      if (state is Animeloaded) {
                        Anime = BlocProvider.of<AnimeBloc>(context).animemodel;
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: Anime.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(onTap: ()
                            {Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Details(image: Anime.data![index].image.toString()
                              , title: Anime.data![index].title.toString(), genres:   Anime.data![index].genres!,
                              description: Anime.data![index].synopsis.toString()
                              ,)));},
                              child: Container(
                                height: 200.h,
                                width: 200.w,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 200.h,
                                      width: 200.w,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r))),
                                      child: Image.network(
                                        Anime.data![index].image.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      Anime.data![index].title.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20.sp,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          '9.1/10 IMDb',
                                          style: TextStyle(
                                            color: Color(0xFF9B9B9B),
                                            fontSize: 12.sp,
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 20.w,
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Popular',
                      style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 16.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Container(
                        width: 61.w,
                        height: 21.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.w, color: Color(0xFFE5E4EA)),
                            borderRadius: BorderRadius.circular(100.r),
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
                height: 240.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: BlocBuilder<AnimeBloc, AnimeState>(
                    builder: (context, state) {
                      if (state is Animeloading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is Animeerror) {
                        return RefreshIndicator(
                            child: Center(child: Text("Somethinng went Wrong")),
                            onRefresh: () async {
                              BlocProvider.of<AnimeBloc>(context)
                                  .add(FetchAnime());
                            });
                      }
                      if (state is Animeloaded) {
                        Anime = BlocProvider.of<AnimeBloc>(context).animemodel;
                        return ListView.separated(
                          itemCount: Anime.data!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(onTap: ()
                            {Navigator.of(context).push(MaterialPageRoute
                              (builder: (_)=>Details(image: Anime.data![index].image.toString(),
                              title: Anime.data![index].title.toString(), genres:  Anime.data![index].genres!,
                              description: Anime.data![index].synopsis.toString(),)));},
                              child: Container(
                                height: 120.h,
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.r))),
                                child: Row(
                                  children: [
                                    Container(height: 120.h,
                                      width: 100.w,
                                      child: Image.network(
                                          Anime.data![index].image.toString(),fit:
                                        BoxFit.cover,),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20.w, top: 5.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 40.h,
                                            width: 200.w,
                                            child: Text(
                                              Anime.data![index].title.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),

                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                '6.4/10 IMDb',
                                                style: TextStyle(
                                                  color: Color(0xFF9B9B9B),
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          SizedBox(
                                            width: 200.w,
                                            height: 20.h,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: Anime
                                                  .data![index].genres!.length,
                                              itemBuilder: (BuildContext context,
                                                  int position) {
                                                return Container(
                                                  height: 50.h,
                                                  decoration: ShapeDecoration(
                                                      color: Color(0xFFDBE3FF),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(
                                                                          20.r))),
                                                  child: Center(
                                                      child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 8.w),
                                                    child: Text(
                                                      Anime.data![index]
                                                          .genres![position]
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Color(0xFF87A3E8),
                                                        fontSize: 8.sp,
                                                        fontFamily: 'Mulish',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  )),
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int position) {
                                                return SizedBox(
                                                  width: 5.w,
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.timer,
                                                size: 20.sp,
                                              ),
                                              Text(
                                                '1h 47m',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10.w,
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
