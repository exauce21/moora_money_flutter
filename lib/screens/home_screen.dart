import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moora_money_flutter/constants/color_constant.dart';
import 'package:moora_money_flutter/models/card_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //Container top barre AppBar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                //espace entre menu et profil
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   GestureDetector(
                     onTap: (){
                       print('Drawer Tapped');
                     },
                     child : SvgPicture.asset('assets/svg/drawer_icon.svg'),
                   ),
                   Container(
                     height: 59,
                     width: 59,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       image: DecorationImage(image: AssetImage('assets/images/user_image.png'))
                     ),
                   )
                 ],
              ),
            ),

            //Card Section
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Good Morning', style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kBlackColor
                  ),),
                  Text('Exauce Yanga', style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor
                  ),)
                ],
              ),
            ),
            Container(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 6),
                itemCount:  cards.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 199,
                      width: 344,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Color(cards[index].cardBackground),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              child: SvgPicture.asset(cards[index].cardElementTop)),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: SvgPicture.asset(cards[index].cardElementBottom)),
                          Positioned(
                              left: 29,
                              top: 48,
                              child: Text('CARD NUMBER', style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kWhiteColor
                              ),)
                          ),
                          Positioned(
                              left: 29,
                              top: 65,
                              child: Text(cards[index].cardNumber, style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor
                              ),)
                          ),
                          Positioned(
                              right: 21,
                              top: 35,
                              child: Image.asset(cards[index].cardType, width: 27, height: 27,),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 50,
                            child: Text('CARD HOLDERNAME', style: GoogleFonts.inter(
                              color: kWhiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 25,
                            child: Text(cards[index].user, style: GoogleFonts.inter(
                              color: kWhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 45,
                            child: Text('EXPIRY DATE', style: GoogleFonts.inter(
                              color: kWhiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 25,
                            child: Text(cards[index].cardExpired, style: GoogleFonts.inter(
                              color: kWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
