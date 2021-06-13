
function srt(arr: [u32; 10]) -> [u32; 10] {
    // Move boundaries of unsorted subarray.
    for i in 0..4 {
        // Find min and max of unsorted subarray.
        let  min = arr[i];
        let  max = arr[i];
        let  min_i = i;
        let  max_i = i;
        let n = 9 - i;

        for k in i..(9+1) {
            if arr[k] > max {
                max = arr[k];
                max_i = k;
            } else if arr[k] < min {
                min = arr[k];
                min_i = k;
            }
        }

        // Shift the min.
        let temp_1 = arr[i];
        arr[i] = arr[min_i];
        arr[min_i] = temp_1;

        // Shift the max.
        let temp_2 = arr[n];

        if arr[min_i] == max { 
            arr[n] = arr[min_i]; 
        } else { 
            arr[n] = arr[max_i];
        }

        if arr[min_i] == max {
            arr[min_i] = temp_2;
        } else {
            arr[max_i] = temp_2;
        }
    }

    return arr;
}

function main(arr: [u32; 10]) {
    let sorted = srt(arr);
    console.log("{}", sorted);
}

@test 
function test_basic() {
    let sorted = srt([34u32, 52u32, 989999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32]);
    console.assert([34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 989999u32] == sorted);
}