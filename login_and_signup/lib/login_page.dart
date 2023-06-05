import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_and_signup/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  /*TextEditingController, Flutter'da metin giriş alanlarını (text field) kontrol etmek ve metin değerlerini okumak veya değiştirmek için kullanılan bir sınıftır.
   Bir TextEditingController örneği, 
  metin giriş alanlarıyla ilişkilendirilir ve kullanıcının girdiği metinleri almak 
  veya belirli bir metni metin giriş alanına yerleştirmek için kullanılabilir.*/

  @override
  void dispose() {
    //dispose metodu, bir widget'in durdurulduğu veya tamamen kaldırıldığı durumlarda çağrılır.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[400],
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/girl.jpg'),
            fit: BoxFit.cover,
          )),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 450,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(10),
                            child: const Text("Log In",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700, //kalınlık
                                  fontSize: 50,
                                )),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.fromLTRB(40, 20, 40, 30),
                              child: TextFormField(
                                controller: emailController,
                                validator: (deger) {
                                  if (deger == null || deger.isEmpty) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  prefixIcon: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Icon(Icons.mail),
                                  ),
                                  hintText: 'hello@gmail.com',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 70.0),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Password",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.fromLTRB(40, 20, 40, 30),
                              child: TextFormField(
                                controller: passwordController,
                                validator: (deger) {
                                  if (deger == null || deger.isEmpty) {
                                    return 'Please enter a valid password.';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  prefixIcon: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Icon(Icons.lock),
                                  ),
                                  hintText: '*************',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 70.0),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(70)),
                                ),
                              )),
                          SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                            child: ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              },
                              child: Container(
                                width: double
                                    .infinity, // Butonun genişlemesini sağlar
                                child: Text(
                                  'Submit',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
                                  );
                                },
                                child: const Text(
                                  " Sign Up ?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
