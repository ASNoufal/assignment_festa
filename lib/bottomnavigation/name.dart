import 'package:assignment/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Namebottom extends ConsumerWidget {
  final int index;
  const Namebottom({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataprovider);
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "HI, My name is",
          style: GoogleFonts.openSans(
              color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        data.when(data: (data) {
          return Text(
            " ${data[index].name.first}  ${data[index].name.last}",
            style: GoogleFonts.openSans(
                color: Color(0xFF317874), fontWeight: FontWeight.w700),
          );
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