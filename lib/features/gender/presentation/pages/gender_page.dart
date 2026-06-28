import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/state/base_state.dart';
import '../controllers/gender_controller.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GenderController>().state;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Gender Predictor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter a name'),
              onSubmitted: (val) => context.read<GenderController>().predict(val),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<GenderController>().predict(_controller.text),
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
                      Icon(
                        state.data!.gender == 'male' ? Icons.male : Icons.female,
                        size: 64,
                        color: state.data!.gender == 'male' ? Colors.blue : Colors.pink,
                      ),
                      const SizedBox(height: 16),
                      Text('Gender: ${state.data!.gender}', style: const TextStyle(fontSize: 20)),
                      Text('Probability: ${(state.data!.probability * 100).toStringAsFixed(1)}%'),
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
