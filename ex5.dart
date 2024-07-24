void main(){
  List<int> nums =[2,7,11,14,-2];
  var target = 9;
  print(sumTarget(nums, target));
}

List<int>? sumTarget (List<int> arr, int target){
  if(arr.isEmpty){
    return [];
  }
  Map <int, int> numToIndex = {};
  var firstIndex = arr.length;
  var secondIndex = 0;
  for(int i = 0; i < arr.length; i++){  
    var valueNeedFind = target - arr[i];
    
    if(numToIndex.containsKey(arr[i])){
      //return [numToIndex[arr[i]]!, i];
       if(firstIndex > numToIndex[arr[i]]!){
        firstIndex = numToIndex[arr[i]]!;
        secondIndex = i;
      }
    }else{
      if(!numToIndex.containsKey(valueNeedFind))
        numToIndex[valueNeedFind] = i;
    }
  }
  return  firstIndex < secondIndex?[firstIndex, secondIndex]:[];
}
