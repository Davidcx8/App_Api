import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/state/base_state.dart';
import '../controllers/universities_controller.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  State<UniversitiesPage> createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UniversitiesController>().state;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Universities Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter a country in English (e.g. Dominican Republic)',
              ),
              onSubmitted: (val) => context.read<UniversitiesController>().search(val),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<UniversitiesController>().search(_controller.text),
              child: const Text('Search'),
            ),
            const SizedBox(height: 16),
            if (state.status == Status.loading)
              const CircularProgressIndicator()
            else if (state.status == Status.error)
              Text(state.errorMessage ?? 'Error', style: const TextStyle(color: Colors.red))
            else if (state.status == Status.success && state.data != null)
              Expanded(
                child: ListView.builder(
                  itemCount: state.data!.length,
                  itemBuilder: (context, index) {
                    final uni = state.data![index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.school),
                        title: Text(uni.name),
                        subtitle: Text(uni.domains.join(', ')),
                        trailing: IconButton(
                          icon: const Icon(Icons.open_in_new),
                          onPressed: () {
                            // Can launch URL here using url_launcher
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
