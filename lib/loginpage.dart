import 'package:assignment/homepage.dart';
import 'package:assignment/utl/responsive.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.green[900],
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            width: Responsive.isMobile(context) ? _size / 1.9 : _size / 3.5,
            height: Responsive.isMobile(context) ? _size / 1.2 : _size / 3.5,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Log In",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "email",
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(Icons.email_outlined),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return HomePage();
                    }));
                  },
                  child: customisedbutton(
                    context,
                    data: "LOG IN",
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                customisedbutton(context,
                    data: "Sign in with google",
                    color: Colors.white,
                    border: Border.all(),
                    icon: Icons.g_mobiledata,
                    iconsize: 30)
              ],
            ),
          ),
        ));
  }
}

Widget customisedbutton(
  BuildContext context, {
  required String data,
  required Color color,
  double? iconsize,
  BoxBorder? border,
  IconData? icon,
}) {
  final size = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), color: color, border: border),
    width: Responsive.isDesktop(context) ? size / 5.5 : size / 2.7,
    height: Responsive.isDesktop(context) ? size / 25 : size / 15,
    child: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconsize,
        ),
        Text(data),
      ],
    )),
  );
}
