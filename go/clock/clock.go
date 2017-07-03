package clock

import (
	"fmt"
)

const testVersion = 4

type Clock struct {
	minutes int
}

func New(hour, minute int) Clock {
	minutes := (hour*60 + minute) % (24 * 60)

	return Clock{minutes}.convert()
}

func (c Clock) String() string {
	return fmt.Sprintf("%02v:%02v", c.minutes/60, c.minutes%60)
}

func (c Clock) Add(minutes int) Clock {
	minutes = (c.minutes + minutes) % (24 * 60)

	return Clock{minutes}.convert()
}

func (c Clock) convert() Clock {
	if c.minutes < 0 {
		c.minutes = (24 * 60) + c.minutes
	}
	return Clock{c.minutes}
}
