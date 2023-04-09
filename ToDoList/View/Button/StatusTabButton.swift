//
//  TaskStatusButton.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/01.
//

import SwiftUI

struct StatusTabButton: View {
    @Binding var selectedButton: TaskStatus
    let selfButtonStatus: TaskStatus
    var namespace: Namespace.ID
    var title: String{
        switch selfButtonStatus{
        case .new:
            return NSLocalizedString("inFuture", comment: "")
        case .doing:
            return NSLocalizedString("inProcess", comment: "")
        case .done:
            return NSLocalizedString("done", comment: "")
        }
    }
    var body: some View {
        ZStack{
            if selectedButton == selfButtonStatus{
                Capsule()
                    .frame(width: 100, height: 50)
                    .matchedGeometryEffect(id: "CustomButton", in: namespace)
            }
            Button(action: {
                withAnimation{
                    selectedButton = selfButtonStatus
                }
            }) {
                Text(title)
                    .fontWeight(.heavy)
                    .frame(width: 100, height: 50)
                    .foregroundColor(selectedButton == selfButtonStatus ? .white : .gray)
            }
            .cornerRadius(25)
        }
    }
}

struct TaskStatusButton_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        StatusTabButton(selectedButton: .constant(.doing), selfButtonStatus: TaskStatus.doing, namespace: namespace)
    }
}
