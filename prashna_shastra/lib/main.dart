import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PrashnaShastraApp(),
  ));
}

class PrashnaShastraApp extends StatefulWidget {
  const PrashnaShastraApp({super.key});

  @override
  State<PrashnaShastraApp> createState() => _PrashnaShastraAppState();
}

class _PrashnaShastraAppState extends State<PrashnaShastraApp> {
  final TextEditingController _numController = TextEditingController();
  String selectedCategory = 'ಉದ್ಯೋಗ ಮತ್ತು ವೃತ್ತಿ';
  String? selectedQuestion;
  String result = '';

  final Map<String, List<String>> questionData = {
    'ಉದ್ಯೋಗ ಮತ್ತು ವೃತ್ತಿ': [
      'ನನಗೆ ಹೊಸ ಉದ್ಯೋಗ ಸಿಗುವುದೇ?',
      'ಸದ್ಯದ ಕೆಲಸದಲ್ಲಿ ಬಡ್ತಿ (Promotion) ಸಿಗುವುದೇ?',
      'ಈಗಿರುವ ಕೆಲಸದಲ್ಲಿ ಸಂಬಳ ಹೆಚ್ಚಳವಾಗುವುದೇ?',
      'ನನಗೆ ಸರ್ಕಾರಿ ಕೆಲಸ ಸಿಗುವ ಯೋಗವಿದೆಯೇ?',
      'ನಾನು ಕೆಲಸ ಬದಲಾಯಿಸುವುದು ಸರಿಯೇ?',
      'ವರ್ಗಾವಣೆ (Transfer) ಬಯಸಿದ ಸ್ಥಳಕ್ಕೆ ಆಗುವುದೇ?',
      'ಕಳೆದುಹೋದ ಕೆಲಸ ಮತ್ತೆ ಸಿಗುವುದೇ?',
      'ವಿದೇಶದಲ್ಲಿ ಉದ್ಯೋಗದ ಅವಕಾಶ ಸಿಗುವುದೇ?',
      'ಇಂಟರ್ವ್ಯೂನಲ್ಲಿ (Interview) ಆಯ್ಕೆಯಾಗುವೆನೇ?',
      'ಕಚೇರಿಯಲ್ಲಿ ಸಹೋದ್ಯೋಗಿಗಳ ಕಿರುಕುಳ ನಿಲ್ಲುವುದೇ?',
    ],
    'ಹಣಕಾಸು ಮತ್ತು ಹೂಡಿಕೆ': [
      'ಆರ್ಥಿಕ ಮುಗ್ಗಟ್ಟು ಶೀಘ್ರದಲ್ಲೇ ಪರಿಹಾರವಾಗುವುದೇ?',
      'ಇತರರಿಗೆ ಕೊಟ್ಟ ಸಾಲದ ಹಣ ವಾಪಸ್ ಬರುವುದೇ?',
      'ಬ್ಯಾಂಕ್‌ನಲ್ಲಿ ಸಾಲ (Loan) ಮಂಜೂರಾಗುವುದೇ?',
      'ಷೇರು ಮಾರುಕಟ್ಟೆ ಅಥವಾ ಟ್ರೇಡಿಂಗ್‌ನಲ್ಲಿ ಲಾಭ ಸಿಗುವುದೇ?',
      'ಲಾಟರಿ ಅಥವಾ ಅನಿರೀಕ್ಷಿತ ಧನಲಾಭ ಪ್ರಾಪ್ತಿಯಾಗುವುದೇ?',
      'ನನ್ನ ಸಾಲಗಳನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ತೀರಿಸಲು ಸಾಧ್ಯವೇ?',
      'ಸ್ಥಿರ ಆಸ್ತಿಯಲ್ಲಿ ಹಣ ಹೂಡುವುದು ಲಾಭದಾಯಕವೇ?',
      'ಕಳೆದುಹೋದ ಹಣ ಅಥವಾ ಒಡವೆ ಮತ್ತೆ ಸಿಗುವುದೇ?',
    ],
    'ವಿವಾಹ ಮತ್ತು ಪ್ರೇಮ': [
      'ನನಗೆ ಈ ವರ್ಷ ವಿವಾಹ ನಿಶ್ಚಯವಾಗುವುದೇ?',
      'ಪ್ರೇಮ ವಿವಾಹಕ್ಕೆ ಕುಟುಂಬದ ಒಪ್ಪಿಗೆ ಸಿಗುವುದೇ?',
      'ನಾನು ಪ್ರೀತಿಸುವ ವ್ಯಕ್ತಿಯೇ ನನ್ನನ್ನು ಮದುವೆಯಾಗುವರೇ?',
      'ದಾಂಪತ್ಯದಲ್ಲಿನ ಮನಸ್ತಾಪ ದೂರವಾಗುವುದೇ?',
      'ದೂರವಾಗಿರುವ ಪತಿ/ಪತ್ನಿ ಮತ್ತೆ ಒಂದಾಗುವರೇ?',
      'ಬ್ರೇಕಪ್ ಆದ ಪ್ರೀತಿ ಮತ್ತೆ ಚಿಗುರುವುದೇ?',
      'ಸಂತಾನ ಭಾಗ್ಯ ಶೀಘ್ರದಲ್ಲೇ ಕೂಡಿಬರುವುದೇ?',
    ],
    'ವ್ಯಾಪಾರ ಮತ್ತು ಆಸ್ತಿ': [
      'ಹೊಸ ವ್ಯಾಪಾರ ಆರಂಭಿಸುವುದು ಸೂಕ್ತವೇ?',
      'ಹೊಸ ಬಿಸಿನೆಸ್ ಪಾರ್ಟ್‌ನರ್ ಜೊತೆ ಸೇರುವುದು ಒಳ್ಳೆಯದೇ?',
      'ಸದ್ಯ ನಷ್ಟದಲ್ಲಿರುವ ವ್ಯಾಪಾರ ಲಾಭಕ್ಕೆ ಬರುವುದೇ?',
      'ಸ್ವಂತ ಮನೆ ಕಟ್ಟುವ ಯೋಗವಿದೆಯೇ?',
      'ಮಾರಾಟಕ್ಕೆ ಇಟ್ಟಿರುವ ಆಸ್ತಿ ಮಾರಾಟವಾಗುವುದೇ?',
      'ಹೊಸ ವಾಹನ ಖರೀದಿ ಯೋಗವಿದೆಯೇ?',
    ],
    'ಆರೋಗ್ಯ ಮತ್ತು ಶಿಕ್ಷಣ': [
      'ಪ್ರಸ್ತುತ ಇರುವ ಆರೋಗ್ಯ ಸಮಸ್ಯೆ ಶೀಘ್ರ ವಾಸಿಯಾಗುವುದೇ?',
      'ನಿಗದಿಯಾಗಿರುವ ಶಸ್ತ್ರಚಿಕಿತ್ಸೆ (Surgery) ಯಶಸ್ವಿಯಾಗುವುದೇ?',
      'ಮಾನಸಿಕ ಒತ್ತಡದಿಂದ ಮುಕ್ತಿ ಸಿಗುವುದೇ?',
      'ಪರೀಕ್ಷೆಯಲ್ಲಿ ಉತ್ತಮ ಅಂಕಗಳೊಂದಿಗೆ ತೇರ್ಗಡೆಯಾಗುವೆನೇ?',
      'ಸ್ಪರ್ಧಾತ್ಮಕ ಪರೀಕ್ಷೆಯಲ್ಲಿ ರ್ಯಾಂಕ್ ಸಿಗುವುದೇ?',
    ]
  };

  @override
  void initState() {
    super.initState();
    selectedQuestion = questionData[selectedCategory]!.first;
  }

  void calculateResult() {
    int? prashnaNumber = int.tryParse(_numController.text.trim());
    if (prashnaNumber == null || prashnaNumber < 1 || prashnaNumber > 249) {
      setState(() {
        result = "⚠️ ದಯವಿಟ್ಟು 1 ರಿಂದ 249 ರೊಳಗಿನ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ.";
      });
      return;
    }

    DateTime now = DateTime.now();
    const List<String> dayLords = [
      'ಸೋಮವಾರ (ಚಂದ್ರ)',
      'ಮಂಗಳವಾರ (ಕುಜ)',
      'ಬುಧವಾರ (ಬುಧ)',
      'ಗುರುವಾರ (ಗುರು)',
      'ಶುಕ್ರವಾರ (ಶುಕ್ರ)',
      'ಶನಿವಾರ (ಶನಿ)',
      'ಭಾನುವಾರ (ರವಿ)'
    ];
    String currentDay = dayLords[now.weekday - 1];

    const Map<String, int> dashaYears = {
      'Ketu': 7,
      'Venus': 20,
      'Sun': 6,
      'Moon': 10,
      'Mars': 7,
      'Rahu': 18,
      'Jupiter': 16,
      'Saturn': 19,
      'Mercury': 17,
    };
    const List<String> planetOrder = [
      'Ketu',
      'Venus',
      'Sun',
      'Moon',
      'Mars',
      'Rahu',
      'Jupiter',
      'Saturn',
      'Mercury'
    ];
    const List<String> signNames = [
      'ಮೇಷ',
      'ವೃಷಭ',
      'ಮಿಥುನ',
      'ಕರ್ಕಾಟಕ',
      'ಸಿಂಹ',
      'ಕನ್ಯಾ',
      'ತುಲಾ',
      'ವೃಶ್ಚಿಕ',
      'ಧನು',
      'ಮಕರ',
      'ಕುಂಭ',
      'ಮೀನ'
    ];
    const List<String> signLords = [
      'ಕುಜ (Mars)',
      'ಶುಕ್ರ (Venus)',
      'ಬುಧ (Mercury)',
      'ಚಂದ್ರ (Moon)',
      'ರವಿ (Sun)',
      'ಬುಧ (Mercury)',
      'ಶುಕ್ರ (Venus)',
      'ಕುಜ (Mars)',
      'ಗುರು (Jupiter)',
      'ಶನಿ (Saturn)',
      'ಶನಿ (Saturn)',
      'ಗುರು (Jupiter)'
    ];

    double currentDegree = 0.0;
    int counter = 1;
    const double nakSpan = 13.33333333;
    String sign = '';
    String rashiLord = '';
    String starLord = '';
    String subLord = '';

    for (int nak = 0; nak < 27; nak++) {
      String stLord = planetOrder[nak % 9];
      int startIdx = nak % 9;
      for (int s = 0; s < 9; s++) {
        String sbLord = planetOrder[(startIdx + s) % 9];
        double subSpan = (dashaYears[sbLord]! / 120.0) * nakSpan;
        double subEnd = currentDegree + subSpan;
        int currentSignIdx = (currentDegree / 30.0).floor();
        double nextBoundary = (currentSignIdx + 1) * 30.0;

        if (subEnd > nextBoundary && (subEnd - nextBoundary) > 0.00001) {
          if (counter == prashnaNumber) {
            sign = signNames[currentSignIdx];
            rashiLord = signLords[currentSignIdx];
            starLord = stLord;
            subLord = sbLord;
            break;
          }
          counter++;
          if (counter == prashnaNumber) {
            sign = signNames[(currentSignIdx + 1) % 12];
            rashiLord = signLords[(currentSignIdx + 1) % 12];
            starLord = stLord;
            subLord = sbLord;
            break;
          }
          counter++;
        } else {
          if (counter == prashnaNumber) {
            sign = signNames[currentSignIdx % 12];
            rashiLord = signLords[currentSignIdx % 12];
            starLord = stLord;
            subLord = sbLord;
            break;
          }
          counter++;
        }
        currentDegree = subEnd;
      }
      if (subLord.isNotEmpty) break;
    }

    String q = selectedQuestion ?? '';
    String finalVerdict = '';
    String explanation = '';

    if (q.contains('ಕೆಲಸ') ||
        q.contains('ಉದ್ಯೋಗ') ||
        q.contains('ಬಡ್ತಿ') ||
        q.contains('ಸಂಬಳ')) {
      if (['Sun', 'Jupiter', 'Saturn', 'Mercury'].contains(subLord)) {
        finalVerdict = "✅ ಹೌದು (Yes) - ಉದ್ಯೋಗ ಸಿದ್ಧಿಯಾಗಲಿದೆ";
        explanation = "ಸಬ್-ಲಾರ್ಡ್ $subLord ವೃತ್ತಿ ಸ್ಥಾನಕ್ಕೆ ಅತ್ಯಂತ ಪೂರಕವಾಗಿದೆ.";
      } else {
        finalVerdict = "⏳ ಸದ್ಯಕ್ಕೆ ವಿಳಂಬ (Delay / Hard Work)";
        explanation = "ಅಡೆತಡೆಗಳು ಎದುರಾಗಬಹುದು, ಸತತ ಪರಿಶ್ರಮ ಅಗತ್ಯ.";
      }
    } else if (q.contains('ವಿವಾಹ') ||
        q.contains('ಮದುವೆ') ||
        q.contains('ಪ್ರೀತಿ')) {
      if (['Venus', 'Jupiter', 'Moon', 'Mercury'].contains(subLord)) {
        finalVerdict = "✅ ಹೌದು (Yes) - ಕಂಕಣ ಭಾಗ್ಯ ಕೂಡಿಬರಲಿದೆ";
        explanation = "ಸಬ್-ಲಾರ್ಡ್ $subLord ವಿವಾಹಕ್ಕೆ ಶುಭ ತರಲಿದೆ.";
      } else {
        finalVerdict = "❌ ಇಲ್ಲ / ತಡೆ (Obstacle)";
        explanation = "ಮನಸ್ತಾಪ ಅಥವಾ ಕುಟುಂಬದ ವಿರೋಧದ ಸಾಧ್ಯತೆಯಿದೆ.";
      }
    } else if (q.contains('ಸಾಲ') ||
        q.contains('ಹಣ') ||
        q.contains('ಲಾಭ') ||
        q.contains('ವ್ಯಾಪಾರ')) {
      if (['Mercury', 'Jupiter', 'Venus'].contains(subLord)) {
        finalVerdict = "✅ ಹೌದು (Yes) - ಉತ್ತಮ ಧನಲಾಭ ಸಿಗಲಿದೆ";
        explanation = "ಹಣಕಾಸಿನ ಅನುಕೂಲತೆ ಒದಗಿಬರಲಿದೆ.";
      } else {
        finalVerdict = "⚠️ ಎಚ್ಚರಿಕೆ (No / Risk)";
        explanation = "ಆರ್ಥಿಕ ನಷ್ಟ ಅಥವಾ ಸಾಲ ಮರುಪಾವತಿಯಲ್ಲಿ ಎಚ್ಚರವಿರಲಿ.";
      }
    } else {
      if (['Jupiter', 'Venus', 'Mercury', 'Moon'].contains(subLord)) {
        finalVerdict = "✅ ಹೌದು (Yes) - ಕಾರ್ಯ ಸಿದ್ಧಿಯಾಗಲಿದೆ";
        explanation = "ಶುಭ ಗ್ರಹದ ಅನುಗ್ರಹವಿದ್ದು ಕಾರ್ಯ ನೆರವೇರುವುದು.";
      } else {
        finalVerdict = "⏳ ವಿಳಂಬ ಅಥವಾ ಸವಾಲುಗಳಿವೆ";
        explanation = "ಸಮಯ ಪ್ರತಿಕೂಲವಾಗಿದೆ, ಎಚ್ಚರಿಕೆಯಿಂದ ಮುನ್ನಡೆಯಿರಿ.";
      }
    }

    setState(() {
      result = """
🔮 ತೀರ್ಪು: $finalVerdict
-----------------------------------------
📌 ವಿವರಣೆ: $explanation

🪐 ಜ್ಯೋತಿಷ್ಯ ವಿವರ:
• ಪ್ರಶ್ನ ದಿನ: $currentDay
• ರಾಶಿ: $sign ($rashiLord)
• ನಕ್ಷತ್ರಾಧಿಪತಿ: $starLord
• ಸಬ್-ಲಾರ್ಡ್ (Sub Lord): $subLord
-----------------------------------------
ಪ್ರಶ್ನೆ: $q
""";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KP ಪ್ರಶ್ನ ಶಾಸ್ತ್ರ',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("1. ಪ್ರಶ್ನೆಯ ವಿಭಾಗ ಆರಿಸಿ:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedCategory,
                  items: questionData.keys.map((String key) {
                    return DropdownMenuItem<String>(
                        value: key, child: Text(key));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedCategory = val!;
                      selectedQuestion = questionData[val]!.first;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("2. ನಿಮ್ಮ ಪ್ರಶ್ನೆ ಆರಿಸಿ:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedQuestion,
                  items: questionData[selectedCategory]!.map((String q) {
                    return DropdownMenuItem<String>(
                        value: q,
                        child: Text(q, overflow: TextOverflow.ellipsis));
                  }).toList(),
                  onChanged: (val) => setState(() => selectedQuestion = val),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("3. ಮನಸ್ಸಿನಲ್ಲಿ ಹೊಳೆದ ಸಂಖ್ಯೆ (1-249):",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: _numController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ಉದಾಹರಣೆಗೆ: 108",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResult,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("ಫಲಿತಾಂಶ ತಿಳಿಯಿರಿ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 24),
            if (result.isNotEmpty)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(result,
                      style: const TextStyle(
                          fontSize: 15, height: 1.5, color: Colors.black87)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
