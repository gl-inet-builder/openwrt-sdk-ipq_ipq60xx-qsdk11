/*
 * Copyright (c) 2018 Qualcomm Technologies, Inc.
 * All Rights Reserved.
 * Confidential and Proprietary - Qualcomm Technologies, Inc.
 */

#ifndef _SPECTRAL_DATA_H_
#define _SPECTRAL_DATA_H_

#include "spec_msg_proto.h"
#include <math.h>

#ifndef MAX_SPECTRAL_MSG_ELEMS
#define MAX_SPECTRAL_MSG_ELEMS 10
#endif

#define MAX_SPECTRAL_CHAINS  3

#define SPECTRAL_SIGNATURE  0xdeadbeef

#ifndef NETLINK_ATHEROS
#define NETLINK_ATHEROS              (NETLINK_GENERIC + 1)
#endif

/*
 * Definitions to help in scaling of gen3 linear format Spectral bins to values
 * similar to those from gen2 chipsets.
 */

/*
 * Max gain for QCA9984. Since this chipset is a prime representative of gen2
 * chipsets, it is chosen for this value.
 */
#define SPECTRAL_QCA9984_MAX_GAIN                               (78)


/* Temporary section for hard-coded values. These need to come from FW. */

/* Max gain for IPQ8074 */
#define SPECTRAL_IPQ8074_DEFAULT_MAX_GAIN_HARDCODE              (62)

/*
 * Section for values needing tuning per customer platform. These too may need
 * to come from FW. To be considered as hard-coded for now.
 */

/*
 * If customers have a different gain line up than QCA reference designs for
 * IPQ8074 and/or QCA9984, they may have to tune the low level threshold and the
 * RSSI threshold.
 */
#define SPECTRAL_SCALING_LOW_LEVEL_OFFSET                       (7)
#define SPECTRAL_SCALING_RSSI_THRESH                            (5)

/*
 * If customers set the AGC backoff differently, they may have to tune the high
 * level threshold.
 */
#define SPECTRAL_SCALING_HIGH_LEVEL_OFFSET                      (5)

/* End of section for values needing fine tuning. */
/* End of temporary section for hard-coded values */


#ifdef WIN32
#pragma pack(push, spectral_data, 1)
#define __ATTRIB_PACK
#else
#ifndef __ATTRIB_PACK
#define __ATTRIB_PACK __attribute__ ((packed))
#endif
#endif

/* 11ac chipsets will have a max of 520 bins in each 80 MHz segment.
 *
 * For 11ac chipsets prior to AR900B version 2.0, a max of 512 bins are delivered.
 * However, there can be additional bins reported for AR900B version 2.0 and
 * QCA9984 as described next:
 *
 * AR900B version 2.0: An additional tone is processed on the right hand side in
 * order to facilitate detection of radar pulses out to the extreme band-edge of
 * the channel frequency. Since the HW design processes four tones at a time,
 * this requires one additional Dword to be added to the search FFT report.
 *
 * QCA9984: When spectral_scan_rpt_mode=2, i.e 2-dword summary + 1x-oversampled
 * bins (in-band) per FFT, then 8 more bins (4 more on left side and 4 more on
 * right side)are added.
 */
#define MAX_NUM_BINS 520

typedef struct spectral_data {
	int16_t		spectral_data_len;
	int16_t		spectral_rssi;
	int16_t		spectral_bwinfo;	
	int32_t		spectral_tstamp;	
	int16_t		spectral_max_index;	
	int16_t		spectral_max_mag;	
} __ATTRIB_PACK SPECTRAL_DATA;

struct spectral_scan_data {
    u_int16_t chanMag[128];
    u_int8_t  chanExp;
    int16_t   primRssi;
    int16_t   extRssi;
    u_int16_t dataLen;
    u_int32_t timeStamp;
    int16_t   filtRssi;
    u_int32_t numRssiAboveThres;
    int16_t   noiseFloor;
    u_int32_t center_freq;
};

typedef struct spectral_msg {
        int16_t      num_elems;
        SPECTRAL_DATA data_elems[MAX_SPECTRAL_MSG_ELEMS];
} SPECTRAL_MSG;

/* This should match the defination in drivers/wlan_modules/include/ath_dev.h */
#define ATH_CAP_DCS_CWIM     0x1
#define ATH_CAP_DCS_WLANIM   0x2

static inline int16_t spectral_pwfactor_max(int16_t pwfactor1,
        int16_t pwfactor2)
{
    return ((pwfactor1 > pwfactor2) ? pwfactor1 : pwfactor2);
}

/**
 * get_spectral_scale_rssi_corr() - Compute RSSI correction factor for scaling
 * @agc_total_gain_db: AGC total gain in dB steps
 * @gen3_defmaxgain: Default max gain value of the gen III chipset
 * @gen2_maxgain: Max gain value used by the reference gen II chipset
 * @lowlevel_offset: Low level offset for scaling
 * @inband_pwr: In band power in dB steps
 * @rssi_thr: RSSI threshold for scaling
 *
 * Helper function to compute RSSI correction factor for Gen III linear format
 * Spectral scaling. It is the responsibility of the caller to ensure that
 * correct values are passed.
 *
 * Return: RSSI correction factor
 */
static inline int16_t get_spectral_scale_rssi_corr(u_int8_t agc_total_gain_db,
        u_int8_t gen3_defmaxgain, u_int8_t gen2_maxgain,
        int16_t lowlevel_offset, int16_t inband_pwr, int16_t rssi_thr)
{
    return ((agc_total_gain_db < gen3_defmaxgain) ?
            (gen2_maxgain - gen3_defmaxgain + lowlevel_offset) :
            spectral_pwfactor_max((inband_pwr - rssi_thr), 0));
}

/**
 * spectral_scale_linear_to_gen2() - Scale linear bin value to gen II equivalent
 * @gen3_binmag: Captured FFT bin value from the Spectral Search FFT report
 * generated by the Gen III chipset
 * @gen2_maxgain: Max gain value used by the reference gen II chipset
 * @gen3_defmaxgain: Default max gain value of the gen III chipset
 * @lowlevel_offset: Low level offset for scaling
 * @inband_pwr: In band power in dB steps
 * @rssi_thr: RSSI threshold for scaling
 * @agc_total_gain_db: AGC total gain in dB steps
 * @highlevel_offset: High level offset for scaling
 * @gen2_bin_scale: Bin scale value used on reference gen II chipset
 * @gen3_bin_scale: Bin scale value used on gen III chipset
 *
 * Helper function to scale a given gen III linear format bin value into an
 * approximately equivalent gen II value. The scaled value can possibly be
 * higher than 8 bits.  If the caller is incapable of handling values larger
 * than 8 bits, the caller can saturate the value at 255. This function does not
 * carry out this saturation for the sake of flexibility so that callers
 * interested in the larger values can avail of this. Also note it is the
 * responsibility of the caller to ensure that correct values are passed.
 *
 * Return: Scaled bin value
 */
static inline u_int32_t spectral_scale_linear_to_gen2(u_int8_t gen3_binmag,
        u_int8_t gen2_maxgain, u_int8_t gen3_defmaxgain,
        int16_t lowlevel_offset, int16_t inband_pwr, int16_t rssi_thr,
        u_int8_t agc_total_gain_db, int16_t highlevel_offset,
        u_int8_t gen2_bin_scale, u_int8_t gen3_bin_scale)
{
    return (gen3_binmag *
            sqrt(pow(10, (((double)spectral_pwfactor_max(gen2_maxgain -
                    gen3_defmaxgain + lowlevel_offset -
                    get_spectral_scale_rssi_corr(agc_total_gain_db,
                            gen3_defmaxgain, gen2_maxgain,
                            lowlevel_offset, inband_pwr,
                            rssi_thr),
                    (agc_total_gain_db < gen3_defmaxgain) *
                            highlevel_offset)) / 10))) *
             pow(2, (gen3_bin_scale - gen2_bin_scale)));
}

#ifdef WIN32
#pragma pack(pop, spectral_data)
#endif
#ifdef __ATTRIB_PACK
#undef __ATTRIB_PACK
#endif

#endif
