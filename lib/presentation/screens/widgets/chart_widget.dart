// import 'package:flutter/material.dart';
// import 'package:get_length/presentation/screens/widgets/profile_image_widget.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ChartWidget extends StatefulWidget {
//   const ChartWidget({Key? key}) : super(key: key);

//   @override
//   _ChartWidgetState createState() => _ChartWidgetState();
// }

// class _ChartWidgetState extends State<ChartWidget> {
//   List<GDData> data = [
//     GDData("x2", .5),
//     GDData("x1.5", 2 / 3),
//     GDData("x1.25", .75),
//     GDData("x1", 1.0),
//   ];

//   late TooltipBehavior tooltipBehavior;

//   @override
//   void initState() {
//     super.initState();
//     tooltipBehavior = TooltipBehavior(enable: true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 400,
//       width: 400,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           SfCircularChart(
//             tooltipBehavior: tooltipBehavior,
//             legend: Legend(
//                 isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
//             series: <CircularSeries>[
//               RadialBarSeries<GDData, String>(
//                 dataSource: data,
//                 gap: "2",
//                 radius: "75%",
//                 strokeWidth: 40,
//                 xValueMapper: (GDData data, _) => data.title,
//                 yValueMapper: (GDData data, _) => data.value,
//                 maximumValue: 1,
//                 cornerStyle: CornerStyle.bothCurve,
//                 enableTooltip: true,
//               ),
//             ],
//           ),
//           const ProfileImageWidget(),
//         ],
//       ),
//     );
//   }
// }

// class GDData {
//   final String title;
//   final double value;

//   GDData(this.title, this.value);
// }
