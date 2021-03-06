#include <stdio.h>
#include "cuda.h"
#define max(x,y)  ((x) > (y)? (x) : (y))
#define min(x,y)  ((x) < (y)? (x) : (y))
#define ceil(a,b) ((a) % (b) == 0 ? (a) / (b) : ((a) / (b)) + 1)

void check_error (const char* message) {
	cudaError_t error = cudaGetLastError ();
	if (error != cudaSuccess) {
		printf ("CUDA error : %s, %s\n", message, cudaGetErrorString (error));
		exit(-1);
	}
}

__global__ void hypterm_0 (double * __restrict__ flux_in_0, double * __restrict__ flux_in_1, double * __restrict__ flux_in_2, double * __restrict__ flux_in_3, double * __restrict__ cons_in_1, double * __restrict__ cons_in_2, double * __restrict__ cons_in_3, double * __restrict__ q_in_1, double * __restrict__ q_in_2, double * __restrict__ q_in_3, double * __restrict__ q_in_4, double dxinv0, double dxinv1, double dxinv2, int L, int M, int N) {
	//Determing the block's indices
	int blockdim_i= (int)(blockDim.x);
	int i0 = (int)(blockIdx.x)*(blockdim_i);
	int i = max (i0, 0) + (int)(threadIdx.x);
	int blockdim_j= (int)(blockDim.y);
	int j0 = (int)(blockIdx.y)*(blockdim_j);
	int j = max (j0, 0) + (int)(threadIdx.y);
	int blockdim_k= (int)(blockDim.z);
	int k0 = (int)(blockIdx.z)*(blockdim_k);
	int k = max (k0, 0) + (int)(threadIdx.z);

	double (*flux_0)[308][308] = (double (*)[308][308])flux_in_0;
	double (*flux_1)[308][308] = (double (*)[308][308])flux_in_1;
	double (*flux_2)[308][308] = (double (*)[308][308])flux_in_2;
	double (*flux_3)[308][308] = (double (*)[308][308])flux_in_3;
	double (*cons_1)[308][308] = (double (*)[308][308])cons_in_1;
	double (*cons_2)[308][308] = (double (*)[308][308])cons_in_2;
	double (*cons_3)[308][308] = (double (*)[308][308])cons_in_3;
    double (*q_1)[308][308] = (double (*)[308][308])q_in_1;
    double (*q_2)[308][308] = (double (*)[308][308])q_in_2;
    double (*q_3)[308][308] = (double (*)[308][308])q_in_3;
    double (*q_4)[308][308] = (double (*)[308][308])q_in_4;

	if (i>=4 & j>=4 & k>=4 & i<=N-5 & j<=N-5 & k<=N-5) {
double _t_1_ = cons_1[k][j][i+1];
_t_1_ -= cons_1[k][j][i-1];
double _t_0_ = 0.8 * _t_1_;
double _t_2_ = cons_1[k][j][i+2];
_t_2_ -= cons_1[k][j][i-2];
_t_0_ -= 0.2 * _t_2_;
double _t_3_ = cons_1[k][j][i+3];
_t_3_ -= cons_1[k][j][i-3];
_t_0_ += 0.038 * _t_3_;
double _t_4_ = cons_1[k][j][i+4];
_t_4_ -= cons_1[k][j][i-4];
_t_0_ -= 0.0035 * _t_4_;
double flux_0kc0jc0ic0 = _t_0_ * dxinv0;

double _t_12_ = cons_1[k][j][i+1] * q_1[k][j][i+1];
_t_12_ -= cons_1[k][j][i-1] * q_1[k][j][i-1];
_t_12_ += q_4[k][j][i+1];
_t_12_ -= q_4[k][j][i-1];
double _t_11_ = 0.8 * _t_12_;
double _t_13_ = cons_1[k][j][i+2] * q_1[k][j][i+2];
_t_13_ -= cons_1[k][j][i-2] * q_1[k][j][i-2];
_t_13_ += q_4[k][j][i+2];
_t_13_ -= q_4[k][j][i-2];
_t_11_ -= 0.2 * _t_13_;
double _t_14_ = cons_1[k][j][i+3] * q_1[k][j][i+3];
_t_14_ -= cons_1[k][j][i-3] * q_1[k][j][i-3];
_t_14_ += q_4[k][j][i+3];
_t_14_ -= q_4[k][j][i-3];
_t_11_ += 0.038 * _t_14_;
double _t_15_ = cons_1[k][j][i+4] * q_1[k][j][i+4];
_t_15_ -= cons_1[k][j][i-4] * q_1[k][j][i-4];
_t_15_ += q_4[k][j][i+4];
_t_15_ -= q_4[k][j][i-4];
_t_11_ -= 0.0035 * _t_15_;
double flux_1kc0jc0ic0 = _t_11_ * dxinv0;

double _t_23_ = cons_2[k][j][i+1] * q_1[k][j][i+1];
_t_23_ -= cons_2[k][j][i-1] * q_1[k][j][i-1];
double _t_22_ = 0.8 * _t_23_;
double _t_24_ = cons_2[k][j][i+2] * q_1[k][j][i+2];
_t_24_ -= cons_2[k][j][i-2] * q_1[k][j][i-2];
_t_22_ -= 0.2 * _t_24_;
double _t_25_ = cons_2[k][j][i+3] * q_1[k][j][i+3];
_t_25_ -= cons_2[k][j][i-3] * q_1[k][j][i-3];
_t_22_ += 0.038 * _t_25_;
double _t_26_ = cons_2[k][j][i+4] * q_1[k][j][i+4];
_t_26_ -= cons_2[k][j][i-4] * q_1[k][j][i-4];
_t_22_ -= 0.0035 * _t_26_;
double flux_2kc0jc0ic0 = _t_22_ * dxinv0;

double _t_34_ = cons_3[k][j][i+1] * q_1[k][j][i+1];
_t_34_ -= cons_3[k][j][i-1] * q_1[k][j][i-1];
double _t_33_ = 0.8 * _t_34_;
double _t_35_ = cons_3[k][j][i+2] * q_1[k][j][i+2];
_t_35_ -= cons_3[k][j][i-2] * q_1[k][j][i-2];
_t_33_ -= 0.2 * _t_35_;
double _t_36_ = cons_3[k][j][i+3] * q_1[k][j][i+3];
_t_36_ -= cons_3[k][j][i-3] * q_1[k][j][i-3];
_t_33_ += 0.038 * _t_36_;
double _t_37_ = cons_3[k][j][i+4] * q_1[k][j][i+4];
_t_37_ -= cons_3[k][j][i-4] * q_1[k][j][i-4];
_t_33_ -= 0.0035 * _t_37_;
double flux_3kc0jc0ic0 = _t_33_ * dxinv0;

double _t_7_ = cons_2[k][j+1][i];
_t_7_ -= cons_2[k][j-1][i];
double _t_6_ = 0.8 * _t_7_;
double _t_8_ = cons_2[k][j+2][i];
_t_8_ -= cons_2[k][j-2][i];
_t_6_ -= 0.2 * _t_8_;
double _t_9_ = cons_2[k][j+3][i];
_t_9_ -= cons_2[k][j-3][i];
_t_6_ += 0.038 * _t_9_;
double _t_10_ = cons_2[k][j+4][i];
_t_10_ -= cons_2[k][j-4][i];
_t_6_ -= 0.0035 * _t_10_;
flux_0kc0jc0ic0 -= _t_6_ * dxinv1;

double _t_29_ = cons_2[k][j+1][i] * q_2[k][j+1][i];
_t_29_ -= cons_2[k][j-1][i] * q_2[k][j-1][i];
_t_29_ += q_4[k][j+1][i];
_t_29_ -= q_4[k][j-1][i];
double _t_28_ = 0.8 * _t_29_;
double _t_30_ = cons_2[k][j+2][i] * q_2[k][j+2][i];
_t_30_ -= cons_2[k][j-2][i] * q_2[k][j-2][i];
_t_30_ += q_4[k][j+2][i];
_t_30_ -= q_4[k][j-2][i];
_t_28_ -= 0.2 * _t_30_;
double _t_31_ = cons_2[k][j+3][i] * q_2[k][j+3][i];
_t_31_ -= cons_2[k][j-3][i] * q_2[k][j-3][i];
_t_31_ += q_4[k][j+3][i];
_t_31_ -= q_4[k][j-3][i];
_t_28_ += 0.038 * _t_31_;
double _t_32_ = cons_2[k][j+4][i] * q_2[k][j+4][i];
_t_32_ -= cons_2[k][j-4][i] * q_2[k][j-4][i];
_t_32_ += q_4[k][j+4][i];
_t_32_ -= q_4[k][j-4][i];
_t_28_ -= 0.0035 * _t_32_;
flux_2kc0jc0ic0 -= _t_28_ * dxinv1;

double _t_18_ = cons_1[k][j+1][i] * q_2[k][j+1][i];
_t_18_ -= cons_1[k][j-1][i] * q_2[k][j-1][i];
double _t_17_ = 0.8 * _t_18_;
double _t_19_ = cons_1[k][j+2][i] * q_2[k][j+2][i];
_t_19_ -= cons_1[k][j-2][i] * q_2[k][j-2][i];
_t_17_ -= 0.2 * _t_19_;
double _t_20_ = cons_1[k][j+3][i] * q_2[k][j+3][i];
_t_20_ -= cons_1[k][j-3][i] * q_2[k][j-3][i];
_t_17_ += 0.038 * _t_20_;
double _t_21_ = cons_1[k][j+4][i] * q_2[k][j+4][i];
_t_21_ -= cons_1[k][j-4][i] * q_2[k][j-4][i];
_t_17_ -= 0.0035 * _t_21_;
flux_1kc0jc0ic0 -= _t_17_ * dxinv1;

double _t_40_ = cons_3[k][j+1][i] * q_2[k][j+1][i];
_t_40_ -= cons_3[k][j-1][i] * q_2[k][j-1][i];
double _t_39_ = 0.8 * _t_40_;
double _t_41_ = cons_3[k][j+2][i] * q_2[k][j+2][i];
_t_41_ -= cons_3[k][j-2][i] * q_2[k][j-2][i];
_t_39_ -= 0.2 * _t_41_;
double _t_42_ = cons_3[k][j+3][i] * q_2[k][j+3][i];
_t_42_ -= cons_3[k][j-3][i] * q_2[k][j-3][i];
_t_39_ += 0.038 * _t_42_;
double _t_43_ = cons_3[k][j+4][i] * q_2[k][j+4][i];
_t_43_ -= cons_3[k][j-4][i] * q_2[k][j-4][i];
_t_39_ -= 0.0035 * _t_43_;
flux_3kc0jc0ic0 -= _t_39_ * dxinv1;

flux_0[k][j][i] = flux_0kc0jc0ic0;
flux_1[k][j][i] = flux_1kc0jc0ic0;
flux_2[k][j][i] = flux_2kc0jc0ic0;
flux_3[k][j][i] = flux_3kc0jc0ic0;
	} 
}

__global__ void hypterm_1 (double * __restrict__ flux_in_0, double * __restrict__ flux_in_1, double * __restrict__ flux_in_2, double * __restrict__ flux_in_3, double * __restrict__ cons_in_1, double * __restrict__ cons_in_2, double * __restrict__ cons_in_3, double * __restrict__ q_in_1, double * __restrict__ q_in_2, double * __restrict__ q_in_3, double * __restrict__ q_in_4, double dxinv0, double dxinv1, double dxinv2, int L, int M, int N) {
    //Determing the block's indices
    int blockdim_i= (int)(blockDim.x);
    int i0 = (int)(blockIdx.x)*(blockdim_i);
    int i = max (i0, 0) + (int)(threadIdx.x);
    int blockdim_j= (int)(blockDim.y);
    int j0 = (int)(blockIdx.y)*(blockdim_j);
    int j = max (j0, 0) + (int)(threadIdx.y);
    int blockdim_k= (int)(blockDim.z);
    int k0 = (int)(blockIdx.z)*(4*blockdim_k);
    int k = max (k0, 0) + (int)(4*threadIdx.z);

    double (*flux_0)[308][308] = (double (*)[308][308])flux_in_0;
    double (*flux_1)[308][308] = (double (*)[308][308])flux_in_1;
    double (*flux_2)[308][308] = (double (*)[308][308])flux_in_2;
    double (*flux_3)[308][308] = (double (*)[308][308])flux_in_3;
    double (*cons_1)[308][308] = (double (*)[308][308])cons_in_1;
    double (*cons_2)[308][308] = (double (*)[308][308])cons_in_2;
    double (*cons_3)[308][308] = (double (*)[308][308])cons_in_3;
    double (*q_1)[308][308] = (double (*)[308][308])q_in_1;
    double (*q_2)[308][308] = (double (*)[308][308])q_in_2;
    double (*q_3)[308][308] = (double (*)[308][308])q_in_3;
    double (*q_4)[308][308] = (double (*)[308][308])q_in_4;
	double flux0_a, flux1_a, flux2_a, flux3_a;
	double flux0_b, flux1_b, flux2_b, flux3_b;
	double flux0_c, flux1_c, flux2_c, flux3_c;
	double flux0_d, flux1_d, flux2_d, flux3_d;

	if (i>=4 & j>=4 & k>=4 & i<=N-5 & j<=N-5 & k<=N-5) {
flux0_a = flux_0[k][j][i];
double flux_0kc0jc0ic0 = flux0_a;

double _t_1_ = cons_3[k+1][j][i];
_t_1_ -= cons_3[k-1][j][i];
double _t_0_ = 0.8 * _t_1_;
double _t_2_ = cons_3[k+2][j][i];
_t_2_ -= cons_3[k-2][j][i];
_t_0_ -= 0.2 * _t_2_;
double _t_3_ = cons_3[k+3][j][i];
_t_3_ -= cons_3[k-3][j][i];
_t_0_ += 0.038 * _t_3_;
double _t_4_ = cons_3[k+4][j][i];
_t_4_ -= cons_3[k-4][j][i];
_t_0_ -= 0.0035 * _t_4_;
flux_0kc0jc0ic0 -= _t_0_ * dxinv2;

flux0_b = flux_0[k+1][j][i];
double flux_0kp1jc0ic0 = flux0_b;

double _t_7_ = cons_3[k+3][j][i];
_t_7_ -= cons_3[k-1][j][i];
double _t_5_ = -(0.2 * _t_7_);
double _t_8_ = cons_3[k+4][j][i];
_t_8_ -= cons_3[k-2][j][i];
_t_5_ += 0.038 * _t_8_;
double _t_6_ = cons_3[k+2][j][i];
_t_6_ -= cons_3[k][j][i];
_t_5_ += 0.8 * _t_6_;
double _t_9_ = -(cons_3[k-3][j][i]);
_t_9_ += cons_3[k+5][j][i];
_t_5_ -= 0.0035 * _t_9_;
flux_0kp1jc0ic0 -= _t_5_ * dxinv2;

flux0_c = flux_0[k+2][j][i];
double flux_0kp2jc0ic0 = flux0_c;

double _t_11_ = cons_3[k+3][j][i];
_t_11_ -= cons_3[k+1][j][i];
double _t_10_ = 0.8 * _t_11_;
double _t_12_ = cons_3[k+4][j][i];
_t_12_ -= cons_3[k][j][i];
_t_10_ -= 0.2 * _t_12_;
double _t_13_ = cons_3[k+5][j][i];
_t_13_ -= cons_3[k-1][j][i];
_t_10_ += 0.038 * _t_13_;
double _t_14_ = -(cons_3[k-2][j][i]);
_t_14_ += cons_3[k+6][j][i];
_t_10_ -= 0.0035 * _t_14_;
flux_0kp2jc0ic0 -= _t_10_ * dxinv2;

flux0_d = flux_0[k+3][j][i];
double flux_0kp3jc0ic0 = flux0_d;

double _t_16_ = cons_3[k+4][j][i];
_t_16_ -= cons_3[k+2][j][i];
double _t_15_ = 0.8 * _t_16_;
double _t_17_ = cons_3[k+5][j][i];
_t_17_ -= cons_3[k+1][j][i];
_t_15_ -= 0.2 * _t_17_;
double _t_18_ = cons_3[k+6][j][i];
_t_18_ -= cons_3[k][j][i];
_t_15_ += 0.038 * _t_18_;
double _t_19_ = -(cons_3[k-1][j][i]);
_t_19_ += cons_3[k+7][j][i];
_t_15_ -= 0.0035 * _t_19_;
flux_0kp3jc0ic0 -= _t_15_ * dxinv2;

flux1_a = flux_1[k][j][i];
double flux_1kc0jc0ic0 = flux1_a;

double _t_24_ = -(cons_1[k-4][j][i] * q_3[k-4][j][i]);
_t_24_ += cons_1[k+4][j][i] * q_3[k+4][j][i];
double _t_20_ = -(0.0035 * _t_24_);
double _t_21_ = cons_1[k+1][j][i] * q_3[k+1][j][i];
_t_21_ -= cons_1[k-1][j][i] * q_3[k-1][j][i];
_t_20_ += 0.8 * _t_21_;
double _t_22_ = cons_1[k+2][j][i] * q_3[k+2][j][i];
_t_22_ -= cons_1[k-2][j][i] * q_3[k-2][j][i];
_t_20_ -= 0.2 * _t_22_;
double _t_23_ = cons_1[k+3][j][i] * q_3[k+3][j][i];
_t_23_ -= cons_1[k-3][j][i] * q_3[k-3][j][i];
_t_20_ += 0.038 * _t_23_;
flux_1kc0jc0ic0 -= _t_20_ * dxinv2;

flux1_b = flux_1[k+1][j][i];
double flux_1kp1jc0ic0 = flux1_b;
double _v_15_ = cons_1[k+3][j][i] * q_3[k+3][j][i];
double _v_16_ = cons_1[k-1][j][i] * q_3[k-1][j][i];
double _v_17_ = cons_1[k+4][j][i] * q_3[k+4][j][i];
double _v_18_ = cons_1[k-2][j][i] * q_3[k-2][j][i];
double _v_20_ = cons_1[k-3][j][i] * q_3[k-3][j][i];
double _v_13_ = cons_1[k+2][j][i] * q_3[k+2][j][i];
double _v_23_ = cons_1[k+1][j][i] * q_3[k+1][j][i];
double _v_47_ = cons_2[k-4][j][i] * q_3[k-4][j][i];
double _v_83_ = cons_3[k-4][j][i] * q_3[k-4][j][i];
double _v_82_ = cons_3[k+4][j][i] * q_3[k+4][j][i];
double _v_76_ = cons_3[k+1][j][i] * q_3[k+1][j][i];
double _v_77_ = cons_3[k-1][j][i] * q_3[k-1][j][i];
double _v_78_ = cons_3[k+2][j][i] * q_3[k+2][j][i];
double _v_79_ = cons_3[k-2][j][i] * q_3[k-2][j][i];
double _v_80_ = cons_3[k+3][j][i] * q_3[k+3][j][i];
double _v_81_ = cons_3[k-3][j][i] * q_3[k-3][j][i];

double _t_27_ = _v_15_;
_t_27_ -= _v_16_;
double _t_25_ = -(0.2 * _t_27_);
double _t_28_ = _v_17_;
_t_28_ -= _v_18_;
_t_25_ += 0.038 * _t_28_;
double _t_29_ = -(_v_20_);
_t_29_ += cons_1[k+5][j][i] * q_3[k+5][j][i];
_t_25_ -= 0.0035 * _t_29_;
double _t_26_ = _v_13_;
_t_26_ -= cons_1[k][j][i] * q_3[k][j][i];
_t_25_ += 0.8 * _t_26_;
flux_1kp1jc0ic0 -= _t_25_ * dxinv2;

flux1_c = flux_1[k+2][j][i];
double flux_1kp2jc0ic0 = flux1_c;
double _v_25_ = cons_1[k][j][i] * q_3[k][j][i];
double _v_26_ = cons_1[k+5][j][i] * q_3[k+5][j][i];
double _v_91_ = cons_3[k+5][j][i] * q_3[k+5][j][i];
double _v_86_ = cons_3[k][j][i] * q_3[k][j][i];

double _t_31_ = _v_15_;
_t_31_ -= _v_23_;
double _t_30_ = 0.8 * _t_31_;
double _t_32_ = _v_17_;
_t_32_ -= _v_25_;
_t_30_ -= 0.2 * _t_32_;
double _t_33_ = _v_26_;
_t_33_ -= _v_16_;
_t_30_ += 0.038 * _t_33_;
double _t_34_ = -(_v_18_);
_t_34_ += cons_1[k+6][j][i] * q_3[k+6][j][i];
_t_30_ -= 0.0035 * _t_34_;
flux_1kp2jc0ic0 -= _t_30_ * dxinv2;

flux1_d = flux_1[k+3][j][i];
double flux_1kp3jc0ic0 = flux1_d;
double _v_35_ = cons_1[k+6][j][i] * q_3[k+6][j][i];
double _v_100_ = cons_3[k+6][j][i] * q_3[k+6][j][i];

double _t_36_ = _v_17_;
_t_36_ -= _v_13_;
double _t_35_ = 0.8 * _t_36_;
double _t_37_ = _v_26_;
_t_37_ -= _v_23_;
_t_35_ -= 0.2 * _t_37_;
double _t_38_ = _v_35_;
_t_38_ -= _v_25_;
_t_35_ += 0.038 * _t_38_;
double _t_39_ = -(_v_16_);
_t_39_ += cons_1[k+7][j][i] * q_3[k+7][j][i];
_t_35_ -= 0.0035 * _t_39_;
flux_1kp3jc0ic0 -= _t_35_ * dxinv2;

flux2_a = flux_2[k][j][i];
double flux_2kc0jc0ic0 = flux2_a;
double _v_73_ = cons_2[k+7][j][i] * q_3[k+7][j][i];
double _v_109_ = cons_3[k+7][j][i] * q_3[k+7][j][i];

double _t_44_ = -(_v_47_);
double _v_46_ = cons_2[k+4][j][i] * q_3[k+4][j][i];
_t_44_ += _v_46_;
double _t_40_ = -(0.0035 * _t_44_);
double _v_40_ = cons_2[k+1][j][i] * q_3[k+1][j][i];
double _t_41_ = _v_40_;
double _v_41_ = cons_2[k-1][j][i] * q_3[k-1][j][i];
_t_41_ -= _v_41_;
_t_40_ += 0.8 * _t_41_;
double _v_42_ = cons_2[k+2][j][i] * q_3[k+2][j][i];
double _t_42_ = _v_42_;
double _v_43_ = cons_2[k-2][j][i] * q_3[k-2][j][i];
_t_42_ -= _v_43_;
_t_40_ -= 0.2 * _t_42_;
double _v_44_ = cons_2[k+3][j][i] * q_3[k+3][j][i];
double _t_43_ = _v_44_;
double _v_45_ = cons_2[k-3][j][i] * q_3[k-3][j][i];
_t_43_ -= _v_45_;
_t_40_ += 0.038 * _t_43_;
flux_2kc0jc0ic0 -= _t_40_ * dxinv2;

flux2_b = flux_2[k+1][j][i];
double flux_2kp1jc0ic0 = flux2_b;

double _t_47_ = _v_44_;
_t_47_ -= _v_41_;
double _t_45_ = -(0.2 * _t_47_);
double _t_48_ = _v_46_;
_t_48_ -= _v_43_;
_t_45_ += 0.038 * _t_48_;
double _t_49_ = -(_v_45_);
double _v_55_ = cons_2[k+5][j][i] * q_3[k+5][j][i];
_t_49_ += _v_55_;
_t_45_ -= 0.0035 * _t_49_;
double _t_46_ = _v_42_;
double _v_50_ = cons_2[k][j][i] * q_3[k][j][i];
_t_46_ -= _v_50_;
_t_45_ += 0.8 * _t_46_;
flux_2kp1jc0ic0 -= _t_45_ * dxinv2;

flux2_c = flux_2[k+2][j][i];
double flux_2kp2jc0ic0 = flux2_c;

double _t_51_ = _v_44_;
_t_51_ -= _v_40_;
double _t_50_ = 0.8 * _t_51_;
double _t_52_ = _v_46_;
_t_52_ -= _v_50_;
_t_50_ -= 0.2 * _t_52_;
double _t_53_ = _v_55_;
_t_53_ -= _v_41_;
_t_50_ += 0.038 * _t_53_;
double _t_54_ = -(_v_43_);
double _v_64_ = cons_2[k+6][j][i] * q_3[k+6][j][i];
_t_54_ += _v_64_;
_t_50_ -= 0.0035 * _t_54_;
flux_2kp2jc0ic0 -= _t_50_ * dxinv2;

flux2_d = flux_2[k+3][j][i];
double flux_2kp3jc0ic0 = flux2_d;

double _t_56_ = _v_46_;
_t_56_ -= _v_42_;
double _t_55_ = 0.8 * _t_56_;
double _t_57_ = _v_55_;
_t_57_ -= _v_40_;
_t_55_ -= 0.2 * _t_57_;
double _t_58_ = _v_64_;
_t_58_ -= _v_50_;
_t_55_ += 0.038 * _t_58_;
double _t_59_ = -(_v_41_);
_t_59_ += _v_73_;
_t_55_ -= 0.0035 * _t_59_;
flux_2kp3jc0ic0 -= _t_55_ * dxinv2;

flux3_a = flux_3[k][j][i];
double flux_3kc0jc0ic0 = flux3_a;

double _t_64_ = -(_v_83_);
_t_64_ += _v_82_;
_t_64_ -= q_4[k-4][j][i];
_t_64_ += q_4[k+4][j][i];
double _t_60_ = -(0.0035 * _t_64_);
double _t_61_ = _v_76_;
_t_61_ -= _v_77_;
_t_61_ += q_4[k+1][j][i];
_t_61_ -= q_4[k-1][j][i];
_t_60_ += 0.8 * _t_61_;
double _t_62_ = _v_78_;
_t_62_ -= _v_79_;
_t_62_ += q_4[k+2][j][i];
_t_62_ -= q_4[k-2][j][i];
_t_60_ -= 0.2 * _t_62_;
double _t_63_ = _v_80_;
_t_63_ -= _v_81_;
_t_63_ += q_4[k+3][j][i];
_t_63_ -= q_4[k-3][j][i];
_t_60_ += 0.038 * _t_63_;
flux_3kc0jc0ic0 -= _t_60_ * dxinv2;

flux3_b = flux_3[k+1][j][i];
double flux_3kp1jc0ic0 = flux3_b;
double _t_69_ = -(q_4[k-3][j][i]);

_t_69_ -= _v_81_;
_t_69_ += _v_91_;
_t_69_ += q_4[k+5][j][i];
double _t_65_ = -(0.0035 * _t_69_);
double _t_67_ = _v_80_;
_t_67_ -= _v_77_;
_t_67_ += q_4[k+3][j][i];
_t_67_ -= q_4[k-1][j][i];
_t_65_ -= 0.2 * _t_67_;
double _t_68_ = _v_82_;
_t_68_ -= _v_79_;
_t_68_ += q_4[k+4][j][i];
_t_68_ -= q_4[k-2][j][i];
_t_65_ += 0.038 * _t_68_;
double _t_66_ = _v_78_;
_t_66_ -= _v_86_;
_t_66_ += q_4[k+2][j][i];
_t_66_ -= q_4[k][j][i];
_t_65_ += 0.8 * _t_66_;
flux_3kp1jc0ic0 -= _t_65_ * dxinv2;

flux3_c = flux_3[k+2][j][i];
double flux_3kp2jc0ic0 = flux3_c;
double _t_71_ = q_4[k+3][j][i];
_t_71_ -= q_4[k+1][j][i];
double _t_74_ = -(q_4[k-2][j][i]);
double _t_72_ = q_4[k+4][j][i];
_t_72_ -= q_4[k][j][i];
double _t_73_ = q_4[k+5][j][i];
_t_73_ -= q_4[k-1][j][i];
double _t_76_ = q_4[k+4][j][i];
_t_76_ -= q_4[k+2][j][i];
double _t_77_ = q_4[k+5][j][i];
_t_77_ -= q_4[k+1][j][i];
double _t_78_ = -(q_4[k][j][i]);
double _t_79_ = -(q_4[k-1][j][i]);

_t_71_ += _v_80_;
_t_71_ -= _v_76_;
double _t_70_ = 0.8 * _t_71_;
_t_74_ -= _v_79_;
_t_74_ += _v_100_;
_t_74_ += q_4[k+6][j][i];
_t_78_ += q_4[k+6][j][i];
_t_70_ -= 0.0035 * _t_74_;
_t_72_ += _v_82_;
_t_72_ -= _v_86_;
_t_70_ -= 0.2 * _t_72_;
_t_73_ += _v_91_;
_t_73_ -= _v_77_;
_t_70_ += 0.038 * _t_73_;
flux_3kp2jc0ic0 -= _t_70_ * dxinv2;

flux3_d = flux_3[k+3][j][i];
double flux_3kp3jc0ic0 = flux3_d;

_t_76_ += _v_82_;
_t_76_ -= _v_78_;
double _t_75_ = 0.8 * _t_76_;
_t_77_ += _v_91_;
_t_77_ -= _v_76_;
_t_75_ -= 0.2 * _t_77_;
_t_78_ += _v_100_;
_t_78_ -= _v_86_;
_t_75_ += 0.038 * _t_78_;
_t_79_ += _v_109_;
_t_79_ -= _v_77_;
_t_79_ += q_4[k+7][j][i];
_t_75_ -= 0.0035 * _t_79_;
flux_3kp3jc0ic0 -= _t_75_ * dxinv2;

flux_0[k][j][i] = flux_0kc0jc0ic0;
flux_0[k+1][j][i] = flux_0kp1jc0ic0;
flux_0[k+2][j][i] = flux_0kp2jc0ic0;
flux_0[k+3][j][i] = flux_0kp3jc0ic0;
flux_1[k][j][i] = flux_1kc0jc0ic0;
flux_1[k+1][j][i] = flux_1kp1jc0ic0;
flux_1[k+2][j][i] = flux_1kp2jc0ic0;
flux_1[k+3][j][i] = flux_1kp3jc0ic0;
flux_2[k][j][i] = flux_2kc0jc0ic0;
flux_2[k+1][j][i] = flux_2kp1jc0ic0;
flux_2[k+2][j][i] = flux_2kp2jc0ic0;
flux_2[k+3][j][i] = flux_2kp3jc0ic0;
flux_3[k][j][i] = flux_3kc0jc0ic0;
flux_3[k+1][j][i] = flux_3kp1jc0ic0;
flux_3[k+2][j][i] = flux_3kp2jc0ic0;
flux_3[k+3][j][i] = flux_3kp3jc0ic0;
	} 
}

__global__ void hypterm_2 (double * __restrict__ flux_in_4, double * __restrict__ cons_in_4, double * __restrict__ q_in_1, double * __restrict__ q_in_2, double * __restrict__ q_in_3, double * __restrict__ q_in_4, double dxinv0, double dxinv1, double dxinv2, int L, int M, int N) {
	//Determing the block's indices
	int blockdim_i= (int)(blockDim.x);
	int i0 = (int)(blockIdx.x)*(blockdim_i);
	int i = max (i0, 0) + (int)(threadIdx.x);
	int blockdim_j= (int)(blockDim.y);
	int j0 = (int)(blockIdx.y)*(blockdim_j);
	int j = max (j0, 0) + (int)(threadIdx.y);
	int blockdim_k= (int)(blockDim.z);
	int k0 = (int)(blockIdx.z)*(2*blockdim_k);
	int k = max (k0, 0) + (int)(2*threadIdx.z);

	double (*flux_4)[308][308] = (double (*)[308][308])flux_in_4;
	double (*q_1)[308][308] = (double (*)[308][308])q_in_1;
	double (*q_2)[308][308] = (double (*)[308][308])q_in_2;
	double (*q_3)[308][308] = (double (*)[308][308])q_in_3;
	double (*q_4)[308][308] = (double (*)[308][308])q_in_4;
	double (*cons_4)[308][308] = (double (*)[308][308])cons_in_4;

	if (i>=4 & j>=4 & k>=4 & i<=N-5 & j<=N-5 & k<=N-5) {
		flux_4[k][j][i] = ((0.8*(cons_4[k][j][i+1]*q_1[k][j][i+1]-cons_4[k][j][i-1]*q_1[k][j][i-1]+(q_4[k][j][i+1]*q_1[k][j][i+1]-q_4[k][j][i-1]*q_1[k][j][i-1]))-0.2*(cons_4[k][j][i+2]*q_1[k][j][i+2]-cons_4[k][j][i-2]*q_1[k][j][i-2]+(q_4[k][j][i+2]*q_1[k][j][i+2]-q_4[k][j][i-2]*q_1[k][j][i-2]))+0.038*(cons_4[k][j][i+3]*q_1[k][j][i+3]-cons_4[k][j][i-3]*q_1[k][j][i-3]+(q_4[k][j][i+3]*q_1[k][j][i+3]-q_4[k][j][i-3]*q_1[k][j][i-3]))-0.0035*(cons_4[k][j][i+4]*q_1[k][j][i+4]-cons_4[k][j][i-4]*q_1[k][j][i-4]+(q_4[k][j][i+4]*q_1[k][j][i+4]-q_4[k][j][i-4]*q_1[k][j][i-4])))*dxinv0);
		flux_4[k+1][j][i] = ((0.8*(cons_4[k+1][j][i+1]*q_1[k+1][j][i+1]-cons_4[k+1][j][i-1]*q_1[k+1][j][i-1]+(q_4[k+1][j][i+1]*q_1[k+1][j][i+1]-q_4[k+1][j][i-1]*q_1[k+1][j][i-1]))-0.2*(cons_4[k+1][j][i+2]*q_1[k+1][j][i+2]-cons_4[k+1][j][i-2]*q_1[k+1][j][i-2]+(q_4[k+1][j][i+2]*q_1[k+1][j][i+2]-q_4[k+1][j][i-2]*q_1[k+1][j][i-2]))+0.038*(cons_4[k+1][j][i+3]*q_1[k+1][j][i+3]-cons_4[k+1][j][i-3]*q_1[k+1][j][i-3]+(q_4[k+1][j][i+3]*q_1[k+1][j][i+3]-q_4[k+1][j][i-3]*q_1[k+1][j][i-3]))-0.0035*(cons_4[k+1][j][i+4]*q_1[k+1][j][i+4]-cons_4[k+1][j][i-4]*q_1[k+1][j][i-4]+(q_4[k+1][j][i+4]*q_1[k+1][j][i+4]-q_4[k+1][j][i-4]*q_1[k+1][j][i-4])))*dxinv0);
		flux_4[k][j][i] -= (0.8*(cons_4[k][j+1][i]*q_2[k][j+1][i]-cons_4[k][j-1][i]*q_2[k][j-1][i]+(q_4[k][j+1][i]*q_2[k][j+1][i]-q_4[k][j-1][i]*q_2[k][j-1][i]))-0.2*(cons_4[k][j+2][i]*q_2[k][j+2][i]-cons_4[k][j-2][i]*q_2[k][j-2][i]+(q_4[k][j+2][i]*q_2[k][j+2][i]-q_4[k][j-2][i]*q_2[k][j-2][i]))+0.038*(cons_4[k][j+3][i]*q_2[k][j+3][i]-cons_4[k][j-3][i]*q_2[k][j-3][i]+(q_4[k][j+3][i]*q_2[k][j+3][i]-q_4[k][j-3][i]*q_2[k][j-3][i]))-0.0035*(cons_4[k][j+4][i]*q_2[k][j+4][i]-cons_4[k][j-4][i]*q_2[k][j-4][i]+(q_4[k][j+4][i]*q_2[k][j+4][i]-q_4[k][j-4][i]*q_2[k][j-4][i])))*dxinv1;
		flux_4[k+1][j][i] -= (0.8*(cons_4[k+1][j+1][i]*q_2[k+1][j+1][i]-cons_4[k+1][j-1][i]*q_2[k+1][j-1][i]+(q_4[k+1][j+1][i]*q_2[k+1][j+1][i]-q_4[k+1][j-1][i]*q_2[k+1][j-1][i]))-0.2*(cons_4[k+1][j+2][i]*q_2[k+1][j+2][i]-cons_4[k+1][j-2][i]*q_2[k+1][j-2][i]+(q_4[k+1][j+2][i]*q_2[k+1][j+2][i]-q_4[k+1][j-2][i]*q_2[k+1][j-2][i]))+0.038*(cons_4[k+1][j+3][i]*q_2[k+1][j+3][i]-cons_4[k+1][j-3][i]*q_2[k+1][j-3][i]+(q_4[k+1][j+3][i]*q_2[k+1][j+3][i]-q_4[k+1][j-3][i]*q_2[k+1][j-3][i]))-0.0035*(cons_4[k+1][j+4][i]*q_2[k+1][j+4][i]-cons_4[k+1][j-4][i]*q_2[k+1][j-4][i]+(q_4[k+1][j+4][i]*q_2[k+1][j+4][i]-q_4[k+1][j-4][i]*q_2[k+1][j-4][i])))*dxinv1;
		flux_4[k][j][i] -= (0.8*(cons_4[k+1][j][i]*q_3[k+1][j][i]-cons_4[k-1][j][i]*q_3[k-1][j][i]+(q_4[k+1][j][i]*q_3[k+1][j][i]-q_4[k-1][j][i]*q_3[k-1][j][i]))-0.2*(cons_4[k+2][j][i]*q_3[k+2][j][i]-cons_4[k-2][j][i]*q_3[k-2][j][i]+(q_4[k+2][j][i]*q_3[k+2][j][i]-q_4[k-2][j][i]*q_3[k-2][j][i]))+0.038*(cons_4[k+3][j][i]*q_3[k+3][j][i]-cons_4[k-3][j][i]*q_3[k-3][j][i]+(q_4[k+3][j][i]*q_3[k+3][j][i]-q_4[k-3][j][i]*q_3[k-3][j][i]))-0.0035*(cons_4[k+4][j][i]*q_3[k+4][j][i]-cons_4[k-4][j][i]*q_3[k-4][j][i]+(q_4[k+4][j][i]*q_3[k+4][j][i]-q_4[k-4][j][i]*q_3[k-4][j][i])))*dxinv2;
		flux_4[k+1][j][i] -= (0.8*(cons_4[k+1+1][j][i]*q_3[k+1+1][j][i]-cons_4[k+1-1][j][i]*q_3[k+1-1][j][i]+(q_4[k+1+1][j][i]*q_3[k+1+1][j][i]-q_4[k+1-1][j][i]*q_3[k+1-1][j][i]))-0.2*(cons_4[k+1+2][j][i]*q_3[k+1+2][j][i]-cons_4[k+1-2][j][i]*q_3[k+1-2][j][i]+(q_4[k+1+2][j][i]*q_3[k+1+2][j][i]-q_4[k+1-2][j][i]*q_3[k+1-2][j][i]))+0.038*(cons_4[k+1+3][j][i]*q_3[k+1+3][j][i]-cons_4[k+1-3][j][i]*q_3[k+1-3][j][i]+(q_4[k+1+3][j][i]*q_3[k+1+3][j][i]-q_4[k+1-3][j][i]*q_3[k+1-3][j][i]))-0.0035*(cons_4[k+1+4][j][i]*q_3[k+1+4][j][i]-cons_4[k+1-4][j][i]*q_3[k+1-4][j][i]+(q_4[k+1+4][j][i]*q_3[k+1+4][j][i]-q_4[k+1-4][j][i]*q_3[k+1-4][j][i])))*dxinv2;
	} 
}

extern "C" void host_code (double *h_flux_0, double *h_flux_1, double *h_flux_2, double *h_flux_3, double *h_flux_4, double *h_cons_1, double *h_cons_2, double *h_cons_3, double *h_cons_4, double *h_q_1, double *h_q_2, double *h_q_3, double *h_q_4, double dxinv0, double dxinv1, double dxinv2, int L, int M, int N) {
	double *flux_0;
	cudaMalloc (&flux_0, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_0\n");
	cudaMemcpy (flux_0, h_flux_0, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_1;
	cudaMalloc (&flux_1, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_1\n");
	cudaMemcpy (flux_1, h_flux_1, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_2;
	cudaMalloc (&flux_2, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_2\n");
	cudaMemcpy (flux_2, h_flux_2, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_3;
	cudaMalloc (&flux_3, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_3\n");
	cudaMemcpy (flux_3, h_flux_3, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *flux_4;
	cudaMalloc (&flux_4, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for flux_4\n");
	cudaMemcpy (flux_4, h_flux_4, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_1;
	cudaMalloc (&cons_1, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_1\n");
	cudaMemcpy (cons_1, h_cons_1, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_2;
	cudaMalloc (&cons_2, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_2\n");
	cudaMemcpy (cons_2, h_cons_2, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_3;
	cudaMalloc (&cons_3, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_3\n");
	cudaMemcpy (cons_3, h_cons_3, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *cons_4;
	cudaMalloc (&cons_4, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for cons_4\n");
	cudaMemcpy (cons_4, h_cons_4, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_1;
	cudaMalloc (&q_1, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_1\n");
	cudaMemcpy (q_1, h_q_1, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_2;
	cudaMalloc (&q_2, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_2\n");
	cudaMemcpy (q_2, h_q_2, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_3;
	cudaMalloc (&q_3, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_3\n");
	cudaMemcpy (q_3, h_q_3, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);
	double *q_4;
	cudaMalloc (&q_4, sizeof(double)*L*M*N);
	check_error ("Failed to allocate device memory for q_4\n");
	cudaMemcpy (q_4, h_q_4, sizeof(double)*L*M*N, cudaMemcpyHostToDevice);

	dim3 blockconfig (16, 4, 4);
	dim3 gridconfig_0 (ceil(N, blockconfig.x), ceil(M, blockconfig.y), ceil(L, blockconfig.z));
	hypterm_0 <<<gridconfig_0, blockconfig>>> (flux_0, flux_1, flux_2, flux_3, cons_1, cons_2, cons_3, q_1, q_2, q_3, q_4, -dxinv0, dxinv1, dxinv2, L, M, N);
	dim3 gridconfig_1 (ceil(N, blockconfig.x), ceil(M, blockconfig.y), ceil(L, 4*blockconfig.z));
	hypterm_1 <<<gridconfig_1, blockconfig>>> (flux_0, flux_1, flux_2, flux_3, cons_1, cons_2, cons_3, q_1, q_2, q_3, q_4, -dxinv0, dxinv1, dxinv2, L, M, N);
	dim3 gridconfig_2 (ceil(N, blockconfig.x), ceil(M, blockconfig.y), ceil(L, 2*blockconfig.z));
	hypterm_2 <<<gridconfig_2, blockconfig>>> (flux_4, cons_4, q_1, q_2, q_3, q_4, -dxinv0, dxinv1, dxinv2, L, M, N);

	cudaMemcpy (h_flux_0, flux_0, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_1, flux_1, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_3, flux_3, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_4, flux_4, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
	cudaMemcpy (h_flux_2, flux_2, sizeof(double)*L*M*N, cudaMemcpyDeviceToHost);
}
