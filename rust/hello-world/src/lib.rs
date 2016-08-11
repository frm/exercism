pub fn hello(name: Option<&str>) -> String {
    let name = match name {
        None        => "World",
        Some(s)     => s
    };

    format!("Hello, {}!", name)
}
