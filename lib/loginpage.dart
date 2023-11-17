import 'package:assignment/homepage.dart';
import 'package:assignment/utl/responsive.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFF317874),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            width: !Responsive.isDesktop(context) ? 350 : _size / 3.5,
            height: !Responsive.isDesktop(context) ? 400 : _size / 3.5,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF317874)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        iconColor: Color(0xFF317874),
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
                    child: Responsive(
                      mobile: customisedbutton(context,
                          data: "LOG IN",
                          color: Color(0xFF317874),
                          width: _size / 2.2,
                          height: _size / 8),
                      desktop: customisedbutton(context,
                          data: "LOG IN",
                          color: Color(0xFF317874),
                          width: _size / 5.5,
                          height: _size / 25),
                      tablet: customisedbutton(context,
                          data: "LOG IN",
                          color: Color(0xFF317874),
                          width: 200,
                          height: 50),
                    )),
                SizedBox(
                  height: 20,
                ),
                Responsive(
                    mobile: customisedbutton(context,
                        data: "Sign in with google",
                        color: Colors.white,
                        border: Border.all(),
                        icon: Icons.g_mobiledata,
                        iconsize: 30,
                        width: _size / 2.2,
                        height: _size / 8),
                    desktop: customisedbutton(context,
                        data: "Sign in with google",
                        color: Colors.white,
                        border: Border.all(),
                        icon: Icons.g_mobiledata,
                        iconsize: 30,
                        width: _size / 5.5,
                        height: _size / 25),
                    tablet: customisedbutton(context,
                        data: "Sign in with google",
                        color: Colors.white,
                        border: Border.all(),
                        icon: Icons.g_mobiledata,
                        iconsize: 30,
                        width: 200,
                        height: 50))
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
  double? width,
  double? height,
}) {
  final size = MediaQuery.of(context).size.width;
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), color: color, border: border),
    width: width,
    height: height,
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
