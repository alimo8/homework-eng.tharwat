// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:task/views/custom_elevated_button.dart';

// class ChangingSection extends StatefulWidget {
//   ChangingSection({super.key, required this.color});
//   Color color;

//   @override
//   State<ChangingSection> createState() => _ChangingSectionState();
// }

// class _ChangingSectionState extends State<ChangingSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40),
//       child: Row(
//         children: [
//           Expanded(
//             child: CustomElevatedButton(
//               icon: Icons.color_lens,
//               text: "Change Color",
//               color: widget.color,
//               onPressed: () {
//                 setState(() {
//                   widget.color =
//                       Colors.primaries[Random().nextInt(
//                         Colors.primaries.length,
//                       )];
//                 });
//               },
//             ),
//           ),
//           SizedBox(width: 15),
//           Expanded(
//             child: CustomElevatedButton(
//               icon: Icons.text_fields,
//               text: "Change Size",
//               color: widget.color,
//               onPressed: () {
//                 setState(() {});
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
