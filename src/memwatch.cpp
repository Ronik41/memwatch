#include "memwatch/memwatch.h"
#include <cstdlib>
#include <cstdio>

void *mw_malloc(size_t size, const char* file, int line) {
    (void)file; (void)line;
    return std::malloc(size);
}

void mw_free(void* ptr, const char* file, int line) {
    (void)file; (void)line;
    std::free(ptr);
}

void mw_report_leaks(void) {
    // Placeholder for leak reporting logic
    std::printf("Memory leak report not implemented.\n");
}