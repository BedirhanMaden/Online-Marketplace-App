//
//  UserDataSource.swift
//  TestProject
//
//  Created by Bedirhan Maden on 30.11.2023.
//

import Foundation

struct UserDataSource{
    private let baseURL="https://dummyjson.com"
    var delegate: UserDataSourceDelegate?


    func loadUserData(){

        let session=URLSession.shared
        if let url=URL(string: "\(baseURL)/users"){
            print("found the url")
            var request = URLRequest(url: url)
            request.httpMethod="GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            print("just before data task")
            let dataTask = session.dataTask(with: request) { data, response, error in

                print("can enter this area")
                guard let data else {print("error in data"); return}
                let decoder = JSONDecoder()
                do{
                    print("Ready to decode")
                    let userDataReceiver = try decoder.decode(UserDataReceiver.self, from: data)
                    let userList=userDataReceiver.users
                    DispatchQueue.main.async {

                        delegate?.usersLoaded(users: userList ?? [])
                    }

                }catch {
                    print(error)
                }

            }
            dataTask.resume()
        }
    }


}
