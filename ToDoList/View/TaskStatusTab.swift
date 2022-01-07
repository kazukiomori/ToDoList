//
//  TaskStatusTab.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/01.
//

import SwiftUI

struct TaskStatusTab: View {
    @Binding var selectedTab: TaskStatus
    @Namespace var namespace
    
    var body: some View {
        HStack{
            ForEach(TaskStatus.allCases,id: \.self){ status in
                StatusTabButton(selectedButton: $selectedTab, selfButtonStatus: status, namespace: namespace)
            }
        }
        .frame(width: 300, height: 50)
        .cornerRadius(25)
    }
}

struct TaskStatusTab_Previews: PreviewProvider {
    static var previews: some View {
        TaskStatusTab(selectedTab: .constant(.doing))
            .previewLayout(.fixed(width: 300, height: 50))
    }
}
