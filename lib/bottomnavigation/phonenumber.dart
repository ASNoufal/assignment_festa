import 'package:assignment/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneNumberBottom extends ConsumerWidget {
  final int index;
  const PhoneNumberBottom({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataprovider);
    return Column(
      children: [
        const Text("My Phone Number is"),
        const SizedBox(
          height: 10,
        ),
        data.when(data: (data) {
          return Text(" +91 ${data[index].phone}");
        }, error: (error, s) {
          return const Text("Error");
        }, loading: () {
          return const SizedBox();
        }),
      ],
    );
  }
}
