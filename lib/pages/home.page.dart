import 'package:flutter/material.dart';
import 'package:gameplayapp/components/category.component.dart';
import 'package:gameplayapp/components/toolbox.component.dart';
import 'package:gameplayapp/enum/categorias.enum.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacidade = true;

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
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(right: 32.0, left: 16.0),
                child: Column(
                  children: [
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
                    const SizedBox(
                      height: 24.0,
                    ),
                    CardMatches(
                      isAnfitriao: true,
                      tipoCategoria: Categorias.ranqueada,
                    ),
                    CardMatches(
                      isAnfitriao: false,
                      tipoCategoria: Categorias.casual,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardMatches extends StatefulWidget {
  final bool isAnfitriao;
  final String tipoCategoria;

  const CardMatches(
      {super.key, required this.isAnfitriao, required this.tipoCategoria});

  @override
  State<CardMatches> createState() => _CardMatchesState();
}

class _CardMatchesState extends State<CardMatches> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 68.0,
      margin: const EdgeInsets.only(bottom: 33.0),
      child: Row(
        children: [
          Container(
            width: 64.0,
            height: 68.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/himeko.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lendários',
                          style: GoogleFonts.rajdhani(
                            color: const Color(0xffDDE3F0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                      Text(widget.tipoCategoria,
                          style: GoogleFonts.rajdhani(
                            color: const Color(0xffABB1CC),
                            fontSize: 13.0,
                          )),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '18/06 ás 21:00h',
                        style: GoogleFonts.inter(
                          color: const Color(0xffDDE3F0),
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        widget.isAnfitriao ? 'Anfitrião' : 'Visitante',
                        style: GoogleFonts.inter(
                          color: Color(
                              widget.isAnfitriao ? 0xffE51C44 : 0xff32BD50),
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
