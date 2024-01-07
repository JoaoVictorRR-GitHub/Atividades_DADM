import 'package:flutter/material.dart';


/*  Pagina contruida a partir de um Layout. */
class Pagina_Layout extends StatelessWidget {
  const Pagina_Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.network('https://topmovies.com.br/wp-content/uploads/2023/08/1691722508_436_One-Piece-Melhores-ilhas-e-locais.jpg', cacheHeight: 200, cacheWidth: 500),
            const Titulo(),
            linhaIcones,
            texto,
          ],
        ),
      ),
    );
  }
}


// Titulo da pagina.
class Titulo extends StatefulWidget {
  const Titulo({Key? key}) : super(key: key);

  @override
  State<Titulo> createState() => _TituloState();
}

class _TituloState extends State<Titulo> {

  String Num = '41';  // Numero de likes.
  bool Mudar = true;  // Indica se remove ou coloca o like.

  // Metodo para dar/remover like.
  void Like_Deslike() {
    setState(() {
      Mudar = !Mudar;
      Mudar ? Num = '41' : Num = '40';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 6.8),
                  child: Text('Paisagem Ilustrativa', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Text('País / Região: Skypiea', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){ Like_Deslike(); }, // Muda o icone da estrela.
            child: Mudar ? const Icon(Icons.star, color: Colors.lightBlueAccent) : const Icon(Icons.star_border),
          ),
          Text(Num),
        ],
      ),
    );
  }
}


// Coluna customizavel de icone com texto.
Column icons(IconData icon, String texto, Color cor){
  return Column(
    children: [
      Icon(icon, color: cor),
      Text(texto, style: TextStyle(color: cor)),
    ],
  );
}


// Linha de icones com texto.
Widget linhaIcones = Container(
  margin: const EdgeInsets.only(left: 30, right: 30),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      icons(Icons.call, 'CALL', Colors.red),
      icons(Icons.route, 'ROUTE', Colors.blue),
      icons(Icons.share, 'SHARE', Colors.green),
    ],
  ),
);


// Texto da pagina.
Widget texto = Container(
  margin: const EdgeInsets.all(30),
  child: const Text('Receita do jogo:\n\nComece misturando o óleo de peixe com o óleo de peixe superior, e adicione '
      'à mistura a alma sombria. Espere por 2 horas até que a alma sombria dilua no óleo. Agora '
      ' junte a mistura de óleo e misture com a farinha até formar uma massa bem consistente. '
      'Prepare o peixe superior em tiras , corte o tomate em rodelas e prepare a alga marinha a '
      'gosto. Abra bem a massa e recheie com as tiras de peixe, as rodelas de tomate e com alga '
      'marinha. Acenda o carvão superior e leve a massa ao fogo por 1h:30min e, por fim, adicione '
      'o Oceano azul-celeste e a poção esplendor por cima para dar um contraste com o peixe e o sabor '
      'da alma sombria na massa.', textAlign: TextAlign.justify),
);