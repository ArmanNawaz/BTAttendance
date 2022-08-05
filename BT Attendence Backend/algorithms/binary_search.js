var binarySearch = (lst, key)=>{

    var start = 0, end = lst.length - 1, mid = 0;

    while(start <= end){
        mid = (start + end) >> 1;
        if(lst[mid] == key || start == end){
            break;
        }else if(lst[mid] < key) start = mid + 1;
        else end = mid - 1;
    }

    console.log(`${lst[mid]} ${key}`);
    if(lst[mid] == key) return [true, mid];
    return [false, end];

}

module.exports = binarySearch;