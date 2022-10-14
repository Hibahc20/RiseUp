import 'package:flutter/material.dart';
import 'package:rise_up/CommonPages/Auth/WelcomeScreen.dart';
import 'package:rise_up/lang/locale_keys.g.dart';
import '../../Colors.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return  Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          leading: const BackButton(
              color: orangeColor // <-- SEE HERE
          ),
        ),
        body:Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left:10),
              color: bgColor,
              child:   ListTile(
                title: Text(
                LocaleKeys.CategoryScreen_lblTitle.tr(),
                  style: const TextStyle(
                    fontFamily: "Lucida Sans",
                    color: blueTextColor,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                 LocaleKeys.CategoryScreen_lblSubTitle.tr(),
                  style:const TextStyle(
                    fontFamily: "Open Sans",
                    color: greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child:ListView.builder(
                      itemCount: 1,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  const WelcomeScreen(category: 'Beneficiary')),
                                );
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 200,
                                          alignment: Alignment.bottomLeft,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("Assets/Images/unsplash_-vzClPe2Yj8.png"),
                                                fit: BoxFit.fill,
                                              )
                                          ),
                                          child:Container(
                                            alignment: Alignment.bottomLeft,
                                            height:MediaQuery.of(context).size.width/2-50,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("Assets/Images/Vector1.png"),
                                                  fit: BoxFit.fill,
                                                )
                                            ),
                                            child: Padding(
                                              padding:const EdgeInsets.only(bottom: 8.0),
                                              child: ListTile(
                                                title: Padding(
                                                  padding:const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                     LocaleKeys.CategoryScreen_lblCatTitle1.tr(),
                                                      style:const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w600,
                                                          color: whiteColor
                                                      )
                                                  ),
                                                ),
                                                subtitle:Text(
                                                    LocaleKeys.CategoryScreen_lblCatDesc1.tr(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: whiteColor
                                                    )
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const WelcomeScreen(category: 'Donor')),
                                );
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 200,
                                          alignment: Alignment.bottomLeft,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("Assets/Images/Rectangle 17465.png"),
                                                fit: BoxFit.fill,
                                              )
                                          ),
                                          child:Container(
                                            alignment: Alignment.bottomLeft,
                                            height:MediaQuery.of(context).size.width/2-50,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("Assets/Images/Vector (1).png"),
                                                  fit: BoxFit.fill,
                                                )
                                            ),
                                            child:  Padding(
                                              padding:const EdgeInsets.only(bottom: 8.0),
                                              child: ListTile(
                                                title: Padding(
                                                  padding:const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                      LocaleKeys.CategoryScreen_lblCatTitle2.tr(),
                                                      style:const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w600,
                                                          color: whiteColor
                                                      )
                                                  ),
                                                ),
                                                subtitle:Text(
                                                    LocaleKeys.CategoryScreen_lblCatDesc2.tr(),
                                                    style:const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: whiteColor
                                                    )
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const WelcomeScreen(category: 'Merchant')),
                                );
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 200,
                                          alignment: Alignment.bottomLeft,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("Assets/Images/unsplash_2z_bmzIuksM.png"),
                                                fit: BoxFit.fill,
                                              )
                                          ),
                                          child:Container(
                                            alignment: Alignment.bottomLeft,
                                            height:MediaQuery.of(context).size.width/2-50,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("Assets/Images/Vector (2).png"),
                                                  fit: BoxFit.fill,
                                                )
                                            ),
                                            child:  Padding(
                                              padding:const EdgeInsets.only(bottom: 8.0),
                                              child: ListTile(
                                                title: Padding(
                                                  padding:const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                      LocaleKeys.CategoryScreen_lblCatTitle3.tr(),
                                                      style:const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w600,
                                                          color: whiteColor
                                                      )
                                                  ),
                                                ),
                                                subtitle:Text(
                                                    LocaleKeys.CategoryScreen_lblCatDesc3.tr(),
                                                    style:const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: whiteColor
                                                    )
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        );
                      }),
                )
            ),
          ],
        ));

  }

}
