package pangram

import "strings"

const testVersion = 1
const Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

func IsPangram(sentance string) bool {
	sentance = strings.ToUpper(sentance)
	for _, letter := range Alphabet {
		if !strings.Contains(sentance, string(letter)) {
			return false
		}
	}
	return true
}
