module visitor

//intersection : intersection of two int tabs
fn intersection(a []int,b []int) ([]int) {
     mut m := map[int]bool{}
	mut res:= []int {}
	//res=[]

      for item in a {
              m[item] = true
      }
      for item in b {
              if m[item] {
                     res<<item  
              }
      }
      return res
}

//is_in_array return true if the value is found in the array 
pub fn is_in_array( value int, array []int) bool  {
	

	 for item in array {
        if item == value {
            return true
        }
    }
	return false
}