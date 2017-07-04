package triangle

import "math"

const testVersion = 3

type Kind int

const (
	NaT Kind = iota
	Equ
	Iso
	Sca
)

type kindTest struct {
	kind Kind
	Test func(float64, float64, float64) bool
}

var kindTests = []kindTest{
	{NaT, isNaT},
	{Equ, isEqu},
	{Iso, isIso},
	{Sca, isSca},
}

func isNaT(a, b, c float64) bool {
	return !isTriangle(a, b, c) || hasZero(a, b, c) || hasNaN(a, b, c) || hasInf(a, b, c)
}
func isEqu(a, b, c float64) bool {
	return a == b && c == b
}
func isIso(a, b, c float64) bool {
	return a == b || b == c || a == c
}
func isSca(a, b, c float64) bool {
	return a != b && b != c && a != c
}
func isTriangle(a, b, c float64) bool {
	return a+b >= c && a+c >= b && b+c >= a
}

func hasInf(sides ...float64) bool {
	return runTest(
		func(num float64) bool {
			return math.IsInf(num, 1) || math.IsInf(num, -1)
		}, sides...)
}

func hasNaN(sides ...float64) bool {
	return runTest(math.IsNaN, sides...)
}

func runTest(test func(float64) bool, sides ...float64) bool {
	for _, side := range sides {
		if test(side) {
			return true
		}
	}
	return false
}

func hasZero(a, b, c float64) bool {
	return a == 0 || b == 0 || c == 0
}

func KindFromSides(a, b, c float64) Kind {
	for _, test := range kindTests {
		if test.Test(a, b, c) {
			return test.kind
		}
	}
	return NaT
}
