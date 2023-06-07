import 'package:flutter/material.dart';
import 'package:gameplayapp/components/category.component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Servidor {
  int id;
  String nome;
  String cargo;
  String imagem;

  Servidor(
      {required this.id,
      required this.nome,
      required this.cargo,
      required this.imagem});
}

class AgendarPartida extends StatefulWidget {
  const AgendarPartida({super.key});

  @override
  State<AgendarPartida> createState() => _AgendarPartidaState();
}

class _AgendarPartidaState extends State<AgendarPartida> {
  List<Servidor> listaServidores = [];
  Servidor servidorSelecionado =
      Servidor(cargo: "", id: 0, imagem: "", nome: "");

  //Controllers
  TextEditingController diaController = TextEditingController();
  TextEditingController mesController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController minutoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  void carregaServidores() {
    setState(() {
      //TODO: deve buscar na api os servidores e carregar eles aqui
      listaServidores = [];
      Servidor servidor1 = Servidor(
          id: 1,
          nome: "OTRIO",
          cargo: "Administrador",
          imagem: "assets/manoel-gomes.jpg");
      Servidor servidor2 = Servidor(
          id: 2,
          nome: "Xablau Universe",
          cargo: "Visitante",
          imagem: "assets/xablau.jpg");

      listaServidores.add(servidor1);
      listaServidores.add(servidor2);
    });
  }

  @override
  Widget build(BuildContext context) {
    carregaServidores();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 25.0),
          color: const Color(0xff171F52),
          child: Text(
            'Agendar Partida',
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
          color: const Color(0xff0A1033),
          padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categoria',
                style: GoogleFonts.rajdhani(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffDDE3F0),
                ),
              ),
              const SizedBox(height: 18),
              const Category(editMode: true),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () async {
                  Servidor servidorSelecionado =
                      await showModalBottomSheet<Servidor>(
                    context: context,
                    backgroundColor: const Color(0xff0E1647),
                    builder: (BuildContext context) {
                      return ListView.builder(
                        itemCount: listaServidores.length,
                        itemBuilder: (context, index) {
                          return CardServidor(
                            cargo: listaServidores[index].cargo,
                            imagem: listaServidores[index].imagem,
                            nome: listaServidores[index].nome,
                            id: listaServidores[index].id,
                          );
                        },
                      );
                    },
                  ) as Servidor;

                  setState(() {
                    this.servidorSelecionado = servidorSelecionado;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 68,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff243189),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 68,
                        height: 68,
                        decoration: servidorSelecionado.imagem != ""
                            ? BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff243189),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff1D2766),
                                image: DecorationImage(
                                  image: AssetImage(servidorSelecionado.imagem),
                                  fit: BoxFit.cover,
                                  opacity:
                                      servidorSelecionado.imagem != "" ? 1 : 0,
                                ),
                              )
                            : BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xff243189),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff1D2766),
                              ),
                      ),
                      Text(
                        servidorSelecionado.nome != ""
                            ? servidorSelecionado.nome
                            : 'Selecione um servidor',
                        style: GoogleFonts.rajdhani(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffDDE3F0),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xffDDE3F0),
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dia e mes',
                        style: GoogleFonts.rajdhani(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffDDE3F0),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff243189),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff1D2766),
                            ),
                            child: TextField(
                              controller: diaController,
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                          ),
                          Text(
                            '/',
                            style: GoogleFonts.rajdhani(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffDDE3F0),
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(left: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff243189),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff1D2766),
                            ),
                            child: TextField(
                              controller: mesController,
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Horário',
                        style: GoogleFonts.rajdhani(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffDDE3F0),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff243189),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff1D2766),
                            ),
                            child: TextField(
                              controller: horaController,
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                          ),
                          Text(
                            ':',
                            style: GoogleFonts.rajdhani(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffDDE3F0),
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            margin: const EdgeInsets.only(left: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff243189),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff1D2766),
                            ),
                            child: TextField(
                              controller: minutoController,
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Descrição',
                    style: GoogleFonts.rajdhani(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffDDE3F0),
                    ),
                  ),
                  Text(
                    'Max 100 caracteres',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: const Color(0xffABB1CC),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 95,
                margin: const EdgeInsets.only(left: 3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff243189),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff1D2766),
                ),
                child: TextField(
                  controller: descricaoController,
                  minLines: 1,
                  maxLines: 4,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: GoogleFonts.inter(color: Colors.white),
                ),
              ),
              const SizedBox(height: 56),
              SizedBox(
                width: double.infinity,
                height: 56.0,
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    String categoria =
                        prefs.getString('categoriaSelecionada') as String;
                    Servidor servidor = servidorSelecionado;
                    String dia = diaController.value.text;
                    String mes = mesController.value.text;
                    String hora = horaController.value.text;
                    String minuto = minutoController.value.text;
                    String descricao = descricaoController.value.text;

                    //TODO: fazer uma requisição para agendar a partida
                    await prefs.setString("partida_agendada",
                        '{"data":"$dia/$mes às $hora:${minuto}h","nome": "${servidor.nome}", "isAnfitriao": true, "imagem":"${servidor.imagem}", "categoria":"$categoria"}');

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context, 'banana');
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: const Color(0xffE51C44)),
                  child: Text(
                    'Agendar',
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardServidor extends StatefulWidget {
  final String imagem;
  final String nome;
  final String cargo;
  final int id;

  const CardServidor(
      {super.key,
      required this.imagem,
      required this.nome,
      required this.cargo,
      required this.id});

  @override
  State<CardServidor> createState() => _CardServidorState();
}

class _CardServidorState extends State<CardServidor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Servidor servidorSelecionado = Servidor(
            id: widget.id,
            nome: widget.nome,
            cargo: widget.cargo,
            imagem: widget.imagem);
        Navigator.pop(context, servidorSelecionado);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 10.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2.0, color: Color(0xff1D2766)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nome,
                  style: GoogleFonts.rajdhani(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffDDE3F0),
                  ),
                ),
                Text(
                  widget.cargo,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: const Color(0xffABB1CC),
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xffDDE3F0),
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
