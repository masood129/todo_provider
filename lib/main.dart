import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider_Todo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'addtext.dart';

Future<void> main() async {
  // Directory directory = await getTemporaryDirectory();
  // Hive.init(directory.path);
  // Hive.init(directory.path);
  runApp(
    ChangeNotifierProvider<ProviderTodo>(
      create: (_) => ProviderTodo(),
      child: const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'), // English,
          Locale('fa', ''), // Farsi, no country code
        ],
        home: Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            InkWell(
                child: const Text('change to farsi'),
                onTap: () {
                  Provider.of<ProviderTodo>(context, listen: false)
                      .changeLanguege(
                          const Locale.fromSubtags(languageCode: 'fa'));
                }),
            SizedBox(
              height: 50,
            ),
            InkWell(
              child: const Text('change to English'),
              onTap: () {
                Provider.of<ProviderTodo>(context, listen: false)
                    .changeLanguege(
                        const Locale.fromSubtags(languageCode: 'en'));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todo),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "title: " +
                        context.watch<ProviderTodo>().todos[index].title!,
                  ),
                  Text(
                    "text: " + context.watch<ProviderTodo>().todos[index].text!,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
          ]);
        },
        itemCount: context.watch<ProviderTodo>().todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
