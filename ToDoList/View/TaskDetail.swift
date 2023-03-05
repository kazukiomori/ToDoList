//
//  TaskDetail.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/01.
//

import SwiftUI

struct TaskDetail: View {
    @EnvironmentObject var todoModel: TodoModel
    @State var task: Task
    var taskIndex: Int {
        if let taskIndex = todoModel.taskList.firstIndex(where: {$0.id == task.id}){
            return taskIndex
        }else{
            return todoModel.taskList.count + 1
        }
    }
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                if taskIndex > todoModel.taskList.count {
                    RegistTaskButton(todoList: $todoModel.taskList, task: task)
                        .padding(.bottom)
                        .offset(x:0, y:32)
                }else {
                    UpdateTaskButton(todoList: $todoModel.taskList,beforeValueTask: $todoModel.taskList[taskIndex], afterValueTask: task)
                }
            }
            TaskStatusTab(selectedTab: $task.status)
            
            HStack{
                Text("タスク名")
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            TextField("タスク名",text: $task.name)
                .frame(width: UIScreen.main.bounds.size.width - 50, height: 40)
                .font(.system(size: 19, weight: .bold))
                .padding(.horizontal)
                .padding(.bottom, 5)
                .background(Color(.white))
            
            HStack{
                Text("内容")
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            TextView(text: $task.description)
                .frame(width: UIScreen.main.bounds.size.width - 50, height: 100)
                .font(.system(size: 19, weight: .bold))
                .padding(.horizontal)
                .padding(.bottom, 5)
                .background(Color(.white))
            
            Spacer()
            AdMobBannerView()
                .frame(width: 320, height: 50)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail(task: .init(name: "~する", description: "ああああ", status: .doing))
            .environmentObject(TodoModel())
    }
}
