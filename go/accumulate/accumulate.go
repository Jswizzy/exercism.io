package accumulate

const testVersion = 1

func Accumulate(stringSlice []string, fun func(string) string) []string {
	for i, str := range stringSlice {
		stringSlice[i] = fun(str)
	}
	return stringSlice
}
