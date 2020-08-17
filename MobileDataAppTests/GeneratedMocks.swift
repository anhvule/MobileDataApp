// MARK: - Mocks generated from file: MobileDataApp/Features/Display Mobile Data/MobileDataViewModel.swift at 2020-08-17 15:42:08 +0000

//
//  MobileDataViewModel.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Cuckoo
@testable import MobileDataApp

import Foundation
import RxCocoa
import RxSwift


 class MockMobileDataViewModelProtocol: MobileDataViewModelProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = MobileDataViewModelProtocol
    
     typealias Stubbing = __StubbingProxy_MobileDataViewModelProtocol
     typealias Verification = __VerificationProxy_MobileDataViewModelProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: MobileDataViewModelProtocol?

     func enableDefaultImplementation(_ stub: MobileDataViewModelProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var mobileData: Observable<[YearlyMobileData]> {
        get {
            return cuckoo_manager.getter("mobileData",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.mobileData)
        }
        
    }
    
    
    
     var isRefreshing: Observable<Bool?> {
        get {
            return cuckoo_manager.getter("isRefreshing",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.isRefreshing)
        }
        
    }
    
    
    
     var error: Observable<Error?> {
        get {
            return cuckoo_manager.getter("error",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.error)
        }
        
    }
    

    

    
    
    
     func reloadMobileData()  {
        
    return cuckoo_manager.call("reloadMobileData()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.reloadMobileData())
        
    }
    

	 struct __StubbingProxy_MobileDataViewModelProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var mobileData: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockMobileDataViewModelProtocol, Observable<[YearlyMobileData]>> {
	        return .init(manager: cuckoo_manager, name: "mobileData")
	    }
	    
	    
	    var isRefreshing: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockMobileDataViewModelProtocol, Observable<Bool?>> {
	        return .init(manager: cuckoo_manager, name: "isRefreshing")
	    }
	    
	    
	    var error: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockMobileDataViewModelProtocol, Observable<Error?>> {
	        return .init(manager: cuckoo_manager, name: "error")
	    }
	    
	    
	    func reloadMobileData() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataViewModelProtocol.self, method: "reloadMobileData()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MobileDataViewModelProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var mobileData: Cuckoo.VerifyReadOnlyProperty<Observable<[YearlyMobileData]>> {
	        return .init(manager: cuckoo_manager, name: "mobileData", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var isRefreshing: Cuckoo.VerifyReadOnlyProperty<Observable<Bool?>> {
	        return .init(manager: cuckoo_manager, name: "isRefreshing", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var error: Cuckoo.VerifyReadOnlyProperty<Observable<Error?>> {
	        return .init(manager: cuckoo_manager, name: "error", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func reloadMobileData() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("reloadMobileData()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MobileDataViewModelProtocolStub: MobileDataViewModelProtocol {
    
    
     var mobileData: Observable<[YearlyMobileData]> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<[YearlyMobileData]>).self)
        }
        
    }
    
    
     var isRefreshing: Observable<Bool?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<Bool?>).self)
        }
        
    }
    
    
     var error: Observable<Error?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<Error?>).self)
        }
        
    }
    

    

    
     func reloadMobileData()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: MobileDataApp/Managers/Display Mobile Data/MobileDataLocalDataManager.swift at 2020-08-17 15:42:08 +0000

//
//  MobileDataLocalDataManager.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Cuckoo
@testable import MobileDataApp

import Foundation
import RealmSwift
import RxRealm
import RxSwift


 class MockMobileDataLocalDataManagerProtocol: MobileDataLocalDataManagerProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = MobileDataLocalDataManagerProtocol
    
     typealias Stubbing = __StubbingProxy_MobileDataLocalDataManagerProtocol
     typealias Verification = __VerificationProxy_MobileDataLocalDataManagerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: MobileDataLocalDataManagerProtocol?

     func enableDefaultImplementation(_ stub: MobileDataLocalDataManagerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var records: Observable<[YearlyMobileData]?> {
        get {
            return cuckoo_manager.getter("records",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.records)
        }
        
    }
    

    

    
    
    
     func removeAllThenInsert(records: [YearlyMobileData])  {
        
    return cuckoo_manager.call("removeAllThenInsert(records: [YearlyMobileData])",
            parameters: (records),
            escapingParameters: (records),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.removeAllThenInsert(records: records))
        
    }
    
    
    
     func removeAll()  {
        
    return cuckoo_manager.call("removeAll()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.removeAll())
        
    }
    

	 struct __StubbingProxy_MobileDataLocalDataManagerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var records: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockMobileDataLocalDataManagerProtocol, Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records")
	    }
	    
	    
	    func removeAllThenInsert<M1: Cuckoo.Matchable>(records: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([YearlyMobileData])> where M1.MatchedType == [YearlyMobileData] {
	        let matchers: [Cuckoo.ParameterMatcher<([YearlyMobileData])>] = [wrap(matchable: records) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataLocalDataManagerProtocol.self, method: "removeAllThenInsert(records: [YearlyMobileData])", parameterMatchers: matchers))
	    }
	    
	    func removeAll() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataLocalDataManagerProtocol.self, method: "removeAll()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MobileDataLocalDataManagerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var records: Cuckoo.VerifyReadOnlyProperty<Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func removeAllThenInsert<M1: Cuckoo.Matchable>(records: M1) -> Cuckoo.__DoNotUse<([YearlyMobileData]), Void> where M1.MatchedType == [YearlyMobileData] {
	        let matchers: [Cuckoo.ParameterMatcher<([YearlyMobileData])>] = [wrap(matchable: records) { $0 }]
	        return cuckoo_manager.verify("removeAllThenInsert(records: [YearlyMobileData])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeAll() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("removeAll()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MobileDataLocalDataManagerProtocolStub: MobileDataLocalDataManagerProtocol {
    
    
     var records: Observable<[YearlyMobileData]?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<[YearlyMobileData]?>).self)
        }
        
    }
    

    

    
     func removeAllThenInsert(records: [YearlyMobileData])   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func removeAll()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockMobileDataLocalDataManager: MobileDataLocalDataManager, Cuckoo.ClassMock {
    
     typealias MocksType = MobileDataLocalDataManager
    
     typealias Stubbing = __StubbingProxy_MobileDataLocalDataManager
     typealias Verification = __VerificationProxy_MobileDataLocalDataManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: MobileDataLocalDataManager?

     func enableDefaultImplementation(_ stub: MobileDataLocalDataManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var records: Observable<[YearlyMobileData]?> {
        get {
            return cuckoo_manager.getter("records",
                superclassCall:
                    
                    super.records
                    ,
                defaultCall: __defaultImplStub!.records)
        }
        
    }
    

    

    
    
    
     override func removeAllThenInsert(records: [YearlyMobileData])  {
        
    return cuckoo_manager.call("removeAllThenInsert(records: [YearlyMobileData])",
            parameters: (records),
            escapingParameters: (records),
            superclassCall:
                
                super.removeAllThenInsert(records: records)
                ,
            defaultCall: __defaultImplStub!.removeAllThenInsert(records: records))
        
    }
    
    
    
     override func removeAll()  {
        
    return cuckoo_manager.call("removeAll()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.removeAll()
                ,
            defaultCall: __defaultImplStub!.removeAll())
        
    }
    

	 struct __StubbingProxy_MobileDataLocalDataManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var records: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockMobileDataLocalDataManager, Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records")
	    }
	    
	    
	    func removeAllThenInsert<M1: Cuckoo.Matchable>(records: M1) -> Cuckoo.ClassStubNoReturnFunction<([YearlyMobileData])> where M1.MatchedType == [YearlyMobileData] {
	        let matchers: [Cuckoo.ParameterMatcher<([YearlyMobileData])>] = [wrap(matchable: records) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataLocalDataManager.self, method: "removeAllThenInsert(records: [YearlyMobileData])", parameterMatchers: matchers))
	    }
	    
	    func removeAll() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataLocalDataManager.self, method: "removeAll()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MobileDataLocalDataManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var records: Cuckoo.VerifyReadOnlyProperty<Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func removeAllThenInsert<M1: Cuckoo.Matchable>(records: M1) -> Cuckoo.__DoNotUse<([YearlyMobileData]), Void> where M1.MatchedType == [YearlyMobileData] {
	        let matchers: [Cuckoo.ParameterMatcher<([YearlyMobileData])>] = [wrap(matchable: records) { $0 }]
	        return cuckoo_manager.verify("removeAllThenInsert(records: [YearlyMobileData])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeAll() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("removeAll()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MobileDataLocalDataManagerStub: MobileDataLocalDataManager {
    
    
     override var records: Observable<[YearlyMobileData]?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<[YearlyMobileData]?>).self)
        }
        
    }
    

    

    
     override func removeAllThenInsert(records: [YearlyMobileData])   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeAll()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockDBYearlyMobileData: DBYearlyMobileData, Cuckoo.ClassMock {
    
     typealias MocksType = DBYearlyMobileData
    
     typealias Stubbing = __StubbingProxy_DBYearlyMobileData
     typealias Verification = __VerificationProxy_DBYearlyMobileData

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: DBYearlyMobileData?

     func enableDefaultImplementation(_ stub: DBYearlyMobileData) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var id: String {
        get {
            return cuckoo_manager.getter("id",
                superclassCall:
                    
                    super.id
                    ,
                defaultCall: __defaultImplStub!.id)
        }
        
        set {
            cuckoo_manager.setter("id",
                value: newValue,
                superclassCall:
                    
                    super.id = newValue
                    ,
                defaultCall: __defaultImplStub!.id = newValue)
        }
        
    }
    
    
    
     override var year: String {
        get {
            return cuckoo_manager.getter("year",
                superclassCall:
                    
                    super.year
                    ,
                defaultCall: __defaultImplStub!.year)
        }
        
        set {
            cuckoo_manager.setter("year",
                value: newValue,
                superclassCall:
                    
                    super.year = newValue
                    ,
                defaultCall: __defaultImplStub!.year = newValue)
        }
        
    }
    
    
    
     override var volumeOfMobileData: Double {
        get {
            return cuckoo_manager.getter("volumeOfMobileData",
                superclassCall:
                    
                    super.volumeOfMobileData
                    ,
                defaultCall: __defaultImplStub!.volumeOfMobileData)
        }
        
        set {
            cuckoo_manager.setter("volumeOfMobileData",
                value: newValue,
                superclassCall:
                    
                    super.volumeOfMobileData = newValue
                    ,
                defaultCall: __defaultImplStub!.volumeOfMobileData = newValue)
        }
        
    }
    
    
    
     override var hasDecreasedQuarterlyVolumes: Bool {
        get {
            return cuckoo_manager.getter("hasDecreasedQuarterlyVolumes",
                superclassCall:
                    
                    super.hasDecreasedQuarterlyVolumes
                    ,
                defaultCall: __defaultImplStub!.hasDecreasedQuarterlyVolumes)
        }
        
        set {
            cuckoo_manager.setter("hasDecreasedQuarterlyVolumes",
                value: newValue,
                superclassCall:
                    
                    super.hasDecreasedQuarterlyVolumes = newValue
                    ,
                defaultCall: __defaultImplStub!.hasDecreasedQuarterlyVolumes = newValue)
        }
        
    }
    

    

    
    
    
     override func toModel() -> YearlyMobileData {
        
    return cuckoo_manager.call("toModel() -> YearlyMobileData",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.toModel()
                ,
            defaultCall: __defaultImplStub!.toModel())
        
    }
    

	 struct __StubbingProxy_DBYearlyMobileData: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var id: Cuckoo.ClassToBeStubbedProperty<MockDBYearlyMobileData, String> {
	        return .init(manager: cuckoo_manager, name: "id")
	    }
	    
	    
	    var year: Cuckoo.ClassToBeStubbedProperty<MockDBYearlyMobileData, String> {
	        return .init(manager: cuckoo_manager, name: "year")
	    }
	    
	    
	    var volumeOfMobileData: Cuckoo.ClassToBeStubbedProperty<MockDBYearlyMobileData, Double> {
	        return .init(manager: cuckoo_manager, name: "volumeOfMobileData")
	    }
	    
	    
	    var hasDecreasedQuarterlyVolumes: Cuckoo.ClassToBeStubbedProperty<MockDBYearlyMobileData, Bool> {
	        return .init(manager: cuckoo_manager, name: "hasDecreasedQuarterlyVolumes")
	    }
	    
	    
	    func toModel() -> Cuckoo.ClassStubFunction<(), YearlyMobileData> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockDBYearlyMobileData.self, method: "toModel() -> YearlyMobileData", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_DBYearlyMobileData: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var id: Cuckoo.VerifyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "id", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var year: Cuckoo.VerifyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "year", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var volumeOfMobileData: Cuckoo.VerifyProperty<Double> {
	        return .init(manager: cuckoo_manager, name: "volumeOfMobileData", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var hasDecreasedQuarterlyVolumes: Cuckoo.VerifyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "hasDecreasedQuarterlyVolumes", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func toModel() -> Cuckoo.__DoNotUse<(), YearlyMobileData> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("toModel() -> YearlyMobileData", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class DBYearlyMobileDataStub: DBYearlyMobileData {
    
    
     override var id: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
     override var year: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
    
     override var volumeOfMobileData: Double {
        get {
            return DefaultValueRegistry.defaultValue(for: (Double).self)
        }
        
        set { }
        
    }
    
    
     override var hasDecreasedQuarterlyVolumes: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    

    

    
     override func toModel() -> YearlyMobileData  {
        return DefaultValueRegistry.defaultValue(for: (YearlyMobileData).self)
    }
    
}


// MARK: - Mocks generated from file: MobileDataApp/Managers/Display Mobile Data/MobileDataRepository.swift at 2020-08-17 15:42:08 +0000

//
//  MobileDataRepository.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 17/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Cuckoo
@testable import MobileDataApp

import Foundation
import RxCocoa
import RxSwift


 class MockMobileDataRepositoryProtocol: MobileDataRepositoryProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = MobileDataRepositoryProtocol
    
     typealias Stubbing = __StubbingProxy_MobileDataRepositoryProtocol
     typealias Verification = __VerificationProxy_MobileDataRepositoryProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: MobileDataRepositoryProtocol?

     func enableDefaultImplementation(_ stub: MobileDataRepositoryProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var records: Observable<[YearlyMobileData]?> {
        get {
            return cuckoo_manager.getter("records",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.records)
        }
        
    }
    

    

    
    
    
     func fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]> {
        
    return cuckoo_manager.call("fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>",
            parameters: (resourceId),
            escapingParameters: (resourceId),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchMobileData(resourceId: resourceId))
        
    }
    

	 struct __StubbingProxy_MobileDataRepositoryProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var records: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockMobileDataRepositoryProtocol, Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records")
	    }
	    
	    
	    func fetchMobileData<M1: Cuckoo.Matchable>(resourceId: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<[YearlyMobileData]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: resourceId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataRepositoryProtocol.self, method: "fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MobileDataRepositoryProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var records: Cuckoo.VerifyReadOnlyProperty<Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func fetchMobileData<M1: Cuckoo.Matchable>(resourceId: M1) -> Cuckoo.__DoNotUse<(String), Observable<[YearlyMobileData]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: resourceId) { $0 }]
	        return cuckoo_manager.verify("fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MobileDataRepositoryProtocolStub: MobileDataRepositoryProtocol {
    
    
     var records: Observable<[YearlyMobileData]?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<[YearlyMobileData]?>).self)
        }
        
    }
    

    

    
     func fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[YearlyMobileData]>).self)
    }
    
}



 class MockMobileDataRepository: MobileDataRepository, Cuckoo.ClassMock {
    
     typealias MocksType = MobileDataRepository
    
     typealias Stubbing = __StubbingProxy_MobileDataRepository
     typealias Verification = __VerificationProxy_MobileDataRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: MobileDataRepository?

     func enableDefaultImplementation(_ stub: MobileDataRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var records: Observable<[YearlyMobileData]?> {
        get {
            return cuckoo_manager.getter("records",
                superclassCall:
                    
                    super.records
                    ,
                defaultCall: __defaultImplStub!.records)
        }
        
    }
    

    

    
    
    
     override func fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]> {
        
    return cuckoo_manager.call("fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>",
            parameters: (resourceId),
            escapingParameters: (resourceId),
            superclassCall:
                
                super.fetchMobileData(resourceId: resourceId)
                ,
            defaultCall: __defaultImplStub!.fetchMobileData(resourceId: resourceId))
        
    }
    

	 struct __StubbingProxy_MobileDataRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var records: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockMobileDataRepository, Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records")
	    }
	    
	    
	    func fetchMobileData<M1: Cuckoo.Matchable>(resourceId: M1) -> Cuckoo.ClassStubFunction<(String), Observable<[YearlyMobileData]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: resourceId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataRepository.self, method: "fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MobileDataRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var records: Cuckoo.VerifyReadOnlyProperty<Observable<[YearlyMobileData]?>> {
	        return .init(manager: cuckoo_manager, name: "records", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func fetchMobileData<M1: Cuckoo.Matchable>(resourceId: M1) -> Cuckoo.__DoNotUse<(String), Observable<[YearlyMobileData]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: resourceId) { $0 }]
	        return cuckoo_manager.verify("fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MobileDataRepositoryStub: MobileDataRepository {
    
    
     override var records: Observable<[YearlyMobileData]?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<[YearlyMobileData]?>).self)
        }
        
    }
    

    

    
     override func fetchMobileData(resourceId: String) -> Observable<[YearlyMobileData]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[YearlyMobileData]>).self)
    }
    
}


// MARK: - Mocks generated from file: MobileDataApp/Managers/Display Mobile Data/MobileDataService.swift at 2020-08-17 15:42:08 +0000

//
//  MobileDataServiceProtocol.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Cuckoo
@testable import MobileDataApp

import Foundation
import RxCocoa
import RxSwift


 class MockMobileDataServiceProtocol: MobileDataServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = MobileDataServiceProtocol
    
     typealias Stubbing = __StubbingProxy_MobileDataServiceProtocol
     typealias Verification = __VerificationProxy_MobileDataServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: MobileDataServiceProtocol?

     func enableDefaultImplementation(_ stub: MobileDataServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func fetchMobileData(resourceId: String) -> Observable<DataStoreSearchResponse> {
        
    return cuckoo_manager.call("fetchMobileData(resourceId: String) -> Observable<DataStoreSearchResponse>",
            parameters: (resourceId),
            escapingParameters: (resourceId),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchMobileData(resourceId: resourceId))
        
    }
    

	 struct __StubbingProxy_MobileDataServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchMobileData<M1: Cuckoo.Matchable>(resourceId: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<DataStoreSearchResponse>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: resourceId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMobileDataServiceProtocol.self, method: "fetchMobileData(resourceId: String) -> Observable<DataStoreSearchResponse>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MobileDataServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchMobileData<M1: Cuckoo.Matchable>(resourceId: M1) -> Cuckoo.__DoNotUse<(String), Observable<DataStoreSearchResponse>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: resourceId) { $0 }]
	        return cuckoo_manager.verify("fetchMobileData(resourceId: String) -> Observable<DataStoreSearchResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MobileDataServiceProtocolStub: MobileDataServiceProtocol {
    

    

    
     func fetchMobileData(resourceId: String) -> Observable<DataStoreSearchResponse>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<DataStoreSearchResponse>).self)
    }
    
}


// MARK: - Mocks generated from file: MobileDataApp/Network/APIClient.swift at 2020-08-17 15:42:08 +0000

//
//  APIClient.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Cuckoo
@testable import MobileDataApp

import Alamofire
import Foundation
import RxAlamofire
import RxSwift


 class MockAPIClientProtocol: APIClientProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = APIClientProtocol
    
     typealias Stubbing = __StubbingProxy_APIClientProtocol
     typealias Verification = __VerificationProxy_APIClientProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: APIClientProtocol?

     func enableDefaultImplementation(_ stub: APIClientProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func requestData(_ method: HTTPMethod, path: String, payload: [String: Any]?, headers: [String : String]?) -> Observable<Data> {
        
    return cuckoo_manager.call("requestData(_: HTTPMethod, path: String, payload: [String: Any]?, headers: [String : String]?) -> Observable<Data>",
            parameters: (method, path, payload, headers),
            escapingParameters: (method, path, payload, headers),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestData(method, path: path, payload: payload, headers: headers))
        
    }
    

	 struct __StubbingProxy_APIClientProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func requestData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable>(_ method: M1, path: M2, payload: M3, headers: M4) -> Cuckoo.ProtocolStubFunction<(HTTPMethod, String, [String: Any]?, [String : String]?), Observable<Data>> where M1.MatchedType == HTTPMethod, M2.MatchedType == String, M3.OptionalMatchedType == [String: Any], M4.OptionalMatchedType == [String : String] {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPMethod, String, [String: Any]?, [String : String]?)>] = [wrap(matchable: method) { $0.0 }, wrap(matchable: path) { $0.1 }, wrap(matchable: payload) { $0.2 }, wrap(matchable: headers) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAPIClientProtocol.self, method: "requestData(_: HTTPMethod, path: String, payload: [String: Any]?, headers: [String : String]?) -> Observable<Data>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_APIClientProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func requestData<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable>(_ method: M1, path: M2, payload: M3, headers: M4) -> Cuckoo.__DoNotUse<(HTTPMethod, String, [String: Any]?, [String : String]?), Observable<Data>> where M1.MatchedType == HTTPMethod, M2.MatchedType == String, M3.OptionalMatchedType == [String: Any], M4.OptionalMatchedType == [String : String] {
	        let matchers: [Cuckoo.ParameterMatcher<(HTTPMethod, String, [String: Any]?, [String : String]?)>] = [wrap(matchable: method) { $0.0 }, wrap(matchable: path) { $0.1 }, wrap(matchable: payload) { $0.2 }, wrap(matchable: headers) { $0.3 }]
	        return cuckoo_manager.verify("requestData(_: HTTPMethod, path: String, payload: [String: Any]?, headers: [String : String]?) -> Observable<Data>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class APIClientProtocolStub: APIClientProtocol {
    

    

    
     func requestData(_ method: HTTPMethod, path: String, payload: [String: Any]?, headers: [String : String]?) -> Observable<Data>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Data>).self)
    }
    
}



 class MockAPIClient: APIClient, Cuckoo.ClassMock {
    
     typealias MocksType = APIClient
    
     typealias Stubbing = __StubbingProxy_APIClient
     typealias Verification = __VerificationProxy_APIClient

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: APIClient?

     func enableDefaultImplementation(_ stub: APIClient) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_APIClient: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_APIClient: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class APIClientStub: APIClient {
    

    

    
}

