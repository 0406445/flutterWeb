


class StringUtils{

  static bool isEmpty(String? s){

    bool ret = false;

    if (s == null || s.length <=0 || s.isEmpty){
      ret = true;
    }

    return ret;
  }



}