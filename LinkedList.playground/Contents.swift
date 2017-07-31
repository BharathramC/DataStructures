//: Playground - noun: a place where people can play

// Linked List implementation
import Cocoa

class Node{
    
    var data : Int
    var next : Node?
    
    init() {
        self.data = 0
        self.next = nil
    }
    
    init(data : Int){
        self.data = data
        self.next = nil
    }

}

class LinkedList{
    
    var firstItem : Node?
    var lastItem : Node?
    var traverser : Node?
    
    
    //******************* Methods to Insert ***********************
    func insertAtBegining(data : Int){
       
        var newNode = Node(data: data)
        
        if self.firstItem == nil{
           self.firstItem = newNode
            self.lastItem = self.firstItem
        }else{
            newNode.next = self.firstItem
            self.firstItem = newNode
            
        }
        
        print("element \((self.firstItem?.data)!) was Inserted at Begining")
    }
    
    func insertAtEnd(data : Int){
        var newNode = Node(data: data)
        
        if self.firstItem == nil{
            self.firstItem = newNode
            self.lastItem = self.firstItem
        }else{
            self.lastItem?.next = newNode
            self.lastItem = newNode
        }
        print("element \((self.lastItem?.data)!) was Inserted at End")
    }
    
    func insert(after: Int,data: Int){
        
        var (curNode,Index) = self.findElementWith(data: after)
        if curNode == nil{
            print("List is Empty")
        }else{
            var newNode = Node(data: data)
            newNode.next = curNode?.next
            curNode?.next = newNode
        }
    }
    
    
    //******************* Methods to Delete  ***********************
    
    func removeFirstElement(){
        if self.firstItem == nil{
            print("List is Empty")
        }else{
            var tempNode = self.firstItem
            self.firstItem = self.firstItem?.next
            print("element \((tempNode?.data)!) was removed at Begining")
            tempNode = nil
        }
    }
    
    func removeLastElement(){
        if self.firstItem == nil{
            print("List is Empty")
        }else{
            var tempNode = self.firstItem
            repeat{
                if tempNode?.next === self.lastItem{
                    break
                }else{
                    tempNode = tempNode?.next
                }
                
            }while tempNode?.next === self.lastItem
            
            var nodeToDelete = self.lastItem
            self.lastItem = tempNode
            self.lastItem?.next = nil
            
            print("element \((nodeToDelete?.data)!) was removed at End")
            nodeToDelete = nil
            
        }
    }
    
    func removeElementWithData(data : Int){
        var (curNode,Index) = self.findElementWith(data: data)
        self.traverser = nil
        if curNode == nil{
            print("List is Empty")
        }else{
            self.traverser = self.firstItem
            repeat{
               self.traverser = self.traverser?.next
            }while(self.traverser?.next !== curNode)
            
            self.traverser?.next = curNode?.next
            print("Element \((curNode?.data)!), at index \(Index) was removed")
            curNode = nil
        }
        //*
    }
    //******************* Methods to Display ***********************
    func displayList(){
        
        self.traverser = self.firstItem
        
        if self.traverser == nil{
            print("List is Empty")
        }else{
            var index = 0
            repeat{
                print("\(index) -> \((self.traverser?.data)!)")
                self.traverser = self.traverser?.next
                index += 1
            }while(self.traverser != nil)
        }
        print("=================================")
    }
    
    //******************* Methods to Search ***********************
    
    func findElementWith(data: Int) -> (Node?,Int){
        var tempNode : Node? = nil
        var index = 0
        if self.firstItem != nil{
            tempNode = self.firstItem
            repeat{
                if tempNode?.data == data{
                    print("Element Found at Index -> \(index)")
                    return (tempNode,index)
                }else{
                    tempNode = tempNode?.next
                    index += 1
                }
            }while tempNode != nil
        }else{
            print("List is Empty")
        }
        
        return (tempNode,index)
    }
    
    //* initialize a List
    init(){
        self.firstItem = nil
        self.lastItem = self.firstItem
    }
    
}

var newList = LinkedList()

newList.displayList()
newList.insertAtBegining(data: 10)
newList.insertAtBegining(data: 23)
newList.insertAtBegining(data: 40)
newList.displayList()
newList.insertAtEnd(data: 50)
newList.displayList()
newList.removeFirstElement()
newList.displayList()
newList.removeLastElement()
newList.displayList()
newList.removeLastElement()
newList.displayList()
newList.insertAtBegining(data: 10)
newList.insertAtBegining(data: 23)
newList.insertAtBegining(data: 40)
newList.displayList()
let (curnode,index) = newList.findElementWith(data: 23)
newList.insert(after: 23, data: 567)
newList.displayList()
newList.removeElementWithData(data: 567)
newList.displayList()