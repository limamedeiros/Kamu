import Cuckoo
@testable import Kamu

import AVFoundation

class MockCapture: Capture, Cuckoo.ClassMock {
  typealias MocksType = Capture
  typealias Stubbing = __StubbingProxy_Capture
  typealias Verification = __VerificationProxy_Capture

  private var __defaultImplStub: Capture?

  let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

  func enableDefaultImplementation(_ stub: Capture) {
    __defaultImplStub = stub
    cuckoo_manager.enableDefaultStubImplementation()
  }

  public override var delegate: Scannable? {
    get {
      return cuckoo_manager.getter("delegate",
                                   superclassCall:

                                   super.delegate,
                                   
                                   defaultCall: __defaultImplStub!.delegate)
    }

    set {
      cuckoo_manager.setter("delegate",
                            value: newValue,
                            superclassCall:

                            super.delegate = newValue,
                            
                            defaultCall: __defaultImplStub!.delegate = newValue)
    }
  }

  public override var preview: CALayer {
    get {
      return cuckoo_manager.getter("preview",
                                   superclassCall:

                                   super.preview,
                                   
                                   defaultCall: __defaultImplStub!.preview)
    }

    set {
      cuckoo_manager.setter("preview",
                            value: newValue,
                            superclassCall:

                            super.preview = newValue,
                            
                            defaultCall: __defaultImplStub!.preview = newValue)
    }
  }

  override func start() {
    return cuckoo_manager.call("start()",
                               parameters: (),
                               escapingParameters: (),
                               superclassCall:

                               super.start(),
                               
                               defaultCall: __defaultImplStub!.start())
  }

  override func configure() {
    return cuckoo_manager.call("configure()",
                               parameters: (),
                               escapingParameters: (),
                               superclassCall:

                               super.configure(),
                               
                               defaultCall: __defaultImplStub!.configure())
  }

  struct __StubbingProxy_Capture: Cuckoo.StubbingProxy {
    private let cuckoo_manager: Cuckoo.MockManager

    init(manager: Cuckoo.MockManager) {
      cuckoo_manager = manager
    }

    var delegate: Cuckoo.ClassToBeStubbedProperty<MockCapture, Scannable?> {
      return .init(manager: cuckoo_manager, name: "delegate")
    }

    var preview: Cuckoo.ClassToBeStubbedProperty<MockCapture, CALayer> {
      return .init(manager: cuckoo_manager, name: "preview")
    }

    func start() -> Cuckoo.ClassStubNoReturnFunction<()> {
      let matchers: [Cuckoo.ParameterMatcher<Void>] = []
      return .init(stub: cuckoo_manager.createStub(for: MockCapture.self, method: "start()", parameterMatchers: matchers))
    }

    func configure() -> Cuckoo.ClassStubNoReturnFunction<()> {
      let matchers: [Cuckoo.ParameterMatcher<Void>] = []
      return .init(stub: cuckoo_manager.createStub(for: MockCapture.self, method: "configure()", parameterMatchers: matchers))
    }
  }

  struct __VerificationProxy_Capture: Cuckoo.VerificationProxy {
    private let cuckoo_manager: Cuckoo.MockManager
    private let callMatcher: Cuckoo.CallMatcher
    private let sourceLocation: Cuckoo.SourceLocation

    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
      cuckoo_manager = manager
      self.callMatcher = callMatcher
      self.sourceLocation = sourceLocation
    }

    var delegate: Cuckoo.VerifyProperty<Scannable?> {
      return .init(manager: cuckoo_manager, name: "delegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
    }

    var preview: Cuckoo.VerifyProperty<CALayer> {
      return .init(manager: cuckoo_manager, name: "preview", callMatcher: callMatcher, sourceLocation: sourceLocation)
    }

    @discardableResult
    func start() -> Cuckoo.__DoNotUse<Void> {
      let matchers: [Cuckoo.ParameterMatcher<Void>] = []
      return cuckoo_manager.verify("start()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
    }

    @discardableResult
    func configure() -> Cuckoo.__DoNotUse<Void> {
      let matchers: [Cuckoo.ParameterMatcher<Void>] = []
      return cuckoo_manager.verify("configure()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
    }
  }
}

class CaptureStub: Capture {
  public override var delegate: Scannable? {
    get {
      return DefaultValueRegistry.defaultValue(for: (Scannable?).self)
    }

    set {}
  }

  public override var preview: CALayer {
    get {
      return DefaultValueRegistry.defaultValue(for: CALayer.self)
    }

    set {}
  }

  override func start() {
    return DefaultValueRegistry.defaultValue(for: Void.self)
  }

  override func configure() {
    return DefaultValueRegistry.defaultValue(for: Void.self)
  }
}

class MockScannable: Scannable, Cuckoo.ProtocolMock {
  typealias MocksType = Scannable
  typealias Stubbing = __StubbingProxy_Scannable
  typealias Verification = __VerificationProxy_Scannable

  private var __defaultImplStub: Scannable?

  let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

  func enableDefaultImplementation(_ stub: Scannable) {
    __defaultImplStub = stub
    cuckoo_manager.enableDefaultStubImplementation()
  }

  func didFail(with failure: Capture.Error) {
    return cuckoo_manager.call("didFail(with: Capture.Error)",
                               parameters: failure,
                               escapingParameters: failure,
                               superclassCall:

                               Cuckoo.MockManager.crashOnProtocolSuperclassCall(),
                               
                               defaultCall: __defaultImplStub!.didFail(with: failure))
  }

  func didRead(code: String) {
    return cuckoo_manager.call("didRead(code: String)",
                               parameters: code,
                               escapingParameters: code,
                               superclassCall:

                               Cuckoo.MockManager.crashOnProtocolSuperclassCall(),
                               
                               defaultCall: __defaultImplStub!.didRead(code: code))
  }

  struct __StubbingProxy_Scannable: Cuckoo.StubbingProxy {
    private let cuckoo_manager: Cuckoo.MockManager

    init(manager: Cuckoo.MockManager) {
      cuckoo_manager = manager
    }

    func didFail<M1: Cuckoo.Matchable>(with failure: M1) -> Cuckoo.ProtocolStubNoReturnFunction<Capture.Error> where M1.MatchedType == Capture.Error {
      let matchers: [Cuckoo.ParameterMatcher<Capture.Error>] = [wrap(matchable: failure) { $0 }]
      return .init(stub: cuckoo_manager.createStub(for: MockScannable.self, method: "didFail(with: Capture.Error)", parameterMatchers: matchers))
    }

    func didRead<M1: Cuckoo.Matchable>(code: M1) -> Cuckoo.ProtocolStubNoReturnFunction<String> where M1.MatchedType == String {
      let matchers: [Cuckoo.ParameterMatcher<String>] = [wrap(matchable: code) { $0 }]
      return .init(stub: cuckoo_manager.createStub(for: MockScannable.self, method: "didRead(code: String)", parameterMatchers: matchers))
    }
  }

  struct __VerificationProxy_Scannable: Cuckoo.VerificationProxy {
    private let cuckoo_manager: Cuckoo.MockManager
    private let callMatcher: Cuckoo.CallMatcher
    private let sourceLocation: Cuckoo.SourceLocation

    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
      cuckoo_manager = manager
      self.callMatcher = callMatcher
      self.sourceLocation = sourceLocation
    }

    @discardableResult
    func didFail<M1: Cuckoo.Matchable>(with failure: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Capture.Error {
      let matchers: [Cuckoo.ParameterMatcher<Capture.Error>] = [wrap(matchable: failure) { $0 }]
      return cuckoo_manager.verify("didFail(with: Capture.Error)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
    }

    @discardableResult
    func didRead<M1: Cuckoo.Matchable>(code: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String {
      let matchers: [Cuckoo.ParameterMatcher<String>] = [wrap(matchable: code) { $0 }]
      return cuckoo_manager.verify("didRead(code: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
    }
  }
}

class ScannableStub: Scannable {
  func didFail(with _: Capture.Error) {
    return DefaultValueRegistry.defaultValue(for: Void.self)
  }

  func didRead(code _: String) {
    return DefaultValueRegistry.defaultValue(for: Void.self)
  }
}
