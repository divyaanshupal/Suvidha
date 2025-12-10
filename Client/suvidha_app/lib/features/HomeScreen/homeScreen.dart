import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<String> _carouselImages = [
    'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=800',
    'https://images.unsplash.com/photo-1557683316-973673baf926?w=800',
    'https://images.unsplash.com/photo-1557682250-33bd709cbe85?w=800',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FA),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 90.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ************** HEADER **************
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1A73E8), Color(0xFF1554C5)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 14.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Suvidha",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              CircleAvatar(
                                radius: 18.r,
                                backgroundColor:
                                    Colors.white.withOpacity(0.12),
                                child: const Icon(
                                  Icons.notifications_none_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Register issues with your city\nand track them in real time.",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 18.h),

                          // GLASS SEARCH BAR
                          _glassBox(
                            child: Row(
                              children: [
                                Icon(Icons.search,
                                    color: Colors.white70, size: 20.sp),
                                SizedBox(width: 10.w),
                                Text(
                                  "Search complaints, IDs...",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 18.h),

                  // *********** CAROUSEL ***********
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 180.h,
                        autoPlay: true,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 900),
                        onPageChanged: (index, reason) {
                          setState(() => _currentIndex = index);
                        },
                      ),
                      items: _carouselImages.map((img) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(18.r),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(img, fit: BoxFit.cover),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.5),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(14.w),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Raise issues in 2 taps\nand let us handle the rest.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _carouselImages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: _currentIndex == index ? 14.w : 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? const Color(0xFF1A73E8)
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 22.h),

                  // *********** QUICK ACTIONS ***********
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Quick actions",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1D2A),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _actionButton(
                          icon: Icons.add_circle_outline_rounded,
                          text: "New complaint",
                          color: const Color(0xFF1A73E8),
                        ),
                        _actionButton(
                          icon: Icons.track_changes_rounded,
                          text: "Track status",
                          color: const Color(0xFFF79009),
                        ),
                        _actionButton(
                          icon: Icons.history_rounded,
                          text: "History",
                          color: const Color(0xFF16A34A),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // *********** CATEGORIES ***********
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1A1D2A),
                          ),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xFF1A73E8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      children: [
                        _categoryCard(
                          icon: Icons.water_damage_outlined,
                          title: "Water supply",
                          subtitle: "Leaks, shortage",
                        ),
                        _categoryCard(
                          icon: Icons.electric_bolt_rounded,
                          title: "Electricity",
                          subtitle: "Outage, faults",
                        ),
                        _categoryCard(
                          icon: Icons.cleaning_services_outlined,
                          title: "Sanitation",
                          subtitle: "Garbage, cleaning",
                        ),
                        _categoryCard(
                          icon: Icons.edit_road_rounded,
                          title: "Road & traffic",
                          subtitle: "Potholes, signals",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // *********** RECENT COMPLAINTS ***********
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Recent complaints",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1D2A),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        _recentComplaintTile(
                          id: "#SU-1023",
                          title: "Street light not working",
                          status: "In progress",
                          statusColor: const Color(0xFFF79009),
                          time: "2 hrs ago",
                        ),
                        _recentComplaintTile(
                          id: "#SU-1018",
                          title: "Water leakage near main road",
                          status: "Resolved",
                          statusColor: const Color(0xFF16A34A),
                          time: "Yesterday",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),
                ],
              ),
            ),

            // *********** PRIMARY CTA BUTTON ***********
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A73E8),
                        padding: EdgeInsets.symmetric(
                          vertical: 14.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // TODO: Navigate to complaint creation screen
                      },
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                      label: Text(
                        "Register new complaint",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // *********** GLASS BOX WIDGET ***********
  Widget _glassBox({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  // *********** QUICK ACTION BUTTON ***********
  Widget _actionButton({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 24.sp, color: color),
        ),
        SizedBox(height: 6.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1A1D2A),
          ),
        ),
      ],
    );
  }

  // *********** CATEGORY CARD ***********
  Widget _categoryCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1A73E8).withOpacity(0.06),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                size: 24.sp,
                color: const Color(0xFF1A73E8),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1D2A),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // *********** RECENT COMPLAINT TILE ***********
  Widget _recentComplaintTile({
    required String id,
    required String title,
    required String status,
    required Color statusColor,
    required String time,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A73E8).withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.report_gmailerrorred_rounded,
              color: const Color(0xFF1A73E8),
              size: 22.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1D2A),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 4.h,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

