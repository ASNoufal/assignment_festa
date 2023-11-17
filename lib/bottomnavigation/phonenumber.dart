import 'package:assignment/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberBottom extends ConsumerWidget {
  final int index;
  const PhoneNumberBottom({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataprovider);
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "My Phone Number is",
          style: GoogleFonts.openSans(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        data.when(data: (data) {
          return Text(
            " +91 ${data[index].phone}",
            style: GoogleFonts.openSans(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF317874)),
          );
        }, error: (error, s) {
          return const Text("Error");
        }, loading: () {
          return const SizedBox();
        }),
      ],
    );
  }
}
