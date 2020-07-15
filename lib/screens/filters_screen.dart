import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';
  final Map<String, bool> filters;
  final Function(String, bool) onFilterChange;

  FiltersScreen(this.filters, {@required this.onFilterChange});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> _filters;

  @override
  void initState() {
    _filters = widget.filters;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, String filterId) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: _filters[filterId],
      onChanged: (val) {
        setState(() {
          _filters[filterId] = val;
          widget.onFilterChange(filterId, val);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Ajust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  'glutten-free',
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  'vegetarian',
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  'vegan',
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  'lactose-free',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
