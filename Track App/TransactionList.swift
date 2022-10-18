//
//  TransactionList.swift
//  Track App
//
//  Created by Macintosh HD on 17/08/2021.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack{
            List{
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id:\.key) {
                    month, transactions in
                    Section{
//                        MARK: Transaction List
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                            
                    } header: {
//                        MARK: Transacation Month
                       Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
                
                
                
            }.listStyle(.plain)
            
            
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = TransactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
