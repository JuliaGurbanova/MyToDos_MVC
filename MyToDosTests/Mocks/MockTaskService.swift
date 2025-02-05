//
//  MockTaskService.swift
//  MyToDosTests
//
//  Created by Julia Gurbanova on 24.03.2024.
//

import XCTest
@testable import MyToDos

class MockTaskService: TaskServiceProtocol {
    private var list: TasksListModel!

    required init(coreDataManager: CoreDataManager) {}
    convenience init(list: TasksListModel) {
        self.init(coreDataManager: CoreDataManager.shared)
        self.list = list
    }

    func fetchTasksForList(_ tasksList: TasksListModel) -> [TaskModel] {
        return list.tasks
    }

    func saveTask(_ task: TaskModel, in tasksList: TasksListModel) {
        list = tasksList
        list.tasks.append(task)
    }

    func updateTask(_ task: TaskModel) {
        guard let tasks = list.tasks else { return }

        var updatedTasks = [TaskModel]()
        tasks.forEach({
            var updatedTask = $0
            if $0.id == task.id {
                updatedTask.done.toggle()
            }
            updatedTasks.append(updatedTask)
        })

        list.tasks = updatedTasks
    }

    func deleteTask(_ task: TaskModel) {
        list.tasks = list.tasks.filter { $0.id != task.id }
    }
}
