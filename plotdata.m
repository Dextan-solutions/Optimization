function [VSI, VP, PLR33, VPIR_33, VSI_Ayepe34, VP_Ayepe34, PLR_Ayepe34, VPIR_Ayepe34]=plotdata

VSI = [
    0.9998	0.9998	1.0000
    0.9871	0.9901	0.9936
    0.9324	0.9509	1.0000
    0.9044	0.9339	1.0000
    0.8763	0.9170	1.0000
    0.8110	0.8738	1.0000
    0.7956	0.8629	1.0000
    0.7538	0.8670	1.0000
    0.7335	0.8740	1.0000
    0.7164	0.8846	1.0000
    0.7134	0.8869	1.0000
    0.7066	0.8900	1.0000
    0.6885	0.9115	1.0000
    0.6827	0.9202	1.0000
    0.6781	0.9322	1.0000
    0.6728	0.9481	1.0000
    0.6676	0.9809	1.0000
    0.9877	0.9907	0.9942
    0.9824	0.9855	0.9889
    0.9709	0.9739	0.9773
    0.9672	0.9702	0.9736
    0.9322	0.9508	1.0000
    0.9150	0.9334	1.0000
    0.8903	0.9084	1.0000
    0.8124	0.8752	1.0000
    0.8056	0.8682	1.0000
    0.7956	0.8578	1.0000
    0.7574	0.8181	1.0000
    0.7291	0.7887	1.0000
    0.7192	0.7784	1.0000
    0.7078	0.7665	1.0000
    0.7052	0.7639	1.0000];

VP =[
    1.0000	1.0000	1.0000
0.9970	0.9988	0.9986
0.9829	0.9832	0.9932
0.9754	0.9832	0.9922
0.9680	0.9790	0.9915
0.9495	0.9673	0.9876
0.9459	0.9653	0.9842
0.9323	0.9654	0.9711
0.9260	0.9674	0.9651
0.9201	0.9699	0.9595
0.9192	0.9706	0.9586
0.9177	0.9721	0.9572
0.9115	0.9777	0.9513
0.9093	0.9797	1.0000
0.9078	0.9830	1.0000
0.9064	0.9875	1.0000
0.9044	0.9956	1.0000
0.9038	1.0008	1.0000
0.9965	0.9973	0.9981
0.9929	0.9936	0.9945
0.9922	0.9930	0.9939
0.9916	0.9923	0.9932
0.9793	0.9842	0.9897
0.9726	0.9775	0.9831
0.9693	0.9742	0.9798
0.9475	0.9654	1.0000
0.9450	0.9629	1.0000
0.9335	0.9517	1.0000
0.9253	0.9436	1.0000
0.9218	0.9401	1.0000
0.9176	0.9361	1.0000
0.9167	0.9352	1.0000
0.9164	0.9349	1.0000
];

PLR33 =[
    12.30	6.36	12.19	6.27	11.59	6.07
32.08	26.52	29.06	24.80	25.97	22.73
20.05	10.21	17.37	9.77	15.97	8.44
18.85	9.60	15.51	9.33	13.58	8.95
28.57	33.29	20.19	30.84	17.99	30.08
1.95	6.43	1.41	6.34	1.09	5.92
13.87	8.57	11.65	7.63	10.98	7.58
4.27	3.07	3.86	3.06	2.92	3.01
3.62	2.58	3.28	2.33	3.32	2.30
0.70	0.29	0.61	0.23	0.52	0.19
1.90	0.48	1.75	0.38	1.43	0.30
6.72	2.14	4.37	2.02	2.58	1.98
2.74	0.98	2.64	0.88	1.68	0.70
1.36	0.32	0.62	0.22	0.43	0.20
5.19	0.21	3.14	0.15	2.26	0.11
0.38	0.34	0.28	0.22	0.24	0.22
0.65	0.14	0.24	0.09	0.20	0.04
0.16	0.15	0.16	0.15	0.16	0.15
0.83	0.75	0.83	0.75	0.82	0.75
0.10	0.12	0.10	0.12	0.10	0.12
0.04	0.06	0.04	0.06	0.04	0.06
3.18	2.17	3.15	2.15	3.12	2.13
5.14	4.06	5.09	4.02	5.04	3.98
1.29	1.01	1.28	1.00	1.26	0.99
2.60	1.33	2.50	1.29	2.18	1.24
3.33	1.70	3.20	1.68	3.04	1.65
11.31	9.97	10.87	9.58	10.32	9.17
7.84	6.83	7.53	6.56	7.15	6.23
3.90	1.99	3.75	1.91	3.66	1.88
1.59	1.58	1.53	1.51	1.46	1.49
0.21	0.25	0.21	0.24	0.20	0.23
0.01	0.02	0.01	0.02	0.01	0.02
];

VPIR_33 =[
    0.994	0.9956	0.9973
9.8822	5.9175	2.8439
0.968	0.979	5.5838
0.9611	0.975	7.1572
0.932	0.9561	8.3069
0.945	0.9643	0.984
0.9215	0.9668	0.9812
0.9242	0.9705	0.9588
0.9197	0.9735	0.9602
0.9247	0.9722	0.9554
0.9227	0.9745	0.9595
0.9122	0.9841	0.9575
0.9148	0.9822	0.9477
0.9146	0.9866	0.9495
0.9136	0.9923	0.949
0.9111	1.0039	0.948
0.9123	2.9426	0.9456
1.0985	7.1	1.0556
2.2241	7.5556	4.5571
6.0205	4.9934	3.9792
7.0689	5.933	4.8531
8.0794	6.8532	5.6122
0.9664	0.9712	0.9766
0.9668	0.9714	0.9768
0.9267	0.9573	0.999
0.9452	0.9616	0.9844
0.9251	0.9419	0.9651
0.9215	0.9379	0.9607
0.9238	0.9399	0.9622
0.9195	0.9356	0.9579
0.9226	0.9384	0.9605
0.923	0.9388	0.9608
0.007	0.0042	0.0016
];

VSI_Ayepe34 = [
0.9995	0.9995	0.9995
0.9320	0.9896	1.0000
0.9005	0.9857	1.0000
0.8154	0.9795	1.0210
0.7247	0.9763	1.0432
0.6945	0.9759	1.0522
0.6474	0.9778	1.0701
0.6079	0.9810	1.0883
0.5708	0.9851	1.1075
0.5327	0.9934	1.1339
0.5256	0.9959	1.1403
0.5075	1.0041	1.1592
0.4901	1.0192	1.1879
0.4889	1.0186	1.1876
0.5328	0.9934	1.1339
0.5322	0.9927	1.1332
0.5075	1.0040	1.1591
0.5046	0.9999	1.1547
0.4895	1.0194	1.1884
0.4840	1.0435	1.1799
0.4802	1.0653	1.1740
0.4790	1.0746	1.1721
0.4770	1.0931	1.1690
0.4741	1.1413	1.1644
0.4895	1.0195	1.1885
0.4876	1.0167	1.1855
0.4852	1.0133	1.1818
0.4830	1.0101	1.0000
0.4830	1.0101	1.1783
0.4796	1.0051	1.1730
0.4787	1.0038	1.1716
0.4785	1.0036	1.0000
0.4796	1.0052	1.0000    
];

VP_Ayepe34 = [
1.0000	1.0000	1.0000
0.9826	0.9195	1.0000
0.9743	0.9966	1.0018
0.9505	0.9950	1.0054
0.9227	0.9341	1.0000
0.9130	0.9941	1.0129
0.8971	0.9945	1.0172
0.8832	0.9954	1.0215
0.8693	0.9964	1.0260
0.8544	0.9984	1.0319
0.8515	0.9290	1.0000
0.8441	1.0011	1.0377
0.8367	1.0048	1.0440
0.8365	1.0049	1.0442
0.8322	1.0013	1.0407
0.8542	0.9283	1.0000
0.8540	0.9979	1.0315
0.8429	1.0001	1.0367
0.8424	0.9486	1.0000
0.8342	1.0108	1.0423
0.8325	1.0160	1.0409
0.8320	1.0182	1.0405
0.8312	1.0226	1.0399
0.8299	1.0337	1.0389
0.8295	1.0432	1.0386
0.8357	1.0042	1.0435
0.8347	1.0034	1.0427
0.8337	1.0025	1.0419
0.8337	1.0025	1.0419
0.8336	1.0025	1.0419
0.8318	1.0010	1.0404
0.8317	1.0010	1.0403
0.8317	0.9010	1.0000    
];

PLR_Ayepe34 = [
    33.95	98.03	28.96	97.87	26.82	96.04
    29.07	78.27	26.63	77.27	24.76	77.01
    17.90	73.63	17.85	72.43	15.33	70.48
    50.68	35.67	40.49	33.93	38.87	32.49
    45.47	118.72	34.14	117.37	31.60	117.03
    22.27	83.87	19.79	82.66	18.56	82.46
    41.52	51.81	35.56	51.03	27.56	50.37
    20.65	61.64	18.49	60.01	17.94	60.39
    21.65	51.83	18.94	50.29	16.75	50.17
    10.70	22.05	9.56	21.49	9.25	21.27
    26.63	15.11	17.24	14.39	15.48	13.78
    22.58	14.33	19.43	14.00	19.25	13.88
    0.55	1.15	0.55	1.11	0.45	1.10
    3.30	0.63	2.28	0.44	2.11	0.40
    0.04	0.01	0.03	0.01	0.03	0.01
    0.11	0.02	0.08	0.02	0.08	0.02
    0.67	0.13	0.57	0.09	0.49	0.09
    0.14	0.03	0.10	0.02	0.09	0.02
    2.75	0.53	1.96	0.52	1.86	0.44
    1.73	0.33	1.64	0.29	1.51	0.25
    0.58	111.07	0.35	111.05	0.29	110.05
    1.45	0.09	1.39	0.06	1.29	0.06
    0.57	0.11	0.44	0.11	0.37	0.11
    0.06	0.01	0.05	0.01	0.04	0.01
    0.67	0.13	0.46	0.09	0.43	0.08
    0.54	0.10	0.37	0.07	0.35	0.07
    0.32	0.08	0.29	0.06	0.27	0.05
    0.01	1.01	0.01	1.01	0.01	1.01
    0.01	0.01	0.01	0.01	0.01	0.01
    0.19	0.04	0.15	0.03	0.12	0.02
    0.02	0.01	0.01	0.01	0.01	0.01
    0.01	0.01	0.01	0.01	0.01	0.01
    0.71	0.14	0.57	0.12	0.55	0.12];

VPIR_Ayepe34 = [
    0.9652	0.9949	1.0018
    0.9663	0.9958	1.0034
    0.9273	0.9936	1.0094
    0.8975	0.9932	1.0162
    0.9093	0.9943	1.0152
    0.8888	0.9952	1.0216
    0.8798	0.9965	1.0229
    0.8692	0.9975	1.0309
    0.8565	1.0004	1.0386
    0.8699	0.9999	1.0359
    0.8589	1.0041	1.0431
    0.8536	1.0086	1.0517
    0.863	1.0052	1.0462
    0.8546	0.9979	1.0393
    0.9044	0.9953	1.0246
    0.8747	0.9978	1.0321
    0.8534	1.0026	1.042
    0.8666	0.9995	1.0373
    0.8507	1.0222	1.0496
    0.8583	1.0212	1.0414
    0.8596	1.0207	1.0418
    0.8587	1.0274	1.041
    0.8571	1.0452	1.0394
    0.858	1.0538	1.0397
    0.871	0.9671	1.05
    0.8608	1.0027	1.0439
    0.8599	1.0017	1.0428
    0.8613	1.0026	1.0437
    0.8613	1.0026	1.0436
    0.8576	0.9995	1.0407
    0.86	1.001	1.0419
    0.8599	1.0009	1.0418
    0.861	1.0019	1.0429
    0.0282	0.0001	0.0017];