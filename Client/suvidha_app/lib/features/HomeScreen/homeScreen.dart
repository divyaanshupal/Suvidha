import 'dart:ui';
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

  // Modern vibrant palette
  final Color kPrimaryColor = const Color(0xFF4F46E5); // Indigo
  final Color kSecondaryColor = const Color(0xFF0EA5E9); // Sky Blue
  final Color kBgColor = const Color(0xFFF8FAFC); // Very light slate
  final Color kDarkText = const Color(0xFF0F172A);

  final List<String> _carouselImages = [
    'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=800',
    'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=800', // Changed for variety
    'https://images.unsplash.com/photo-1557682250-33bd709cbe85?w=800',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      extendBody: true, // Allows content behind bottom nav/buttons
      body: Stack(
        children: [
          // 1. Dynamic Background Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 320.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r),
                ),
              ),
            ),
          ),
          
          // 2. Decorative Circles for "Vibe"
          Positioned(
            top: -50,
            right: -50,
            child: CircleAvatar(
              radius: 100.r,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 80,
            left: -40,
            child: CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),

          // 3. Main Scrollable Content
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100.h),
              //physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER SECTION
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: _buildHeader(),
                  ),

                  SizedBox(height: 20.h),

                  // STATS / QUICK INFO CARDS
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: _buildQuickStats(),
                  ),

                  SizedBox(height: 25.h),

                  // SECTION TITLE: SERVICES
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    // child: Text(
                    //   "Services",
                    //   style: TextStyle(
                    //     fontSize: 18.sp,
                    //     fontWeight: FontWeight.bold,
                    //     color: kDarkText,
                    //     letterSpacing: 0.5,
                    //   ),
                    // ),
                  ),
                  SizedBox(height: 15.h),
                  
                  // GRID MENU
                  _buildServiceGrid(),

                  SizedBox(height: 25.h),

                  // CAROUSEL SECTION
                  _buildCarousel(),

                  SizedBox(height: 25.h),

                  // RECENT ACTIVITY
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Activity",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: kDarkText,
                          ),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  _buildRecentActivityList(),
                ],
              ),
            ),
          ),

          // 4. Floating Action Button (Modern Style)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
              child: _buildFloatingBottomBar(),
            ),
          ),
        ],
      ),
    );
  }

  // ************** WIDGETS **************

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 24.r,
                    backgroundImage: const NetworkImage(
                      "https://i.imgur.com/BoN9kdC.png",
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning,",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "Divyanshu 👋",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: const Icon(Icons.notifications_none_rounded, color: Colors.white),
            )
          ],
        ),
        SizedBox(height: 25.h),
        // Glassmorphism Search Bar
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.white70, size: 22.sp),
                  SizedBox(width: 12.w),
                  Text(
                    "Search for complaints...",
                    style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statItem("24", "Pending", Colors.orange),
          Container(width: 1, height: 40.h, color: Colors.grey.shade200),
          _statItem("12", "Resolved", Colors.green),
          Container(width: 1, height: 40.h, color: Colors.grey.shade200),
          _statItem("05", "In Progress", Colors.blue),
        ],
      ),
    );
  }

  Widget _statItem(String count, String label, Color color) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceGrid() {
    return SizedBox(
      height: 110.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: const BouncingScrollPhysics(),
        children: [
          _serviceCard(Icons.water_drop_rounded, "Water", const Color(0xFF3B82F6)),
          _serviceCard(Icons.bolt_rounded, "Electric", const Color(0xFFF59E0B)),
          _serviceCard(Icons.delete_outline_rounded, "Waste", const Color(0xFF10B981)),
          _serviceCard(Icons.add_road_rounded, "Roads", const Color(0xFF6366F1)),
          _serviceCard(Icons.local_hospital_outlined, "Health", const Color(0xFFEF4444)),
        ],
      ),
    );
  }

  Widget _serviceCard(IconData icon, String label, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 80.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: kDarkText,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160.h,
            autoPlay: true,
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          items: _carouselImages.map((img) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
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
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15.h,
                    left: 15.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Update",
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "City clean drive\nstarts tomorrow!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _carouselImages.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentIndex == entry.key ? 20.w : 6.w,
              height: 6.h,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _currentIndex == entry.key
                    ? kPrimaryColor
                    : Colors.grey.shade300,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRecentActivityList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          _activityTile("#ID-2921", "Street Light Broken", "In Progress", Colors.orange),
          _activityTile("#ID-2920", "Garbage Pickup Missed", "Resolved", Colors.green),
          _activityTile("#ID-2919", "Water Pipe Leakage", "Pending", Colors.red),
        ],
      ),
    );
  }

  Widget _activityTile(String id, String title, String status, Color statusColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.description_outlined, color: kPrimaryColor, size: 20.sp),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: kDarkText,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 11.sp,
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFloatingBottomBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: kDarkText.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Need Help?",
                    style: TextStyle(color: Colors.white54, fontSize: 11.sp),
                  ),
                  Text(
                    "Register Complaint",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 24.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}