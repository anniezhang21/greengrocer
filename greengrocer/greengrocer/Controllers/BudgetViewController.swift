//
//  BudgetViewViewController.swift
//  greengrocer
//
//  Created by Jessica Meng on 11/3/18.
//  Copyright © 2018 Annie Zhang. All rights reserved.
//

import UIKit
import Charts

class BudgetViewViewController: UIViewController {
    @IBOutlet weak var pieChart: PieChartView!
    
    var fruitsDataEntry = PieChartDataEntry (value:0, label:"")
    var vegDataEntry = PieChartDataEntry (value:0, label:"")
    var grainsDataEntry = PieChartDataEntry (value:0, label:"")
    var proteinDataEntry = PieChartDataEntry (value:0, label:"")
    var condimentsDataEntry = PieChartDataEntry (value:0, label:"")
    var snacksDataEntry = PieChartDataEntry (value:0, label:"")
    var otherDataEntry = PieChartDataEntry (value:0, label:"")
    var dairyDataEntry = PieChartDataEntry(value:0, label:"")
    
    var totalDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pieChart.chartDescription?.text = nil
        
        totalDataEntries=[fruitsDataEntry, vegDataEntry,grainsDataEntry, proteinDataEntry, condimentsDataEntry, snacksDataEntry, otherDataEntry, dairyDataEntry]
        
        updateValues()
        updateChartData()
        
        pieChart.legend.enabled = false
        pieChart.holeColor = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateValues()
        updateChartData()
    }
    
    func updateValues() {
        for food in FoodDicts.myFood {
            if !food.marked {
                if food.category == "Fruit" {
                    fruitsDataEntry.label = "Fruit"
                    self.fruitsDataEntry.value += food.price
                } else if food.category == "Grains" {
                    grainsDataEntry.label = "Grains"
                    self.grainsDataEntry.value += food.price
                } else if food.category == "Protein" {
                    proteinDataEntry.label = "Protein"
                    self.proteinDataEntry.value += food.price
                } else if food.category == "Snacks" {
                    snacksDataEntry.label = "Snacks"
                    self.snacksDataEntry.value += food.price
                } else if food.category == "Condiments" {
                    condimentsDataEntry.label = "Condiments"
                    self.condimentsDataEntry.value += food.price
                } else if food.category == "Other" {
                    otherDataEntry.label = "Other"
                    self.otherDataEntry.value += food.price
                } else if food.category == "Vegetables" {
                    vegDataEntry.label = "Vegetables"
                    self.vegDataEntry.value += food.price
                } else if food.category == "Dairy" {
                    dairyDataEntry.label = "Dairy"
                    self.dairyDataEntry.value += food.price
                }
                food.marked = true
            }
        }
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(values: totalDataEntries, label: nil)
        
        let noZeroFormatter = NumberFormatter()
        noZeroFormatter.numberStyle = NumberFormatter.Style.currency
        noZeroFormatter.zeroSymbol = ""
        chartDataSet.valueFormatter = DefaultValueFormatter(formatter: noZeroFormatter)
        
        let chartData = PieChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.colorful()
        pieChart.data = chartData
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
