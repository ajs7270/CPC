/*
3 310
50 40
100 70
200 150
*/

#define _CRT_SECURE_NO_WARNINGS

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
#ifdef _DEBUG
	freopen("input.txt", "r", stdin);
#endif

	int N, T;
	cin >> N >> T;

	long long int answer[2][10001] = { 0, };

	for (int i = 0; i < N; i++) {
		int K, S;
		cin >> K >> S;

		int prev = i % 2;
		int curr = (i + 1) % 2;

		for (int j = 0; j <= T; j++) {
			answer[prev][j] = answer[curr][j];
		}

		for (int j = K; j <= T; j++) {
			if (answer[curr][j] < answer[prev][j - K] + S) {
				answer[curr][j] = answer[prev][j - K] + S;
			}
		}
	}

	int max = 0;
	for (int i = 0; i < 2; i++) {
		for (int j = 0; j <= T; j++) {
			if (max < answer[i][j]) {
				max = answer[i][j];
			}
		}
	}
	printf("%d\n", max);

	return 0;
}