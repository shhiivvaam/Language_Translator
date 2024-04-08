import "package:flutter/material.dart";
import "package:translator/translator.dart";

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() =>
      _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = [
    'Hindi',
    'English',
    'Marathi',
    'Spanish',
    'Bengali',
    'Telugu',
    'Marathi',
    'Tamil',
    'Urdu',
    'Gujarati',
    'Kannada',
    'Malayalam',
    'Punjabi',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Korean',
    'Arabic',
    'Russian',
    'Italian'
  ];
  var originLanguage = 'From';
  var destinationLanguage = 'To';
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);

    setState(() {
      output = translation.text.toString();
    });

    if (src == '--' || dest == '--') {
      setState(() {
        output = 'Failed to Translate!!';
      });
    }
  }

  // getting language code from the language name
  String getLanguageCode(String language) {
    if (language == 'Hindi') {
      return "hi";
    } else if (language == 'English') {
      return "en";
    } else if (language == 'Spanish') {
      return "mr";
    } else if (language == 'Bengali') {
      return "bn";
    } else if (language == 'Telugu') {
      return "mr";
    } else if (language == 'Marathi') {
      return "mr";
    } else if (language == 'Tamil') {
      return "ta";
    } else if (language == 'Urdu') {
      return "ur";
    } else if (language == 'Gujarati') {
      return "gu";
    } else if (language == 'Kannada') {
      return "kn";
    } else if (language == 'Malayalam') {
      return "ml";
    } else if (language == 'Punjabi') {
      return "pa";
    } else if (language == 'French') {
      return "fr";
    } else if (language == 'German') {
      return "de";
    } else if (language == 'Chinese') {
      return "zh";
    } else if (language == 'Japanese') {
      return "ja";
    } else if (language == 'Korean') {
      return "ko";
    } else if (language == 'Arabic') {
      return "ar";
    } else if (language == 'Russian') {
      return "ru";
    } else if (language == 'Italian') {
      return "it";
    } else {
      return "--";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text("Language Translator"),
        centerTitle: true,
        backgroundColor: const Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    // These are the required fields
                    items: languages.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },

                    // These are not required but, added better UX
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: Text(
                      originLanguage,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  const Icon(Icons.arrow_right_alt_outlined,
                      color: Colors.white, size: 40),
                  const SizedBox(width: 40),
                  DropdownButton(
                    // These are the required fields
                    items: languages.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },

                    // These are not required but, added better UX
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: Text(
                      destinationLanguage,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Please enter your text!!',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text first!!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Color(0xff2b3c5a),),
                  onPressed: () {
                    translate(
                        getLanguageCode(originLanguage),
                        getLanguageCode(destinationLanguage),
                        languageController.text.toString());
                  },
                  child: const Text('Translate'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "\n$output",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
