//
//  TodoModel.swift
//  ToDoList
//
//  Created by Kazuki Omori on 2022/01/01.
//

import Foundation

class TodoModel:ObservableObject  {
    @Published var taskList: [Task] = createTaskList()
}

struct  Task: Identifiable, Codable {
    
    let id = UUID()
    var name: String
    var description: String
    var status: TaskStatus
    
    init(name: String, description: String, status: TaskStatus){
        self.name = name
        self.description = description
        self.status = status
    }
    
}

enum TaskStatus: String,CaseIterable,Codable{
    case new
    case doing
    case done
}

func createTaskList() -> [Task] {
    var taskList: [Task] = []
    return taskList
}


extension UserDefaults {
  func setEncoded<T: Encodable>(_ value: T, forKey key: String) {
    guard let data = try? JSONEncoder().encode(value) else {
       print("Can not Encode to JSON.")
       return
    }

    set(data, forKey: key)
  }

  func decodedObject<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
    guard let data = data(forKey: key) else {
      return nil
    }

    return try? JSONDecoder().decode(type, from: data)
  }
}
