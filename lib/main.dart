import 'package:flutter/material.dart';
import 'models/data_layer.dart';
import 'providers/plan_provider.dart';
import 'views/plan_creator_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: PlanProvider(
        notifier: ValueNotifier<List<Plan>>([]),
        child: const PlanCreatorScreen(),
      ),
    );
  }
}