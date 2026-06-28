import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/state/base_state.dart';
import '../controllers/age_controller.dart';

class AgePage extends StatefulWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  final _controller = TextEditingController();

  Widget _buildAgeCategory(int age) {
    String category = '';
    String image = '';
    if (age < 30) {
      category = 'Young';
      image = 'assets/young.png'; // Placeholder if needed
    } else if (age < 60) {
      category = 'Adult';
      image = 'assets/adult.png';
    } else {
      category = 'Elderly';
      image = 'assets/elderly.png';
    }

    return Column(
      children: [
        Icon(
          age < 30 ? Icons.child_care : age < 60 ? Icons.person : Icons.elderly,
          size: 64,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 16),
        Text('Age: $age', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Category: $category', style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AgeController>().state;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Age Predictor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter a name'),
              onSubmitted: (val) => context.read<AgeController>().predict(val),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<AgeController>().predict(_controller.text),
              child: const Text('Predict'),
            ),
            const SizedBox(height: 32),
            if (state.status == Status.loading)
              const CircularProgressIndicator()
            else if (state.status == Status.error)
              Text(state.errorMessage ?? 'Error', style: const TextStyle(color: Colors.red))
            else if (state.status == Status.success && state.data != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildAgeCategory(state.data!.age),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
