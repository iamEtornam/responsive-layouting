import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Examples')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('MediaQuery Example'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('LayoutBuilder Example'),
          )
        ],
      ),
    );
  }
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('MediaQuery Example')),
      body: Column(
        children: [
          if (size.width < 400) ...{
            Container(
                height: size.height,
                color: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: const Center(child: Text('mobile view'))),
          } else ...{
            Row(
              children: [
                Container(
                    width: size.width / 4,
                    height: size.height,
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                    child: const Center(child: Text('Side navigation'))),
                Expanded(
                    child: Container(
                  width: size.width,
                  height: size.height,
                  color: Colors.blue,
                  child: const Center(child: Text('main view')),
                ))
              ],
            )
          }
        ],
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Example')),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Center(
            child: Row(
              children: [
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth / 4,
                  color: Colors.red,
                  child: const Center(child: Text('Side navigation')),
                ),
                Expanded(
                    child: Container(
                  height: constraints.maxHeight,
                  color: Colors.blue,
                  child: const Center(child: Text('Main view')),
                ))
              ],
            ),
          );
        } else {
          return Center(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              color: Colors.red,
              child: const Center(
                child: Text('Mobile view'),
              ),
            ),
          );
        }
      }),
    );
  }
}
