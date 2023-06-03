import 'package:flutter/material.dart';
import 'package:gameplayapp/components/category.component.dart';
import 'package:gameplayapp/components/toolbox.component.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        flexibleSpace: Container(
          alignment: Alignment.center,
          color: const Color(0xff0E1647),
          padding: const EdgeInsets.only(right: 24.0, left: 24.0),
          child: const Toolbox(),
        ),
      ),
      body: Container(
        color: const Color(0xff0E1647),
        child: Column(
          children: [
            const Category(),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.only(right: 32.0, left: 16.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Partidas agendadas',
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'Total 6',
                      style: GoogleFonts.inter(
                        color: const Color(0xffABB1CC),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: const [
                      CardMatches(),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CardMatches extends StatefulWidget {
  const CardMatches({super.key});

  @override
  State<CardMatches> createState() => _CardMatchesState();
}

class _CardMatchesState extends State<CardMatches> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
