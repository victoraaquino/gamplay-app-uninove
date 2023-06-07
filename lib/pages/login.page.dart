import 'package:flutter/material.dart';
import 'package:gameplayapp/pages/home.page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0E1647), Color(0xff0A1033)]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: const [
              Image(image: AssetImage('assets/bg-login.png')),
              Image(image: AssetImage('assets/lee-sin.png')),
            ],
          ),
          Text(
            'Conecte-se\ne organize suas\njogatinas',
            textAlign: TextAlign.center,
            style: GoogleFonts.rajdhani(
              fontSize: 40.0,
              color: Colors.white,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Crie grupos para jogar seus games\nfavoritos com seus amigos',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14.0,
              color: const Color(0xffDDE3F0),
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 48.0),
          SizedBox(
            width: 274.0,
            height: 56.0,
            child: ElevatedButton(
              onPressed: () async {
                final WebViewController controller = WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
                        // Update loading bar.
                      },
                      onPageStarted: (String url) {},
                      onPageFinished: (String url) {},
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url.startsWith('http://localhost:4000/')) {
                          Navigator.pop(context, request.url);
                          return NavigationDecision.navigate;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(Uri.parse(
                      'https://discord.com/api/oauth2/authorize?client_id=1101180680244834314&redirect_uri=http%3A%2F%2Flocalhost%3A4000%2Fauth%2Fredirect&response_type=code&scope=identify%20connections%20email%20guilds'));

                String response = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewWidget(controller: controller),
                  ),
                );

                //TODO: buscar os dados do backend

                // String code = response.split('?code=')[1];

                // var client = http.Client();

                // try {
                //   var response = await client.post(
                //       Uri.http('localhost:4000', '/login'),
                //       body: {'code': code});
                // } finally {
                //   client.close();
                // }

                // ignore: use_build_context_synchronously
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: const Color(0xffE51C44)),
              child: Row(
                children: [
                  Container(
                    width: 56.0,
                    height: 56.0,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Color(0xff991F36),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Image(
                      width: 24.0,
                      height: 18.0,
                      image: AssetImage('assets/discord-logo.png'),
                    ),
                  ),
                  Container(
                    width: 218,
                    alignment: Alignment.center,
                    child: Text(
                      'Entrar com Discord',
                      style: GoogleFonts.inter(
                        fontSize: 14.0,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
