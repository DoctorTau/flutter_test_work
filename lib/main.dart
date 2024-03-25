import 'package:flutter/material.dart';
import 'package:flutter_app/settings_provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final SettingsProvider settingsProvider = SettingsProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green[800]),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Choose exam variant',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Center(
            child: Column(
              children: [
                const Text("Main color", style: TextStyle(fontSize: 35)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: settingsProvider.colorSettings
                      .map((color) => ElevatedButton(
                            onPressed: () {},
                            child: Text(color,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            // set color of the button to the color from the list
                            style: ButtonStyle(
                                backgroundColor: settingsProvider.color == color
                                    ? const MaterialStatePropertyAll(
                                        Colors.grey)
                                    : MaterialStateProperty.all(
                                        Colors.green[800])),
                          ))
                      .toList(),
                ),
                const Text("Main color", style: TextStyle(fontSize: 35)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: settingsProvider.transitionSettings
                      .map((trans) => ElevatedButton(
                            onPressed: () {},
                            child: Text(trans,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            // set color of the button to the color from the list
                            style: ButtonStyle(
                                backgroundColor:
                                    settingsProvider.transition == trans
                                        ? const MaterialStatePropertyAll(
                                            Colors.grey)
                                        : MaterialStateProperty.all(
                                            Colors.green[800])),
                          ))
                      .toList(),
                ),
                const Text("Main color", style: TextStyle(fontSize: 35)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: settingsProvider.itemSettings
                      .map((item) => ElevatedButton(
                            onPressed: () {},
                            child: Text(item,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            // set color of the button to the color from the list
                            style: ButtonStyle(
                                backgroundColor: settingsProvider.item == item
                                    ? const MaterialStatePropertyAll(
                                        Colors.grey)
                                    : MaterialStateProperty.all(
                                        Colors.green[800])),
                          ))
                      .toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    settingsProvider.generateSettings();
                    setState(() {});
                  },
                  child: const Text('Generate settings',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[800])),
                ),
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
// show dialog with selected settings
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Selected settings'),
                          content: Column(
                            children: [
                              Text('Color: ${settingsProvider.color}'),
                              Text('Item: ${settingsProvider.item}'),
                              Text(
                                  'Transition: ${settingsProvider.transition}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Show selected settings',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[800])),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RulesPage()));
                    },
                    child: const Text('Show rules',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[800])),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rules', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: RichText(
        text: const TextSpan(
          text:
              "1) 0 баллов – работа не сделана\n2) 1-3 балла – генерация не работает, но интерфейс отрисован\n3) 4-5 балла – отрисован интерфейс одного экрана в заданном цвете\n4) 6-7 баллов – отрисован интерфейс экрана и показ результата\n5) 8-9 баллов – отрисован интерфейс двух экранов с кастомным переходом в соответствии с заданием и показ результата\n6) 10 баллов – все выполнено и комбинации заданий не повторяются (каждый раз уникальный набор, пока не закончится)",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
