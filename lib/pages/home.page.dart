import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gameplayapp/components/category.component.dart';
import 'package:gameplayapp/components/toolbox.component.dart';
import 'package:gameplayapp/enum/categorias.enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PartidaAgendada {
  String nome;
  String data;
  String imagem;
  String categoria;
  bool isAnfitriao;

  PartidaAgendada(
      {required this.nome,
      required this.data,
      required this.imagem,
      required this.categoria,
      required this.isAnfitriao});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacidade = true;

  List<PartidaAgendada> listaPartidas = [
    PartidaAgendada(
        nome: 'OTRIO',
        data: '18/06 às 21:00h',
        imagem: 'assets/manoel-gomes.jpg',
        categoria: Categorias.ranqueada,
        isAnfitriao: true),
    PartidaAgendada(
        nome: 'Xablau Universe',
        data: '10/07 às 18:00h',
        imagem: 'assets/xablau.jpg',
        categoria: Categorias.casual,
        isAnfitriao: false),
  ];

  void carregaLista() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String partidaAgendadaTexto = prefs.getString('partida_agendada') as String;
    if (partidaAgendadaTexto != "") {
      setState(() {
        Map<String, dynamic> partidamap = jsonDecode(partidaAgendadaTexto);
        PartidaAgendada partidaAgendada = PartidaAgendada(
            nome: partidamap['nome'],
            data: partidamap['data'],
            imagem: partidamap['imagem'],
            categoria: partidamap['categoria'],
            isAnfitriao: partidamap['isAnfitriao']);
        listaPartidas.add(partidaAgendada);
      });
    }
  }

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
          child: Toolbox(
            callback: () {
              print('macarrao');
              carregaLista();
            },
          ),
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
                          'Total ${listaPartidas.length}',
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
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: ListView.builder(
                        itemCount: listaPartidas.length,
                        itemBuilder: (context, i) {
                          return CardMatches(
                            isAnfitriao: listaPartidas[i].isAnfitriao,
                            tipoCategoria: listaPartidas[i].categoria,
                            data: listaPartidas[i].data,
                            nome: listaPartidas[i].nome,
                            imagem: listaPartidas[i].imagem,
                          );
                        },
                      ),
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
  final String data;
  final String imagem;
  final String nome;

  const CardMatches(
      {super.key,
      required this.isAnfitriao,
      required this.tipoCategoria,
      required this.data,
      required this.imagem,
      required this.nome});

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
              image: DecorationImage(
                image: AssetImage(widget.imagem),
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
                      Text(widget.nome,
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
                        widget.data,
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
