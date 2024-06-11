## How to display row indexes like Excel in Flutter DataTable?

In this article, we will show you how to display row indexes like Excel in [Flutter DataTable](https://www.syncfusion.com/flutter-widgets/flutter-datagrid).

Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all the required properties. you can display indexes ranging from 1 to the visible row count by creating a separate column as the first column to show the count of rows. In the [buildRow](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/DataGridSource/buildRow.html) method, add the respective index to the first column by utilizing the [effective rows](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/DataGridSource/effectiveRows.html) collection. Obtaining the index from the effective rows ensures it ranges from 1 to the visible row count, even when filtering or sorting is applied.

```dart
class EmployeeDataSource extends DataGridSource {
…

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
```

You can download this example on [GitHub](https://github.com/SyncfusionExamples/How-to-display-row-indexes-like-Excel-in-Flutter-DataTable).