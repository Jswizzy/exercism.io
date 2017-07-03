package hamming

import "errors"

const testVersion = 6

func Distance(dnaA, dnaB string) (int, error) {
	if len(dnaA) != len(dnaB) {
		return -1, errors.New("DNA length not equal.")
	}

	dist := 0
	for i := range dnaA {
		if dnaA[i] != dnaB[i] {
			dist += 1
		}
	}
	return dist, nil
}
