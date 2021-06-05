import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      default:
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns você ganhou";
      });
    } 
    else if (
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) 
        {
          setState(() {
        this._mensagem ="Você perdeu";
      });
    } else {
      setState(() {
        this._mensagem ="Empatamos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jokenpo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 32, 0, 16),
            child: Text(
              "Escolha do app",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
              onTap: () {
                print("imagem clicada");
              },
              child: Image(image: _imagemApp)),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 32, 0, 16),
            child: Text(
              this._mensagem,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel"),
                child: Image.asset(
                  "imagens/papel.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "imagens/pedra.png",
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "imagens/tesoura.png",
                  height: 95,
                ),
              ),
              /*
              Image.asset("imagens/papel.png",height: 95,),
              Image.asset("imagens/pedra.png",height: 95,),
              Image.asset("imagens/tesoura.png",height: 95,),
              */
            ],
          )
        ],
      ),
    );
  }
}
