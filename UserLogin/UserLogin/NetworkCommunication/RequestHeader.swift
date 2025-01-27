import Foundation

class RequestHeaderBuilder {
  
  private var header = HttpHeaders()
  
  func with(accept: String) -> RequestHeaderBuilder {
    self.header["accept"] = accept
    return self
  }
  
  func with(authToken: String) -> RequestHeaderBuilder {
    self.header["Authorization"] = authToken
    return self
  }
  
  func get() -> HttpHeaders {
    return self.header
  }
}
