package require TclOO
oo::class create A {
	method m args {puts "[self class].m $args"}
	constructor args {puts "[self class].constructor $args"}
}
oo::class create M0 {
	constructor args {puts "[self class].constructor $args"}
}
oo::class create M1 {
	method m args {puts "[self class].m $args";next [self class] {*}$args}
	constructor args {puts "[self class].constructor $args";next [self class] {*}$args}
}
oo::class create M2 {
	superclass A
	method m args {puts "[self class].m $args";next [self class] {*}$args}
	constructor args {puts "[self class].constructor $args";next [self class] {*}$args}
}
oo::class create B {
	superclass A
	method m args {puts "[self class].m $args";next [self class] {*}$args}
	constructor args {puts "[self class].constructor $args";next [self class] {*}$args}
}
oo::class create C {
	superclass B
	method m args {puts "[self class].m $args";next [self class] {*}$args}
	constructor args {puts "[self class].constructor $args";next [self class] {*}$args}
}
oo::class create C0 {
	superclass B
	mix M0
	method m args {puts "[self class].m $args";next [self class] {*}$args}
	constructor args {puts "[self class].constructor $args";next [self class] {*}$args}
}
oo::class create C1 {
	superclass B
	mix M1
	method m args {puts "[self class].m $args";next [self class] {*}$args}
	constructor args {puts "[self class].constructor $args";next [self class] {*}$args}
}
oo::class create C2 {
	superclass B
	mix M2
	method m args {puts "[self class].m $args";next [self class] {*}$args}
	constructor args {puts "[self class].constructor $args";next [self class] {*}$args}
}

puts "C [info class call C m]"
C create c
c m
puts "C0 [info class call C0 m]"
C0 create c0
c0 m
puts "C1 [info class call C1 m]"
C1 create c1
c1 m
puts "C2 [info class call C2 m]"
C2 create c2
c2 m
