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
    
    var fruitsDataEntry = PieChartDataEntry (value:0, label:"Fruits")
    var vegDataEntry = PieChartDataEntry (value:0, label:"Vegetables")
    var grainsDataEntry = PieChartDataEntry (value:0, label:"Grains")
    var proteinDataEntry = PieChartDataEntry (value:0, label:"Proteins")
    var condimentsDataEntry = PieChartDataEntry (value:0, label:"Condiments")
    var snacksDataEntry = PieChartDataEntry (value:0, label:"Snacks")
    var otherDataEntry = PieChartDataEntry (value:0, label:"Other")
    var dairyDataEntry = PieChartDataEntry(value:0, label:"Dairy")
    
    var totalDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.chartDescription?.text = nil
        // Do any additional setup after loading the view.
        pieChart.chartDescription?.text = nil
        
        totalDataEntries=[fruitsDataEntry, vegDataEntry,grainsDataEntry, proteinDataEntry, condimentsDataEntry, snacksDataEntry, otherDataEntry, dairyDataEntry]
        
        updateValues()
        updateChartData() //pie chart
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
                    self.fruitsDataEntry.value += food.quantity
                } else if food.category == "Grains" {
                    self.grainsDataEntry.value += food.quantity
                } else if food.category == "Protein" {
                    self.proteinDataEntry.value += food.quantity
                } else if food.category == "Snacks" {
                    self.snacksDataEntry.value += food.quantity
                } else if food.category == "Condiments" {
                    self.condimentsDataEntry.value += food.quantity
                } else if food.category == "Other" {
                    self.otherDataEntry.value += food.quantity
                } else if food.category == "Vegetables" {
                    self.vegDataEntry.value += food.quantity
                } else if food.category == "Dairy" {
                    self.dairyDataEntry.value += food.quantity
                }
                food.marked = true
            }
        }
    }
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(values: totalDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.vordiplom()
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
