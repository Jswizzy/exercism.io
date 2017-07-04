package accumulate

const testVersion = 1

func Accumulate(stringSlice []string, fun func(string) string) []string {
	newSlice := make([]string, len(stringSlice))
	for i, str := range stringSlice {
		newSlice[i] = fun(str)
	}
	return newSlice
}
