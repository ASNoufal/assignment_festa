import 'package:assignment/infrastructure/Model/modelData.dart';
import 'package:assignment/infrastructure/repo/datafromapi.dart';
import 'package:assignment/loginpage.dart';
import 'package:assignment/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: UserDetails()),
          Expanded(
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
    return Container(
      width: size,
      height: size,
      color: Colors.red,
      child: Column(
        children: [
          const SizedBox(
            height: 150,
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
            print(data);
            return data.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    return Text(data[0].name.first!);
                  } else {
                    return Text("No data available");
                  }
                },
                error: (error, s) {
                  return Text("error");
                },
                loading: () => SizedBox());
          })),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Consumer(builder: (context, ref, _) {
              final data = ref.watch(dataprovider);
              return Align(
                  alignment: Alignment.centerLeft,
                  child: data.when(
                      data: (data) {
                        if (data.isNotEmpty) {
                          return Text("Email:${data[0].email}");
                        } else {
                          return Text("No data available");
                        }
                      },
                      error: (error, s) {
                        return Text("error");
                      },
                      loading: () => SizedBox()));
            }),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Consumer(builder: (context, ref, _) {
              return Align(
                  alignment: Alignment.centerLeft,
                  child: data.when(
                      data: (data) {
                        if (data.isNotEmpty) {
                          return Text("Phone: +91 ${data[0].phone}");
                        } else {
                          return Text("No data available");
                        }
                      },
                      error: (error, s) {
                        return Text("error");
                      },
                      loading: () => SizedBox()));
            }),
          ),
          const SizedBox(
            height: 90,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                homepagecustomizedbutton(name: "Signout", color: Colors.green),
          )
        ],
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
          child: Align(
              alignment: Alignment.bottomRight,
              child: homepagecustomizedbutton(
                  name: "FILTER", color: Colors.amber[50])),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 90, top: 20, bottom: 10, right: 30),
              child: Profileuser()),
        ),
      ],
    );
  }
}

class Profileuser extends ConsumerWidget {
  const Profileuser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 50,
            mainAxisSpacing: 20),
        itemCount: 6,
        itemBuilder: (context, index) {
          final data = ref.watch(dataprovider);
          return Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.red,
                      width: double.infinity,
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 180, top: 10),
                      child: CircleAvatar(
                        backgroundImage: data.when(data: (data) {
                          return NetworkImage(data[index].picture.thumbnail!);
                        }, error: (error, s) {
                          return;
                        }, loading: () {
                          return;
                        }),
                        radius: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("My Phone Number is"),
                const SizedBox(
                  height: 10,
                ),
                data.when(data: (data) {
                  return Text("+91 ${data[index].phone}");
                }, error: (error, s) {
                  return Text("Error");
                }, loading: () {
                  return SizedBox();
                }),
                DividerTheme(
                    data: DividerThemeData(color: Colors.red),
                    child: Icon(Icons.call))
              ],
            ),
          );
        });
  }
}

Widget homepagecustomizedbutton({required String name, Color? color}) {
  return Container(
    width: 150,
    height: 50,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
    child: Center(child: Text(name)),
  );
}
