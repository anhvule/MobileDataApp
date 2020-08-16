// MARK: - Mocks generated from file: MobileDataApp/Features/Display Mobile Data/MobileDataViewModel.swift at 2020-08-16 11:10:56 +0000

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


// MARK: - Mocks generated from file: MobileDataApp/Services/MobileDataService.swift at 2020-08-16 11:10:56 +0000

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

