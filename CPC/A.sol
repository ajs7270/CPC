#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <string.h>

int main()
{

#ifdef _DEBUG
	freopen("input.txt", "r", stdin);
#endif

	int T;
	char str[80];

	scanf("%d\n", &T);
	while (T--) {
		gets(str);
		int len = strlen(str);
		printf("%s %d\n", str, len);

		int sum = 0;
		for (int i = 0; i < len; i++) {
			int k = str[i] - '0';
			if (k % 2 == 1) {
				sum += k;
			}
			else {
				k *= 2;
				if (k >= 10) {
					sum += (k / 10) + (k % 10);
				}
			}
		}

		printf("%c\n", sum % 10 == 0 ? 'T' : 'F');
	}

	return 0;
}