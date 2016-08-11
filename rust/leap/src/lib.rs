pub fn is_leap_year(year: i32) -> bool {
    let div_by = |n: i32, d: i32| n % d == 0;

    div_by(year, 4) && (
        !div_by(year, 100) ||
            div_by(year, 400)
    )
}
