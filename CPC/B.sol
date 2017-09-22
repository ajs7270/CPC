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

	int N;
	cin >> N;

	vector<int> rects(N);

	for (int i = 0; i < N; i++) {
		cin >> rects[i];
	}

	sort(rects.begin(), rects.end());

	long long int answer = 0;
	for (int i = 0; i < N; i++) {
		long long int count = N - i;
		if (answer < rects[i] * count) {
			answer = rects[i] * count;
		}
	}
	cout << answer;

	return 0;
}