import 'package:flutter/material.dart';
import 'package:atividades_dadm/Estilos_Fontes.dart';


/*  Exemplo da implementacao de
*   uma pagina de login e rotas.  */
class Pagina_Login extends StatefulWidget {
  const Pagina_Login({Key? key}) : super(key: key);

  @override
  State<Pagina_Login> createState() => _Pagina_LoginState();
}

class _Pagina_LoginState extends State<Pagina_Login> {

  TextEditingController Nome  = TextEditingController();  // Controle do campo de nome.
  TextEditingController Senha = TextEditingController();  // Controle do campo de senha.

  // Metodo para verificar o login.
  void VerificarLogin(){
    setState(() {
      if((Nome.text == 'admin') && (Senha.text == '1234')){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mostrar_Senha(Password: Senha.text)));
      }
      else{ // Mensagem de erro.
        showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: const Text('Mensagem de alerta!', style: TextStyle(color: Colors.red)),
              content: const Text('Utilizador inválido.'),
              actions: [
                TextButton(
                  onPressed: (){ Navigator.pop(context); }, // Fecha a mensagem.
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: const Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
          children: [
            const Icon(Icons.login, size: 70, color: Colors.lightGreen),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                controller: Nome,
                decoration: const InputDecoration(labelText: 'Inserir Utilizador:', suffixText: 'admin'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              child: TextField(
                controller: Senha,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Inserir Password:', suffixText: '1234'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){ VerificarLogin(); }, // Verifica o login.
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                    child: const Text('ENTRAR', style: styleBotao),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/*  Pagina para exibir a senha do login.  */
class Mostrar_Senha extends StatelessWidget {
  const Mostrar_Senha({super.key, required this.Password});

  final String Password;  // Senha do login.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.black54,
        title: const Text('UTILIZADOR REGISTRADO', style: styleTitulo),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 160.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text('Password inserida:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('\n$Password\n', style: const TextStyle(fontSize: 20)),
            const SizedBox(
              width: 200,
              height: 100,
              child: Icon(Icons.account_circle, size: 200, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}