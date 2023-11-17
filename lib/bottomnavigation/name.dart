import 'package:assignment/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Namebottom extends ConsumerWidget {
  final int index;
  const Namebottom({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataprovider);
    return Column(
      children: [
        Text("HI, My name is"),
        SizedBox(
          height: 10,
        ),
        data.when(data: (data) {
          return Text(" ${data[index].name.first}  ${data[index].name.last}");
        }, error: (error, s) {
          return Text("Error");
        }, loading: () {
          return SizedBox();
        }),
      ],
    );
  }
}
//   SizedBox(
//                     height: 10,
//                   ),
//                   const Text("My Phone Number is"),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   data.when(data: (data) {
//                     return Text("+91 ${data[index].phone}");
//                   }, error: (error, s) {
//                     return Text("Error");
//                   }, loading: () {
//                     return SizedBox();
//                   }),
//                   DividerTheme(
//                       data: DividerThemeData(color: Colors.red),
//                       child: Icon(Icons.call))
//                 ],
//               ),
//             ),
// ;
//   }