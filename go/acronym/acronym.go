package acronym

import (
	"regexp"
	"strings"
)

const testVersion = 3

var regex = regexp.MustCompile("\\b\\w")

func Abbreviate(phrase string) string {
	letters := regex.FindAllString(phrase, -1)
	abbreviation := strings.Join(letters, "")
	return strings.ToUpper(abbreviation)
}
