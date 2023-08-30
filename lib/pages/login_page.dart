import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../db/services/auth_service.dart';
import '../widgets/create_label.dart';
import '../widgets/show_dialog.dart';
import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isChecked = false;
  final formKey = GlobalKey<FormState>();
  final usuario = TextEditingController();
  final senha = TextEditingController();
  final name = TextEditingController();
  final confPassword = TextEditingController();
  final email = TextEditingController();
  final birthDate = TextEditingController();

  bool _isLogin = true;
  //true para login, falso para cadastro
  late String toggleButton;
  late String actionButon;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    toggleButton = 'Não tenho conta';
    actionButon = 'Entrar';
  }

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
      if (_isLogin) {
        toggleButton = 'Não tenho conta';
        actionButon = 'Entrar';
      } else {
        toggleButton = 'Já tenho conta';
        actionButon = 'Cadastrar';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      var user =
          await context.read<AuthService>().login(email.text, senha.text);
      if (user != null) {
        goToHome();
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } /*finally {
      setState(() => loading = false);
    }*/
  }

  registrar() async {
    setState(() => loading = true);
    try {
      var user =
          await context.read<AuthService>().registrar(email.text, senha.text);
      if (user != null) {
        goToHome();
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      setState(() => loading = false);
    }
  }

  void goToHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const MenuView();
    }));
  }

//Future loginUser(String user, String password) async{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 125),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              const Center(
                                child: Text('Bem vindo ao',
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.5,
                                      color: Color(0xFF0292B7),
                                    )),
                              ),
                              Hero(
                                  tag: 'imageHero',
                                  child: Image.asset(
                                    'assets/Logo.png',
                                    width: 320,
                                  )),
                            ],
                          )
                        ],
                      ),
                      Container(
                        child: page(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget label() {
    return Column(children: [
      CreateLabel(
        onControll: email,
        icon: Icons.mail_outline,
        fillColor: const Color(0xFFA4D8E5),
        iconColor: Colors.white,
        labelText: 'Usuário',
        labelColor: Colors.white,
        obscureText: false,
        horizonte: 5,
        tipo: TextInputType.emailAddress,
        tamanho: 0,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          } else if (value.isEmpty) {
            return 'Informe o email corretamente!';
          }
          return null;
        },
      ),
      CreateLabel(
        onControll: senha,
        icon: Icons.lock_outline,
        fillColor: const Color(0xFFA4D8E5),
        iconColor: Colors.white,
        labelText: 'Senha',
        labelColor: Colors.white,
        obscureText: true,
        horizonte: 5,
        tipo: TextInputType.visiblePassword,
        tamanho: 6,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          } else if (value.length < 6) {
            return 'A senha deve ter no mínimo 6 caracteres!';
          }
          return null;
        },
      ),
    ]);
  }

  Widget signin() {
    return Column(
      children: [
        SizedBox(height: 10),
        label(),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: const Color(0xFF0292B7)),
                ),
              ),
              TextButton(
                  onPressed: _toggleForm,
                  child: Text(
                    toggleButton,
                    style: TextStyle(color: const Color(0xFF0292B7)),
                  ))
            ],
          ),
        ),
        submitButton(),
      ],
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0292B7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (_isLogin) {
              login();
            } else {
              registrar();
            }
          }
        },
        child: Text(
          actionButon,
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }

  Widget signup() {
    return Column(
      children: [
        label(),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
              onPressed: _toggleForm,
              child: Text(
                toggleButton,
                style: TextStyle(color: const Color(0xFF0292B7)),
              ))
        ]),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: CheckboxListTile(
            title: const Text('Aceito os termos de uso'),
            enabled: true,
            dense: true,
            activeColor: const Color(0xFF0292B7),
            checkColor: Colors.white,
            side: const BorderSide(color: Color(0xFF0292B7)),
            value: _isChecked,
            onChanged: (newValue) {
              setState(() {
                _isChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity
                .leading, //  <-- Define posição do checkbox
          ),
        ),
        submitButton(),
      ],
    );
  }

  Widget? page() {
    if (_isLogin) {
      return signin();
    } else {
      return signup();
    }
  }

  void dialog() async {
    print("Clique sucesso!");
    showDialog(
      context: context,
      builder: (context) {
        return SuccessRegisterDialog(
          context: context,
          //urlImage: "",
          primaryText: "SUCESSO!",
          secondText: "Sua conta foi criada!",
          page: "login",
          nextPage: LoginPage(),
        );
      },
    );
  }
}
