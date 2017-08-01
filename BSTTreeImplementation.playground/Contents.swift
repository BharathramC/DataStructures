//: A Cocoa based Playground to present user interface

import Foundation

class Node{
    var data : Int
    var leftNode : Node?
    var rightNode : Node?
    
    init(){
        self.data = 0
        self.leftNode = nil
        self.rightNode = nil
    }
    
    init(data: Int){
        self.data = data
        self.leftNode = nil
        self.rightNode = nil
    }
}

class BSTree{
    var root:Node?
    
    func insertIntoTree(data : Int,_ currentNode: Node?) -> Bool{
        
        var newNode = Node(data: data)
        var curNode : Node? = nil
        
        if currentNode == nil{
            curNode = self.root
            

        }else{
            curNode = currentNode
        }
        
        if self.root != nil{

            if (curNode?.data)! < newNode.data {
                if curNode?.rightNode == nil{
                    curNode?.rightNode = newNode
                    print("Node inserted to right of \((curNode?.data)!)")
                    return true
                }else{
                    insertIntoTree(data: data, curNode?.rightNode)
                }
            }
            
           if (curNode?.data)! > newNode.data{
                if curNode?.leftNode == nil{
                    curNode?.leftNode = newNode
                     print("Node inserted to left of \((curNode?.data)!)")
                    return true
                }else{
                    insertIntoTree(data: data, curNode?.leftNode)
                }
            }
            
        }else{
            self.root = newNode
            print("Node inserted at Root")
            return true
        }
        return false
    }
    
    func searchForANode(data : Int){
        
    }
    
    func removeNodeFromTree(data : Int){
        
    }
    
    func displayTree(){
        
    }
    init() {
        self.root = nil
    }
}

var newBST = BSTree()

newBST.insertIntoTree(data: 10, nil)
newBST.insertIntoTree(data: 2, nil)
newBST.insertIntoTree(data: 4, nil)
newBST.insertIntoTree(data: 18, nil)
newBST.insertIntoTree(data: 28, nil)
newBST.insertIntoTree(data: 40, nil)
