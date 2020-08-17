//
//  MobileDataLocalDataManager.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift
import RxRealm

protocol MobileDataLocalDataManagerProtocol: class {
    var records: Observable<[YearlyMobileData]?> { get }
    func removeAllThenInsert(records: [YearlyMobileData])
    func removeAll()
}

final class MobileDataLocalDataManager: MobileDataLocalDataManagerProtocol {

    private let yearlyMobileDataRecordsSubject = BehaviorSubject<[YearlyMobileData]?>(value: nil)
    private let databaseName: String

    init(databaseName: String = "MobileDataLocalDataManager.realm") {
        self.databaseName = databaseName
        loadYearlyMobileDataRecords()
    }

    var records: Observable<[YearlyMobileData]?> {
        return yearlyMobileDataRecordsSubject.asObservable()
    }

    func removeAllThenInsert(records: [YearlyMobileData]) {
        do {
            let realm = try getRealm()
            try realm.write {
                realm.delete(realm.objects(DBYearlyMobileData.self))
                let dbModels = records.map { DBYearlyMobileData(model: $0) }
                realm.add(dbModels, update: .all)
                loadYearlyMobileDataRecords(inRealm: realm)
            }
        } catch {
            print("Realm error: \(error.localizedDescription)")
        }
    }

    func removeAll() {
        do {
            let realm = try getRealm()
            try realm.write {
                realm.delete(realm.objects(DBYearlyMobileData.self))
                loadYearlyMobileDataRecords(inRealm: realm)
            }
        } catch {
            print("Realm error: \(error.localizedDescription)")
        }
    }

    // MARK: Private

    private func loadYearlyMobileDataRecords(inRealm: Realm? = nil) {
        do {
            let realm = try inRealm ?? getRealm()
            let result = realm.objects(DBYearlyMobileData.self).toArray().map { $0.toModel() }
            yearlyMobileDataRecordsSubject.onNext(result)
        } catch {
            print("Realm error: \(error.localizedDescription)")
        }
    }

    private func getRealm() throws -> Realm {
        let objectTypes = [DBYearlyMobileData.self]
        let config = Realm.Configuration(
            fileURL: try getPathInDocuments(databaseName),
            schemaVersion: 1,
            deleteRealmIfMigrationNeeded: true,
            objectTypes: objectTypes)

        return try Realm(configuration: config)
    }

    private func getPathInDocuments(_ name: String) throws -> URL {
        return try FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(name)
    }
}

class DBYearlyMobileData: Object {

    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var year: String = ""
    @objc dynamic var volumeOfMobileData: Double = 0.0
    @objc dynamic var hasDecreasedQuarterlyVolumes: Bool = false

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(model: YearlyMobileData) {
        self.init()
        year = model.year
        volumeOfMobileData = model.volumeOfMobileData
        hasDecreasedQuarterlyVolumes = model.hasDecreasedQuarterlyVolumes
    }

    func toModel() -> YearlyMobileData {
        return YearlyMobileData(volumeOfMobileData: volumeOfMobileData,
                                year: year,
                                hasDecreasedQuarterlyVolumes: hasDecreasedQuarterlyVolumes)
    }
}
