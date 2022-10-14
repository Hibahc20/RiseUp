import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rise_up/Colors.dart';
import 'package:rise_up/CommonPages/home.dart';
import 'package:sizer/sizer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedPage = 0;
  List<Widget> screens = [const BeneficiaryHome()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 34),
        width: 100.w,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0XFFFDEBE4),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                offset: Offset(0, -2),
                blurRadius: 20)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPage = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'Assets/icons/home.svg',
                      color: selectedPage == 0 ? navyColor : bottomNavGrey,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 11,
                        color: selectedPage == 0 ? navyColor : bottomNavGrey,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPage = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'Assets/icons/wallet.svg',
                      color: selectedPage == 1 ? navyColor : bottomNavGrey,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: 11,
                        color: selectedPage == 1 ? navyColor : bottomNavGrey,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPage = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'Assets/icons/request.svg',
                      color: selectedPage == 2 ? navyColor : bottomNavGrey,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Requests',
                      style: TextStyle(
                        fontSize: 11,
                        color: selectedPage == 2 ? navyColor : bottomNavGrey,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPage = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'Assets/icons/profile.svg',
                      color: selectedPage == 3 ? navyColor : bottomNavGrey,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 11,
                        color: selectedPage == 3 ? navyColor : bottomNavGrey,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[selectedPage],
    );
  }
}
