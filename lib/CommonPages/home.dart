import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rise_up/Colors.dart';
import 'package:sizer/sizer.dart';

class BeneficiaryHome extends StatefulWidget {
  const BeneficiaryHome({Key? key}) : super(key: key);

  @override
  State<BeneficiaryHome> createState() => _BeneficiaryHomeState();
}

class _BeneficiaryHomeState extends State<BeneficiaryHome> {
  TextEditingController searchController = TextEditingController();
  /* bool getDeviceType() {
    //returns true if device is phone
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? true : false;
  } */
  bool shrinkUi() {
    //device width is smaller than that of the design and elements needs to get smaller by a bit
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.width < 812 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 5.h,
                  width: 100.w,
                  color: navyColor,
                ),
                SvgPicture.asset(
                  'Assets/backgrounds/bgNavy.svg',
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Hi, User Name',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lucida Sans',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.notifications_none_sharp,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 28.41,
                            ),
                            Container(
                              width: 46,
                              height: 46,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                                    ),
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 51,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16),
                          child: const Text(
                            'Find Nearby Merchant Stores',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Lucida Sans',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          width: 100.w - 32,
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                            width: shrinkUi() == true ? 267 : 287,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                    offset: Offset(0, -2),
                                    blurRadius: 20)
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: TextField(
                                controller: searchController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search address, or near you ',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                              ),
                            )),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  offset: Offset(0, -2),
                                  blurRadius: 20)
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.search,
                              color: navyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: shrinkUi() == true ? 92 : 102,
                          height: shrinkUi() == true ? 75 : 80,
                          margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: const Color(0XFFF94343),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  offset: Offset(0, -2),
                                  blurRadius: 20)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'Assets/icons/food.svg',
                              ),
                              const Text(
                                'Food',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lucida Sans',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: shrinkUi() == true ? 92 : 102,
                          height: shrinkUi() == true ? 75 : 80,
                          //margin: const EdgeInsets.fromLTRB(0, 0, 19, 0),
                          decoration: BoxDecoration(
                            color: const Color(0XFF6F0151),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  offset: Offset(0, -2),
                                  blurRadius: 20)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'Assets/icons/medicine.svg',
                              ),
                              const Text(
                                'Medicine',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lucida Sans',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: shrinkUi() == true ? 92 : 102,
                          height: shrinkUi() == true ? 75 : 80,
                          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          decoration: BoxDecoration(
                            color: const Color(0XFFFF9E5C),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  offset: Offset(0, -2),
                                  blurRadius: 20)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'Assets/icons/other.svg',
                              ),
                              const Text(
                                'Other',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lucida Sans',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
