import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false),
      home: const SfDataGridDemo(),
    );
  }
}

class SfDataGridDemo extends StatefulWidget {
  const SfDataGridDemo({super.key});

  @override
  SfDataGridDemoState createState() => SfDataGridDemoState();
}

class SfDataGridDemoState extends State<SfDataGridDemo> {
  List<Employee> _employees = <Employee>[];
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter DataGrid')),
        body: SfDataGrid(
          source: _employeeDataSource,
          columns: getColumns,
          columnWidthMode: ColumnWidthMode.auto,
        ));
  }

  List<GridColumn> get getColumns {
    return <GridColumn>[
      GridColumn(
          columnName: 'Index',
          allowEditing: false,
          allowFiltering: false,
          allowSorting: false,
          width: 80,
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text(''))),
      GridColumn(
          columnName: 'ID',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('ID'))),
      GridColumn(
          columnName: 'Name',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Name'))),
      GridColumn(
          columnName: 'Designation',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child:
                  const Text('Designation', overflow: TextOverflow.ellipsis))),
      GridColumn(
          columnName: 'Salary',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Salary'))),
    ];
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'Jack', 'Manager', 150000),
      Employee(10002, 'Perry', 'Project Lead', 88000),
      Employee(10003, 'James', 'Developer', 55000),
      Employee(10004, 'Michael', 'Developer', 39000),
      Employee(10005, 'Roland Mendel', 'Developer', 45000),
      Employee(10006, 'Sven Ottlieb', 'UI Designer', 36000),
      Employee(10007, 'Williams', 'Project Lead', 84000),
      Employee(10008, 'Adams', 'Developer', 43000),
      Employee(10009, 'Edwards', 'QA Testing', 43000),
      Employee(10010, 'Grimes', 'Developer', 43000),
      Employee(10011, 'Maria Andres', 'Developer', 41000),
      Employee(10012, 'Thomas Hardy', 'Developer', 40000),
      Employee(10013, 'Hanna Moos', 'Sales Associate', 350000),
      Employee(10014, 'Elizabeth', 'Developer', 41000),
      Employee(10015, 'Patricio Simpson', 'Administrator', 33000),
      Employee(10016, 'Francisco Chang', 'QA Testing', 32000),
      Employee(10017, 'Yang Wang', 'Developer', 30000),
      Employee(10018, 'Peter Franken', 'Developer', 30000),
      Employee(10019, 'Carlos Schmitt', 'Sales Associate', 30000),
      Employee(10020, 'Yoshi Latimer', 'Developer', 28000),
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    buildDataGridRows(employees);
  }

  List<DataGridRow> datagridRows = [];

  @override
  List<DataGridRow> get rows => datagridRows;

  void buildDataGridRows(List<Employee> employeesData) {
    datagridRows = employeesData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              const DataGridCell<int>(columnName: 'Index', value: null),
              DataGridCell<int>(columnName: 'ID', value: e.id),
              DataGridCell<String>(columnName: 'Name', value: e.name),
              DataGridCell<String>(
                  columnName: 'Designation', value: e.designation),
              DataGridCell<int>(columnName: 'Salary', value: e.salary),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: dataGridCell.columnName == 'Index'
            ? getSerialNumber(row)
            : Text(dataGridCell.value.toString()),
      );
    }).toList());
  }

  Text getSerialNumber(DataGridRow row) {
    // Get the index of the current row
    // Add header count to the index, here 1 is added
    int serialNumber = effectiveRows.indexOf(row) + 1;
    return Text((serialNumber.toString()));
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}
