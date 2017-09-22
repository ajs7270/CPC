/*
4
3 3
2 2
4 1
4 1000000000
*/

#define _CRT_SECURE_NO_WARNINGS

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

long long int MAX = 1000000007;

int main()
{
#ifdef _DEBUG
	freopen("input.txt", "r", stdin);
#endif

	int N;
	cin >> N;

	long long int answer = 0;
	for (int i = 0; i < N; i++) {
		int c, k;
		cin >> c >> k;

		long long int sum = 0;
		long long int currentPower = 1;
		long long int currentVal = 2;
		while (currentPower <= k) {
			if ((k - 1) & currentPower) {
				sum += currentVal;
				sum %= MAX;
			}

			currentPower *= 2;
			currentVal = (currentVal * currentVal) % MAX;
		}

		if (k - 1 == 0) {
			answer += c;
		}
		else {
			answer += (((c * (long long int)k) % MAX) * sum) % MAX;
		}
		answer %= MAX;

	}
	cout << answer;

	return 0;
}