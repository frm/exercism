// Notice "Plong" and "Plang" are switched
// That way I can pretend I have a hash
const FACTORS: [i32; 3] = [3, 5, 7];
const VALUES: [&'static str; 3] = ["Pling", "Plong", "Plang"];
const SIZE: i32 = 3;

pub fn raindrops(i: i32) -> String {
    let raindrop = FACTORS.iter().fold(String::new(), |acc, n| {
        let drop = if i % n == 0 {
            VALUES[(n % SIZE) as usize]
        } else {
           ""
        };

        acc + drop
    });

    match raindrop.len() {
        0   => i.to_string(),
        _   => raindrop
    }
}
