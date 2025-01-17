import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/answer_model.dart';
import '../models/bottom_nav_model.dart';
import '../widgets/answer_tile.dart';
import '../widgets/custom_buttom_nav_bar.dart';

class BonFirePage extends StatefulWidget {
  const BonFirePage({super.key});

  @override
  State<BonFirePage> createState() => _BonFirePageState();
}

class _BonFirePageState extends State<BonFirePage> {
  final List<BottomNavItem> navItems = [
    BottomNavItem(
      iconName: 'potential-match',
    ),
    BottomNavItem(
      iconName: 'likes',
      hasNotification: true,
    ),
    BottomNavItem(
      iconName: 'chats',
      notificationCount: 10,
    ),
    BottomNavItem(
      iconName: 'profile',
    ),
  ];
  final List<AnswerModel> options = [
    AnswerModel(answer: 'The peace in the early mornings', option: 'A'),
    AnswerModel(answer: 'The magical golden hours', option: 'B'),
    AnswerModel(answer: 'Wind-down time after dinners', option: 'C'),
    AnswerModel(answer: 'The serenity past midnight', option: 'D'),
  ];
  String? selectedAnswer = 'D';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(
        navItems: navItems,
        onTap: () {
          //change page route via method
        },
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/video.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fade.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 18,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Stroll Bonfire',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffCCC8FF),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, 2),
                              blurRadius: 20,
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.expand_more_rounded,
                        size: 30,
                        color: Color(0xffCBC9FF),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        width: 18,
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '22h 00m',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 14),
                      SvgPicture.asset(
                        'assets/icons/user-white.svg',
                        width: 18,
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '103',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/joey-pic.png'),
                        ),
                        SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6),
                              Text(
                                'Angelina, 28',
                                style: TextStyle(
                                  color: Color(0xFFF5F5F5),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'What is your favorite time of the day?',
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: Color(0xFFF5F5F5),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      '"Mine is definitely the peace in the morning."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(203, 201, 255, 0.7),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1 / .4,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 12, top: 14),
                    children: options.map((option) {
                      return AnswerTile(
                        selectedAnswer: selectedAnswer,
                        option: option,
                        onTap: () {
                          setState(() {
                            selectedAnswer = option.option;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Pick your option. \n See who has a similar mind.',
                        style: TextStyle(
                            color: Color(0xffE5E5E5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.6),
                      ),
                      const SizedBox(width: 10),
                      const Spacer(),
                      ...['mic', 'back'].map(
                        (iconName) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SvgPicture.asset(
                              'assets/icons/$iconName.svg',
                              width: 60,
                              height: 60,
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ).toList(),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
