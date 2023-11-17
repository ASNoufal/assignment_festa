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
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "HI, My name is",
            style: GoogleFonts.openSans(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        data.when(data: (data) {
          return Center(
            child: Text(
              " ${data[index].name.first}  ${data[index].name.last}",
              style: GoogleFonts.openSans(
                  color: const Color(0xFF317874), fontWeight: FontWeight.w700),
            ),
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
