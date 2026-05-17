//
//  BasketDataSource.swift
//  TestProject
//
//  Created by Bedirhan Maden on 4.01.2024.
//

import Foundation
import Firebase

class BasketDataSource{

    var baskets: [Basket] = []
    var userBasket: Basket? = nil
    

    var delegate : BasketDataSourceDelegate?

   

    func getUserBasket(uid:String){



        print("Obtained data")
        for basket in baskets{

            if(uid == basket.uid){
                self.userBasket = basket
                print("basket is foumnd")


            }
        }

    }

    func fetchBasket(){

        let db = Firestore.firestore()
        let ref = db.collection("basketsJSON")

        ref.getDocuments {snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }

            if let snapshot = snapshot{
                for document in  snapshot.documents{
                    let data = document.data()

                    let basketJson = data["basketJSON"] as? String
                    if(basketJson=="b"){
                        
                    }else{
                        let jsonDecoder = JSONDecoder()
                        do{
                            let data = basketJson!.data(using: .utf8)!
                            let basket = try jsonDecoder.decode(Basket.self, from: data)
                            self.baskets.append(basket)

                        }catch{
                            print("error in firebase data")
                        }
                    }
                }
                DispatchQueue.main.async {

                    self.delegate?.basketListLoaded(basketList: self.baskets)
                }
            }
        }

    }

    func addBasket(basket: Basket, uid: String){
        let db = Firestore.firestore()
        //TODO implement basket json

        let jsonEncoder = JSONEncoder()
        do{
            let jsonData = try jsonEncoder.encode(basket)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)

            let ref = db.collection("basketsJSON").document(uid)
            ref.setData(["basketJSON" : json ?? ""]){ error in
                if let error=error{
                    print(error.localizedDescription)
                    print("error in saving basket - 1")
                }
            }

        }catch{
            print("error in saving basket - 2")
        }


    }
     func updateBasket(basket: Basket, uid: String) {


        let db = Firestore.firestore()
        //TODO implement basket json

        let jsonEncoder = JSONEncoder()
        do{
            let jsonData = try jsonEncoder.encode(basket)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)

            let ref = db.collection("basketsJSON").document(uid)
            ref.setData(["basketJSON" : json ?? ""]){ error in
                if let error=error{
                    print(error.localizedDescription)
                    print("error in saving basket - 1")
                }
            }

        }catch{
            print("error in saving basket - 2")
        }
      }

}

