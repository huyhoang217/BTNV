void main(){
  List<int> nums =[2,7,11,14,-2];
  var target = 9;
  print(sumTarget(nums, target));
}

List<int>? sumTarget(List<int> arr, int target){
  if(arr.isEmpty){
    return [];
  }
  for(int i1 = 0; i1< arr.length; i1++){
    for(int i2 = i1; i2< arr.length; i2++){
      if(arr[i1] + arr[i2] == target){
        return [i1,i2];
      }
    }
  }
  return [];
}