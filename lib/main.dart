//
// made by fixedOtter
//

/* imported goods */
import 'package:flutter/material.dart';

/* main for calling up the predefined app class through runApp */
void main() {
  runApp(const DietApp());
}

/* defining our amazing app class from stateless widget */
class DietApp extends StatelessWidget {
  const DietApp({super.key});

  @override
  Widget build(BuildContext context) {
    // returning materialapp with a theme and home page so far
    return MaterialApp(
      theme: ThemeData(
        // just defining a main theme color for the page
        primaryColor: Colors.pink.shade400,
      ),
      // calling WelcomePage (stateful widget class) and passing some props
      home: const WelcomePage(title: 'generic diet app', bloodType: 'A+'),
    );
  }
}

/* WelcomePage parent and childstate */
// here we define the WelcomePage StatefulWidget class
class WelcomePage extends StatefulWidget {
  // first calling out the props given to us
  const WelcomePage({super.key, required this.title, required this.bloodType});

  // then defining them in the class so they are accessible from our child
  final String title, bloodType;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

// with a stateful widget, we have to create the state for the page
// (this is really what's going to hold what will be updated)
class _WelcomePageState extends State<WelcomePage> {
  void buttonHandler() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ReportSnackScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // this is just a column to hold multiple texts
        child: Column(
          // aligning it in the center of the column (centered on screen)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to '),
            Text(widget.title),
            TextButton(onPressed: buttonHandler, child: Text('report snacks')),
          ],
        ),
      ), // i love this comma
    );
  }
}
