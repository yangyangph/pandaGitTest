public struct PlatformConfig {
    public private(set) var deviceId: String
    public private(set) var appId: String
    public private(set) var appKey: String
    public var baseUrl: String
    public let product: String
    public let productName: String

    public init(deviceId: String, appId: String, appKey: String, baseUrl: String = "https://test79.ubtrobot.com",
                product: String, productName: String) {
        self.deviceId = deviceId
        self.appId = appId
        self.appKey = appKey
        self.baseUrl = baseUrl
        self.product = product
        self.productName = productName
    }
}
