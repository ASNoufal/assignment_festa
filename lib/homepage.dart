import 'package:assignment/bottomnavigation/bottomNavigation.dart';
import 'package:assignment/bottomnavigation/callender.dart';
import 'package:assignment/bottomnavigation/email.dart';
import 'package:assignment/bottomnavigation/name.dart';
import 'package:assignment/bottomnavigation/phonenumber.dart';
import 'package:assignment/bottomnavigation/search.dart';

import 'package:assignment/provider/providers.dart';
import 'package:assignment/utl/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!Responsive.isDesktop(context))
          ? AppBar(
              backgroundColor: Color(0xFF317874),
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Filter"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF317874)),
                )
              ],
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return const Expanded(child: UserDetails());
                    }));
                  },
                  icon: const Icon(Icons.api_sharp)))
          : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(flex: 1, child: UserDetails()),
          const Expanded(
              flex: 3,
              child: Profile(
                crossAxisCount: 2,
              ))
        ],
      ),
    );
  }
}

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataprovider);
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: size,
        color: Color(0xFF317874),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: data.when(data: ((data) {
                return NetworkImage(data[0].picture.medium!);
              }), error: ((error, stackTrace) {
                return;
              }), loading: () {
                return;
              }),
            ),
            const SizedBox(
              height: 40,
            ),
            Consumer(builder: ((context, ref, _) {
              final data = ref.watch(dataprovider);
              return data.when(
                  data: (data) {
                    if (data.isNotEmpty) {
                      return Text(
                        "${data[0].name.first!} ${data[0].name.last}",
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    } else {
                      return const Text("No data available");
                    }
                  },
                  error: (error, s) {
                    return const Text("error");
                  },
                  loading: () => const SizedBox());
            })),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Consumer(builder: (context, ref, _) {
                final data = ref.watch(dataprovider);
                return Align(
                    alignment: Alignment.centerLeft,
                    child: data.when(
                        data: (data) {
                          if (data.isNotEmpty) {
                            return Text(
                              "Email:${data[0].email}",
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            );
                          } else {
                            return const Text("No data available");
                          }
                        },
                        error: (error, s) {
                          return const Text("error");
                        },
                        loading: () => const SizedBox()));
              }),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Consumer(builder: (context, ref, _) {
                return Align(
                    alignment: Alignment.centerLeft,
                    child: data.when(
                        data: (data) {
                          if (data.isNotEmpty) {
                            return Text(
                              "Phone: +91 ${data[0].phone}",
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            );
                          } else {
                            return const Text("No data available");
                          }
                        },
                        error: (error, s) {
                          return const Text("error");
                        },
                        loading: () => const SizedBox()));
              }),
            ),
            SizedBox(
              height: Responsive.isDesktop(context) ? 130 : 160,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: homepagecustomizedbutton(
                  name: "LOG OUT", color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final int crossAxisCount;
  const Profile({super.key, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30, top: 10),
          child: (Responsive.isDesktop(context))
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: homepagecustomizedbutton(
                      name: "FILTER", color: Colors.amber[50]))
              : const SizedBox(),
        ),
        const Expanded(
          child: Padding(
              padding:
                  EdgeInsets.only(left: 50, top: 20, bottom: 10, right: 30),
              child: Responsive(
                  mobile: Profileuser(
                    childAspectRatio: 1,
                    crossAxisCount: 1,
                  ),
                  desktop: Profileuser(),
                  tablet: Profileuser())),
        ),
      ],
    );
  }
}

class Profileuser extends ConsumerWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  const Profileuser(
      {super.key, this.childAspectRatio = 2, this.crossAxisCount = 2});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 50,
            mainAxisSpacing: 20),
        itemCount: 6,
        itemBuilder: (context, index) {
          final widget = [
            Namebottom(
              index: index,
            ),
            const Emailbottom(),
            const CallenderBottom(),
            const SearchBottom(),
            PhoneNumberBottom(
              index: index,
            ),
          ];
          final data = ref.watch(dataprovider);
          return Scaffold(
              bottomNavigationBar: BottomNavigation(),
              body: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(children: [
                    Stack(
                      children: [
                        Container(
                          color: Color(0xFF317874),
                          width: double.infinity,
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: CircleAvatar(
                              backgroundImage: data.when(data: (data) {
                                return NetworkImage(
                                    data[index].picture.thumbnail!);
                              }, error: (error, s) {
                                return;
                              }, loading: () {
                                return;
                              }),
                              radius: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ValueListenableBuilder(
                        valueListenable: indexvalue,
                        builder: (context, newvalue, _) {
                          return widget[newvalue];
                        }),
                  ])));
        });
  }
}

Widget homepagecustomizedbutton({required String name, Color? color}) {
  return Container(
    width: 150,
    height: 50,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
    child: Center(
        child: Text(
      name,
      style: GoogleFonts.openSans(
          fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF317874)),
    )),
  );
}
