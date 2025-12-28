import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

Widget popularView() {
  return ListView.separated(
    itemCount: 10,
    separatorBuilder: (_, __) => const SizedBox(height: 10),
    itemBuilder: (_, index) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Popular Product $index"),
      );
    },
  );
}

Widget brandView(BuildContext context) {
  return Center(
    child: Text("Brand List Here", style: context.textTheme.bodyLarge),
  );
}
