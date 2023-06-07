import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detalhes extends StatefulWidget {
  final String nome;
  final String descricao;

  const Detalhes({super.key, required this.nome, required this.descricao});

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 25.0),
          color: const Color(0xff171F52),
          child: Text(
            'Detalhes',
            style: GoogleFonts.rajdhani(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xffDDE3F0),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff171F52),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: double.infinity,
                    height: 237,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/akali-logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 24, bottom: 28, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nome,
                          style: GoogleFonts.rajdhani(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffDDE3F0),
                          ),
                        ),
                        Text(
                          widget.descricao,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: const Color(0xffDDE3F0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 24, right: 40, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jogadores',
                      style: GoogleFonts.rajdhani(
                          color: const Color(0xffDDE3F0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Total 1',
                      style: GoogleFonts.inter(
                        color: const Color(0xffABB1CC),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 68.0,
                margin:
                    const EdgeInsets.only(bottom: 33.0, right: 24, left: 24),
                child: Row(
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
                    Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Vk',
                                  style: GoogleFonts.rajdhani(
                                    color: const Color(0xffDDE3F0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  )),
                              Text('Disponível',
                                  style: GoogleFonts.rajdhani(
                                    color: const Color(0xff32BD50),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
