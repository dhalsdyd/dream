import 'package:dream/app/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/icon.jpeg"),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("로그인이 필요해요!"),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text("로그인이 필요해요!"),
                  const SizedBox(height: 60),
                  DreamLargeTextButton(
                    text: "로그인",
                    onTap: () {},
                    color: const Color(0xff9F9F9F),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container(height: 1, color: const Color(0xffA6ABC0))),
                      const SizedBox(width: 16),
                      const Text("간편로그인", style: TextStyle(color: Color(0xffA6ABC0))),
                      const SizedBox(width: 16),
                      Expanded(child: Container(height: 1, color: const Color(0xffA6ABC0))),
                    ],
                  ),
                  const SizedBox(height: 30),
                  DreamSmallIconTextButton(text: "", icon: "", color: const Color(0xff9F9F9F), onTap: () {}),
                  const SizedBox(height: 16),
                  DreamSmallIconTextButton(text: "", icon: "", color: const Color(0xff9F9F9F), onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
