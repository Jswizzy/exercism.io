package bob

import "strings"

const testVersion = 3

var Sayings = []struct {
	isMatch func(string) bool
	message string
}{
	{isSilent, "Fine. Be that way!"},
	{isYelling, "Whoa, chill out!"},
	{isQuestioning, "Sure."},
}

const other = "Whatever."

func isSilent(stmt string) bool {
	return stmt == ""
}

func isYelling(stmt string) bool {
	return strings.ToUpper(stmt) == stmt &&
		strings.ToLower(stmt) != stmt
}

func isQuestioning(stmt string) bool {
	return strings.HasSuffix(stmt, "?")
}

func Hey(say string) string {
	say = strings.TrimSpace(say)

	for _, saying := range Sayings {
		if saying.isMatch(say) {
			return saying.message
		}
	}
	return other
}
