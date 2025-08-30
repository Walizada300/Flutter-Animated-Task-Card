import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191919),
      body: Center(
        child: BounceInDown(
          child: Container(
            height: 300,
            width: 300,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white30,
                  Colors.white.withOpacity(0.05),
                  Colors.white30,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xff191919),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Follow Abdul Baes Walizadah
                  TitleComponent(),
                  DividerComponent(),
                  TaskStatusComponent(),
                  StreakComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StreakComponent extends StatelessWidget {
  const StreakComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "STREAK",
          style: TextStyle(
            color: Color(0xff8C8C8C),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
        SizedBox(height: 1),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "6825",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
                Text(
                  "/10,000",
                  style: TextStyle(
                    color: Color(0xff8C8C8C),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            Text(
              "68%",
              style: TextStyle(
                color: Color(0xff8C8C8C),
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Stack(
          children: [
            Container(
              height: 14,
              decoration: BoxDecoration(
                color: Color(0xff27D16E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Container(
              height: 14,
              width: 200 * 0.68,
              decoration: BoxDecoration(
                color: Color(0xff27D16E),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff27D16E).withOpacity(0.5),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TaskStatusComponent extends StatelessWidget {
  const TaskStatusComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeekItem(type: TaskType.done, day: "Sat"),
        WeekItem(type: TaskType.done, day: "Sun"),
        WeekItem(type: TaskType.done, day: "Mon"),
        WeekItem(type: TaskType.inProgress, day: "Thu"),
        WeekItem(type: TaskType.todo, day: "Wen"),
        WeekItem(type: TaskType.todo, day: "Tur"),
        WeekItem(type: TaskType.todo, day: "Fri"),
      ],
    );
  }
}

class DividerComponent extends StatelessWidget {
  const DividerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.02),
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.02),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 6,
            children: [
              SvgPicture.asset(
                "assets/images/fire.svg",
                color: Color(0xffFE3366),
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "STREAK",
                    style: TextStyle(
                      color: Color(0xff8C8C8C),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                  Row(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "32",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        "Days".toUpperCase(),
                        style: TextStyle(
                          color: Color(0xff8C8C8C),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/images/shoe.svg",
            color: Color(0xff8C8C8C),
            height: 32,
          ),
        ],
      ),
    );
  }
}

class WeekItem extends StatelessWidget {
  const WeekItem({super.key, this.type = TaskType.todo, this.day});

  final TaskType? type;
  final String? day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (type == TaskType.done) ...[
          SvgPicture.asset(
            "assets/images/done.svg",
            color: Color(0xff27D16E),
            height: 30,
          ),
          SizedBox(height: 6),
          Text(
            day ?? "Tue",
            style: TextStyle(
              color: Color(0xff8C8C8C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
        ] else if (type == TaskType.inProgress) ...[
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xff27D16E), width: 2),
            ),
            child: Center(
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff27D16E),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            day ?? "Tue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ] else ...[
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.04),
                  Colors.white.withOpacity(0.2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            day ?? "Tue",
            style: TextStyle(
              color: Color(0xff8C8C8C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
        ],
      ],
    );
  }
}

enum TaskType { done, inProgress, todo }
