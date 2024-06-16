#ifndef _RELMOD_H_
#define _RELMOD_H_

void RELMOD_RelocModulePointers(intptr_t baseaddr, int offset, int *relocs);
void RELMOD_InitModulePointers(intptr_t baseaddr, int *relocs);

#endif
