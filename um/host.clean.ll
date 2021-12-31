; ModuleID = 'um.cu'
source_filename = "um.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct.CUstream_st = type opaque
%struct.dim3 = type { i32, i32, i32 }

$_ZN4dim3C2Ejjj = comdat any

$_ZSt4fabsf = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [12 x i8] c"Max error: \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_um.cu, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !1088 {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !1090
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #2, !dbg !1090
  ret void, !dbg !1090
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z14myCudaPrefetchPfi(float* %0, i32 %1) #3 !dbg !1091 {
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  store float* %0, float** %3, align 8
  call void @llvm.dbg.declare(metadata float** %3, metadata !1094, metadata !DIExpression()), !dbg !1095
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !1096, metadata !DIExpression()), !dbg !1097
  %5 = load float*, float** %3, align 8, !dbg !1098
  %6 = bitcast float* %5 to i8*, !dbg !1098
  %7 = load i32, i32* %4, align 4, !dbg !1099
  %8 = sext i32 %7 to i64, !dbg !1099
  %9 = call i32 @cudaMemPrefetchAsync(i8* %6, i64 %8, i32 0, %struct.CUstream_st* null), !dbg !1100
  ret void, !dbg !1101
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #4

declare dso_local i32 @cudaMemPrefetchAsync(i8*, i64, i32, %struct.CUstream_st*) #1

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z5MyaddiPfS_(i32 %0, float* %1, float* %2) #3 !dbg !1102 {
  %4 = alloca i32, align 4
  %5 = alloca float*, align 8
  %6 = alloca float*, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8*, align 8
  %11 = alloca { i64, i32 }, align 8
  %12 = alloca { i64, i32 }, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !1105, metadata !DIExpression()), !dbg !1106
  store float* %1, float** %5, align 8
  call void @llvm.dbg.declare(metadata float** %5, metadata !1107, metadata !DIExpression()), !dbg !1108
  store float* %2, float** %6, align 8
  call void @llvm.dbg.declare(metadata float** %6, metadata !1109, metadata !DIExpression()), !dbg !1110
  %13 = alloca i8*, i64 3, align 16, !dbg !1111
  %14 = bitcast i32* %4 to i8*, !dbg !1111
  %15 = getelementptr i8*, i8** %13, i32 0, !dbg !1111
  store i8* %14, i8** %15, !dbg !1111
  %16 = bitcast float** %5 to i8*, !dbg !1111
  %17 = getelementptr i8*, i8** %13, i32 1, !dbg !1111
  store i8* %16, i8** %17, !dbg !1111
  %18 = bitcast float** %6 to i8*, !dbg !1111
  %19 = getelementptr i8*, i8** %13, i32 2, !dbg !1111
  store i8* %18, i8** %19, !dbg !1111
  %20 = call i32 @__cudaPopCallConfiguration(%struct.dim3* %7, %struct.dim3* %8, i64* %9, i8** %10), !dbg !1111
  %21 = load i64, i64* %9, align 8, !dbg !1111
  %22 = load i8*, i8** %10, align 8, !dbg !1111
  %23 = bitcast { i64, i32 }* %11 to i8*, !dbg !1111
  %24 = bitcast %struct.dim3* %7 to i8*, !dbg !1111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %23, i8* align 8 %24, i64 12, i1 false), !dbg !1111
  %25 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %11, i32 0, i32 0, !dbg !1111
  %26 = load i64, i64* %25, align 8, !dbg !1111
  %27 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %11, i32 0, i32 1, !dbg !1111
  %28 = load i32, i32* %27, align 8, !dbg !1111
  %29 = bitcast { i64, i32 }* %12 to i8*, !dbg !1111
  %30 = bitcast %struct.dim3* %8 to i8*, !dbg !1111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %29, i8* align 8 %30, i64 12, i1 false), !dbg !1111
  %31 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 0, !dbg !1111
  %32 = load i64, i64* %31, align 8, !dbg !1111
  %33 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 1, !dbg !1111
  %34 = load i32, i32* %33, align 8, !dbg !1111
  %35 = bitcast i8* %22 to %struct.CUstream_st*, !dbg !1111
  %36 = call i32 @cudaLaunchKernel(i8* bitcast (void (i32, float*, float*)* @_Z5MyaddiPfS_ to i8*), i64 %26, i32 %28, i64 %32, i32 %34, i8** %13, i64 %21, %struct.CUstream_st* %35), !dbg !1111
  br label %37, !dbg !1111

37:                                               ; preds = %3
  ret void, !dbg !1112
}

declare dso_local i32 @__cudaPopCallConfiguration(%struct.dim3*, %struct.dim3*, i64*, i8**)

declare dso_local i32 @cudaLaunchKernel(i8*, i64, i32, i64, i32, i8**, i64, %struct.CUstream_st*)

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #6 !dbg !1113 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  %5 = alloca %struct.CUstream_st*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.dim3, align 4
  %10 = alloca %struct.dim3, align 4
  %11 = alloca { i64, i32 }, align 4
  %12 = alloca { i64, i32 }, align 4
  %13 = alloca float, align 4
  %14 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !1114, metadata !DIExpression()), !dbg !1115
  store i32 1024, i32* %2, align 4, !dbg !1115
  call void @llvm.dbg.declare(metadata float** %3, metadata !1116, metadata !DIExpression()), !dbg !1117
  call void @llvm.dbg.declare(metadata float** %4, metadata !1118, metadata !DIExpression()), !dbg !1119
  call void @llvm.dbg.declare(metadata %struct.CUstream_st** %5, metadata !1120, metadata !DIExpression()), !dbg !1125
  %15 = call i32 @cudaStreamCreate(%struct.CUstream_st** %5), !dbg !1126
  %16 = load i32, i32* %2, align 4, !dbg !1127
  %17 = sext i32 %16 to i64, !dbg !1127
  %18 = mul i64 %17, 4, !dbg !1128
  %19 = call i32 @_ZL17cudaMallocManagedIfE9cudaErrorPPT_mj(float** %3, i64 %18, i32 1), !dbg !1129
  %20 = load i32, i32* %2, align 4, !dbg !1130
  %21 = sext i32 %20 to i64, !dbg !1130
  %22 = mul i64 %21, 4, !dbg !1131
  %23 = call i32 @_ZL17cudaMallocManagedIfE9cudaErrorPPT_mj(float** %4, i64 %22, i32 1), !dbg !1132
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1133, metadata !DIExpression()), !dbg !1135
  store i32 0, i32* %6, align 4, !dbg !1135
  br label %24, !dbg !1136

24:                                               ; preds = %37, %0
  %25 = load i32, i32* %6, align 4, !dbg !1137
  %26 = load i32, i32* %2, align 4, !dbg !1139
  %27 = icmp slt i32 %25, %26, !dbg !1140
  br i1 %27, label %28, label %40, !dbg !1141

28:                                               ; preds = %24
  %29 = load float*, float** %3, align 8, !dbg !1142
  %30 = load i32, i32* %6, align 4, !dbg !1144
  %31 = sext i32 %30 to i64, !dbg !1142
  %32 = getelementptr inbounds float, float* %29, i64 %31, !dbg !1142
  store float 1.000000e+00, float* %32, align 4, !dbg !1145
  %33 = load float*, float** %4, align 8, !dbg !1146
  %34 = load i32, i32* %6, align 4, !dbg !1147
  %35 = sext i32 %34 to i64, !dbg !1146
  %36 = getelementptr inbounds float, float* %33, i64 %35, !dbg !1146
  store float 2.000000e+00, float* %36, align 4, !dbg !1148
  br label %37, !dbg !1149

37:                                               ; preds = %28
  %38 = load i32, i32* %6, align 4, !dbg !1150
  %39 = add nsw i32 %38, 1, !dbg !1150
  store i32 %39, i32* %6, align 4, !dbg !1150
  br label %24, !dbg !1151, !llvm.loop !1152

40:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata i32* %7, metadata !1154, metadata !DIExpression()), !dbg !1155
  store i32 128, i32* %7, align 4, !dbg !1155
  call void @llvm.dbg.declare(metadata i32* %8, metadata !1156, metadata !DIExpression()), !dbg !1157
  %41 = load i32, i32* %2, align 4, !dbg !1158
  %42 = load i32, i32* %7, align 4, !dbg !1159
  %43 = add nsw i32 %41, %42, !dbg !1160
  %44 = sub nsw i32 %43, 1, !dbg !1161
  %45 = load i32, i32* %7, align 4, !dbg !1162
  %46 = sdiv i32 %44, %45, !dbg !1163
  store i32 %46, i32* %8, align 4, !dbg !1157
  %47 = load i32, i32* %8, align 4, !dbg !1164
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %9, i32 %47, i32 1, i32 1), !dbg !1164
  %48 = load i32, i32* %7, align 4, !dbg !1165
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %10, i32 %48, i32 1, i32 1), !dbg !1165
  %49 = bitcast { i64, i32 }* %11 to i8*, !dbg !1166
  %50 = bitcast %struct.dim3* %9 to i8*, !dbg !1166
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %49, i8* align 4 %50, i64 12, i1 false), !dbg !1166
  %51 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %11, i32 0, i32 0, !dbg !1166
  %52 = load i64, i64* %51, align 4, !dbg !1166
  %53 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %11, i32 0, i32 1, !dbg !1166
  %54 = load i32, i32* %53, align 4, !dbg !1166
  %55 = bitcast { i64, i32 }* %12 to i8*, !dbg !1166
  %56 = bitcast %struct.dim3* %10 to i8*, !dbg !1166
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %55, i8* align 4 %56, i64 12, i1 false), !dbg !1166
  %57 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 0, !dbg !1166
  %58 = load i64, i64* %57, align 4, !dbg !1166
  %59 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %12, i32 0, i32 1, !dbg !1166
  %60 = load i32, i32* %59, align 4, !dbg !1166
  %61 = call i32 @__cudaPushCallConfiguration(i64 %52, i32 %54, i64 %58, i32 %60, i64 0, i8* null), !dbg !1166
  %62 = icmp ne i32 %61, 0, !dbg !1166
  br i1 %62, label %67, label %63, !dbg !1167

63:                                               ; preds = %40
  %64 = load i32, i32* %2, align 4, !dbg !1168
  %65 = load float*, float** %3, align 8, !dbg !1169
  %66 = load float*, float** %4, align 8, !dbg !1170
  call void @_Z5MyaddiPfS_(i32 %64, float* %65, float* %66), !dbg !1167
  br label %67, !dbg !1167

67:                                               ; preds = %63, %40
  %68 = call i32 @cudaDeviceSynchronize(), !dbg !1171
  call void @llvm.dbg.declare(metadata float* %13, metadata !1172, metadata !DIExpression()), !dbg !1173
  store float 0.000000e+00, float* %13, align 4, !dbg !1173
  call void @llvm.dbg.declare(metadata i32* %14, metadata !1174, metadata !DIExpression()), !dbg !1176
  store i32 0, i32* %14, align 4, !dbg !1176
  br label %69, !dbg !1177

69:                                               ; preds = %86, %67
  %70 = load i32, i32* %14, align 4, !dbg !1178
  %71 = load i32, i32* %2, align 4, !dbg !1180
  %72 = icmp slt i32 %70, %71, !dbg !1181
  br i1 %72, label %73, label %89, !dbg !1182

73:                                               ; preds = %69
  %74 = load float, float* %13, align 4, !dbg !1183
  %75 = fpext float %74 to double, !dbg !1183
  %76 = load float*, float** %4, align 8, !dbg !1184
  %77 = load i32, i32* %14, align 4, !dbg !1185
  %78 = sext i32 %77 to i64, !dbg !1184
  %79 = getelementptr inbounds float, float* %76, i64 %78, !dbg !1184
  %80 = load float, float* %79, align 4, !dbg !1184
  %81 = fsub contract float %80, 3.000000e+00, !dbg !1186
  %82 = call float @_ZSt4fabsf(float %81), !dbg !1187
  %83 = fpext float %82 to double, !dbg !1187
  %84 = call double @llvm.maxnum.f64(double %75, double %83), !dbg !1188
  %85 = fptrunc double %84 to float, !dbg !1188
  store float %85, float* %13, align 4, !dbg !1189
  br label %86, !dbg !1190

86:                                               ; preds = %73
  %87 = load i32, i32* %14, align 4, !dbg !1191
  %88 = add nsw i32 %87, 1, !dbg !1191
  store i32 %88, i32* %14, align 4, !dbg !1191
  br label %69, !dbg !1192, !llvm.loop !1193

89:                                               ; preds = %69
  %90 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0)), !dbg !1195
  %91 = load float, float* %13, align 4, !dbg !1196
  %92 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"* %90, float %91), !dbg !1197
  %93 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %92, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1198
  %94 = load float*, float** %3, align 8, !dbg !1199
  %95 = bitcast float* %94 to i8*, !dbg !1199
  %96 = call i32 @cudaFree(i8* %95), !dbg !1200
  %97 = load float*, float** %4, align 8, !dbg !1201
  %98 = bitcast float* %97 to i8*, !dbg !1201
  %99 = call i32 @cudaFree(i8* %98), !dbg !1202
  ret i32 0, !dbg !1203
}

declare dso_local i32 @cudaStreamCreate(%struct.CUstream_st**) #1

; Function Attrs: noinline optnone uwtable
define internal i32 @_ZL17cudaMallocManagedIfE9cudaErrorPPT_mj(float** %0, i64 %1, i32 %2) #3 !dbg !1204 {
  %4 = alloca float**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store float** %0, float*** %4, align 8
  call void @llvm.dbg.declare(metadata float*** %4, metadata !1212, metadata !DIExpression()), !dbg !1213
  store i64 %1, i64* %5, align 8
  call void @llvm.dbg.declare(metadata i64* %5, metadata !1214, metadata !DIExpression()), !dbg !1215
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1216, metadata !DIExpression()), !dbg !1217
  %7 = load float**, float*** %4, align 8, !dbg !1218
  %8 = bitcast float** %7 to i8*, !dbg !1218
  %9 = bitcast i8* %8 to i8**, !dbg !1219
  %10 = load i64, i64* %5, align 8, !dbg !1220
  %11 = load i32, i32* %6, align 4, !dbg !1221
  %12 = call i32 @cudaMallocManaged(i8** %9, i64 %10, i32 %11), !dbg !1222
  ret i32 %12, !dbg !1223
}

declare dso_local i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64, i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %0, i32 %1, i32 %2, i32 %3) unnamed_addr #7 comdat align 2 !dbg !1224 {
  %5 = alloca %struct.dim3*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.dim3* %0, %struct.dim3** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %5, metadata !1249, metadata !DIExpression()), !dbg !1251
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1252, metadata !DIExpression()), !dbg !1253
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !1254, metadata !DIExpression()), !dbg !1255
  store i32 %3, i32* %8, align 4
  call void @llvm.dbg.declare(metadata i32* %8, metadata !1256, metadata !DIExpression()), !dbg !1257
  %9 = load %struct.dim3*, %struct.dim3** %5, align 8
  %10 = getelementptr inbounds %struct.dim3, %struct.dim3* %9, i32 0, i32 0, !dbg !1258
  %11 = load i32, i32* %6, align 4, !dbg !1259
  store i32 %11, i32* %10, align 4, !dbg !1258
  %12 = getelementptr inbounds %struct.dim3, %struct.dim3* %9, i32 0, i32 1, !dbg !1260
  %13 = load i32, i32* %7, align 4, !dbg !1261
  store i32 %13, i32* %12, align 4, !dbg !1260
  %14 = getelementptr inbounds %struct.dim3, %struct.dim3* %9, i32 0, i32 2, !dbg !1262
  %15 = load i32, i32* %8, align 4, !dbg !1263
  store i32 %15, i32* %14, align 4, !dbg !1262
  ret void, !dbg !1264
}

declare dso_local i32 @cudaDeviceSynchronize() #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local float @_ZSt4fabsf(float %0) #7 comdat !dbg !1265 {
  %2 = alloca float, align 4
  store float %0, float* %2, align 4
  call void @llvm.dbg.declare(metadata float* %2, metadata !1266, metadata !DIExpression()), !dbg !1267
  %3 = load float, float* %2, align 4, !dbg !1268
  %4 = call float @llvm.fabs.f32(float %3), !dbg !1269
  ret float %4, !dbg !1270
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #4

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"*, float) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

declare dso_local i32 @cudaFree(i8*) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #4

declare dso_local i32 @cudaMallocManaged(i8**, i64, i32) #1

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_um.cu() #0 section ".text.startup" !dbg !1271 {
  call void @__cxx_global_var_init(), !dbg !1273
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!19, !20, !21, !22}
!llvm.dbg.cu = !{!23}
!llvm.ident = !{!1087}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/iostream", directory: "")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 601, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !7, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, flags: DIFlagFwdDecl)
!7 = !{!8, !12, !14, !18}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !4, file: !5, line: 609, baseType: !9, flags: DIFlagStaticMember)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !10, line: 32, baseType: !11)
!10 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0/bits/atomic_word.h", directory: "")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !4, file: !5, line: 610, baseType: !13, flags: DIFlagStaticMember)
!13 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!14 = !DISubprogram(name: "Init", scope: !4, file: !5, line: 605, type: !15, scopeLine: 605, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!18 = !DISubprogram(name: "~Init", scope: !4, file: !5, line: 606, type: !15, scopeLine: 606, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!19 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !24, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !25, retainedTypes: !140, globals: !143, imports: !144, splitDebugInlining: false, nameTableKind: None)
!24 = !DIFile(filename: "um.cu", directory: "/home/yuweitt/cuda/um")
!25 = !{!26}
!26 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !27, line: 189, baseType: !28, size: 32, elements: !29, identifier: "_ZTS9cudaError")
!27 = !DIFile(filename: "/usr/local/cuda-10.2/include/driver_types.h", directory: "")
!28 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139}
!30 = !DIEnumerator(name: "cudaSuccess", value: 0, isUnsigned: true)
!31 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 1, isUnsigned: true)
!32 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2, isUnsigned: true)
!33 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3, isUnsigned: true)
!34 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 4, isUnsigned: true)
!35 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 5, isUnsigned: true)
!36 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 6, isUnsigned: true)
!37 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 7, isUnsigned: true)
!38 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 8, isUnsigned: true)
!39 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9, isUnsigned: true)
!40 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12, isUnsigned: true)
!41 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13, isUnsigned: true)
!42 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16, isUnsigned: true)
!43 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!44 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18, isUnsigned: true)
!45 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19, isUnsigned: true)
!46 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20, isUnsigned: true)
!47 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!48 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22, isUnsigned: true)
!49 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23, isUnsigned: true)
!50 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24, isUnsigned: true)
!51 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25, isUnsigned: true)
!52 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26, isUnsigned: true)
!53 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27, isUnsigned: true)
!54 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28, isUnsigned: true)
!55 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31, isUnsigned: true)
!56 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32, isUnsigned: true)
!57 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35, isUnsigned: true)
!58 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37, isUnsigned: true)
!59 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43, isUnsigned: true)
!60 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44, isUnsigned: true)
!61 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45, isUnsigned: true)
!62 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46, isUnsigned: true)
!63 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49, isUnsigned: true)
!64 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 52, isUnsigned: true)
!65 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 53, isUnsigned: true)
!66 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65, isUnsigned: true)
!67 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66, isUnsigned: true)
!68 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67, isUnsigned: true)
!69 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68, isUnsigned: true)
!70 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69, isUnsigned: true)
!71 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 98, isUnsigned: true)
!72 = !DIEnumerator(name: "cudaErrorNoDevice", value: 100, isUnsigned: true)
!73 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 101, isUnsigned: true)
!74 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127, isUnsigned: true)
!75 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 200, isUnsigned: true)
!76 = !DIEnumerator(name: "cudaErrorDeviceUninitialized", value: 201, isUnsigned: true)
!77 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 205, isUnsigned: true)
!78 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 206, isUnsigned: true)
!79 = !DIEnumerator(name: "cudaErrorArrayIsMapped", value: 207, isUnsigned: true)
!80 = !DIEnumerator(name: "cudaErrorAlreadyMapped", value: 208, isUnsigned: true)
!81 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 209, isUnsigned: true)
!82 = !DIEnumerator(name: "cudaErrorAlreadyAcquired", value: 210, isUnsigned: true)
!83 = !DIEnumerator(name: "cudaErrorNotMapped", value: 211, isUnsigned: true)
!84 = !DIEnumerator(name: "cudaErrorNotMappedAsArray", value: 212, isUnsigned: true)
!85 = !DIEnumerator(name: "cudaErrorNotMappedAsPointer", value: 213, isUnsigned: true)
!86 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 214, isUnsigned: true)
!87 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 215, isUnsigned: true)
!88 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 216, isUnsigned: true)
!89 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 217, isUnsigned: true)
!90 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 218, isUnsigned: true)
!91 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 219, isUnsigned: true)
!92 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 220, isUnsigned: true)
!93 = !DIEnumerator(name: "cudaErrorJitCompilerNotFound", value: 221, isUnsigned: true)
!94 = !DIEnumerator(name: "cudaErrorInvalidSource", value: 300, isUnsigned: true)
!95 = !DIEnumerator(name: "cudaErrorFileNotFound", value: 301, isUnsigned: true)
!96 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 302, isUnsigned: true)
!97 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 303, isUnsigned: true)
!98 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 304, isUnsigned: true)
!99 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 400, isUnsigned: true)
!100 = !DIEnumerator(name: "cudaErrorIllegalState", value: 401, isUnsigned: true)
!101 = !DIEnumerator(name: "cudaErrorSymbolNotFound", value: 500, isUnsigned: true)
!102 = !DIEnumerator(name: "cudaErrorNotReady", value: 600, isUnsigned: true)
!103 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 700, isUnsigned: true)
!104 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 701, isUnsigned: true)
!105 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 702, isUnsigned: true)
!106 = !DIEnumerator(name: "cudaErrorLaunchIncompatibleTexturing", value: 703, isUnsigned: true)
!107 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 704, isUnsigned: true)
!108 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 705, isUnsigned: true)
!109 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 708, isUnsigned: true)
!110 = !DIEnumerator(name: "cudaErrorContextIsDestroyed", value: 709, isUnsigned: true)
!111 = !DIEnumerator(name: "cudaErrorAssert", value: 710, isUnsigned: true)
!112 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 711, isUnsigned: true)
!113 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 712, isUnsigned: true)
!114 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 713, isUnsigned: true)
!115 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 714, isUnsigned: true)
!116 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 715, isUnsigned: true)
!117 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 716, isUnsigned: true)
!118 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 717, isUnsigned: true)
!119 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 718, isUnsigned: true)
!120 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 719, isUnsigned: true)
!121 = !DIEnumerator(name: "cudaErrorCooperativeLaunchTooLarge", value: 720, isUnsigned: true)
!122 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 800, isUnsigned: true)
!123 = !DIEnumerator(name: "cudaErrorNotSupported", value: 801, isUnsigned: true)
!124 = !DIEnumerator(name: "cudaErrorSystemNotReady", value: 802, isUnsigned: true)
!125 = !DIEnumerator(name: "cudaErrorSystemDriverMismatch", value: 803, isUnsigned: true)
!126 = !DIEnumerator(name: "cudaErrorCompatNotSupportedOnDevice", value: 804, isUnsigned: true)
!127 = !DIEnumerator(name: "cudaErrorStreamCaptureUnsupported", value: 900, isUnsigned: true)
!128 = !DIEnumerator(name: "cudaErrorStreamCaptureInvalidated", value: 901, isUnsigned: true)
!129 = !DIEnumerator(name: "cudaErrorStreamCaptureMerge", value: 902, isUnsigned: true)
!130 = !DIEnumerator(name: "cudaErrorStreamCaptureUnmatched", value: 903, isUnsigned: true)
!131 = !DIEnumerator(name: "cudaErrorStreamCaptureUnjoined", value: 904, isUnsigned: true)
!132 = !DIEnumerator(name: "cudaErrorStreamCaptureIsolation", value: 905, isUnsigned: true)
!133 = !DIEnumerator(name: "cudaErrorStreamCaptureImplicit", value: 906, isUnsigned: true)
!134 = !DIEnumerator(name: "cudaErrorCapturedEvent", value: 907, isUnsigned: true)
!135 = !DIEnumerator(name: "cudaErrorStreamCaptureWrongThread", value: 908, isUnsigned: true)
!136 = !DIEnumerator(name: "cudaErrorTimeout", value: 909, isUnsigned: true)
!137 = !DIEnumerator(name: "cudaErrorGraphExecUpdateFailure", value: 910, isUnsigned: true)
!138 = !DIEnumerator(name: "cudaErrorUnknown", value: 999, isUnsigned: true)
!139 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000, isUnsigned: true)
!140 = !{!141, !142}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!143 = !{!0}
!144 = !{!145, !150, !155, !157, !159, !161, !163, !167, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !189, !191, !193, !195, !199, !201, !203, !205, !209, !214, !216, !218, !222, !226, !228, !230, !232, !234, !236, !238, !240, !242, !247, !251, !253, !258, !262, !264, !266, !268, !270, !272, !276, !278, !280, !285, !293, !297, !299, !301, !303, !305, !309, !311, !313, !317, !319, !321, !323, !325, !327, !329, !331, !333, !335, !339, !345, !347, !349, !353, !355, !357, !359, !361, !363, !365, !367, !371, !375, !377, !379, !384, !386, !388, !390, !392, !394, !396, !400, !406, !410, !415, !417, !421, !425, !438, !442, !446, !450, !454, !459, !461, !465, !469, !473, !481, !485, !489, !493, !497, !501, !507, !511, !515, !517, !525, !529, !536, !538, !540, !544, !548, !552, !557, !561, !566, !567, !568, !569, !571, !572, !573, !574, !575, !576, !577, !579, !580, !581, !582, !583, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !597, !598, !599, !600, !601, !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !615, !617, !619, !621, !623, !625, !627, !629, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665, !667, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !697, !699, !701, !703, !705, !707, !709, !711, !713, !715, !717, !719, !721, !723, !730, !733, !738, !746, !751, !755, !759, !763, !767, !769, !771, !775, !781, !785, !791, !797, !799, !803, !807, !811, !815, !826, !828, !832, !836, !840, !842, !846, !850, !854, !856, !858, !862, !870, !874, !878, !882, !884, !890, !892, !898, !902, !906, !910, !914, !918, !922, !924, !926, !930, !934, !938, !940, !944, !948, !950, !952, !956, !960, !964, !968, !969, !970, !971, !975, !979, !983, !988, !992, !994, !996, !998, !1000, !1002, !1004, !1006, !1008, !1010, !1012, !1014, !1016, !1020, !1022, !1030, !1033, !1034, !1036, !1038, !1040, !1042, !1046, !1048, !1050, !1052, !1054, !1056, !1058, !1060, !1062, !1066, !1070, !1072, !1076, !1080, !1082}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !146, file: !147, line: 223)
!146 = !DISubprogram(name: "abs", linkageName: "_ZL3absi", scope: !147, file: !147, line: 53, type: !148, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!147 = !DIFile(filename: "llvm-project/build/lib/clang/10.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/yuweitt")
!148 = !DISubroutineType(types: !149)
!149 = !{!11, !11}
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !151, file: !147, line: 224)
!151 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !147, file: !147, line: 55, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!152 = !DISubroutineType(types: !153)
!153 = !{!154, !154}
!154 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !156, file: !147, line: 225)
!156 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !147, file: !147, line: 57, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !158, file: !147, line: 226)
!158 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !147, file: !147, line: 59, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !160, file: !147, line: 227)
!160 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !147, file: !147, line: 61, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !162, file: !147, line: 228)
!162 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !147, file: !147, line: 65, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !164, file: !147, line: 229)
!164 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !147, file: !147, line: 63, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!165 = !DISubroutineType(types: !166)
!166 = !{!154, !154, !154}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !168, file: !147, line: 230)
!168 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !147, file: !147, line: 67, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !170, file: !147, line: 231)
!170 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !147, file: !147, line: 69, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !172, file: !147, line: 232)
!172 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !147, file: !147, line: 71, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !174, file: !147, line: 233)
!174 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !147, file: !147, line: 73, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !176, file: !147, line: 234)
!176 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !147, file: !147, line: 75, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !178, file: !147, line: 235)
!178 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !147, file: !147, line: 77, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !180, file: !147, line: 236)
!180 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !147, file: !147, line: 81, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !182, file: !147, line: 237)
!182 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !147, file: !147, line: 79, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !184, file: !147, line: 238)
!184 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !147, file: !147, line: 85, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !186, file: !147, line: 239)
!186 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !147, file: !147, line: 83, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !188, file: !147, line: 240)
!188 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !147, file: !147, line: 87, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !190, file: !147, line: 241)
!190 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !147, file: !147, line: 89, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !192, file: !147, line: 242)
!192 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !147, file: !147, line: 91, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !194, file: !147, line: 243)
!194 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !147, file: !147, line: 93, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !196, file: !147, line: 244)
!196 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !147, file: !147, line: 95, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!197 = !DISubroutineType(types: !198)
!198 = !{!154, !154, !154, !154}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !200, file: !147, line: 245)
!200 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !147, file: !147, line: 97, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !202, file: !147, line: 246)
!202 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !147, file: !147, line: 99, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !204, file: !147, line: 247)
!204 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !147, file: !147, line: 101, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !206, file: !147, line: 248)
!206 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !147, file: !147, line: 103, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!207 = !DISubroutineType(types: !208)
!208 = !{!11, !154}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !210, file: !147, line: 249)
!210 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !147, file: !147, line: 105, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!211 = !DISubroutineType(types: !212)
!212 = !{!154, !154, !213}
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !215, file: !147, line: 250)
!215 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !147, file: !147, line: 107, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !217, file: !147, line: 251)
!217 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !147, file: !147, line: 109, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !219, file: !147, line: 252)
!219 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !147, file: !147, line: 114, type: !220, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!220 = !DISubroutineType(types: !221)
!221 = !{!13, !154}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !223, file: !147, line: 253)
!223 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !147, file: !147, line: 118, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!224 = !DISubroutineType(types: !225)
!225 = !{!13, !154, !154}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !227, file: !147, line: 254)
!227 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !147, file: !147, line: 117, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !229, file: !147, line: 255)
!229 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !147, file: !147, line: 123, type: !220, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !231, file: !147, line: 256)
!231 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !147, file: !147, line: 127, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !233, file: !147, line: 257)
!233 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !147, file: !147, line: 126, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !235, file: !147, line: 258)
!235 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !147, file: !147, line: 129, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !237, file: !147, line: 259)
!237 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !147, file: !147, line: 134, type: !220, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !239, file: !147, line: 260)
!239 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !147, file: !147, line: 136, type: !220, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !241, file: !147, line: 261)
!241 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !147, file: !147, line: 138, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !243, file: !147, line: 262)
!243 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !147, file: !147, line: 139, type: !244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!244 = !DISubroutineType(types: !245)
!245 = !{!246, !246}
!246 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !248, file: !147, line: 263)
!248 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !147, file: !147, line: 141, type: !249, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!249 = !DISubroutineType(types: !250)
!250 = !{!154, !154, !11}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !252, file: !147, line: 264)
!252 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !147, file: !147, line: 143, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !254, file: !147, line: 265)
!254 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !147, file: !147, line: 144, type: !255, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!255 = !DISubroutineType(types: !256)
!256 = !{!257, !257}
!257 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !259, file: !147, line: 266)
!259 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !147, file: !147, line: 146, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!260 = !DISubroutineType(types: !261)
!261 = !{!257, !154}
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !263, file: !147, line: 267)
!263 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !147, file: !147, line: 159, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !265, file: !147, line: 268)
!265 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !147, file: !147, line: 148, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !267, file: !147, line: 269)
!267 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !147, file: !147, line: 150, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !269, file: !147, line: 270)
!269 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !147, file: !147, line: 152, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !271, file: !147, line: 271)
!271 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !147, file: !147, line: 154, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !273, file: !147, line: 272)
!273 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !147, file: !147, line: 161, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!274 = !DISubroutineType(types: !275)
!275 = !{!246, !154}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !277, file: !147, line: 273)
!277 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !147, file: !147, line: 163, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !279, file: !147, line: 274)
!279 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !147, file: !147, line: 164, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !281, file: !147, line: 275)
!281 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !147, file: !147, line: 166, type: !282, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!282 = !DISubroutineType(types: !283)
!283 = !{!154, !154, !284}
!284 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !286, file: !147, line: 276)
!286 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !147, file: !147, line: 167, type: !287, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!287 = !DISubroutineType(types: !288)
!288 = !{!289, !290}
!289 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!290 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !291, size: 64)
!291 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !292)
!292 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !294, file: !147, line: 277)
!294 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !147, file: !147, line: 168, type: !295, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!295 = !DISubroutineType(types: !296)
!296 = !{!154, !290}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !298, file: !147, line: 278)
!298 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !147, file: !147, line: 170, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !300, file: !147, line: 279)
!300 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !147, file: !147, line: 172, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !302, file: !147, line: 280)
!302 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !147, file: !147, line: 176, type: !249, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !304, file: !147, line: 281)
!304 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !147, file: !147, line: 178, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !306, file: !147, line: 282)
!306 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !147, file: !147, line: 180, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!307 = !DISubroutineType(types: !308)
!308 = !{!154, !154, !154, !213}
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !310, file: !147, line: 283)
!310 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !147, file: !147, line: 182, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !147, line: 284)
!312 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !147, file: !147, line: 184, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !314, file: !147, line: 285)
!314 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !147, file: !147, line: 186, type: !315, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!315 = !DISubroutineType(types: !316)
!316 = !{!154, !154, !246}
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !318, file: !147, line: 286)
!318 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !147, file: !147, line: 188, type: !249, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !320, file: !147, line: 287)
!320 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !147, file: !147, line: 190, type: !220, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !322, file: !147, line: 288)
!322 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !147, file: !147, line: 192, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !324, file: !147, line: 289)
!324 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !147, file: !147, line: 194, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !326, file: !147, line: 290)
!326 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !147, file: !147, line: 196, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !328, file: !147, line: 291)
!328 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !147, file: !147, line: 198, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !330, file: !147, line: 292)
!330 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !147, file: !147, line: 200, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !332, file: !147, line: 293)
!332 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !147, file: !147, line: 202, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !334, file: !147, line: 294)
!334 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !147, file: !147, line: 204, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !336, file: !338, line: 52)
!336 = !DISubprogram(name: "abs", scope: !337, file: !337, line: 837, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!337 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!338 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/bits/std_abs.h", directory: "")
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !340, file: !344, line: 83)
!340 = !DISubprogram(name: "acos", scope: !341, file: !341, line: 53, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!341 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!342 = !DISubroutineType(types: !343)
!343 = !{!289, !289}
!344 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cmath", directory: "")
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !346, file: !344, line: 102)
!346 = !DISubprogram(name: "asin", scope: !341, file: !341, line: 55, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !348, file: !344, line: 121)
!348 = !DISubprogram(name: "atan", scope: !341, file: !341, line: 57, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !350, file: !344, line: 140)
!350 = !DISubprogram(name: "atan2", scope: !341, file: !341, line: 59, type: !351, flags: DIFlagPrototyped, spFlags: 0)
!351 = !DISubroutineType(types: !352)
!352 = !{!289, !289, !289}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !354, file: !344, line: 161)
!354 = !DISubprogram(name: "ceil", scope: !341, file: !341, line: 159, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !356, file: !344, line: 180)
!356 = !DISubprogram(name: "cos", scope: !341, file: !341, line: 62, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !358, file: !344, line: 199)
!358 = !DISubprogram(name: "cosh", scope: !341, file: !341, line: 71, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !360, file: !344, line: 218)
!360 = !DISubprogram(name: "exp", scope: !341, file: !341, line: 95, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !362, file: !344, line: 237)
!362 = !DISubprogram(name: "fabs", scope: !341, file: !341, line: 162, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !364, file: !344, line: 256)
!364 = !DISubprogram(name: "floor", scope: !341, file: !341, line: 165, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !366, file: !344, line: 275)
!366 = !DISubprogram(name: "fmod", scope: !341, file: !341, line: 168, type: !351, flags: DIFlagPrototyped, spFlags: 0)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !368, file: !344, line: 296)
!368 = !DISubprogram(name: "frexp", scope: !341, file: !341, line: 98, type: !369, flags: DIFlagPrototyped, spFlags: 0)
!369 = !DISubroutineType(types: !370)
!370 = !{!289, !289, !213}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !372, file: !344, line: 315)
!372 = !DISubprogram(name: "ldexp", scope: !341, file: !341, line: 101, type: !373, flags: DIFlagPrototyped, spFlags: 0)
!373 = !DISubroutineType(types: !374)
!374 = !{!289, !289, !11}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !376, file: !344, line: 334)
!376 = !DISubprogram(name: "log", scope: !341, file: !341, line: 104, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !378, file: !344, line: 353)
!378 = !DISubprogram(name: "log10", scope: !341, file: !341, line: 107, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !380, file: !344, line: 372)
!380 = !DISubprogram(name: "modf", scope: !341, file: !341, line: 110, type: !381, flags: DIFlagPrototyped, spFlags: 0)
!381 = !DISubroutineType(types: !382)
!382 = !{!289, !289, !383}
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !385, file: !344, line: 384)
!385 = !DISubprogram(name: "pow", scope: !341, file: !341, line: 140, type: !351, flags: DIFlagPrototyped, spFlags: 0)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !387, file: !344, line: 421)
!387 = !DISubprogram(name: "sin", scope: !341, file: !341, line: 64, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !389, file: !344, line: 440)
!389 = !DISubprogram(name: "sinh", scope: !341, file: !341, line: 73, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !391, file: !344, line: 459)
!391 = !DISubprogram(name: "sqrt", scope: !341, file: !341, line: 143, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !393, file: !344, line: 478)
!393 = !DISubprogram(name: "tan", scope: !341, file: !341, line: 66, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !395, file: !344, line: 497)
!395 = !DISubprogram(name: "tanh", scope: !341, file: !341, line: 75, type: !342, flags: DIFlagPrototyped, spFlags: 0)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !397, file: !399, line: 127)
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !337, line: 62, baseType: !398)
!398 = !DICompositeType(tag: DW_TAG_structure_type, file: !337, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!399 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cstdlib", directory: "")
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !401, file: !399, line: 128)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !337, line: 70, baseType: !402)
!402 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !337, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !403, identifier: "_ZTS6ldiv_t")
!403 = !{!404, !405}
!404 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !402, file: !337, line: 68, baseType: !246, size: 64)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !402, file: !337, line: 69, baseType: !246, size: 64, offset: 64)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !407, file: !399, line: 130)
!407 = !DISubprogram(name: "abort", scope: !337, file: !337, line: 588, type: !408, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!408 = !DISubroutineType(types: !409)
!409 = !{null}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !411, file: !399, line: 134)
!411 = !DISubprogram(name: "atexit", scope: !337, file: !337, line: 592, type: !412, flags: DIFlagPrototyped, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{!11, !414}
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !408, size: 64)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !416, file: !399, line: 140)
!416 = !DISubprogram(name: "atof", scope: !337, file: !337, line: 101, type: !287, flags: DIFlagPrototyped, spFlags: 0)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !418, file: !399, line: 141)
!418 = !DISubprogram(name: "atoi", scope: !337, file: !337, line: 104, type: !419, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DISubroutineType(types: !420)
!420 = !{!11, !290}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !422, file: !399, line: 142)
!422 = !DISubprogram(name: "atol", scope: !337, file: !337, line: 107, type: !423, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DISubroutineType(types: !424)
!424 = !{!246, !290}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !426, file: !399, line: 143)
!426 = !DISubprogram(name: "bsearch", scope: !337, file: !337, line: 817, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{!142, !429, !429, !431, !431, !434}
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !430, size: 64)
!430 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!431 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !432, line: 46, baseType: !433)
!432 = !DIFile(filename: "llvm-project/build/lib/clang/10.0.0/include/stddef.h", directory: "/home/yuweitt")
!433 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!434 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !337, line: 805, baseType: !435)
!435 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !436, size: 64)
!436 = !DISubroutineType(types: !437)
!437 = !{!11, !429, !429}
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !439, file: !399, line: 144)
!439 = !DISubprogram(name: "calloc", scope: !337, file: !337, line: 541, type: !440, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DISubroutineType(types: !441)
!441 = !{!142, !431, !431}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !443, file: !399, line: 145)
!443 = !DISubprogram(name: "div", scope: !337, file: !337, line: 849, type: !444, flags: DIFlagPrototyped, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{!397, !11, !11}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !447, file: !399, line: 146)
!447 = !DISubprogram(name: "exit", scope: !337, file: !337, line: 614, type: !448, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!448 = !DISubroutineType(types: !449)
!449 = !{null, !11}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !451, file: !399, line: 147)
!451 = !DISubprogram(name: "free", scope: !337, file: !337, line: 563, type: !452, flags: DIFlagPrototyped, spFlags: 0)
!452 = !DISubroutineType(types: !453)
!453 = !{null, !142}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !455, file: !399, line: 148)
!455 = !DISubprogram(name: "getenv", scope: !337, file: !337, line: 631, type: !456, flags: DIFlagPrototyped, spFlags: 0)
!456 = !DISubroutineType(types: !457)
!457 = !{!458, !290}
!458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !292, size: 64)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !460, file: !399, line: 149)
!460 = !DISubprogram(name: "labs", scope: !337, file: !337, line: 838, type: !244, flags: DIFlagPrototyped, spFlags: 0)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !462, file: !399, line: 150)
!462 = !DISubprogram(name: "ldiv", scope: !337, file: !337, line: 851, type: !463, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DISubroutineType(types: !464)
!464 = !{!401, !246, !246}
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !466, file: !399, line: 151)
!466 = !DISubprogram(name: "malloc", scope: !337, file: !337, line: 539, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!467 = !DISubroutineType(types: !468)
!468 = !{!142, !431}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !399, line: 153)
!470 = !DISubprogram(name: "mblen", scope: !337, file: !337, line: 919, type: !471, flags: DIFlagPrototyped, spFlags: 0)
!471 = !DISubroutineType(types: !472)
!472 = !{!11, !290, !431}
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !474, file: !399, line: 154)
!474 = !DISubprogram(name: "mbstowcs", scope: !337, file: !337, line: 930, type: !475, flags: DIFlagPrototyped, spFlags: 0)
!475 = !DISubroutineType(types: !476)
!476 = !{!431, !477, !480, !431}
!477 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !478)
!478 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !479, size: 64)
!479 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!480 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !290)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !482, file: !399, line: 155)
!482 = !DISubprogram(name: "mbtowc", scope: !337, file: !337, line: 922, type: !483, flags: DIFlagPrototyped, spFlags: 0)
!483 = !DISubroutineType(types: !484)
!484 = !{!11, !477, !480, !431}
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !486, file: !399, line: 157)
!486 = !DISubprogram(name: "qsort", scope: !337, file: !337, line: 827, type: !487, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{null, !142, !431, !431, !434}
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !490, file: !399, line: 163)
!490 = !DISubprogram(name: "rand", scope: !337, file: !337, line: 453, type: !491, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DISubroutineType(types: !492)
!492 = !{!11}
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !494, file: !399, line: 164)
!494 = !DISubprogram(name: "realloc", scope: !337, file: !337, line: 549, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!495 = !DISubroutineType(types: !496)
!496 = !{!142, !142, !431}
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !498, file: !399, line: 165)
!498 = !DISubprogram(name: "srand", scope: !337, file: !337, line: 455, type: !499, flags: DIFlagPrototyped, spFlags: 0)
!499 = !DISubroutineType(types: !500)
!500 = !{null, !28}
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !502, file: !399, line: 166)
!502 = !DISubprogram(name: "strtod", scope: !337, file: !337, line: 117, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DISubroutineType(types: !504)
!504 = !{!289, !480, !505}
!505 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !506)
!506 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !458, size: 64)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !508, file: !399, line: 167)
!508 = !DISubprogram(name: "strtol", scope: !337, file: !337, line: 176, type: !509, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DISubroutineType(types: !510)
!510 = !{!246, !480, !505, !11}
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !512, file: !399, line: 168)
!512 = !DISubprogram(name: "strtoul", scope: !337, file: !337, line: 180, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!513 = !DISubroutineType(types: !514)
!514 = !{!433, !480, !505, !11}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !516, file: !399, line: 169)
!516 = !DISubprogram(name: "system", scope: !337, file: !337, line: 781, type: !419, flags: DIFlagPrototyped, spFlags: 0)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !518, file: !399, line: 171)
!518 = !DISubprogram(name: "wcstombs", scope: !337, file: !337, line: 933, type: !519, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DISubroutineType(types: !520)
!520 = !{!431, !521, !522, !431}
!521 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !458)
!522 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !523)
!523 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !524, size: 64)
!524 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !479)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !526, file: !399, line: 172)
!526 = !DISubprogram(name: "wctomb", scope: !337, file: !337, line: 926, type: !527, flags: DIFlagPrototyped, spFlags: 0)
!527 = !DISubroutineType(types: !528)
!528 = !{!11, !458, !479}
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !531, file: !399, line: 200)
!530 = !DINamespace(name: "__gnu_cxx", scope: null)
!531 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !337, line: 80, baseType: !532)
!532 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !337, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !533, identifier: "_ZTS7lldiv_t")
!533 = !{!534, !535}
!534 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !532, file: !337, line: 78, baseType: !257, size: 64)
!535 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !532, file: !337, line: 79, baseType: !257, size: 64, offset: 64)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !537, file: !399, line: 206)
!537 = !DISubprogram(name: "_Exit", scope: !337, file: !337, line: 626, type: !448, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !539, file: !399, line: 210)
!539 = !DISubprogram(name: "llabs", scope: !337, file: !337, line: 841, type: !255, flags: DIFlagPrototyped, spFlags: 0)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !541, file: !399, line: 216)
!541 = !DISubprogram(name: "lldiv", scope: !337, file: !337, line: 855, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DISubroutineType(types: !543)
!543 = !{!531, !257, !257}
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !545, file: !399, line: 227)
!545 = !DISubprogram(name: "atoll", scope: !337, file: !337, line: 112, type: !546, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DISubroutineType(types: !547)
!547 = !{!257, !290}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !549, file: !399, line: 228)
!549 = !DISubprogram(name: "strtoll", scope: !337, file: !337, line: 200, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!257, !480, !505, !11}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !553, file: !399, line: 229)
!553 = !DISubprogram(name: "strtoull", scope: !337, file: !337, line: 205, type: !554, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DISubroutineType(types: !555)
!555 = !{!556, !480, !505, !11}
!556 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !558, file: !399, line: 231)
!558 = !DISubprogram(name: "strtof", scope: !337, file: !337, line: 123, type: !559, flags: DIFlagPrototyped, spFlags: 0)
!559 = !DISubroutineType(types: !560)
!560 = !{!154, !480, !505}
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !562, file: !399, line: 232)
!562 = !DISubprogram(name: "strtold", scope: !337, file: !337, line: 126, type: !563, flags: DIFlagPrototyped, spFlags: 0)
!563 = !DISubroutineType(types: !564)
!564 = !{!565, !480, !505}
!565 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !531, file: !399, line: 240)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !537, file: !399, line: 242)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !539, file: !399, line: 244)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !570, file: !399, line: 245)
!570 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !530, file: !399, line: 213, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !541, file: !399, line: 246)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !545, file: !399, line: 248)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !558, file: !399, line: 249)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !549, file: !399, line: 250)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !553, file: !399, line: 251)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !562, file: !399, line: 252)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !407, file: !578, line: 38)
!578 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/stdlib.h", directory: "")
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !411, file: !578, line: 39)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !447, file: !578, line: 40)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !397, file: !578, line: 51)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !401, file: !578, line: 52)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !584, file: !578, line: 54)
!584 = !DISubprogram(name: "abs", linkageName: "_ZSt3abse", scope: !2, file: !338, line: 78, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DISubroutineType(types: !586)
!586 = !{!565, !565}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !416, file: !578, line: 55)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !418, file: !578, line: 56)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !422, file: !578, line: 57)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !426, file: !578, line: 58)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !439, file: !578, line: 59)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !570, file: !578, line: 60)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !451, file: !578, line: 61)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !455, file: !578, line: 62)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !460, file: !578, line: 63)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !462, file: !578, line: 64)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !466, file: !578, line: 65)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !470, file: !578, line: 67)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !474, file: !578, line: 68)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !482, file: !578, line: 69)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !486, file: !578, line: 71)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !490, file: !578, line: 72)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !494, file: !578, line: 73)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !498, file: !578, line: 74)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !502, file: !578, line: 75)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !508, file: !578, line: 76)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !512, file: !578, line: 77)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !516, file: !578, line: 78)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !518, file: !578, line: 80)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !526, file: !578, line: 81)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !612, file: !614, line: 414)
!612 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !613, file: !613, line: 1489, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!613 = !DIFile(filename: "llvm-project/build/lib/clang/10.0.0/include/__clang_cuda_device_functions.h", directory: "/home/yuweitt")
!614 = !DIFile(filename: "llvm-project/build/lib/clang/10.0.0/include/__clang_cuda_cmath.h", directory: "/home/yuweitt")
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !616, file: !614, line: 415)
!616 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !613, file: !613, line: 1491, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !618, file: !614, line: 416)
!618 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !613, file: !613, line: 1493, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !620, file: !614, line: 417)
!620 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !613, file: !613, line: 1495, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !622, file: !614, line: 418)
!622 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !613, file: !613, line: 1498, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !624, file: !614, line: 419)
!624 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !613, file: !613, line: 1499, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !626, file: !614, line: 420)
!626 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !613, file: !613, line: 1501, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !628, file: !614, line: 421)
!628 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !613, file: !613, line: 1503, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !630, file: !614, line: 422)
!630 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !613, file: !613, line: 1505, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !632, file: !614, line: 423)
!632 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !613, file: !613, line: 1513, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !634, file: !614, line: 424)
!634 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !613, file: !613, line: 1517, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !636, file: !614, line: 425)
!636 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !613, file: !613, line: 1521, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !638, file: !614, line: 426)
!638 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !613, file: !613, line: 1530, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !640, file: !614, line: 427)
!640 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !613, file: !613, line: 1535, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !642, file: !614, line: 428)
!642 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !613, file: !613, line: 1542, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !644, file: !614, line: 429)
!644 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !613, file: !613, line: 1543, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !646, file: !614, line: 430)
!646 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !613, file: !613, line: 1545, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !648, file: !614, line: 431)
!648 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !613, file: !613, line: 1546, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !650, file: !614, line: 432)
!650 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !613, file: !613, line: 1548, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !652, file: !614, line: 433)
!652 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !613, file: !613, line: 1558, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !654, file: !614, line: 434)
!654 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !613, file: !613, line: 1562, type: !197, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !656, file: !614, line: 435)
!656 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !613, file: !613, line: 1566, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !658, file: !614, line: 436)
!658 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !613, file: !613, line: 1568, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !660, file: !614, line: 437)
!660 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !613, file: !613, line: 1570, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !662, file: !614, line: 438)
!662 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !613, file: !613, line: 1572, type: !211, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !664, file: !614, line: 439)
!664 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !613, file: !613, line: 1574, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !666, file: !614, line: 440)
!666 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !613, file: !613, line: 1576, type: !207, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !614, line: 441)
!668 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !613, file: !613, line: 1589, type: !249, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !670, file: !614, line: 442)
!670 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !613, file: !613, line: 1591, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !672, file: !614, line: 443)
!672 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !613, file: !613, line: 1600, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !674, file: !614, line: 444)
!674 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !613, file: !613, line: 1602, type: !260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !676, file: !614, line: 445)
!676 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !613, file: !613, line: 1605, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !678, file: !614, line: 446)
!678 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !613, file: !613, line: 1607, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !680, file: !614, line: 447)
!680 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !613, file: !613, line: 1609, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !682, file: !614, line: 448)
!682 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !613, file: !613, line: 1613, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !684, file: !614, line: 449)
!684 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !613, file: !613, line: 1614, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !686, file: !614, line: 450)
!686 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !613, file: !613, line: 1619, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !688, file: !614, line: 451)
!688 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !613, file: !613, line: 1621, type: !274, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !690, file: !614, line: 452)
!690 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !613, file: !613, line: 1641, type: !282, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !614, line: 453)
!692 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !613, file: !613, line: 1643, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !694, file: !614, line: 454)
!694 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !613, file: !613, line: 1647, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !614, line: 455)
!696 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !613, file: !613, line: 1673, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !698, file: !614, line: 456)
!698 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !613, file: !613, line: 1681, type: !165, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !700, file: !614, line: 457)
!700 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !613, file: !613, line: 1687, type: !307, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !702, file: !614, line: 458)
!702 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !613, file: !613, line: 1697, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !704, file: !614, line: 459)
!704 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !613, file: !613, line: 1717, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !706, file: !614, line: 462)
!706 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !613, file: !613, line: 1731, type: !315, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !708, file: !614, line: 464)
!708 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !613, file: !613, line: 1721, type: !249, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !710, file: !614, line: 465)
!710 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !613, file: !613, line: 1752, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !712, file: !614, line: 466)
!712 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !613, file: !613, line: 1756, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !714, file: !614, line: 467)
!714 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !613, file: !613, line: 1760, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !716, file: !614, line: 468)
!716 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !613, file: !613, line: 1762, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !718, file: !614, line: 469)
!718 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !613, file: !613, line: 1764, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !720, file: !614, line: 470)
!720 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !613, file: !613, line: 1766, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !722, file: !614, line: 471)
!722 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !613, file: !613, line: 1768, type: !152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !724, file: !729, line: 64)
!724 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !725, line: 6, baseType: !726)
!725 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "")
!726 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !727, line: 21, baseType: !728)
!727 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "")
!728 = !DICompositeType(tag: DW_TAG_structure_type, file: !727, line: 13, flags: DIFlagFwdDecl, identifier: "_ZTS11__mbstate_t")
!729 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cwchar", directory: "")
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !731, file: !729, line: 139)
!731 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !732, line: 20, baseType: !28)
!732 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "")
!733 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !734, file: !729, line: 141)
!734 = !DISubprogram(name: "btowc", scope: !735, file: !735, line: 284, type: !736, flags: DIFlagPrototyped, spFlags: 0)
!735 = !DIFile(filename: "/usr/include/wchar.h", directory: "")
!736 = !DISubroutineType(types: !737)
!737 = !{!731, !11}
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !739, file: !729, line: 142)
!739 = !DISubprogram(name: "fgetwc", scope: !735, file: !735, line: 727, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!740 = !DISubroutineType(types: !741)
!741 = !{!731, !742}
!742 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !743, size: 64)
!743 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !744, line: 5, baseType: !745)
!744 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "")
!745 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !744, line: 4, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !747, file: !729, line: 143)
!747 = !DISubprogram(name: "fgetws", scope: !735, file: !735, line: 756, type: !748, flags: DIFlagPrototyped, spFlags: 0)
!748 = !DISubroutineType(types: !749)
!749 = !{!478, !477, !11, !750}
!750 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !742)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !752, file: !729, line: 144)
!752 = !DISubprogram(name: "fputwc", scope: !735, file: !735, line: 741, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!753 = !DISubroutineType(types: !754)
!754 = !{!731, !479, !742}
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !756, file: !729, line: 145)
!756 = !DISubprogram(name: "fputws", scope: !735, file: !735, line: 763, type: !757, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DISubroutineType(types: !758)
!758 = !{!11, !522, !750}
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !760, file: !729, line: 146)
!760 = !DISubprogram(name: "fwide", scope: !735, file: !735, line: 573, type: !761, flags: DIFlagPrototyped, spFlags: 0)
!761 = !DISubroutineType(types: !762)
!762 = !{!11, !742, !11}
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !764, file: !729, line: 147)
!764 = !DISubprogram(name: "fwprintf", scope: !735, file: !735, line: 580, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DISubroutineType(types: !766)
!766 = !{!11, !750, !522, null}
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !768, file: !729, line: 148)
!768 = !DISubprogram(name: "fwscanf", scope: !735, file: !735, line: 621, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !770, file: !729, line: 149)
!770 = !DISubprogram(name: "getwc", scope: !735, file: !735, line: 728, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !772, file: !729, line: 150)
!772 = !DISubprogram(name: "getwchar", scope: !735, file: !735, line: 734, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DISubroutineType(types: !774)
!774 = !{!731}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !776, file: !729, line: 151)
!776 = !DISubprogram(name: "mbrlen", scope: !735, file: !735, line: 307, type: !777, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DISubroutineType(types: !778)
!778 = !{!431, !480, !431, !779}
!779 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !780)
!780 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !724, size: 64)
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !782, file: !729, line: 152)
!782 = !DISubprogram(name: "mbrtowc", scope: !735, file: !735, line: 296, type: !783, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{!431, !477, !480, !431, !779}
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !786, file: !729, line: 153)
!786 = !DISubprogram(name: "mbsinit", scope: !735, file: !735, line: 292, type: !787, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DISubroutineType(types: !788)
!788 = !{!11, !789}
!789 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !790, size: 64)
!790 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !724)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !792, file: !729, line: 154)
!792 = !DISubprogram(name: "mbsrtowcs", scope: !735, file: !735, line: 337, type: !793, flags: DIFlagPrototyped, spFlags: 0)
!793 = !DISubroutineType(types: !794)
!794 = !{!431, !477, !795, !431, !779}
!795 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !796)
!796 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !798, file: !729, line: 155)
!798 = !DISubprogram(name: "putwc", scope: !735, file: !735, line: 742, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !800, file: !729, line: 156)
!800 = !DISubprogram(name: "putwchar", scope: !735, file: !735, line: 748, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!801 = !DISubroutineType(types: !802)
!802 = !{!731, !479}
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !804, file: !729, line: 158)
!804 = !DISubprogram(name: "swprintf", scope: !735, file: !735, line: 590, type: !805, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DISubroutineType(types: !806)
!806 = !{!11, !477, !431, !522, null}
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !808, file: !729, line: 160)
!808 = !DISubprogram(name: "swscanf", scope: !735, file: !735, line: 631, type: !809, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DISubroutineType(types: !810)
!810 = !{!11, !522, !522, null}
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !812, file: !729, line: 161)
!812 = !DISubprogram(name: "ungetwc", scope: !735, file: !735, line: 771, type: !813, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DISubroutineType(types: !814)
!814 = !{!731, !731, !742}
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !816, file: !729, line: 162)
!816 = !DISubprogram(name: "vfwprintf", scope: !735, file: !735, line: 598, type: !817, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DISubroutineType(types: !818)
!818 = !{!11, !750, !522, !819}
!819 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !820, size: 64)
!820 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !24, size: 192, flags: DIFlagTypePassByValue, elements: !821, identifier: "_ZTS13__va_list_tag")
!821 = !{!822, !823, !824, !825}
!822 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !820, file: !24, baseType: !28, size: 32)
!823 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !820, file: !24, baseType: !28, size: 32, offset: 32)
!824 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !820, file: !24, baseType: !142, size: 64, offset: 64)
!825 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !820, file: !24, baseType: !142, size: 64, offset: 128)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !827, file: !729, line: 164)
!827 = !DISubprogram(name: "vfwscanf", scope: !735, file: !735, line: 673, type: !817, flags: DIFlagPrototyped, spFlags: 0)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !829, file: !729, line: 167)
!829 = !DISubprogram(name: "vswprintf", scope: !735, file: !735, line: 611, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DISubroutineType(types: !831)
!831 = !{!11, !477, !431, !522, !819}
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !833, file: !729, line: 170)
!833 = !DISubprogram(name: "vswscanf", scope: !735, file: !735, line: 685, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!834 = !DISubroutineType(types: !835)
!835 = !{!11, !522, !522, !819}
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !837, file: !729, line: 172)
!837 = !DISubprogram(name: "vwprintf", scope: !735, file: !735, line: 606, type: !838, flags: DIFlagPrototyped, spFlags: 0)
!838 = !DISubroutineType(types: !839)
!839 = !{!11, !522, !819}
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !841, file: !729, line: 174)
!841 = !DISubprogram(name: "vwscanf", scope: !735, file: !735, line: 681, type: !838, flags: DIFlagPrototyped, spFlags: 0)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !843, file: !729, line: 176)
!843 = !DISubprogram(name: "wcrtomb", scope: !735, file: !735, line: 301, type: !844, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DISubroutineType(types: !845)
!845 = !{!431, !521, !479, !779}
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !847, file: !729, line: 177)
!847 = !DISubprogram(name: "wcscat", scope: !735, file: !735, line: 97, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DISubroutineType(types: !849)
!849 = !{!478, !477, !522}
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !851, file: !729, line: 178)
!851 = !DISubprogram(name: "wcscmp", scope: !735, file: !735, line: 106, type: !852, flags: DIFlagPrototyped, spFlags: 0)
!852 = !DISubroutineType(types: !853)
!853 = !{!11, !523, !523}
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !855, file: !729, line: 179)
!855 = !DISubprogram(name: "wcscoll", scope: !735, file: !735, line: 131, type: !852, flags: DIFlagPrototyped, spFlags: 0)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !857, file: !729, line: 180)
!857 = !DISubprogram(name: "wcscpy", scope: !735, file: !735, line: 87, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !859, file: !729, line: 181)
!859 = !DISubprogram(name: "wcscspn", scope: !735, file: !735, line: 187, type: !860, flags: DIFlagPrototyped, spFlags: 0)
!860 = !DISubroutineType(types: !861)
!861 = !{!431, !523, !523}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !863, file: !729, line: 182)
!863 = !DISubprogram(name: "wcsftime", scope: !735, file: !735, line: 835, type: !864, flags: DIFlagPrototyped, spFlags: 0)
!864 = !DISubroutineType(types: !865)
!865 = !{!431, !477, !431, !522, !866}
!866 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !867)
!867 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !868, size: 64)
!868 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !869)
!869 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !735, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !871, file: !729, line: 183)
!871 = !DISubprogram(name: "wcslen", scope: !735, file: !735, line: 222, type: !872, flags: DIFlagPrototyped, spFlags: 0)
!872 = !DISubroutineType(types: !873)
!873 = !{!431, !523}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !875, file: !729, line: 184)
!875 = !DISubprogram(name: "wcsncat", scope: !735, file: !735, line: 101, type: !876, flags: DIFlagPrototyped, spFlags: 0)
!876 = !DISubroutineType(types: !877)
!877 = !{!478, !477, !522, !431}
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !879, file: !729, line: 185)
!879 = !DISubprogram(name: "wcsncmp", scope: !735, file: !735, line: 109, type: !880, flags: DIFlagPrototyped, spFlags: 0)
!880 = !DISubroutineType(types: !881)
!881 = !{!11, !523, !523, !431}
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !883, file: !729, line: 186)
!883 = !DISubprogram(name: "wcsncpy", scope: !735, file: !735, line: 92, type: !876, flags: DIFlagPrototyped, spFlags: 0)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !885, file: !729, line: 187)
!885 = !DISubprogram(name: "wcsrtombs", scope: !735, file: !735, line: 343, type: !886, flags: DIFlagPrototyped, spFlags: 0)
!886 = !DISubroutineType(types: !887)
!887 = !{!431, !521, !888, !431, !779}
!888 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !889)
!889 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !523, size: 64)
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !891, file: !729, line: 188)
!891 = !DISubprogram(name: "wcsspn", scope: !735, file: !735, line: 191, type: !860, flags: DIFlagPrototyped, spFlags: 0)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !893, file: !729, line: 189)
!893 = !DISubprogram(name: "wcstod", scope: !735, file: !735, line: 377, type: !894, flags: DIFlagPrototyped, spFlags: 0)
!894 = !DISubroutineType(types: !895)
!895 = !{!289, !522, !896}
!896 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !897)
!897 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !478, size: 64)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !899, file: !729, line: 191)
!899 = !DISubprogram(name: "wcstof", scope: !735, file: !735, line: 382, type: !900, flags: DIFlagPrototyped, spFlags: 0)
!900 = !DISubroutineType(types: !901)
!901 = !{!154, !522, !896}
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !903, file: !729, line: 193)
!903 = !DISubprogram(name: "wcstok", scope: !735, file: !735, line: 217, type: !904, flags: DIFlagPrototyped, spFlags: 0)
!904 = !DISubroutineType(types: !905)
!905 = !{!478, !477, !522, !896}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !907, file: !729, line: 194)
!907 = !DISubprogram(name: "wcstol", scope: !735, file: !735, line: 428, type: !908, flags: DIFlagPrototyped, spFlags: 0)
!908 = !DISubroutineType(types: !909)
!909 = !{!246, !522, !896, !11}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !911, file: !729, line: 195)
!911 = !DISubprogram(name: "wcstoul", scope: !735, file: !735, line: 433, type: !912, flags: DIFlagPrototyped, spFlags: 0)
!912 = !DISubroutineType(types: !913)
!913 = !{!433, !522, !896, !11}
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !915, file: !729, line: 196)
!915 = !DISubprogram(name: "wcsxfrm", scope: !735, file: !735, line: 135, type: !916, flags: DIFlagPrototyped, spFlags: 0)
!916 = !DISubroutineType(types: !917)
!917 = !{!431, !477, !522, !431}
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !919, file: !729, line: 197)
!919 = !DISubprogram(name: "wctob", scope: !735, file: !735, line: 288, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!920 = !DISubroutineType(types: !921)
!921 = !{!11, !731}
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !923, file: !729, line: 198)
!923 = !DISubprogram(name: "wmemcmp", scope: !735, file: !735, line: 258, type: !880, flags: DIFlagPrototyped, spFlags: 0)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !925, file: !729, line: 199)
!925 = !DISubprogram(name: "wmemcpy", scope: !735, file: !735, line: 262, type: !876, flags: DIFlagPrototyped, spFlags: 0)
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !927, file: !729, line: 200)
!927 = !DISubprogram(name: "wmemmove", scope: !735, file: !735, line: 267, type: !928, flags: DIFlagPrototyped, spFlags: 0)
!928 = !DISubroutineType(types: !929)
!929 = !{!478, !478, !523, !431}
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !931, file: !729, line: 201)
!931 = !DISubprogram(name: "wmemset", scope: !735, file: !735, line: 271, type: !932, flags: DIFlagPrototyped, spFlags: 0)
!932 = !DISubroutineType(types: !933)
!933 = !{!478, !478, !479, !431}
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !935, file: !729, line: 202)
!935 = !DISubprogram(name: "wprintf", scope: !735, file: !735, line: 587, type: !936, flags: DIFlagPrototyped, spFlags: 0)
!936 = !DISubroutineType(types: !937)
!937 = !{!11, !522, null}
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !939, file: !729, line: 203)
!939 = !DISubprogram(name: "wscanf", scope: !735, file: !735, line: 628, type: !936, flags: DIFlagPrototyped, spFlags: 0)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !941, file: !729, line: 204)
!941 = !DISubprogram(name: "wcschr", scope: !735, file: !735, line: 164, type: !942, flags: DIFlagPrototyped, spFlags: 0)
!942 = !DISubroutineType(types: !943)
!943 = !{!478, !523, !479}
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !945, file: !729, line: 205)
!945 = !DISubprogram(name: "wcspbrk", scope: !735, file: !735, line: 201, type: !946, flags: DIFlagPrototyped, spFlags: 0)
!946 = !DISubroutineType(types: !947)
!947 = !{!478, !523, !523}
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !949, file: !729, line: 206)
!949 = !DISubprogram(name: "wcsrchr", scope: !735, file: !735, line: 174, type: !942, flags: DIFlagPrototyped, spFlags: 0)
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !951, file: !729, line: 207)
!951 = !DISubprogram(name: "wcsstr", scope: !735, file: !735, line: 212, type: !946, flags: DIFlagPrototyped, spFlags: 0)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !953, file: !729, line: 208)
!953 = !DISubprogram(name: "wmemchr", scope: !735, file: !735, line: 253, type: !954, flags: DIFlagPrototyped, spFlags: 0)
!954 = !DISubroutineType(types: !955)
!955 = !{!478, !523, !479, !431}
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !957, file: !729, line: 248)
!957 = !DISubprogram(name: "wcstold", scope: !735, file: !735, line: 384, type: !958, flags: DIFlagPrototyped, spFlags: 0)
!958 = !DISubroutineType(types: !959)
!959 = !{!565, !522, !896}
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !961, file: !729, line: 257)
!961 = !DISubprogram(name: "wcstoll", scope: !735, file: !735, line: 441, type: !962, flags: DIFlagPrototyped, spFlags: 0)
!962 = !DISubroutineType(types: !963)
!963 = !{!257, !522, !896, !11}
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !965, file: !729, line: 258)
!965 = !DISubprogram(name: "wcstoull", scope: !735, file: !735, line: 448, type: !966, flags: DIFlagPrototyped, spFlags: 0)
!966 = !DISubroutineType(types: !967)
!967 = !{!556, !522, !896, !11}
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !957, file: !729, line: 264)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !961, file: !729, line: 265)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !965, file: !729, line: 266)
!971 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !972, entity: !973, file: !974, line: 58)
!972 = !DINamespace(name: "__gnu_debug", scope: null)
!973 = !DINamespace(name: "__debug", scope: !2)
!974 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/debug/debug.h", directory: "")
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !976, file: !978, line: 53)
!976 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !977, line: 51, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!977 = !DIFile(filename: "/usr/include/locale.h", directory: "")
!978 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/clocale", directory: "")
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !980, file: !978, line: 54)
!980 = !DISubprogram(name: "setlocale", scope: !977, file: !977, line: 122, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DISubroutineType(types: !982)
!982 = !{!458, !11, !290}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !984, file: !978, line: 55)
!984 = !DISubprogram(name: "localeconv", scope: !977, file: !977, line: 125, type: !985, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DISubroutineType(types: !986)
!986 = !{!987}
!987 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !976, size: 64)
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !989, file: !991, line: 64)
!989 = !DISubprogram(name: "isalnum", scope: !990, file: !990, line: 108, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!990 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!991 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cctype", directory: "")
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !993, file: !991, line: 65)
!993 = !DISubprogram(name: "isalpha", scope: !990, file: !990, line: 109, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !995, file: !991, line: 66)
!995 = !DISubprogram(name: "iscntrl", scope: !990, file: !990, line: 110, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !997, file: !991, line: 67)
!997 = !DISubprogram(name: "isdigit", scope: !990, file: !990, line: 111, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !999, file: !991, line: 68)
!999 = !DISubprogram(name: "isgraph", scope: !990, file: !990, line: 113, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1001, file: !991, line: 69)
!1001 = !DISubprogram(name: "islower", scope: !990, file: !990, line: 112, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1003, file: !991, line: 70)
!1003 = !DISubprogram(name: "isprint", scope: !990, file: !990, line: 114, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1005, file: !991, line: 71)
!1005 = !DISubprogram(name: "ispunct", scope: !990, file: !990, line: 115, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1007, file: !991, line: 72)
!1007 = !DISubprogram(name: "isspace", scope: !990, file: !990, line: 116, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1009, file: !991, line: 73)
!1009 = !DISubprogram(name: "isupper", scope: !990, file: !990, line: 117, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1011, file: !991, line: 74)
!1011 = !DISubprogram(name: "isxdigit", scope: !990, file: !990, line: 118, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1013, file: !991, line: 75)
!1013 = !DISubprogram(name: "tolower", scope: !990, file: !990, line: 122, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1015, file: !991, line: 76)
!1015 = !DISubprogram(name: "toupper", scope: !990, file: !990, line: 125, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !1017, file: !1019, line: 44)
!1017 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !1018, line: 231, baseType: !433)
!1018 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/x86_64-linux-gnu/c++/7.5.0/bits/c++config.h", directory: "")
!1019 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/ext/new_allocator.h", directory: "")
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !530, entity: !1021, file: !1019, line: 45)
!1021 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !2, file: !1018, line: 232, baseType: !246)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1023, file: !1029, line: 82)
!1023 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1024, line: 48, baseType: !1025)
!1024 = !DIFile(filename: "/usr/include/wctype.h", directory: "")
!1025 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1026, size: 64)
!1026 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1027)
!1027 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !1028, line: 40, baseType: !11)
!1028 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!1029 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/cwctype", directory: "")
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1031, file: !1029, line: 83)
!1031 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1032, line: 38, baseType: !433)
!1032 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "")
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !731, file: !1029, line: 84)
!1034 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1035, file: !1029, line: 86)
!1035 = !DISubprogram(name: "iswalnum", scope: !1032, file: !1032, line: 95, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1037, file: !1029, line: 87)
!1037 = !DISubprogram(name: "iswalpha", scope: !1032, file: !1032, line: 101, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1039, file: !1029, line: 89)
!1039 = !DISubprogram(name: "iswblank", scope: !1032, file: !1032, line: 146, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1041, file: !1029, line: 91)
!1041 = !DISubprogram(name: "iswcntrl", scope: !1032, file: !1032, line: 104, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1043, file: !1029, line: 92)
!1043 = !DISubprogram(name: "iswctype", scope: !1032, file: !1032, line: 159, type: !1044, flags: DIFlagPrototyped, spFlags: 0)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!11, !731, !1031}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1047, file: !1029, line: 93)
!1047 = !DISubprogram(name: "iswdigit", scope: !1032, file: !1032, line: 108, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1049, file: !1029, line: 94)
!1049 = !DISubprogram(name: "iswgraph", scope: !1032, file: !1032, line: 112, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1051, file: !1029, line: 95)
!1051 = !DISubprogram(name: "iswlower", scope: !1032, file: !1032, line: 117, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1053, file: !1029, line: 96)
!1053 = !DISubprogram(name: "iswprint", scope: !1032, file: !1032, line: 120, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1055, file: !1029, line: 97)
!1055 = !DISubprogram(name: "iswpunct", scope: !1032, file: !1032, line: 125, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1057, file: !1029, line: 98)
!1057 = !DISubprogram(name: "iswspace", scope: !1032, file: !1032, line: 130, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1059, file: !1029, line: 99)
!1059 = !DISubprogram(name: "iswupper", scope: !1032, file: !1032, line: 135, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1060 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1061, file: !1029, line: 100)
!1061 = !DISubprogram(name: "iswxdigit", scope: !1032, file: !1032, line: 140, type: !920, flags: DIFlagPrototyped, spFlags: 0)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1063, file: !1029, line: 101)
!1063 = !DISubprogram(name: "towctrans", scope: !1024, file: !1024, line: 55, type: !1064, flags: DIFlagPrototyped, spFlags: 0)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{!731, !731, !1023}
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1067, file: !1029, line: 102)
!1067 = !DISubprogram(name: "towlower", scope: !1032, file: !1032, line: 166, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!731, !731}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1071, file: !1029, line: 103)
!1071 = !DISubprogram(name: "towupper", scope: !1032, file: !1032, line: 169, type: !1068, flags: DIFlagPrototyped, spFlags: 0)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1073, file: !1029, line: 104)
!1073 = !DISubprogram(name: "wctrans", scope: !1024, file: !1024, line: 52, type: !1074, flags: DIFlagPrototyped, spFlags: 0)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!1023, !290}
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1077, file: !1029, line: 105)
!1077 = !DISubprogram(name: "wctype", scope: !1032, file: !1032, line: 155, type: !1078, flags: DIFlagPrototyped, spFlags: 0)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!1031, !290}
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !584, file: !1081, line: 38)
!1081 = !DIFile(filename: "/usr/bin/../lib/gcc/x86_64-linux-gnu/7.5.0/../../../../include/c++/7.5.0/math.h", directory: "")
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !1083, file: !1081, line: 54)
!1083 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !2, file: !344, line: 380, type: !1084, flags: DIFlagPrototyped, spFlags: 0)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!565, !565, !1086}
!1086 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !565, size: 64)
!1087 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
!1088 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !408, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !23, retainedNodes: !1089)
!1089 = !{}
!1090 = !DILocation(line: 74, column: 25, scope: !1088)
!1091 = distinct !DISubprogram(name: "myCudaPrefetch", linkageName: "_Z14myCudaPrefetchPfi", scope: !24, file: !24, line: 4, type: !1092, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !1089)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{null, !284, !11}
!1094 = !DILocalVariable(name: "x", arg: 1, scope: !1091, file: !24, line: 4, type: !284)
!1095 = !DILocation(line: 4, column: 28, scope: !1091)
!1096 = !DILocalVariable(name: "s", arg: 2, scope: !1091, file: !24, line: 4, type: !11)
!1097 = !DILocation(line: 4, column: 35, scope: !1091)
!1098 = !DILocation(line: 6, column: 24, scope: !1091)
!1099 = !DILocation(line: 6, column: 27, scope: !1091)
!1100 = !DILocation(line: 6, column: 3, scope: !1091)
!1101 = !DILocation(line: 7, column: 1, scope: !1091)
!1102 = distinct !DISubprogram(name: "Myadd", linkageName: "_Z5MyaddiPfS_", scope: !24, file: !24, line: 13, type: !1103, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !1089)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{null, !11, !284, !284}
!1105 = !DILocalVariable(name: "n", arg: 1, scope: !1102, file: !24, line: 13, type: !11)
!1106 = !DILocation(line: 13, column: 16, scope: !1102)
!1107 = !DILocalVariable(name: "x", arg: 2, scope: !1102, file: !24, line: 13, type: !284)
!1108 = !DILocation(line: 13, column: 26, scope: !1102)
!1109 = !DILocalVariable(name: "y", arg: 3, scope: !1102, file: !24, line: 13, type: !284)
!1110 = !DILocation(line: 13, column: 36, scope: !1102)
!1111 = !DILocation(line: 14, column: 1, scope: !1102)
!1112 = !DILocation(line: 19, column: 1, scope: !1102)
!1113 = distinct !DISubprogram(name: "main", scope: !24, file: !24, line: 21, type: !491, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !1089)
!1114 = !DILocalVariable(name: "N", scope: !1113, file: !24, line: 23, type: !11)
!1115 = !DILocation(line: 23, column: 7, scope: !1113)
!1116 = !DILocalVariable(name: "x", scope: !1113, file: !24, line: 24, type: !284)
!1117 = !DILocation(line: 24, column: 10, scope: !1113)
!1118 = !DILocalVariable(name: "y", scope: !1113, file: !24, line: 24, type: !284)
!1119 = !DILocation(line: 24, column: 14, scope: !1113)
!1120 = !DILocalVariable(name: "stream", scope: !1113, file: !24, line: 26, type: !1121)
!1121 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaStream_t", file: !27, line: 2214, baseType: !1122)
!1122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1123, size: 64)
!1123 = !DICompositeType(tag: DW_TAG_structure_type, name: "CUstream_st", file: !1124, line: 266, flags: DIFlagFwdDecl, identifier: "_ZTS11CUstream_st")
!1124 = !DIFile(filename: "/usr/local/cuda-10.2/include/cuda.h", directory: "")
!1125 = !DILocation(line: 26, column: 16, scope: !1113)
!1126 = !DILocation(line: 27, column: 3, scope: !1113)
!1127 = !DILocation(line: 30, column: 25, scope: !1113)
!1128 = !DILocation(line: 30, column: 26, scope: !1113)
!1129 = !DILocation(line: 30, column: 3, scope: !1113)
!1130 = !DILocation(line: 31, column: 25, scope: !1113)
!1131 = !DILocation(line: 31, column: 26, scope: !1113)
!1132 = !DILocation(line: 31, column: 3, scope: !1113)
!1133 = !DILocalVariable(name: "i", scope: !1134, file: !24, line: 38, type: !11)
!1134 = distinct !DILexicalBlock(scope: !1113, file: !24, line: 38, column: 3)
!1135 = !DILocation(line: 38, column: 12, scope: !1134)
!1136 = !DILocation(line: 38, column: 8, scope: !1134)
!1137 = !DILocation(line: 38, column: 19, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1134, file: !24, line: 38, column: 3)
!1139 = !DILocation(line: 38, column: 23, scope: !1138)
!1140 = !DILocation(line: 38, column: 21, scope: !1138)
!1141 = !DILocation(line: 38, column: 3, scope: !1134)
!1142 = !DILocation(line: 39, column: 5, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !24, line: 38, column: 31)
!1144 = !DILocation(line: 39, column: 7, scope: !1143)
!1145 = !DILocation(line: 39, column: 10, scope: !1143)
!1146 = !DILocation(line: 40, column: 5, scope: !1143)
!1147 = !DILocation(line: 40, column: 7, scope: !1143)
!1148 = !DILocation(line: 40, column: 10, scope: !1143)
!1149 = !DILocation(line: 41, column: 3, scope: !1143)
!1150 = !DILocation(line: 38, column: 27, scope: !1138)
!1151 = !DILocation(line: 38, column: 3, scope: !1138)
!1152 = distinct !{!1152, !1141, !1153}
!1153 = !DILocation(line: 41, column: 3, scope: !1134)
!1154 = !DILocalVariable(name: "blockSize", scope: !1113, file: !24, line: 44, type: !11)
!1155 = !DILocation(line: 44, column: 7, scope: !1113)
!1156 = !DILocalVariable(name: "numBlocks", scope: !1113, file: !24, line: 45, type: !11)
!1157 = !DILocation(line: 45, column: 7, scope: !1113)
!1158 = !DILocation(line: 45, column: 20, scope: !1113)
!1159 = !DILocation(line: 45, column: 24, scope: !1113)
!1160 = !DILocation(line: 45, column: 22, scope: !1113)
!1161 = !DILocation(line: 45, column: 34, scope: !1113)
!1162 = !DILocation(line: 45, column: 41, scope: !1113)
!1163 = !DILocation(line: 45, column: 39, scope: !1113)
!1164 = !DILocation(line: 46, column: 11, scope: !1113)
!1165 = !DILocation(line: 46, column: 22, scope: !1113)
!1166 = !DILocation(line: 46, column: 8, scope: !1113)
!1167 = !DILocation(line: 46, column: 3, scope: !1113)
!1168 = !DILocation(line: 46, column: 35, scope: !1113)
!1169 = !DILocation(line: 46, column: 38, scope: !1113)
!1170 = !DILocation(line: 46, column: 41, scope: !1113)
!1171 = !DILocation(line: 49, column: 3, scope: !1113)
!1172 = !DILocalVariable(name: "maxError", scope: !1113, file: !24, line: 52, type: !154)
!1173 = !DILocation(line: 52, column: 9, scope: !1113)
!1174 = !DILocalVariable(name: "i", scope: !1175, file: !24, line: 53, type: !11)
!1175 = distinct !DILexicalBlock(scope: !1113, file: !24, line: 53, column: 3)
!1176 = !DILocation(line: 53, column: 12, scope: !1175)
!1177 = !DILocation(line: 53, column: 8, scope: !1175)
!1178 = !DILocation(line: 53, column: 19, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1175, file: !24, line: 53, column: 3)
!1180 = !DILocation(line: 53, column: 23, scope: !1179)
!1181 = !DILocation(line: 53, column: 21, scope: !1179)
!1182 = !DILocation(line: 53, column: 3, scope: !1175)
!1183 = !DILocation(line: 54, column: 21, scope: !1179)
!1184 = !DILocation(line: 54, column: 36, scope: !1179)
!1185 = !DILocation(line: 54, column: 38, scope: !1179)
!1186 = !DILocation(line: 54, column: 40, scope: !1179)
!1187 = !DILocation(line: 54, column: 31, scope: !1179)
!1188 = !DILocation(line: 54, column: 16, scope: !1179)
!1189 = !DILocation(line: 54, column: 14, scope: !1179)
!1190 = !DILocation(line: 54, column: 5, scope: !1179)
!1191 = !DILocation(line: 53, column: 27, scope: !1179)
!1192 = !DILocation(line: 53, column: 3, scope: !1179)
!1193 = distinct !{!1193, !1182, !1194}
!1194 = !DILocation(line: 54, column: 46, scope: !1175)
!1195 = !DILocation(line: 55, column: 13, scope: !1113)
!1196 = !DILocation(line: 55, column: 33, scope: !1113)
!1197 = !DILocation(line: 55, column: 30, scope: !1113)
!1198 = !DILocation(line: 55, column: 42, scope: !1113)
!1199 = !DILocation(line: 58, column: 12, scope: !1113)
!1200 = !DILocation(line: 58, column: 3, scope: !1113)
!1201 = !DILocation(line: 59, column: 12, scope: !1113)
!1202 = !DILocation(line: 59, column: 3, scope: !1113)
!1203 = !DILocation(line: 61, column: 3, scope: !1113)
!1204 = distinct !DISubprogram(name: "cudaMallocManaged<float>", linkageName: "_ZL17cudaMallocManagedIfE9cudaErrorPPT_mj", scope: !1205, file: !1205, line: 500, type: !1206, scopeLine: 505, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !23, templateParams: !1210, retainedNodes: !1089)
!1205 = !DIFile(filename: "/usr/local/cuda-10.2/include/cuda_runtime.h", directory: "")
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!1208, !1209, !431, !28}
!1208 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !27, line: 2209, baseType: !26)
!1209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !284, size: 64)
!1210 = !{!1211}
!1211 = !DITemplateTypeParameter(name: "T", type: !154)
!1212 = !DILocalVariable(name: "devPtr", arg: 1, scope: !1204, file: !1205, line: 501, type: !1209)
!1213 = !DILocation(line: 501, column: 18, scope: !1204)
!1214 = !DILocalVariable(name: "size", arg: 2, scope: !1204, file: !1205, line: 502, type: !431)
!1215 = !DILocation(line: 502, column: 18, scope: !1204)
!1216 = !DILocalVariable(name: "flags", arg: 3, scope: !1204, file: !1205, line: 503, type: !28)
!1217 = !DILocation(line: 503, column: 18, scope: !1204)
!1218 = !DILocation(line: 506, column: 45, scope: !1204)
!1219 = !DILocation(line: 506, column: 30, scope: !1204)
!1220 = !DILocation(line: 506, column: 53, scope: !1204)
!1221 = !DILocation(line: 506, column: 59, scope: !1204)
!1222 = !DILocation(line: 506, column: 10, scope: !1204)
!1223 = !DILocation(line: 506, column: 3, scope: !1204)
!1224 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1226, file: !1225, line: 425, type: !1232, scopeLine: 425, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, declaration: !1231, retainedNodes: !1089)
!1225 = !DIFile(filename: "/usr/local/cuda-10.2/include/vector_types.h", directory: "")
!1226 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1225, line: 416, size: 96, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !1227, identifier: "_ZTS4dim3")
!1227 = !{!1228, !1229, !1230, !1231, !1235, !1244}
!1228 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1226, file: !1225, line: 418, baseType: !28, size: 32)
!1229 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1226, file: !1225, line: 418, baseType: !28, size: 32, offset: 32)
!1230 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1226, file: !1225, line: 418, baseType: !28, size: 32, offset: 64)
!1231 = !DISubprogram(name: "dim3", scope: !1226, file: !1225, line: 425, type: !1232, scopeLine: 425, flags: DIFlagPrototyped, spFlags: 0)
!1232 = !DISubroutineType(types: !1233)
!1233 = !{null, !1234, !28, !28, !28}
!1234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1226, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1235 = !DISubprogram(name: "dim3", scope: !1226, file: !1225, line: 426, type: !1236, scopeLine: 426, flags: DIFlagPrototyped, spFlags: 0)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{null, !1234, !1238}
!1238 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1225, line: 382, baseType: !1239)
!1239 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1225, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1240, identifier: "_ZTS5uint3")
!1240 = !{!1241, !1242, !1243}
!1241 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1239, file: !1225, line: 192, baseType: !28, size: 32)
!1242 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1239, file: !1225, line: 192, baseType: !28, size: 32, offset: 32)
!1243 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1239, file: !1225, line: 192, baseType: !28, size: 32, offset: 64)
!1244 = !DISubprogram(name: "operator uint3", linkageName: "_ZNK4dim3cv5uint3Ev", scope: !1226, file: !1225, line: 427, type: !1245, scopeLine: 427, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!1238, !1247}
!1247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1248, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1248 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1226)
!1249 = !DILocalVariable(name: "this", arg: 1, scope: !1224, type: !1250, flags: DIFlagArtificial | DIFlagObjectPointer)
!1250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1226, size: 64)
!1251 = !DILocation(line: 0, scope: !1224)
!1252 = !DILocalVariable(name: "vx", arg: 2, scope: !1224, file: !1225, line: 425, type: !28)
!1253 = !DILocation(line: 425, column: 43, scope: !1224)
!1254 = !DILocalVariable(name: "vy", arg: 3, scope: !1224, file: !1225, line: 425, type: !28)
!1255 = !DILocation(line: 425, column: 64, scope: !1224)
!1256 = !DILocalVariable(name: "vz", arg: 4, scope: !1224, file: !1225, line: 425, type: !28)
!1257 = !DILocation(line: 425, column: 85, scope: !1224)
!1258 = !DILocation(line: 425, column: 95, scope: !1224)
!1259 = !DILocation(line: 425, column: 97, scope: !1224)
!1260 = !DILocation(line: 425, column: 102, scope: !1224)
!1261 = !DILocation(line: 425, column: 104, scope: !1224)
!1262 = !DILocation(line: 425, column: 109, scope: !1224)
!1263 = !DILocation(line: 425, column: 111, scope: !1224)
!1264 = !DILocation(line: 425, column: 116, scope: !1224)
!1265 = distinct !DISubprogram(name: "fabs", linkageName: "_ZSt4fabsf", scope: !2, file: !344, line: 241, type: !152, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !23, retainedNodes: !1089)
!1266 = !DILocalVariable(name: "__x", arg: 1, scope: !1265, file: !344, line: 241, type: !154)
!1267 = !DILocation(line: 241, column: 14, scope: !1265)
!1268 = !DILocation(line: 242, column: 28, scope: !1265)
!1269 = !DILocation(line: 242, column: 12, scope: !1265)
!1270 = !DILocation(line: 242, column: 5, scope: !1265)
!1271 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_um.cu", scope: !24, file: !24, type: !1272, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !23, retainedNodes: !1089)
!1272 = !DISubroutineType(types: !1089)
!1273 = !DILocation(line: 0, scope: !1271)
