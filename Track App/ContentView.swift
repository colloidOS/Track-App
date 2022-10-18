//
//  ContentView.swift
//  Track App
//
//  Created by Macintosh HD on 17/08/2021.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
//    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
   
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 25) {
                    
                 Text("OVERVIEW")
                        .font(.title2)
                        .bold()
                    
                    
        //            MARK: Chart view
                    let data = transactionListVM.AccumulateTransactions()
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                            CardView {
                                VStack(alignment: .leading) {
                                
                                    ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                    
                                LineChart()
                                }
                                .background(Color.systemBackground)
                                
                            }
                                    .data(data)
                                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.Icon.opacity(0.4), Color.Icon)))
                                .frame(height: 300)
                    }
                   
                            
                      
                    
                    
                    
//                    MARK: Transaction List
                    RecentTransactionList()
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                
            }
            .background(Color.BackGround)
            .navigationBarTitleDisplayMode(.inline)
//            .ignoresSafeArea()
            
            .toolbar {
    //            MARK: Notification Icon
               
                ToolbarItem{
                        HStack {
                         
                            Button{
                                
                            }
                            
                            
                        label:  {
                        Image(systemName: "bell.badge")
                                .font(.title2)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.Icon, .primary)

              
                            }
                   
                }
                
            }
            }
            .overlay( alignment: .bottomTrailing) {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(Color.Icon)
                    .background(Color.BackGround)
                  
                    .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous) )
                    .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
//                    .frame(width: 100, height: 100)
                    .padding()
            }
            
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
        
        
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = TransactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
