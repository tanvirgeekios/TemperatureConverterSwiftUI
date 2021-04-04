//
//  HomeView.swift
//  Convert Temperatures
//
//  Created by MD Tanvir Alam on 4/4/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeVM = HomeViewModel()
    
    var body: some View {
        NavigationView(){
            Form{
                Section(header:Text("Select Input Unit")){
                    Picker("Input Unit", selection: $homeVM.inputUnit) {
                        ForEach(homeVM.inputUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    //Text("Selected input Unit \(homeVM.inputUnit)")
                }
                
                Section(header:Text("Select Output Unit")){
                    Picker("Output Unit", selection: $homeVM.outputUnit) {
                        ForEach(homeVM.outputUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    //Text("Selected output Unit \(homeVM.outputUnit)")
                }
                
                Section(header:Text("Input Value")){
                    TextField("Input Value in \(homeVM.inputUnit)", text: $homeVM.inputValue)
                }
                
                Section(header:Text("Result")){
                    if homeVM.inputValue == ""{
                        Text("No input value")
                    }else{
                        Text("\(homeVM.result) \(homeVM.outputUnit)")
                    }
                    
                }
                
            }.navigationBarTitle("Temperature Converter", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
