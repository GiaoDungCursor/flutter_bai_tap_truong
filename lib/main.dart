import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginform.dart';
import 'package:flutter_application_1/bmi.dart';
import 'package:flutter_application_1/new_list.dart';
import 'package:flutter_application_1/carllist.dart';
import 'package:flutter_application_1/change_color_app.dart';
import 'package:flutter_application_1/countdonwntimer_app.dart';
import 'package:flutter_application_1/counter_app.dart';
import 'package:flutter_application_1/feedbackpage.dart';
import 'package:flutter_application_1/registerfrom.dart';
import 'package:flutter_application_1/thebt.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/myhomepage.dart';
import 'package:flutter_application_1/myplace.dart';
import 'package:flutter_application_1/myproduct_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tôn Thất Nam Giao',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Keep Dashboard as the home but also expose named routes for the drawer
      home: const DashboardScreen(),
      routes: {
        '/mainpage': (context) => const DashboardScreen(),
        '/bai1': (context) => const myclassroom(),
        '/hotel_list_file': (context) => const HomeScreen(),
        '/bai3': (context) => const ChangeColorApp(),
        '/auth': (context) => const LoginFormScreen(),
        '/products': (context) => const ProductApi(),
        '/news_list': (context) => const NewsList(),
        '/bmi_calculator': (context) => const BMIPage(),
        '/feedback_form': (context) => const FeedbackPage(),
        '/landing': (context) => const HomePage(),
        '/bai10': (context) => const MyHomePage(),
        '/bai11': (context) => const HomeScreen(),
      },
    );
  }
}

// ----------------------------- App Drawer -----------------------------
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Drawer(
        // prevent the drawer from exceeding the viewport width on small screens
        width: MediaQuery.of(context).size.width * 0.85,
        elevation: 14,
        shadowColor: Colors.black.withOpacity(0.25),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey.shade100,
                Colors.grey.shade200,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildHeader(),
              const SizedBox(height: 6),
              _hoverItem(context, Icons.home, "Mainpage", "/mainpage"),
              _hoverItem(context, Icons.class_, "Bài 1 - Classroom", "/bai1"),
              _hoverItem(context, Icons.hotel, "Bài 2 - Hotel List", "/hotel_list_file"),
              _hoverItem(context, Icons.color_lens, "Bài 3 - Color & Timer", "/bai3"),
              _hoverItem(context, Icons.lock_open, "Bài 4 - Login & Register", "/auth"),
              _hoverItem(context, Icons.shopping_bag, "Bài 5 - Product", "/products"),
              _hoverItem(context, Icons.newspaper, "Bài 6 - News List", "/news_list"),
              _hoverItem(context, Icons.fitness_center, "Bài 7 - BMI Calculator", "/bmi_calculator"),
              _hoverItem(context, Icons.feedback, "Bài 8 - Feedback Form", "/feedback_form"),
              _hoverItem(context, Icons.landscape, "Bài 9 - Landing Page", "/landing"),
              _hoverItem(context, Icons.home_work, "Bài 10 - My Home", "/bai10"),
              _hoverItem(context, Icons.web, "Bài 11 - Web Page", "/bai11"),
            ],
          ),
        ),
      ),
    );
  }

  /// ⭐ HEADER TRÒN + CHUYÊN NGHIỆP
  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade700,
            Colors.blue.shade500,
            Colors.blue.shade300,
          ],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(30),
          topLeft: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(20),
          child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white.withOpacity(0.9),
            child: const Icon(Icons.school, size: 34, color: Colors.blue),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              "Tôn Thất Nam Giao",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hoverItem(BuildContext context, IconData icon, String title, String route) {
    bool isHover = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()..scale(isHover ? 1.05 : 1.0),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: isHover ? Colors.blue.withOpacity(0.12) : Colors.transparent,

              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.28),
                        blurRadius: 16,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
            ),
            child: ListTile(
              leading: Icon(
                icon,
                size: 26,
                color: isHover ? Colors.blue.shade700 : Colors.black87,
              ),
              title: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: isHover ? 18 : 16,
                  fontWeight: isHover ? FontWeight.bold : FontWeight.normal,
                  color: isHover ? Colors.blue.shade700 : Colors.black87,
                ),
                child: Text(title),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, route);
              },
            ),
          ),
        );
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.deepPurple.shade400,
                Colors.blue.shade400,
                Colors.cyan.shade300,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
        title: Text(
          'Tôn Thất Nam Giao',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade50,
              Colors.blue.shade50,
              Colors.white,
            ],
            stops: const [0.0, 0.3, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Text(
                      'Danh sách Dịch vụ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              Colors.deepPurple.shade700,
                              Colors.blue.shade600,
                            ],
                          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Chọn dịch vụ bạn muốn sử dụng',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Grid Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.0,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildServiceCard(
                        context,
                        title: 'Đăng nhập (api)',
                        icon: Icons.login_rounded,
                        gradientColors: [Colors.orange.shade400, Colors.deepOrange.shade600],
                        destination: const LoginFormScreen(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Tính BMI',
                        icon: Icons.health_and_safety_rounded,
                        gradientColors: [Colors.green.shade400, Colors.teal.shade600],
                        destination: const BMIPage(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Tin tức',
                        icon: Icons.newspaper_rounded,
                        gradientColors: [Colors.red.shade400, Colors.pink.shade600],
                        destination: const NewsList(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Khóa học',
                        icon: Icons.school_rounded,
                        gradientColors: [Colors.purple.shade400, Colors.deepPurple.shade600],
                        destination: const CardList(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Đổi màu',
                        icon: Icons.palette_rounded,
                        gradientColors: [Colors.amber.shade400, Colors.orange.shade600],
                        destination: const ChangeColorApp(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Bộ đếm giờ',
                        icon: Icons.timer_rounded,
                        gradientColors: [Colors.indigo.shade400, Colors.blue.shade700],
                        destination: const CountdownTimerScreen(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Đếm số',
                        icon: Icons.add_circle_rounded,
                        gradientColors: [Colors.blue.shade400, Colors.cyan.shade600],
                        destination: const CounterApp(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Phản hồi',
                        icon: Icons.feedback_rounded,
                        gradientColors: [Colors.deepOrange.shade400, Colors.red.shade600],
                        destination: const FeedbackPage(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Đăng ký (no api)',
                        icon: Icons.person_add_rounded,
                        gradientColors: [Colors.teal.shade400, Colors.green.shade600],
                        destination: const RegisterFormScreen(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Lớp học',
                        icon: Icons.class_rounded,
                        gradientColors: [Colors.brown.shade400, Colors.brown.shade700],
                        destination: const myclassroom(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Khách sạn',
                        icon: Icons.hotel_rounded,
                        gradientColors: [Colors.pink.shade400, Colors.pinkAccent.shade700],
                        destination: const HomeScreen(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Welcome',
                        icon: Icons.home_rounded,
                        gradientColors: [Colors.cyan.shade400, Colors.lightBlue.shade600],
                        destination: const HomePage(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Chào mừng',
                        icon: Icons.waving_hand_rounded,
                        gradientColors: [Colors.lightGreen.shade400, Colors.green.shade600],
                        destination: const MyHomePage(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Địa điểm',
                        icon: Icons.place_rounded,
                        gradientColors: [Colors.deepPurple.shade400, Colors.purple.shade700],
                        destination: const LakePage(),
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Sản phẩm',
                        icon: Icons.shopping_cart_rounded,
                        gradientColors: [Colors.blueGrey.shade400, Colors.blueGrey.shade700],
                        destination: const ProductApi(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Color> gradientColors,
    required Widget destination,
  }) {
    return Hero(
      tag: title,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => destination,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOutCubic;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 400),
              ),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: gradientColors[0].withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: gradientColors[1].withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 42,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.3,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            offset: Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}