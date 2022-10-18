//
//  previewData.swift
//  Track App
//
//  Created by Macintosh HD on 17/08/2021.
//

import Foundation
import SwiftUI
var TransactionPreviewData = Transaction(id: 1, date: "06/13/2022", institution: "Desjardins", account: "visa Desjardins", merchant: "Apple", amount: 102.34, type: "debit", categoryId: 801, category: "software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)



var TransactionListPreviewData = [Transaction] (repeating: TransactionPreviewData, count: 10)

