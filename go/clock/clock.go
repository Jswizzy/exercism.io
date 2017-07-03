package clock

import (
	"fmt"
)

const testVersion = 4

const minutesInDay = 24 * 60

type Clock int

func New(hour, minute int) Clock {
	return Clock(hour*60 + minute).normalize()
}

func (clock Clock) String() string {
	return fmt.Sprintf("%02d:%02d", clock/60, clock%60)
}

func (clock Clock) Add(minutes int) Clock {
	return Clock(int(clock) + minutes).normalize()
}

func (clock Clock) normalize() Clock {
	clock %= minutesInDay
	if clock < 0 {
		return Clock(minutesInDay + clock)
	}
	return clock
}
