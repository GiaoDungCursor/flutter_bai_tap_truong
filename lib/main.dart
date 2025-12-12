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
      home: const DashboardScreen(),
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
        title: const Text(
          'Tôn Thất Nam Giao',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
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
                        title: 'Đăng nhập',
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
                        title: 'Đăng ký',
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