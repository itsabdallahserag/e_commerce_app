import 'package:flutter/material.dart';
class BuildRow extends StatelessWidget {
  final String text ;
  final void Function()? onPressed ;
  const BuildRow({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.headlineLarge,),
        TextButton(
          onPressed: onPressed,
            child: Text('ViewAll',style: Theme.of(context).textTheme.bodyMedium,)),
      ],
    );
  }
}
