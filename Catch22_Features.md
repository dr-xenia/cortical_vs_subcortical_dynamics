# Catch22 Features
“*In their simplest form, these methods can be represented as algorithms that capture time-series properties as real numbers, or features*. […] ***the choice of which features to use to characterize a time series is subjective and non-systematic.*** *Thus, it is difficult to determine whether the features selected by one researcher might differ had they been selected by a different researcher, and therefore whether the feature set presented for a given task is better than existing alternatives”* (extracted from: Fulcher, 2017 doi: https://doi.org/10.1016/j.cels.2017.10.001)

## Distribution

Simple measures that ignore the time ordering.

1. **Distribution DN_HistogramMode_5** - mode of the z-scored distribution (5-bin histogram)
2. **DN_HistogramMode_10** - mode of the z-scored distribution (10-bin histogram)
## Simple temporal statistics
3. **SB_BinaryStats_mean_longstretch1** - longest period of consecutive values above the mean
4. **DN_OutlierInclude_p_001_mdrmd** - time intervals between successive extreme events above the mean
5. **DN_OutlierInclude_n_001_mdrmd** - time intervals between successive extreme events below the mean
## Linear autocorrelation

Correlation of a time series with its previous and future values

6. **CO_f1ecac** - first 1/e crossing of autocorrelation function
7. **CO_FirstMin_ac** - first minimum of autocorrelation function
8. **SP_Summaries_welch_rect_area_5_1** - total power in lowest fifth of frequencies in the Fourier power spectrum
9. **SP_Summaries_welch_rect_centroid** - centroid of the Fourier power spectrum
10. **FC_LocalSimple_mean3_stderr** - mean error from a rolling 3-sample mean forecasting
## Nonlinear autocorrelation
11. **CO_trev_1_num** - time-reversibility statistic ⟨(xt+1 − xt)^3⟩
12. **CO_HistogramAMI_even_2_5** - automutual information, m = 2, τ = 5 First
13. **IN_AutoMutualInfoStats_40_gaussian_fmmi** - first minimum of the automutual information function
## Successive differences
14. **MD_hrv_classic_pnn40** - proportion of successive differences exceeding 0.04σ
15. **SB_BinaryStats_diff_longstretch0** - longest period of successive incremental decreases
16. **SB_MotifThree_quantile_hh** - Shannon entropy of two successive letters in equiprobable 3-letter symbolisation.
17. **FC_LocalSimple_mean1_tauresrat** -  change in correlation length after iterative differencing
18. **CO_Embed2_Dist_tau_d_expfit_meandiff** - exponential fit to successive distances in 2-d embedding space
## Fluctuation Analysis 
19. **SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1** - proportion of slower timescale fluctuations that scale with DFA (50% sampling)
20. **SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1** - proportion of slower timescale fluctuations that scale with linearly rescaled range fits
## Others 
21. **SB_TransitionMatrix_3ac_sumdiagcov** - trace of covariance of transition matrix between symbols in 3-letter alphabet 
22. **PD_PeriodicityWang_th0_01** - periodicity measures


