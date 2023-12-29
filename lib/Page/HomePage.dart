import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:reverpod_flutter/Controller/Controller.dart';
import 'package:reverpod_flutter/Widget/LoadingWidget.dart';

final controller = ChangeNotifierProvider((ref) => Controller());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(controller).getData();
  }

  @override
  Widget build(BuildContext context) {
    var read = ref.read(controller);
    var watch = ref.watch(controller);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          centerTitle: true,
        ),
        body: CircularLoading(
          isLoading: watch.isloading,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: watch.users.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: 15.allBR),
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(watch.users[index].avatar!),
                      radius: 20),
                  title: Text(
                    "${watch.users[index].firstName} ${watch.users[index].lastName}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text("${watch.users[index].email}"),
                ),
              );
            },
          ),
        ));
  }
}
