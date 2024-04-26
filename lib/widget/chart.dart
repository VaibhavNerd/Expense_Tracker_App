import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
         horizontalInterval: 1,
        drawHorizontalLine: true,
        // getDrawingHorizontalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 0.1,
        //   );
        // }
        ),
    titlesData: FlTitlesData(
      show: true,
        topTitles:  AxisTitles(sideTitles: SideTitles( showTitles: false)),
         rightTitles: AxisTitles(sideTitles: SideTitles( showTitles: false)),
      bottomTitles: AxisTitles(


        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 2:
                return Text("1",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
              case 5:
                return Text("11",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
              case 8:
                return Text("21",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
            }
            return Text(" ",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
          },

        ),



      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,

          getTitlesWidget: (value, meta){
            switch (value.toInt()) {
              case 2:
                return Text("10k",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
              case 4:
                return Text("50k",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
              case 6:
                return Text("100k",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
            }
            return Text(" ",style: TextStyle(color: Color(0xff68737d), fontSize: 12),);
          },
          reservedSize: 28,

        ),

      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 12,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 1),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        color: primary,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
      ),
    ],
  );
}
