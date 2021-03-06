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
    @IBOutlet weak var whiteRectangle: UIView!
    
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
        whiteRectangle.layer.cornerRadius = 10
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
            if !food.marked && (food.owner == FoodDicts.currentUser.name) {
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
//        let darkGreen = UIColor(red: 130/255.0, green: 139/255.0, blue: 124/255.0, alpha: 1.0)
        
        let chartDataSet = PieChartDataSet(values: totalDataEntries, label: nil)
        
        let noZeroFormatter = NumberFormatter()
        noZeroFormatter.numberStyle = NumberFormatter.Style.currency
        noZeroFormatter.zeroSymbol = ""
        chartDataSet.valueFormatter = DefaultValueFormatter(formatter: noZeroFormatter)
        
        let chartData = PieChartData(dataSet: chartDataSet)
        chartDataSet.colors = sunsetish
        chartDataSet.entryLabelColor = UIColor.white
        chartDataSet.valueTextColor = UIColor.white
        pieChart.data = chartData
        
    }
    
    let sunsetish: [UIColor] = [
//        UIColor(red: 248/255.0, green: 202/255.0, blue: 153/255.0, alpha: 1.0),
        UIColor(red: 252/255.0, green: 177/255.0, blue: 164/255.0, alpha: 1.0),
        UIColor(red: 238/255.0, green: 139/255.0, blue: 154/255.0, alpha: 1.0),
//        UIColor(red: 240/255.0, green: 162/255.0, blue: 223/255.0, alpha: 1.0),
        UIColor(red: 193/255.0, green: 167/255.0, blue: 238/255.0, alpha: 1.0),
        UIColor(red: 169/255.0, green: 188/255.0, blue: 252/255.0, alpha: 1.0),
        UIColor(red: 161/255.0, green: 221/255.0, blue: 252/255.0, alpha: 1.0)
    ]
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
