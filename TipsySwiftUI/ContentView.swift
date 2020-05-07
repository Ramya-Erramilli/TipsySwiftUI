//
//  ContentView.swift
//  TipsySwiftUI
//
//  Created by Ramya Seshagiri on 03/05/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var tapCount = 0
//    @State private var name = ""
//
//    var studentNames = ["Ramya","Divya","Bhavya","Sravya"]
//
//    @State private var selectedStudent = 0
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    @State private var peopleCount = "2"
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson : Double{
        let noOfPeople = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = orderAmount+tipValue
        let amountPerPerson = grandTotal/noOfPeople
        
        return amountPerPerson
    }
    
    var body: some View {
    
        
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $peopleCount)
                        .keyboardType(.numberPad)
                    
//                    Picker("No of people", selection: $numberOfPeople) {
//                        ForEach(2..<100){
//                            Text("\($0) people")
//                        }
//                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")){
                    Text("₨ \(totalPerPerson, specifier: "%.2f")")
                }//.background(Color.red).foregroundColor(Color.white)
                
                Section(header: Text("Grand Total")){
                    Text("₨ \(totalPerPerson/Double(numberOfPeople+2), specifier: "%.2f")")
                }
                
            }.navigationBarTitle("Tipsy")
        }
        
        // DEMO
        //                Text("Hello, World!")
        //        NavigationView{
        //            Form{
        //            Section{
        //                Text("Hello")
        //                Text("Hello")
        //                Text("Hello")
        //                Text("Hello")
        //                Text("Hello")
        //                Text("Hello")
        //            }
        //            }.navigationBarTitle("Tipsy")
        //            //.navigationBarTitle(Text("Tipsy"),displayMode: .inline)
        //
        //        Form{
        //            TextField("Enter your name: ", text: $name)
        //            Text("Your name is \(name)")
        //            Button("Tap Count: \(tapCount)") {
        //            self.tapCount += 1
        //        }
//        Form{
//            ForEach(0..<100){
//                Text("Row \($0)")
//            }
//        }
        
//        VStack{
//            Picker("Select your student", selection: $selectedStudent) {
//                ForEach(0..<studentNames.count){
//                    Text(self.studentNames[$0])
//                }
//            }
//            Text("You selected: \(studentNames[selectedStudent])")
//        }
//
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
