import UIKit

let unSortedArray = [4, 3, 10, 44, 6, 4, 1, 7];
print("unsort array:     \(quickSort(unSortedArray))")

//MARK:- ---------- Start of Quick Sort -------------
    
// Time complexity: O(n^2).
   //  * First time arround is to separate the entire array.
   //  * Second time around should sort the rest of the array.
   // Space complexity: O(log n)  +1 for unsortedArray but the mutable copy never gets added to the autorelease pool.
   // All of the arrays that are not attached to the returnArray are released by a compiler pass at the end of the method.
func quickSort(_ unsortedArray: [Int]) -> [Int]{
    
    guard unsortedArray.count > 1 else { return unsortedArray }
    let pivot   = unsortedArray[unsortedArray.count/2]
    let less    = unsortedArray.filter { $0 < pivot }
    let equal   = unsortedArray.filter { $0 == pivot }
    let greater = unsortedArray.filter { $0 > pivot }
    return quickSort(less) + equal + quickSort(greater)
}

print("Quick sort:     \(quickSort(unSortedArray))")
// ---------- End of Quick Sort ---------------


//MARK:- ---------- Start of Merge Sort -------------

// Time complexity: Worst case is: O(n * log(n)).
// Space complexity: O(3 * n) or O(n) due to the 3 NSArrays that are used.

func mergeSort(_ unsortedArray:[Int]) -> [Int]{
    
    func mergeArray(_ leftArray: [Int], _ rightArray:[Int] ) -> [Int]{
        
        var returnArray : [Int] = []
        var i = 0, e = 0
        
        while(i < leftArray.count && e < rightArray.count){
            
            let leftValue   = leftArray[i]
            let rightValue  = rightArray[e]
            if  (leftValue < rightValue) {
                returnArray.append(leftArray[i])
                i = i + 1
            }else{
                returnArray.append(rightArray[e])
                e = e + 1
            }
        }
        while (i < leftArray.count) {
            returnArray.append(leftArray[i])
            i = i + 1
        }
        while (e < rightArray.count) {
            returnArray.append(rightArray[e])
            e = e + 1
        }
        return returnArray
    }
    let count = unsortedArray.count
    if count < 2 {
        return unsortedArray
    }
    let middle      = count / 2
    let leftArray   = Array(unsortedArray[0..<middle])
    let rightArray  = Array(unsortedArray[middle..<count])
    let returnArray = mergeArray(mergeSort(leftArray), mergeSort(rightArray))
    return  returnArray
}

print("Merge sort:     \(mergeSort(unSortedArray))")
// ---------- End of Merge Sort ---------------

//MARK:- ---------- Start of Insertion Sort -------------

// Time complexity: O(n^2).  Worst case: i*j.
// Space complexity: O(1)  1 for sortedArray and the mutable copy never gets added to the autorelease pool.
// Expensive routines:
// * replaceObjectAtIndex


func insertionSort(_ unSortedArray: [Int]) -> [Int] {
  var returnArray = unSortedArray
  for i in 1..<returnArray.count {
    var j = i
    let temp = returnArray[j]
    while j > 0 && temp < returnArray[j - 1] {
      returnArray[j] = returnArray[j - 1]   //1 is what shifts up the previous elements by one position. At the end of the inner loop
      j -= 1
    }
    returnArray[j] = temp                   // 2 y is the destination index for the new number in the sorted portion, and the line at //2 copies this number into place
  }
  return returnArray
}
print("Insertion sort: \(insertionSort(unSortedArray))")
