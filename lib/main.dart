import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Preview Latex'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Enter Latex here ... ',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 10),
              if (_controller.text.isNotEmpty)
                TeXView(
                  renderingEngine: const TeXViewRenderingEngine.katex(),
                  style: const TeXViewStyle(backgroundColor: Colors.white),
                  child: TeXViewDocument(
                    _controller.text,
                    style: TeXViewStyle(
                        fontStyle: TeXViewFontStyle(
                      fontSize: 20,
                    )),
                  ),
                  loadingWidgetBuilder: (context) {
                    return const Center(
                      child: Text('Loading question ...'),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
