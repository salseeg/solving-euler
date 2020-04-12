use std::time::Instant;

//fn is_prime(x: u32) -> bool {
//    let mut divisor = 2;
//
//    if (x < 2) {
//        return false;
//    }
//
//    while (divisor * divisor <= x) {
//        if (x % divisor == 0) {
//            return false;
//        }
//        divisor += 1;
//    }
//
//    return true;
//}
fn is_prime(x: u32, div: u32) -> bool {
    if x < 2 {
        return false;
    }
    if div * div > x {
        return true;
    }
    if x % div == 0 {
        return false;
    }

    return is_prime(x, div + 1);
}

//fn count_primes(mut n: u32) -> u32 {
//    let mut x = 2;
//
//        while n > 0 {
//        if is_prime(x, 2) {
//            n -= 1;
//        }
//        x += 1;
//    }
//
//    x - 1
//}
//

fn count_primes(x: u32, n: u32) -> u32 {
    if n == 0 {
        return x - 1;
    }
    if is_prime(x, 2) {
        return count_primes(x + 1, n - 1);
    }

    return count_primes(x + 1, n);
}


fn main() {
    let n_arg = std::env::args().nth(1).expect("no pattern given");
    let n = n_arg.parse::<u32>().unwrap();

    let start = Instant::now();
    let prime = count_primes(2, n);
    let time = start.elapsed().as_millis();

    println!("{} prime = {}", n_arg, prime);
    println!("{} ms", time);

}
