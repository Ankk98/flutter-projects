import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentage;

  ChartBar(this.label, this.amount, this.percentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(label),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                width: 10,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    FractionallySizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      heightFactor: percentage,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text(amount.toString()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


// fit: FlexFit.tight,