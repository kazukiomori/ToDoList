//
//  SwiftUIView.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/05.
//

import SwiftUI

struct RegistTaskButton: View {
    @Binding var todoList: [Task]
    let task: Task
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        
        Button(action: {
            if self.task.name == "" || self.task.description == ""{
                
            }else{
                todoList.append(task)
                self.presentationMode.wrappedValue.dismiss()
                UserDefaults.standard.setEncoded(todoList, forKey: "ToDoList")
            }
        }, label: {
            Text("登録")
                .font(.title3)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .frame(width: 100, height: 60)
                .cornerRadius(50)
        })
        .padding(.trailing)
        .padding(.top)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegistTaskButton(todoList: .constant(TodoModel().taskList), task: .init(name: "追加タスク", description: "追加タスクの説明", status: .new))
    }
}
