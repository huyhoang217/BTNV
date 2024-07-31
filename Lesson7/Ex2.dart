void main(){
  print(checkString("{([])}")); // true
  print(checkString("{(())"));  // false 
  print(checkString(""));       // false
  print(checkString("{[()(){}]}")); // true
}

bool checkString(String str){
  List <String> stack = [];
  Map <String, String> hashMap = {
    "(":")",
    "[":"]",
    "{":"}"
  };
  if(str == "") return false;
  for (int i = 0; i<str.length; i++){
    if(hashMap.containsKey(str[i])){
      stack.add(str[i]);
    }else{
      if(hashMap[stack.last] != str[i]){
        return false;
      }
      stack.removeLast();
    } 
  }
  return stack.isEmpty;
}