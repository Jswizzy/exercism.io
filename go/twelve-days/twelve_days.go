package twelve

import (
	"fmt"
	"strings"
)

const testVersion = 1

const totalDays = 12

var verses = []string{
	"On the %v day of Christmas my true love gave to me, ",
	"twelve Drummers Drumming, ",
	"eleven Pipers Piping, ",
	"ten Lords-a-Leaping, ",
	"nine Ladies Dancing, ",
	"eight Maids-a-Milking, ",
	"seven Swans-a-Swimming, ",
	"six Geese-a-Laying, ",
	"five Gold Rings, ",
	"four Calling Birds, ",
	"three French Hens, ",
	"two Turtle Doves, and ",
	"a Partridge in a Pear Tree.",
}

type Day string

var days = strings.Split("first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth", " ")

func Song() string {
	song := make([]string, totalDays)
	for i := 0; i < totalDays; i++ {
		song[i] = Verse(i + 1)
	}
	song = append(song, "")
	return strings.Join(song, "\n")
}

func Verse(n int) string {
	lines := make([]string, n+1)
	lines[0] = fmt.Sprintf(verses[0], days[n-1])
	for i := n; i > 0; i-- {
		lines[n-i+1] = verses[len(verses)-i]
	}
	return strings.Join(lines, "")
}
