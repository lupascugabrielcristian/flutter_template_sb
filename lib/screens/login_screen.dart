import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:licitatii_mobil/presentation/map_presentation.dart';
import 'package:licitatii_mobil/screens/map_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget  {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  void didChangeDependencies() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final SupabaseClient supabase = Supabase.instance.client;
        final session = supabase.auth.currentSession;

        if (session != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapScreen(presentation: GetIt.I.get<MapPresentation>(),)),
          );
        }
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 40,
          children: [
            Spacer(),
            Text('Login'),
            TextField(
              controller: userController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                doLogin();
              },
              child: Text('Login')),

            Spacer(),

          ],
        ),
      ),);
  }

  void doLogin() async {
    final SupabaseClient supabase = Supabase.instance.client;
    final AuthResponse res = await supabase.auth.signInWithPassword(
        email: userController.text,
        password: passwordController.text
    );

    if (res.user != null) {
      showResultDialog(context, res.user!.id);
    }

  }

  void showResultDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
