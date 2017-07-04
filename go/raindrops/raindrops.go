package raindrops

import "strconv"

const testVersion = 3

var factors = []struct {
	factor  int
	message string
}{
	{3, "Pling"},
	{5, "Plang"},
	{7, "Plong"},
}

func Convert(number int) string {
	output := ""
	for _, factor := range factors {
		if number%factor.factor == 0 {
			output += factor.message
		}
	}
	if output == "" {
		output = strconv.Itoa(number)
	}
	return output
}
