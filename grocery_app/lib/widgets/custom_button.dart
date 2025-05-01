// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   CustomButton({super.key, this.ontap, required this.text});
//   String text;
//   VoidCallback? ontap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//         margin: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.orange,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         width: double.infinity,
//         height: 60,
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onTap;

  const CustomButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: color,
          border:
              borderColor != null
                  ? Border.all(color: borderColor!, width: 2)
                  : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
