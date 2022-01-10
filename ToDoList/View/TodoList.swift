//
//  ContentView.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/01.
//

import SwiftUI

struct TodoList: View {
    
    @Binding var todoList: [Task]
    @EnvironmentObject var todoModel: TodoModel
    @State var selectedTab: TaskStatus
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationView{
            VStack {
                
                TaskStatusTab(selectedTab: $selectedTab)
                List {
                    ForEach(todoModel.taskList.filter{
                        $0.status == selectedTab
                    }) { task in
                        NavigationLink(
                            destination: TaskDetail(task: task)){
                            HStack {
                                Text(task.name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text(task.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.leading, 6)
                            }
                        }
                    }.onDelete{ (IndexSet) in
                        todoModel.taskList.remove(atOffsets: IndexSet)
                        UserDefaults.standard.setEncoded(todoModel.taskList, forKey: "ToDoList")
                    }
                }
                .cornerRadius(25)
                .navigationTitle("ToDoList")
                .navigationBarItems(trailing: Button(action: {
                                        isShowingSheet = true
                                    }) {
                                        Text("+")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                            .frame(width: 30, height: 30)
                                            .cornerRadius(15)
                                    })
            }
        }
        .onAppear(){
            guard let defaultList = UserDefaults.standard.decodedObject([Task].self,forKey: "ToDoList") as? [Task]
            else{return}
            todoModel.taskList = defaultList
        }
        .sheet(isPresented: $isShowingSheet, content: {
            let task: Task = .init(name: "",description: "",status: .new)
            TaskDetail(task: task)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoList(todoList: .constant(TodoModel().taskList),selectedTab: TaskStatus.doing)
            .environmentObject(TodoModel())
    }
}
