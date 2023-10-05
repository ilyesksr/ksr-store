import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ksr_store_app/res/constant.dart';

class FiltterProducts extends StatelessWidget {
  const FiltterProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMediumPM),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Popular Products',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const Expanded(child: SizedBox()),
          DropdownButton(
            hint:
                Text('Sort by', style: Theme.of(context).textTheme.titleMedium),
            iconSize: kMediumIcon,
            underline: const SizedBox(),
            icon: const Icon(
              FontAwesomeIcons.angleDown,
            ),
            items: const [DropdownMenuItem(value: 0, child: Text('test'))],
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
