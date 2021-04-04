//
//  HomeViewModel.swift
//  Convert Temperatures
//
//  Created by MD Tanvir Alam on 4/4/21.
//

import Foundation

class HomeViewModel:ObservableObject{
    @Published var inputUnit = "Celcius"
    let inputUnits = ["Celcius", "Furrenhite", "Kelvin"]
    
    @Published var outputUnit = "Furrenhite"
    let outputUnits = ["Celcius", "Furrenhite", "Kelvin"]
    
    @Published var inputValue:String = ""
    
    var inputUnitInKelvin:Double{
        guard let inputValue = Double(inputValue) else {
            return 0.0
        }
        var result:Double = 0.0
        if inputUnit == "Celcius"{
            result = inputValue + 273.15
        }else if inputUnit == "Furrenhite"{
            result = (inputValue - 32.0) * 5/9 + 273.15
        }else if inputUnit == "Kelvin"{
            result = inputValue
        }
        return result
    }
    
    var result:String{
        var result:Double = 0.0
        if outputUnit == "Celcius"{
            result = inputUnitInKelvin - 273.15
        }else if outputUnit == "Furrenhite"{
            result = (inputUnitInKelvin - 273.15) * 9/5 + 32
        }else if outputUnit == "Kelvin"{
            result = inputUnitInKelvin
        }
        return String(format: "%.2f", result)
    }
}
