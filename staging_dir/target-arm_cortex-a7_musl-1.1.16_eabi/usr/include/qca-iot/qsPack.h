/*
 * Copyright (c) 2018 Qualcomm Technologies, Inc.
 * All Rights Reserved.
 */
// Copyright (c) 2018 Qualcomm Technologies, Inc.
// All rights reserved.
// Redistribution and use in source and binary forms, with or without modification, are permitted (subject to the limitations in the disclaimer below) 
// provided that the following conditions are met:
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of Qualcomm Technologies, Inc. nor the names of its contributors may be used to endorse or promote products derived 
// from this software without specific prior written permission.
// NO EXPRESS OR IMPLIED LICENSES TO ANY PARTY'S PATENT RIGHTS ARE GRANTED BY THIS LICENSE. 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
// BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
// IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, 
// OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#ifndef __QS_PACK_H__
#define __QS_PACK_H__

#include <stdint.h>

   /* The following macros are used for structure packing.              */
#if defined(_MSC_VER) || defined(__BORLANDC__) || defined(__MINGW32__)
   #define PACKED      #pragma pack(push, 1)
   #define PACKED_END  #pragma pack(pop)
#elif (defined(__CC_ARM) || defined(__GNUC__))
   /* ARM and GCC compilers                                             */
   #define PACKED
   #define PACKED_END  __attribute__ ((packed))
#elif (defined(__ICCARM__))
   /* IAR compiler                                                      */
   #define PACKED       __packed
   #define PACKED_END
#else
   #define PACKED
   #define PACKED_END
#endif

/**
   Converts a host-ordered, 8-bit integer to an unalgined, little-endian
   integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_LITTLE_ENDIAN_UINT8(__dest__, __src__) \
do {                                                           \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)(__src__));           \
} while(0)

/**
   Converts a host-ordered, 16-bit integer to an unalgined, little-endian
   integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_LITTLE_ENDIAN_UINT16(__dest__, __src__)                  \
do {                                                                             \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)(((uint16_t)(__src__)) & 0xFF));        \
  ((uint8_t *)(__dest__))[1] = ((uint8_t)((((uint16_t)(__src__)) >> 8) & 0xFF)); \
} while(0)

/**
   Converts a host-ordered, 32-bit integer to an unalgined, little-endian
   integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_LITTLE_ENDIAN_UINT32(__dest__, __src__)                   \
do {                                                                              \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)(((uint32_t)(__src__)) & 0xFF));         \
  ((uint8_t *)(__dest__))[1] = ((uint8_t)((((uint32_t)(__src__)) >> 8) & 0xFF));  \
  ((uint8_t *)(__dest__))[2] = ((uint8_t)((((uint32_t)(__src__)) >> 16) & 0xFF)); \
  ((uint8_t *)(__dest__))[3] = ((uint8_t)((((uint32_t)(__src__)) >> 24) & 0xFF)); \
} while(0)

/**
   Converts a host-ordered, 64-bit integer to an unalgined, little-endian
   integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_LITTLE_ENDIAN_UINT64(__dest__, __src__)                   \
do {                                                                              \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)(((uint64_t)(__src__)) & 0xFF));         \
  ((uint8_t *)(__dest__))[1] = ((uint8_t)((((uint64_t)(__src__)) >> 8) & 0xFF));  \
  ((uint8_t *)(__dest__))[2] = ((uint8_t)((((uint64_t)(__src__)) >> 16) & 0xFF)); \
  ((uint8_t *)(__dest__))[3] = ((uint8_t)((((uint64_t)(__src__)) >> 24) & 0xFF)); \
  ((uint8_t *)(__dest__))[4] = ((uint8_t)((((uint64_t)(__src__)) >> 32) & 0xFF)); \
  ((uint8_t *)(__dest__))[5] = ((uint8_t)((((uint64_t)(__src__)) >> 40) & 0xFF)); \
  ((uint8_t *)(__dest__))[6] = ((uint8_t)((((uint64_t)(__src__)) >> 48) & 0xFF)); \
  ((uint8_t *)(__dest__))[7] = ((uint8_t)((((uint64_t)(__src__)) >> 56) & 0xFF)); \
} while(0)

/**
   Converts an unaligned, little-endian 8-bit integer to an aligned,
   host-ordered value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_LITTLE_ENDIAN_UINT8(__src__) \
   (((uint8_t *)(__src__))[0])

/**
   Converts an unaligned, little-endian 16-bit integer to an aligned,
   host-ordered value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_LITTLE_ENDIAN_UINT16(__src__)            \
   ((uint16_t)((((uint16_t)(((uint8_t *)(__src__))[1])) << 8) | \
                ((uint16_t)(((uint8_t *)(__src__))[0]))))

/**
   Converts an unaligned, little-endian 32-bit integer to an aligned,
   host-ordered value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_LITTLE_ENDIAN_UINT32(__src__)             \
   ((uint32_t)((((uint32_t)(((uint8_t *)(__src__))[3])) << 24) | \
               (((uint32_t)(((uint8_t *)(__src__))[2])) << 16) | \
               (((uint32_t)(((uint8_t *)(__src__))[1])) << 8)  | \
                ((uint32_t)(((uint8_t *)(__src__))[0]))))


/**
   Converts an unaligned, little-endian 64-bit integer to an aligned,
   host-ordered value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_LITTLE_ENDIAN_UINT64(__src__)             \
   ((uint64_t)((((uint64_t)(((uint8_t *)(__src__))[7])) << 56) | \
               (((uint64_t)(((uint8_t *)(__src__))[6])) << 48) | \
               (((uint64_t)(((uint8_t *)(__src__))[5])) << 40) | \
               (((uint64_t)(((uint8_t *)(__src__))[4])) << 32) | \
               (((uint32_t)(((uint8_t *)(__src__))[3])) << 24) | \
               (((uint32_t)(((uint8_t *)(__src__))[2])) << 16) | \
               (((uint32_t)(((uint8_t *)(__src__))[1])) << 8)  | \
                ((uint32_t)(((uint8_t *)(__src__))[0]))))

/**
   Converts a host-ordered, 8-bit integer to an unalgined, big-endian integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_BIG_ENDIAN_UINT8(__dest__, __src__) \
do {                                                        \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)(_y));             \
} while(0)

/**
   Converts a host-ordered, 16-bit integer to an unalgined, big-endian integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_BIG_ENDIAN_UINT16(__dest__, __src__)                     \
do {                                                                             \
  ((uint8_t *)(__dest__))[1] = ((uint8_t)(((uint16_t)(__src__)) & 0xFF));        \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)((((uint16_t)(__src__)) >> 8) & 0xFF)); \
} while(0)

/**
   Converts a host-ordered, 32-bit integer to an unalgined, big-endian integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_BIG_ENDIAN_UINT32(__dest__, __src__)                      \
do {                                                                              \
  ((uint8_t *)(__dest__))[3] = ((uint8_t)(((uint32_t)(__src__)) & 0xFF));         \
  ((uint8_t *)(__dest__))[2] = ((uint8_t)((((uint32_t)(__src__)) >> 8) & 0xFF));  \
  ((uint8_t *)(__dest__))[1] = ((uint8_t)((((uint32_t)(__src__)) >> 16) & 0xFF)); \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)((((uint32_t)(__src__)) >> 24) & 0xFF)); \
} while(0)

/**
   Converts a host-ordered, 64-bit integer to an unalgined, big-endian integer.

   @param __dest__ Pointer to where the unaligned value should be written.
   @param __src__  Integer value to write.
*/
#define WRITE_UNALIGNED_BIG_ENDIAN_UINT64(__dest__, __src__)                      \
{                                                                                 \
  ((uint8_t *)(__dest__))[7] = ((uint8_t)(((uint64_t)(__src__)) & 0xFF));         \
  ((uint8_t *)(__dest__))[6] = ((uint8_t)((((uint64_t)(__src__)) >> 8) & 0xFF));  \
  ((uint8_t *)(__dest__))[5] = ((uint8_t)((((uint64_t)(__src__)) >> 16) & 0xFF)); \
  ((uint8_t *)(__dest__))[4] = ((uint8_t)((((uint64_t)(__src__)) >> 24) & 0xFF)); \
  ((uint8_t *)(__dest__))[3] = ((uint8_t)((((uint64_t)(__src__)) >> 32) & 0xFF)); \
  ((uint8_t *)(__dest__))[2] = ((uint8_t)((((uint64_t)(__src__)) >> 40) & 0xFF)); \
  ((uint8_t *)(__dest__))[1] = ((uint8_t)((((uint64_t)(__src__)) >> 48) & 0xFF)); \
  ((uint8_t *)(__dest__))[0] = ((uint8_t)((((uint64_t)(__src__)) >> 56) & 0xFF)); \
} while(0)

/**
   Converts an unaligned, big-endian 8-bit integer to an aligned, host-ordered
   value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_BIG_ENDIAN_UINT8(__src__) \
   (((uint8_t *)(__src__))[0])

/**
   Converts an unaligned, big-endian 16-bit integer to an aligned, host-ordered
   value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_BIG_ENDIAN_UINT16(__src__)               \
   ((uint16_t)((((uint16_t)(((uint8_t *)(__src__))[0])) << 8) | \
                ((uint16_t)(((uint8_t *)(__src__))[1]))))

/**
   Converts an unaligned, big-endian 32-bit integer to an aligned, host-ordered
   value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_BIG_ENDIAN_UINT32(__src__)                \
   ((uint32_t)((((uint32_t)(((uint8_t *)(__src__))[0])) << 24) | \
               (((uint32_t)(((uint8_t *)(__src__))[1])) << 16) | \
               (((uint32_t)(((uint8_t *)(__src__))[2])) << 8)  | \
                ((uint32_t)(((uint8_t *)(__src__))[3]))))

/**
   Converts an unaligned, big-endian 64-bit integer to an aligned, host-ordered
   value.

   @param __src__ Pointer to the unaligned, big-endian value.

   @return The aligned, host ordered value.
*/
#define READ_UNALIGNED_BIG_ENDIAN_UINT64(__src__)                \
   ((uint64_t)((((uint64_t)(((uint8_t *)(__src__))[0])) << 56) | \
               (((uint64_t)(((uint8_t *)(__src__))[1])) << 48) | \
               (((uint64_t)(((uint8_t *)(__src__))[2])) << 40) | \
               (((uint64_t)(((uint8_t *)(__src__))[3])) << 32) | \
               (((uint32_t)(((uint8_t *)(__src__))[4])) << 24) | \
               (((uint32_t)(((uint8_t *)(__src__))[5])) << 16) | \
               (((uint32_t)(((uint8_t *)(__src__))[6])) << 8)  | \
                ((uint32_t)(((uint8_t *)(__src__))[7]))))

#endif // __QS_PACK_H__

