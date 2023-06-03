import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Toolbox extends StatefulWidget {
  const Toolbox({super.key});

  @override
  State<Toolbox> createState() => _ToolboxState();
}

class _ToolboxState extends State<Toolbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/himeko.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 21.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Olá, ',
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      'Thiago',
                      style: GoogleFonts.rajdhani(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  'Hoje é dia de vitória',
                  style: GoogleFonts.inter(
                    color: const Color(0xffABB1CC),
                    fontSize: 13.0,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: 48.0,
          height: 48.0,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE51C44),
            ),
            child: const Text(
              '+',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ],
    );
  }
}
