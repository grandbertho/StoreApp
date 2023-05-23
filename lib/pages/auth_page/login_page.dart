import 'package:flutter/material.dart';
import '../../service/api_service.dart';
import 'package:provider/provider.dart';
import '/main.dart';
import '/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = "";
  bool _progressBar = false;

  void _navigateToLoginSuccess() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return const MainScreen();
    }));
  }

  var titlePage = "Login";

  @override
  Widget build(BuildContext context) {
    StateNotifier appState = context.watch<StateNotifier>();
    return Scaffold(
      appBar: AppBar(title: Text(titlePage)),
      body: Stack(
        children: [
          Image.network(
            'data:image/jpeg;base64,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', // Replace with your image URL
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                      SizedBox(height: 50,),
                    Text("Enter Information to Log",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.cyan),),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(hintText: "Username",fillColor: Colors.cyan),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(hintText: "Password",fillColor: Colors.cyan),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez saisir votre mot de passe';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    _progressBar
                        ? const LinearProgressIndicator()
                        : Text(
                      _error,
                      style: const TextStyle(
                          color: Colors.red, fontSize: 12),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _progressBar = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          String username = _usernameController.text;
                          String password = _passwordController.text;
                          Map<String, String> loginInfo = {
                            "username": username,
                            "password": password
                          };
                          bool response =
                          await APIService.login(loginInfo);
                          print("User connected $response");
                          if (response) {
                            dynamic user =
                            await APIService.getUser(username);
                            await appState.login(user);
                            setState(() {
                              _error = "";
                            });
                            _navigateToLoginSuccess();
                          } else {
                            setState(() {
                              _error = "Username or password incorrect";
                            });
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Data is not correct"),
                            ),
                          );
                        }
                        setState(() {
                          _progressBar = false;
                        });
                      },
                      child: const Text("Se Connecter"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// class LoginSuccesPage extends StatelessWidget {
//   const LoginSuccesPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Login Success")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   Navigator.push(context, MaterialPageRoute(builder: (ctx) {
//                     return const MainScreen();
//                   }));
//                 },
//                 child: const Text("Return to the home page"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
