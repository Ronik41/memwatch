/* include/memwatch/memwatch.h */
#pragma once
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

#define MW_MALLOC(size) mw_malloc(size, __FILE__, __LINE__)
#define MW_FREE(ptr)    mw_free(ptr, __FILE__, __LINE__)

void *mw_malloc(size_t size, const char *file, int line);
void mw_free(void *ptr, const char *file, int line);
void mw_report_leaks(void);

#ifdef __cplusplus
}
#endif