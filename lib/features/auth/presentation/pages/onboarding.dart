import 'dart:async';

import 'package:clinic_doctor_interview/core/theme/colors.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/pages/login_page.dart';
import 'package:clinic_doctor_interview/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  final PageController _pagecontroller = PageController();
  late Timer _timer;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    _timer = Timer.periodic(Duration(seconds: 6), (_) {
      if (_pagecontroller.hasClients) {
        currentPage++;
        if (currentPage >= 3) currentPage = 0;
        _pagecontroller.animateToPage(
          currentPage,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pagecontroller,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/image_login1.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image_login3.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image_login2.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.28,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pagecontroller,
                count: 3,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 20,
                  spacing: 8,
                  activeDotColor: CustomColors.activedotcolor,
                  dotColor: CustomColors.dotcolor,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.26,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 67,
                        height: 4,
                        decoration: BoxDecoration(
                          color: CustomColors.dividercolor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Title
                      Text(
                        "Your Health, Our Priority",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),

                      //subtitle
                      Text(
                        'Book appointments with trusted doctors anytime, anywhere.',
                        style: GoogleFonts.poppins(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // Custom Button
                      AuthButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            LoginPage.route(),
                            (route) => false,
                          );
                        },
                        text: "Get started",
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
