#include "memwatch/memwatch.h"
#include <stdio.h>

int main() {
    char* p = (char*)MW_MALLOC(100);
    MW_FREE(p);
    mw_report_leaks();
    return 0;
}