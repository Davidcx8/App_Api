import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/state/base_state.dart';
import '../controllers/wordpress_controller.dart';

class WordpressPage extends StatefulWidget {
  const WordpressPage({Key? key}) : super(key: key);

  @override
  State<WordpressPage> createState() => _WordpressPageState();
}

class _WordpressPageState extends State<WordpressPage> {
  final _controller = TextEditingController(text: 'techcrunch.com'); // Default example

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WordpressController>().state;
    
    return Scaffold(
      appBar: AppBar(title: const Text('WordPress News')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter WordPress site (e.g., techcrunch.com)'),
              onSubmitted: (val) => context.read<WordpressController>().fetchPosts(val),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<WordpressController>().fetchPosts(_controller.text),
              child: const Text('Fetch Posts'),
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
                    final post = state.data![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          post.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          post.date.isNotEmpty ? post.date.substring(0, 10) : '',
                        ),
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
