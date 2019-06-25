
import Foundation
import Alamofire

final class ServiceHelper {
    
    class var sharedInstance: ServiceHelper {
        struct Static {
            static let instance = ServiceHelper()
        }
        return Static.instance
    }
    
    
    //Save the cookie for the alamofire request .
    func saveCookies(response: DataResponse<Any>) {
        let headerFields = response.response?.allHeaderFields as! [String: String]
        let url = response.response?.url
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url!)
        var cookieArray = [[HTTPCookiePropertyKey: Any]]()
        for cookie in cookies {
            cookieArray.append(cookie.properties!)
        }
        UserDefaults.standard.set(cookieArray, forKey: "savedCookies")
        UserDefaults.standard.synchronize()
    }
    
    
    //load the cookie for alamofire request.
    func loadCookies() {
        guard let cookieArray = UserDefaults.standard.array(forKey: "savedCookies") as? [[HTTPCookiePropertyKey: Any]] else { return }
        for cookieProperties in cookieArray {
            if let cookie = HTTPCookie(properties: cookieProperties) {
                HTTPCookieStorage.shared.setCookie(cookie)
            }
        }
    }
    
    
    
    //Create Get and send request
    func createGetRequest(isShowHud: Bool, apiName : String, completion: @escaping (_ response: AnyObject?, _ error: String?) -> Void) {
        
        if !APPDELEGATE.checkReachablility() {
            completion(nil,"Please check your internet connection!")
            return
        }
        
        let url = BASE_URL + apiName
        print( "\n\n Request URL  >>>>>>\(url)")
        loadCookies()
        
        if isShowHud {
            showHud()
        }
        
        Alamofire.request(URL.init(string: url)!, method: HTTPMethod.get, encoding: URLEncoding.default).validate().responseJSON { response in
            
            
            switch response.result {
            case .success(_):
                RappleActivityIndicatorView.stopAnimation()
                
                if response.response?.statusCode == 200 {
                    //Ok Response
                    completion(response.result.value as AnyObject?, nil)
                    
                } else if response.response?.statusCode == 401 {
                    //Unauthorized
                    completion(response.result.value as AnyObject?, nil)
                    
                } else if response.response?.statusCode == 403 {
                    //Unauthorized
                    
                } else if response.response?.statusCode == 404 {
                    //Forbidden
                    
                }  else if response.response?.statusCode == 400 {
                    completion(response.result.value as AnyObject?, nil)
                }
            case .failure(let error):
                print( "\nfailure:\n failure Response From Server >>>>>>\n\(String(describing: response.result.error))")
                RappleActivityIndicatorView.stopAnimation()
                
                if(response.response?.statusCode == 401){
                    //Logout the application
                    UserDefaultValue.removeUserDefault(key: validUser)
                }
                
                if  let errorStr = response.data {
                    let errorJson = JSON(errorStr)
                    if(errorJson != JSON.null){
                        if errorJson["error"] != JSON.null{
                            completion(nil, errorJson["error"].stringValue)
                        }else{
                            completion(nil, errorJson["message"].stringValue)
                            
                        }
                    }else {
                        completion(nil, error.localizedDescription)
                        
                    }
                }else {
                    completion(nil, "Error Connecting to Server")
                }
            }
            
        }
    }
    
    
    func createPostRequest(isShowHud: Bool, params: [String : AnyObject]!,apiName : String, completion: @escaping (_ response: AnyObject?, _ error: String?) -> Void)
    {
        
        if !APPDELEGATE.checkReachablility() {
            completion(nil,"Please check your internet connection!")
            return
        }
        
        
        let url = BASE_URL + apiName
        let parameterDict = params as NSDictionary
        
        if isShowHud {
            showHud()
        }
        
        Alamofire.request(URL.init(string: url)!, method: HTTPMethod.post, parameters: parameterDict as? Parameters, encoding: URLEncoding.queryString).responseJSON { response in
            
            switch response.result {
            case .success(_):
                
                RappleActivityIndicatorView.stopAnimation()
                
                //Save the cookie for the api login api only...
                if apiName == SIGN_IN {
                    self.saveCookies(response: response)
                }
                
                if response.response?.statusCode == 200 {
                    //Ok Response
                    completion(response.result.value as AnyObject?, nil)
                    
                } else if response.response?.statusCode == 401 {
                    //Unauthorized
                    completion(response.result.value as AnyObject?, nil)
                    
                } else if response.response?.statusCode == 403 {
                    //Unauthorized
                    
                } else if response.response?.statusCode == 404 {
                    //Forbidden
                    
                }  else if response.response?.statusCode == 400 {
                    completion(response.result.value as AnyObject?, nil)
                }
                
            case .failure(let error):
                RappleActivityIndicatorView.stopAnimation()
                if(response.response?.statusCode == 401){
                    //Logout the application
                    UserDefaultValue.removeUserDefault(key: validUser)
                }
                
                if  let errorStr = response.data {
                    let errorJson = JSON(errorStr)
                    if(errorJson != JSON.null){
                        if errorJson["error"] != JSON.null{
                            completion(nil, errorJson["error"].stringValue)
                        }else{
                            completion(nil, errorJson["message"].stringValue)
                            
                        }
                    }else {
                        completion(nil, error.localizedDescription)
                    }
                }else {
                    completion(nil, "Error Connecting to Server")
                }
            }
        }
    }
    
    
    
    
    func createRequestToUploadMultipleDataWithString(additionalParams : Dictionary<String,Any>, imageList: [UIImage],apiName : String,completion: @escaping (_ response: AnyObject?, _ error: NSError?) -> Void) {
        if !APPDELEGATE.checkReachablility() {
            completion(nil,NSError.init(domain: "Please check your internet connection!", code: 000, userInfo: nil))
            return
        }
        self.showHud()
        let url = BASE_URL + apiName
        let URL = try! URLRequest(url: url, method: .post)
        print("88888888",additionalParams)
        
        Alamofire.upload(multipartFormData: { (multipartData) in
            for (key,value) in additionalParams {
                multipartData.append("\(value)".data(using: .utf8)!, withName: key)
            }
            if imageList.count > 0{
                for index in 0...imageList.count-1{
                    let imageData = imageList[index].jpegData(compressionQuality: 0.5)!
                    multipartData.append(imageData, withName: "image.file", fileName: "image\(index+1).jpg", mimeType: "image/jpeg")
                }
            }
            
        }, with: URL) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    print("Success ------ \(response)")
                    RappleActivityIndicatorView.stopAnimation()
                    if response.response?.statusCode == 200 {
                        if let jsonData = response.result.value as? NSDictionary {
                            let status = jsonData.value(forKey: "status") as? NSNumber
                            if (status == 203)
                            {
                                let message = jsonData.value(forKey: "message") as! String
                                AlertController.alert(message: message)
                                //  APPDELEGATE.setLogOutController()
                            }else {
                                completion(response.result.value as AnyObject?, nil)
                            }
                        }else {
                            completion(nil, response.result.error as NSError?)
                        }
                    }else {
                        completion(nil, response.result.error as NSError?)
                    }
                }
                break
                
            case .failure(let encodingError):
                print("Error ------- \(encodingError)")
                RappleActivityIndicatorView.stopAnimation()
                RappleActivityIndicatorView.stopAnimation(completionIndicator: .none, completionLabel: "", completionTimeout: 1.0)
                completion(nil, encodingError as NSError?)
                break
            }
        }
    }
    
    
    
    func showHud() {
        let attribute = RappleActivityIndicatorView.attribute(style: RappleStyleCircle, tintColor: .white, screenBG: nil, progressBG: .black, progressBarBG: .lightGray, progreeBarFill: .yellow)
        RappleActivityIndicatorView.startAnimating(attributes: attribute)
    }

    
}
    
    
 
    


