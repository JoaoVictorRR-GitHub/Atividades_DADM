import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:atividades_dadm/Estilos_Fontes.dart';
import 'package:atividades_dadm/Atividade01_Incrementar_Decrementar.dart';
import 'package:atividades_dadm/Atividade02_Incrementar_com_AppBar.dart';
import 'package:atividades_dadm/Atividade03_Drawers_e_Tabs.dart';
import 'package:atividades_dadm/Atividade04_Layout.dart';
import 'package:atividades_dadm/Atividade05_Login.dart';
import 'package:atividades_dadm/Atividade06_GridView.dart';
import 'package:atividades_dadm/Atividade07_Anotacoes.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),  // Define o material 2 do dart.
      debugShowCheckedModeBanner: false,
      home: const Atividades(),
    );
  }
}



/*  Pagina inicial. */
class Atividades extends StatelessWidget {
  const Atividades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: const Text('ATIVIDADES', style: styleTitulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: const [ // Pagina de cada atividade.
            Custom_ElevatedButton(linkPagina: Contador(),         botaoLegenda: "PAGINA COM CONTADOR"),
            Custom_ElevatedButton(linkPagina: Contador_AppBar(),  botaoLegenda: "CONTADOR NO APPBAR"),
            Custom_ElevatedButton(linkPagina: Drawer_Tabs(),      botaoLegenda: "DRAWER E TABBAR"),
            Custom_ElevatedButton(linkPagina: Pagina_Layout(),    botaoLegenda: "PÁGINA COM LAYOUT"),
            Custom_ElevatedButton(linkPagina: Pagina_Login(),     botaoLegenda: "PÁGINA DE LOGIN"),
            Custom_ElevatedButton(linkPagina: GridView_Imagens(), botaoLegenda: "GRIDVIEW DE IMAGENS"),
            Custom_ElevatedButton(linkPagina: Anotacoes(),        botaoLegenda: "ANOTAÇÕES COM FIREBASE"),
          ],
        ),
      ),
    );
  }
}



/*  Botao personalizado.  */
class Custom_ElevatedButton extends StatelessWidget {
  const Custom_ElevatedButton({super.key, required this.linkPagina, required this.botaoLegenda});

  final Widget linkPagina;    // Pagina para onde o botao ira redirecionar.
  final String botaoLegenda;  // Legenda do botao.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        style: const ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.blueGrey),      // Cor quando pressionado.
          backgroundColor: MaterialStatePropertyAll(Colors.lightGreen), // Cor de fundo.
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => linkPagina));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(botaoLegenda, style: styleBotao),
        ),
      ),
    );
  }
}