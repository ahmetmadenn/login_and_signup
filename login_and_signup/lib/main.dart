import 'package:login_and_signup/home_page.dart';
import 'package:login_and_signup/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_and_signup/signup_page.dart';

import 'login_page.dart';

/*WidgetsFlutterBinding.ensureInitialized() yöntemi, 
  Flutter uygulamasının çalışması için gerekli olan temel bileşenleri başlatmak için kullanılır. */

/* 
  asenkron programlamada, bir işlem başladıktan sonra diğer işlem aynı anda veya daha sonra başlayabilir ve bloklama olmadan devam edebilir.

"async" anahtar kelimesi, işlevin asenkron çalışmasını ifade ederken, await ifadesi, bir işlemin tamamlanmasını beklemek için kullanılır. 
"await" ifadesi, bir asenkron işlemi beklerken işlemin sonucunu döndürür ve işlevin çalışmasını duraklatır. 
Bu sayede, işlevin devam etmesi için beklenen işlemin tamamlanması beklenir.*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LoginAndSignup());
}

class LoginAndSignup extends StatelessWidget {
  const LoginAndSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        ));
  }
}
