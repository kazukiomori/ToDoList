//
//  UpdateTaskButton.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/05.
//

import SwiftUI

struct UpdateTaskButton: View {
    @Binding var todoList: [Task]
    @Binding var beforeValueTask: Task
    let afterValueTask: Task
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            beforeValueTask = afterValueTask
            self.presentationMode.wrappedValue.dismiss()
            UserDefaults.standard.setEncoded(todoList, forKey: "ToDoList")
        }, label: {
            Text("更新")
                .font(.title3)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .frame(width: 100, height: 60)
                .cornerRadius(25)
        })
        .padding(.trailing)
        .padding(.top)
    }
}

struct UpdateTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        UpdateTaskButton(todoList: .constant(TodoModel().taskList),beforeValueTask: .constant(.init(name: "", description: "", status: .doing)), afterValueTask: .init(name: "", description: "", status: .doing))
    }
}
