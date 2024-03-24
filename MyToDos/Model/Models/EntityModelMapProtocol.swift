//
//  EntityModelMapProtocol.swift
//  MyToDos
//
//  Created by Julia Gurbanova on 05.03.2024.
//

import Foundation
import CoreData

protocol EntityModelMapProtocol {
    associatedtype EntityType: NSManagedObject

    func mapToEntityInContext(_ context: NSManagedObjectContext) -> EntityType
    static func mapFromEntity(_ entity: EntityType) -> Self
}
