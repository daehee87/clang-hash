#ifndef FUZZCOIN_H
#define FUZZCOIN_H

#include <stddef.h>
#include <unistd.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

void FuzzTrace(int32_t);
void InitFuzzcoin();

#ifdef __cplusplus
}
#endif

#endif /* FUZZCOIN_H */
