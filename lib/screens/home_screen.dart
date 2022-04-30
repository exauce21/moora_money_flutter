import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moora_money_flutter/constants/color_constant.dart';
import 'package:moora_money_flutter/models/card_model.dart';
import 'package:moora_money_flutter/models/operation_model.dart';
import 'package:moora_money_flutter/models/transaction_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Curent
  int current = 0;

  //Handle Indicateur
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 8),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: <Widget>[
              //Container top barre AppBar
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  //espace entre menu et profil
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print('Drawer Tapped');
                      },
                      child: SvgPicture.asset('assets/svg/drawer_icon.svg'),
                    ),
                    Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/user_image.png'))),
                    )
                  ],
                ),
              ),

              //Card Section
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Good Morning',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor),
                    ),
                    Text(
                      'Exauce Yanga',
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor),
                    )
                  ],
                ),
              ),

              //List card bank
              Container(
                height: 199,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16, right: 6),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 199,
                        width: 344,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(cards[index].cardBackground),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: SvgPicture.asset(
                                    cards[index].cardElementTop)),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                    cards[index].cardElementBottom)),
                            Positioned(
                                left: 29,
                                top: 48,
                                child: Text(
                                  'CARD NUMBER',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kWhiteColor),
                                )),
                            Positioned(
                                left: 29,
                                top: 65,
                                child: Text(
                                  cards[index].cardNumber,
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: kWhiteColor),
                                )),
                            Positioned(
                              right: 21,
                              top: 35,
                              child: Image.asset(
                                cards[index].cardType,
                                width: 27,
                                height: 27,
                              ),
                            ),
                            Positioned(
                              left: 29,
                              bottom: 50,
                              child: Text(
                                'CARD HOLDERNAME',
                                style: GoogleFonts.inter(
                                  color: kWhiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 29,
                              bottom: 25,
                              child: Text(
                                cards[index].user,
                                style: GoogleFonts.inter(
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 21,
                              bottom: 45,
                              child: Text(
                                'EXPIRY DATE',
                                style: GoogleFonts.inter(
                                  color: kWhiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 21,
                              bottom: 25,
                              child: Text(
                                cards[index].cardExpired,
                                style: GoogleFonts.inter(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              //Section Oppérations
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, bottom: 13, top: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Operation',
                      style: GoogleFonts.inder(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor),
                    ),
                    Row(
                      children: map<Widget>(datas, (index, selected) {
                        return Container(
                          alignment: Alignment.center,
                          height: 9,
                          width: 9,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      }),
                    )
                  ],
                ),
              ),

              Container(
                height: 123,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard(
                            operation: datas[index].name,
                            selectedIcon: datas[index].selectedIcon,
                            unselectedIcon: datas[index].unselectedIcon,
                            isSelected: current == index,
                            context: this),
                      );
                    }),
              ),

              //Section Transaction
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, bottom: 13, top: 16, right: 16),
                child: Text(
                  'Historique des transactions',
                  style: GoogleFonts.inder(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor),
                ),
              ),

              ListView.builder(
                itemCount: transactions.length,
                padding: const EdgeInsets.only(left: 16, right: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 76,
                    margin: const EdgeInsets.only(bottom: 13),
                    padding: const EdgeInsets.only(
                        left: 24, top: 12, bottom: 12, right: 22),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: kTenBlackColor,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(8.0, 8.0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 57,
                              width: 57,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(transactions[index].photo),
                              )),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(transactions[index].name,
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor)),
                                Text(
                                  transactions[index].date,
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: kGreyColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              transactions[index].amount,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: kBlueColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  final _HomeScreenState context;

  OperationCard(
      {required this.operation,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected,
      required this.context});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: kTenBlackColor,
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(5.0, 5.0),
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? kBlueColor : kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
              widget.isSelected ? widget.selectedIcon : widget.unselectedIcon),
          const SizedBox(
            height: 9,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor),
          )
        ],
      ),
    );
  }
}
