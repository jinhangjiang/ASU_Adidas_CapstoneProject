??8
?!? 
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T?

value"T

output_ref"T?"	
Ttype"
validate_shapebool("
use_lockingbool(?
s
	AssignAdd
ref"T?

value"T

output_ref"T?" 
Ttype:
2	"
use_lockingbool( 
s
	AssignSub
ref"T?

value"T

output_ref"T?" 
Ttype:
2	"
use_lockingbool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
?
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

?
DepthwiseConv2dNative

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
FusedBatchNorm
x"T

scale"T
offset"T	
mean"T
variance"T
y"T

batch_mean"T
batch_variance"T
reserve_space_1"T
reserve_space_2"T"
Ttype:
2"
epsilonfloat%??8"-
data_formatstringNHWC:
NHWCNCHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
N
IsVariableInitialized
ref"dtype?
is_initialized
"
dtypetype?
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
?
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
;
Minimum
x"T
y"T
z"T"
Ttype:

2	?
=
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
_
Pad

input"T
paddings"	Tpaddings
output"T"	
Ttype"
	Tpaddingstype0:
2	
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
6
Pow
x"T
y"T
z"T"
Ttype:

2	
?
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
s

VariableV2
ref"dtype?"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ?"serve*1.12.02v1.12.0-0-ga6d8ffae09??2
~
input_1Placeholder*
dtype0*1
_output_shapes
:???????????*&
shape:???????????
?
conv1_pad/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv1_pad/PadPadinput_1conv1_pad/Pad/paddings*
T0*
	Tpaddings0*1
_output_shapes
:???????????
s
conv1/random_uniform/shapeConst*%
valueB"             *
dtype0*
_output_shapes
:
]
conv1/random_uniform/minConst*
valueB
 *OS?*
dtype0*
_output_shapes
: 
]
conv1/random_uniform/maxConst*
valueB
 *OS>*
dtype0*
_output_shapes
: 
?
"conv1/random_uniform/RandomUniformRandomUniformconv1/random_uniform/shape*
seed???)*
T0*
dtype0*&
_output_shapes
: *
seed2???
t
conv1/random_uniform/subSubconv1/random_uniform/maxconv1/random_uniform/min*
T0*
_output_shapes
: 
?
conv1/random_uniform/mulMul"conv1/random_uniform/RandomUniformconv1/random_uniform/sub*
T0*&
_output_shapes
: 
?
conv1/random_uniformAddconv1/random_uniform/mulconv1/random_uniform/min*
T0*&
_output_shapes
: 
?
conv1/kernel
VariableV2*
shared_name *
dtype0*&
_output_shapes
: *
	container *
shape: 
?
conv1/kernel/AssignAssignconv1/kernelconv1/random_uniform*
use_locking(*
T0*
_class
loc:@conv1/kernel*
validate_shape(*&
_output_shapes
: 
}
conv1/kernel/readIdentityconv1/kernel*&
_output_shapes
: *
T0*
_class
loc:@conv1/kernel
p
conv1/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv1/convolutionConv2Dconv1_pad/Padconv1/kernel/read*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*/
_output_shapes
:?????????pp *
	dilations
*
T0
[
conv1_bn/ConstConst*
dtype0*
_output_shapes
: *
valueB *  ??
z
conv1_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
?
conv1_bn/gamma/AssignAssignconv1_bn/gammaconv1_bn/Const*!
_class
loc:@conv1_bn/gamma*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
w
conv1_bn/gamma/readIdentityconv1_bn/gamma*
_output_shapes
: *
T0*!
_class
loc:@conv1_bn/gamma
]
conv1_bn/Const_1Const*
dtype0*
_output_shapes
: *
valueB *    
y
conv1_bn/beta
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
?
conv1_bn/beta/AssignAssignconv1_bn/betaconv1_bn/Const_1*
use_locking(*
T0* 
_class
loc:@conv1_bn/beta*
validate_shape(*
_output_shapes
: 
t
conv1_bn/beta/readIdentityconv1_bn/beta*
T0* 
_class
loc:@conv1_bn/beta*
_output_shapes
: 
]
conv1_bn/Const_2Const*
dtype0*
_output_shapes
: *
valueB *    
?
conv1_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
?
conv1_bn/moving_mean/AssignAssignconv1_bn/moving_meanconv1_bn/Const_2*
use_locking(*
T0*'
_class
loc:@conv1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
conv1_bn/moving_mean/readIdentityconv1_bn/moving_mean*
_output_shapes
: *
T0*'
_class
loc:@conv1_bn/moving_mean
]
conv1_bn/Const_3Const*
valueB *  ??*
dtype0*
_output_shapes
: 
?
conv1_bn/moving_variance
VariableV2*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
?
conv1_bn/moving_variance/AssignAssignconv1_bn/moving_varianceconv1_bn/Const_3*
use_locking(*
T0*+
_class!
loc:@conv1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
conv1_bn/moving_variance/readIdentityconv1_bn/moving_variance*
_output_shapes
: *
T0*+
_class!
loc:@conv1_bn/moving_variance
?
conv1_bn/IsVariableInitializedIsVariableInitializedconv1/kernel*
_class
loc:@conv1/kernel*
dtype0*
_output_shapes
: 
?
 conv1_bn/IsVariableInitialized_1IsVariableInitializedconv1_bn/gamma*!
_class
loc:@conv1_bn/gamma*
dtype0*
_output_shapes
: 
?
 conv1_bn/IsVariableInitialized_2IsVariableInitializedconv1_bn/beta* 
_class
loc:@conv1_bn/beta*
dtype0*
_output_shapes
: 
?
 conv1_bn/IsVariableInitialized_3IsVariableInitializedconv1_bn/moving_mean*'
_class
loc:@conv1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
 conv1_bn/IsVariableInitialized_4IsVariableInitializedconv1_bn/moving_variance*
dtype0*
_output_shapes
: *+
_class!
loc:@conv1_bn/moving_variance
?
conv1_bn/initNoOp^conv1/kernel/Assign^conv1_bn/beta/Assign^conv1_bn/gamma/Assign^conv1_bn/moving_mean/Assign ^conv1_bn/moving_variance/Assign
S
conv1_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
S
conv1_bn/Const_5Const*
dtype0*
_output_shapes
: *
valueB 
?
conv1_bn/FusedBatchNormFusedBatchNormconv1/convolutionconv1_bn/gamma/readconv1_bn/beta/readconv1_bn/Const_4conv1_bn/Const_5*
T0*
data_formatNHWC*G
_output_shapes5
3:?????????pp : : : : *
is_training(*
epsilon%o?:
_
conv1_bn/ShapeShapeconv1/convolution*
T0*
out_type0*
_output_shapes
:
f
conv1_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
h
conv1_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
h
conv1_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv1_bn/strided_sliceStridedSliceconv1_bn/Shapeconv1_bn/strided_slice/stackconv1_bn/strided_slice/stack_1conv1_bn/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
a
conv1_bn/Shape_1Shapeconv1/convolution*
T0*
out_type0*
_output_shapes
:
h
conv1_bn/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
j
 conv1_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
j
 conv1_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv1_bn/strided_slice_1StridedSliceconv1_bn/Shape_1conv1_bn/strided_slice_1/stack conv1_bn/strided_slice_1/stack_1 conv1_bn/strided_slice_1/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
a
conv1_bn/Shape_2Shapeconv1/convolution*
T0*
out_type0*
_output_shapes
:
h
conv1_bn/strided_slice_2/stackConst*
_output_shapes
:*
valueB:*
dtype0
j
 conv1_bn/strided_slice_2/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
j
 conv1_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv1_bn/strided_slice_2StridedSliceconv1_bn/Shape_2conv1_bn/strided_slice_2/stack conv1_bn/strided_slice_2/stack_1 conv1_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
conv1_bn/Rank/packedPackconv1_bn/strided_sliceconv1_bn/strided_slice_1conv1_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
O
conv1_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
V
conv1_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
V
conv1_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
z
conv1_bn/rangeRangeconv1_bn/range/startconv1_bn/Rankconv1_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv1_bn/Prod/inputPackconv1_bn/strided_sliceconv1_bn/strided_slice_1conv1_bn/strided_slice_2*

axis *
N*
_output_shapes
:*
T0
x
conv1_bn/ProdProdconv1_bn/Prod/inputconv1_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
d
conv1_bn/CastCastconv1_bn/Prod*
_output_shapes
: *

DstT0*

SrcT0*
Truncate( 
S
conv1_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
S
conv1_bn/subSubconv1_bn/Castconv1_bn/sub/y*
_output_shapes
: *
T0
Y
conv1_bn/truedivRealDivconv1_bn/Castconv1_bn/sub*
T0*
_output_shapes
: 
e
conv1_bn/mulMulconv1_bn/FusedBatchNorm:2conv1_bn/truediv*
T0*
_output_shapes
: 
?
conv1_bn/AssignMovingAvg/decayConst*'
_class
loc:@conv1_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/zerosConst*
_output_shapes
: *'
_class
loc:@conv1_bn/moving_mean*
valueB *    *
dtype0
?
conv1_bn/moving_mean/biased
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *'
_class
loc:@conv1_bn/moving_mean
?
"conv1_bn/moving_mean/biased/AssignAssignconv1_bn/moving_mean/biased3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/zeros*
T0*'
_class
loc:@conv1_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
 conv1_bn/moving_mean/biased/readIdentityconv1_bn/moving_mean/biased*
T0*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: 
?
1conv1_bn/moving_mean/local_step/Initializer/zerosConst*'
_class
loc:@conv1_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
conv1_bn/moving_mean/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *'
_class
loc:@conv1_bn/moving_mean*
	container *
shape: 
?
&conv1_bn/moving_mean/local_step/AssignAssignconv1_bn/moving_mean/local_step1conv1_bn/moving_mean/local_step/Initializer/zeros*
T0*'
_class
loc:@conv1_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
$conv1_bn/moving_mean/local_step/readIdentityconv1_bn/moving_mean/local_step*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: *
T0
?
1conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/subSub conv1_bn/moving_mean/biased/readconv1_bn/FusedBatchNorm:1*
T0*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: 
?
1conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/mulMul1conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/subconv1_bn/AssignMovingAvg/decay*
_output_shapes
: *
T0*'
_class
loc:@conv1_bn/moving_mean
?
Bconv1_bn/AssignMovingAvg/conv1_bn/moving_mean/conv1_bn/moving_mean	AssignSubconv1_bn/moving_mean/biased1conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/mul*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: *
use_locking( *
T0
?
=conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/AssignAdd/valueConst*
dtype0*
_output_shapes
: *'
_class
loc:@conv1_bn/moving_mean*
valueB
 *  ??
?
7conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/AssignAdd	AssignAddconv1_bn/moving_mean/local_step=conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*'
_class
loc:@conv1_bn/moving_mean
?
2conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/readIdentityconv1_bn/moving_mean/biased8^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/AssignAddC^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/conv1_bn/moving_mean*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: *
T0
?
5conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_1/xConst8^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/AssignAddC^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/conv1_bn/moving_mean*'
_class
loc:@conv1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_1Sub5conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_1/xconv1_bn/AssignMovingAvg/decay*
T0*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: 
?
4conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/read_1Identityconv1_bn/moving_mean/local_step8^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/AssignAddC^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/conv1_bn/moving_mean*
T0*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: 
?
1conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/PowPow3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_14conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/read_1*
_output_shapes
: *
T0*'
_class
loc:@conv1_bn/moving_mean
?
5conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_2/xConst8^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/AssignAddC^conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/conv1_bn/moving_mean*'
_class
loc:@conv1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_2Sub5conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_2/x1conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/Pow*
_output_shapes
: *
T0*'
_class
loc:@conv1_bn/moving_mean
?
5conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/truedivRealDiv2conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/read3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_2*
T0*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: 
?
3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_3Subconv1_bn/moving_mean/read5conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/truediv*
T0*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: 
?
conv1_bn/AssignMovingAvg	AssignSubconv1_bn/moving_mean3conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/sub_3*
T0*'
_class
loc:@conv1_bn/moving_mean*
_output_shapes
: *
use_locking( 
?
 conv1_bn/AssignMovingAvg_1/decayConst*+
_class!
loc:@conv1_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/zerosConst*+
_class!
loc:@conv1_bn/moving_variance*
valueB *    *
dtype0*
_output_shapes
: 
?
conv1_bn/moving_variance/biased
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv1_bn/moving_variance*
	container *
shape: 
?
&conv1_bn/moving_variance/biased/AssignAssignconv1_bn/moving_variance/biased9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/zeros*
use_locking(*
T0*+
_class!
loc:@conv1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
$conv1_bn/moving_variance/biased/readIdentityconv1_bn/moving_variance/biased*
_output_shapes
: *
T0*+
_class!
loc:@conv1_bn/moving_variance
?
5conv1_bn/moving_variance/local_step/Initializer/zerosConst*+
_class!
loc:@conv1_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv1_bn/moving_variance/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv1_bn/moving_variance*
	container *
shape: 
?
*conv1_bn/moving_variance/local_step/AssignAssign#conv1_bn/moving_variance/local_step5conv1_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
(conv1_bn/moving_variance/local_step/readIdentity#conv1_bn/moving_variance/local_step*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: 
?
7conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/subSub$conv1_bn/moving_variance/biased/readconv1_bn/mul*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: 
?
7conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/mulMul7conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub conv1_bn/AssignMovingAvg_1/decay*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: 
?
Lconv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/conv1_bn/moving_variance	AssignSubconv1_bn/moving_variance/biased7conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/mul*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: *
use_locking( 
?
Cconv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/AssignAdd/valueConst*+
_class!
loc:@conv1_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/AssignAdd	AssignAdd#conv1_bn/moving_variance/local_stepCconv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/AssignAdd/value*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: *
use_locking( *
T0
?
8conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/readIdentityconv1_bn/moving_variance/biased>^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/AssignAddM^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/conv1_bn/moving_variance*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: 
?
;conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_1/xConst>^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/AssignAddM^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/conv1_bn/moving_variance*+
_class!
loc:@conv1_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_1Sub;conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_1/x conv1_bn/AssignMovingAvg_1/decay*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: 
?
:conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/read_1Identity#conv1_bn/moving_variance/local_step>^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/AssignAddM^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/conv1_bn/moving_variance*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: 
?
7conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/PowPow9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_1:conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/read_1*
_output_shapes
: *
T0*+
_class!
loc:@conv1_bn/moving_variance
?
;conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_2/xConst>^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/AssignAddM^conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/conv1_bn/moving_variance*+
_class!
loc:@conv1_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_2Sub;conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_2/x7conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/Pow*
T0*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: 
?
;conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/truedivRealDiv8conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/read9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_2*
_output_shapes
: *
T0*+
_class!
loc:@conv1_bn/moving_variance
?
9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_3Subconv1_bn/moving_variance/read;conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/truediv*
_output_shapes
: *
T0*+
_class!
loc:@conv1_bn/moving_variance
?
conv1_bn/AssignMovingAvg_1	AssignSubconv1_bn/moving_variance9conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/sub_3*+
_class!
loc:@conv1_bn/moving_variance*
_output_shapes
: *
use_locking( *
T0
e
#conv1_bn/keras_learning_phase/inputConst*
_output_shapes
: *
value	B
 Z *
dtype0

?
conv1_bn/keras_learning_phasePlaceholderWithDefault#conv1_bn/keras_learning_phase/input*
shape: *
dtype0
*
_output_shapes
: 

conv1_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
[
conv1_bn/cond/switch_tIdentityconv1_bn/cond/Switch:1*
_output_shapes
: *
T0

Y
conv1_bn/cond/switch_fIdentityconv1_bn/cond/Switch*
_output_shapes
: *
T0

a
conv1_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv1_bn/cond/Switch_1Switchconv1_bn/FusedBatchNormconv1_bn/cond/pred_id*
T0**
_class 
loc:@conv1_bn/FusedBatchNorm*J
_output_shapes8
6:?????????pp :?????????pp 
{
conv1_bn/cond/batchnorm/add/yConst^conv1_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv1_bn/cond/batchnorm/addAdd"conv1_bn/cond/batchnorm/add/Switchconv1_bn/cond/batchnorm/add/y*
T0*
_output_shapes
: 
?
"conv1_bn/cond/batchnorm/add/SwitchSwitchconv1_bn/moving_variance/readconv1_bn/cond/pred_id* 
_output_shapes
: : *
T0*+
_class!
loc:@conv1_bn/moving_variance
h
conv1_bn/cond/batchnorm/RsqrtRsqrtconv1_bn/cond/batchnorm/add*
T0*
_output_shapes
: 
?
conv1_bn/cond/batchnorm/mulMulconv1_bn/cond/batchnorm/Rsqrt"conv1_bn/cond/batchnorm/mul/Switch*
_output_shapes
: *
T0
?
"conv1_bn/cond/batchnorm/mul/SwitchSwitchconv1_bn/gamma/readconv1_bn/cond/pred_id*
T0*!
_class
loc:@conv1_bn/gamma* 
_output_shapes
: : 
?
conv1_bn/cond/batchnorm/mul_1Mul$conv1_bn/cond/batchnorm/mul_1/Switchconv1_bn/cond/batchnorm/mul*
T0*/
_output_shapes
:?????????pp 
?
$conv1_bn/cond/batchnorm/mul_1/SwitchSwitchconv1/convolutionconv1_bn/cond/pred_id*
T0*$
_class
loc:@conv1/convolution*J
_output_shapes8
6:?????????pp :?????????pp 
?
conv1_bn/cond/batchnorm/mul_2Mul$conv1_bn/cond/batchnorm/mul_2/Switchconv1_bn/cond/batchnorm/mul*
T0*
_output_shapes
: 
?
$conv1_bn/cond/batchnorm/mul_2/SwitchSwitchconv1_bn/moving_mean/readconv1_bn/cond/pred_id*
T0*'
_class
loc:@conv1_bn/moving_mean* 
_output_shapes
: : 
?
conv1_bn/cond/batchnorm/subSub"conv1_bn/cond/batchnorm/sub/Switchconv1_bn/cond/batchnorm/mul_2*
_output_shapes
: *
T0
?
"conv1_bn/cond/batchnorm/sub/SwitchSwitchconv1_bn/beta/readconv1_bn/cond/pred_id*
T0* 
_class
loc:@conv1_bn/beta* 
_output_shapes
: : 
?
conv1_bn/cond/batchnorm/add_1Addconv1_bn/cond/batchnorm/mul_1conv1_bn/cond/batchnorm/sub*
T0*/
_output_shapes
:?????????pp 
?
conv1_bn/cond/MergeMergeconv1_bn/cond/batchnorm/add_1conv1_bn/cond/Switch_1:1*
T0*
N*1
_output_shapes
:?????????pp : 
f
conv1_relu/ReluReluconv1_bn/cond/Merge*
T0*/
_output_shapes
:?????????pp 
U
conv1_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
z
conv1_relu/MinimumMinimumconv1_relu/Reluconv1_relu/Const*/
_output_shapes
:?????????pp *
T0
?
conv_pad_1/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_1/PadPadconv1_relu/Minimumconv_pad_1/Pad/paddings*
	Tpaddings0*/
_output_shapes
:?????????rr *
T0
w
conv_dw_1/random_uniform/shapeConst*%
valueB"             *
dtype0*
_output_shapes
:
a
conv_dw_1/random_uniform/minConst*
valueB
 *???*
dtype0*
_output_shapes
: 
a
conv_dw_1/random_uniform/maxConst*
valueB
 *??>*
dtype0*
_output_shapes
: 
?
&conv_dw_1/random_uniform/RandomUniformRandomUniformconv_dw_1/random_uniform/shape*
T0*
dtype0*&
_output_shapes
: *
seed2???*
seed???)
?
conv_dw_1/random_uniform/subSubconv_dw_1/random_uniform/maxconv_dw_1/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_1/random_uniform/mulMul&conv_dw_1/random_uniform/RandomUniformconv_dw_1/random_uniform/sub*&
_output_shapes
: *
T0
?
conv_dw_1/random_uniformAddconv_dw_1/random_uniform/mulconv_dw_1/random_uniform/min*&
_output_shapes
: *
T0
?
conv_dw_1/depthwise_kernel
VariableV2*
dtype0*&
_output_shapes
: *
	container *
shape: *
shared_name 
?
!conv_dw_1/depthwise_kernel/AssignAssignconv_dw_1/depthwise_kernelconv_dw_1/random_uniform*-
_class#
!loc:@conv_dw_1/depthwise_kernel*
validate_shape(*&
_output_shapes
: *
use_locking(*
T0
?
conv_dw_1/depthwise_kernel/readIdentityconv_dw_1/depthwise_kernel*
T0*-
_class#
!loc:@conv_dw_1/depthwise_kernel*&
_output_shapes
: 
r
conv_dw_1/depthwise/ShapeConst*%
valueB"             *
dtype0*
_output_shapes
:
r
!conv_dw_1/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_1/depthwiseDepthwiseConv2dNativeconv_pad_1/Padconv_dw_1/depthwise_kernel/read*
T0*
data_formatNHWC*
strides
*
paddingVALID*/
_output_shapes
:?????????pp *
	dilations

_
conv_dw_1_bn/ConstConst*
valueB *  ??*
dtype0*
_output_shapes
: 
~
conv_dw_1_bn/gamma
VariableV2*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
?
conv_dw_1_bn/gamma/AssignAssignconv_dw_1_bn/gammaconv_dw_1_bn/Const*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*%
_class
loc:@conv_dw_1_bn/gamma
?
conv_dw_1_bn/gamma/readIdentityconv_dw_1_bn/gamma*
_output_shapes
: *
T0*%
_class
loc:@conv_dw_1_bn/gamma
a
conv_dw_1_bn/Const_1Const*
valueB *    *
dtype0*
_output_shapes
: 
}
conv_dw_1_bn/beta
VariableV2*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
?
conv_dw_1_bn/beta/AssignAssignconv_dw_1_bn/betaconv_dw_1_bn/Const_1*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*$
_class
loc:@conv_dw_1_bn/beta
?
conv_dw_1_bn/beta/readIdentityconv_dw_1_bn/beta*
T0*$
_class
loc:@conv_dw_1_bn/beta*
_output_shapes
: 
a
conv_dw_1_bn/Const_2Const*
dtype0*
_output_shapes
: *
valueB *    
?
conv_dw_1_bn/moving_mean
VariableV2*
shape: *
shared_name *
dtype0*
_output_shapes
: *
	container 
?
conv_dw_1_bn/moving_mean/AssignAssignconv_dw_1_bn/moving_meanconv_dw_1_bn/Const_2*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
conv_dw_1_bn/moving_mean/readIdentityconv_dw_1_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
a
conv_dw_1_bn/Const_3Const*
valueB *  ??*
dtype0*
_output_shapes
: 
?
conv_dw_1_bn/moving_variance
VariableV2*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
?
#conv_dw_1_bn/moving_variance/AssignAssignconv_dw_1_bn/moving_varianceconv_dw_1_bn/Const_3*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(
?
!conv_dw_1_bn/moving_variance/readIdentityconv_dw_1_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
W
conv_dw_1_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_dw_1_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_1_bn/FusedBatchNormFusedBatchNormconv_dw_1/depthwiseconv_dw_1_bn/gamma/readconv_dw_1_bn/beta/readconv_dw_1_bn/Const_4conv_dw_1_bn/Const_5*G
_output_shapes5
3:?????????pp : : : : *
is_training(*
epsilon%o?:*
T0*
data_formatNHWC
e
conv_dw_1_bn/ShapeShapeconv_dw_1/depthwise*
_output_shapes
:*
T0*
out_type0
j
 conv_dw_1_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_dw_1_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_dw_1_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_1_bn/strided_sliceStridedSliceconv_dw_1_bn/Shape conv_dw_1_bn/strided_slice/stack"conv_dw_1_bn/strided_slice/stack_1"conv_dw_1_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
g
conv_dw_1_bn/Shape_1Shapeconv_dw_1/depthwise*
_output_shapes
:*
T0*
out_type0
l
"conv_dw_1_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_1_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_1_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_1_bn/strided_slice_1StridedSliceconv_dw_1_bn/Shape_1"conv_dw_1_bn/strided_slice_1/stack$conv_dw_1_bn/strided_slice_1/stack_1$conv_dw_1_bn/strided_slice_1/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
g
conv_dw_1_bn/Shape_2Shapeconv_dw_1/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_1_bn/strided_slice_2/stackConst*
_output_shapes
:*
valueB:*
dtype0
n
$conv_dw_1_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_1_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_1_bn/strided_slice_2StridedSliceconv_dw_1_bn/Shape_2"conv_dw_1_bn/strided_slice_2/stack$conv_dw_1_bn/strided_slice_2/stack_1$conv_dw_1_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
conv_dw_1_bn/Rank/packedPackconv_dw_1_bn/strided_sliceconv_dw_1_bn/strided_slice_1conv_dw_1_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_1_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_dw_1_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_dw_1_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_1_bn/rangeRangeconv_dw_1_bn/range/startconv_dw_1_bn/Rankconv_dw_1_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_1_bn/Prod/inputPackconv_dw_1_bn/strided_sliceconv_dw_1_bn/strided_slice_1conv_dw_1_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_1_bn/ProdProdconv_dw_1_bn/Prod/inputconv_dw_1_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
l
conv_dw_1_bn/CastCastconv_dw_1_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_1_bn/sub/yConst*
_output_shapes
: *
valueB
 *? ??*
dtype0
_
conv_dw_1_bn/subSubconv_dw_1_bn/Castconv_dw_1_bn/sub/y*
_output_shapes
: *
T0
e
conv_dw_1_bn/truedivRealDivconv_dw_1_bn/Castconv_dw_1_bn/sub*
T0*
_output_shapes
: 
q
conv_dw_1_bn/mulMulconv_dw_1_bn/FusedBatchNorm:2conv_dw_1_bn/truediv*
T0*
_output_shapes
: 
?
"conv_dw_1_bn/AssignMovingAvg/decayConst*
_output_shapes
: *+
_class!
loc:@conv_dw_1_bn/moving_mean*
valueB
 *
?#<*
dtype0
?
;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/zerosConst*+
_class!
loc:@conv_dw_1_bn/moving_mean*
valueB *    *
dtype0*
_output_shapes
: 
?
conv_dw_1_bn/moving_mean/biased
VariableV2*
shared_name *+
_class!
loc:@conv_dw_1_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
&conv_dw_1_bn/moving_mean/biased/AssignAssignconv_dw_1_bn/moving_mean/biased;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
$conv_dw_1_bn/moving_mean/biased/readIdentityconv_dw_1_bn/moving_mean/biased*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean
?
5conv_dw_1_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_1_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_1_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_dw_1_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_dw_1_bn/moving_mean/local_step/AssignAssign#conv_dw_1_bn/moving_mean/local_step5conv_dw_1_bn/moving_mean/local_step/Initializer/zeros*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
validate_shape(
?
(conv_dw_1_bn/moving_mean/local_step/readIdentity#conv_dw_1_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: *
T0
?
9conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/subSub$conv_dw_1_bn/moving_mean/biased/readconv_dw_1_bn/FusedBatchNorm:1*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean
?
9conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/mulMul9conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub"conv_dw_1_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
Nconv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/conv_dw_1_bn/moving_mean	AssignSubconv_dw_1_bn/moving_mean/biased9conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
Econv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_dw_1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_1_bn/moving_mean/local_stepEconv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean
?
:conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/readIdentityconv_dw_1_bn/moving_mean/biased@^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/AssignAddO^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/conv_dw_1_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_1/xConst@^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/AssignAddO^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/conv_dw_1_bn/moving_mean*+
_class!
loc:@conv_dw_1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_1Sub=conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_1/x"conv_dw_1_bn/AssignMovingAvg/decay*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: *
T0
?
<conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/read_1Identity#conv_dw_1_bn/moving_mean/local_step@^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/AssignAddO^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/conv_dw_1_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/PowPow;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_1<conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_2/xConst@^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/AssignAddO^conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/conv_dw_1_bn/moving_mean*+
_class!
loc:@conv_dw_1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_2Sub=conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_2/x9conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/Pow*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean
?
=conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/truedivRealDiv:conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/read;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_3Subconv_dw_1_bn/moving_mean/read=conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
conv_dw_1_bn/AssignMovingAvg	AssignSubconv_dw_1_bn/moving_mean;conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
_output_shapes
: 
?
$conv_dw_1_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
valueB *    *
dtype0*
_output_shapes
: 
?
#conv_dw_1_bn/moving_variance/biased
VariableV2*
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_dw_1_bn/moving_variance*
	container *
shape: 
?
*conv_dw_1_bn/moving_variance/biased/AssignAssign#conv_dw_1_bn/moving_variance/biasedAconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
(conv_dw_1_bn/moving_variance/biased/readIdentity#conv_dw_1_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
9conv_dw_1_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_dw_1_bn/moving_variance/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_dw_1_bn/moving_variance*
	container *
shape: 
?
.conv_dw_1_bn/moving_variance/local_step/AssignAssign'conv_dw_1_bn/moving_variance/local_step9conv_dw_1_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_dw_1_bn/moving_variance/local_step/readIdentity'conv_dw_1_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: *
T0
?
?conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/subSub(conv_dw_1_bn/moving_variance/biased/readconv_dw_1_bn/mul*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance
?
?conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/mulMul?conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub$conv_dw_1_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
Xconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/conv_dw_1_bn/moving_variance	AssignSub#conv_dw_1_bn/moving_variance/biased?conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
Kconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_1_bn/moving_variance/local_stepKconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
@conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/readIdentity#conv_dw_1_bn/moving_variance/biasedF^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/AssignAddY^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/conv_dw_1_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_1/xConstF^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/AssignAddY^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/conv_dw_1_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_1_bn/moving_variance*
valueB
 *  ??
?
Aconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_1SubCconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_1/x$conv_dw_1_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/read_1Identity'conv_dw_1_bn/moving_variance/local_stepF^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/AssignAddY^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/conv_dw_1_bn/moving_variance*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: *
T0
?
?conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/PowPowAconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_1Bconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_2/xConstF^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/AssignAddY^conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/conv_dw_1_bn/moving_variance*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_2SubCconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_2/x?conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/Pow*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance
?
Cconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/truedivRealDiv@conv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/readAconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
Aconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_3Sub!conv_dw_1_bn/moving_variance/readCconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
_output_shapes
: 
?
conv_dw_1_bn/AssignMovingAvg_1	AssignSubconv_dw_1_bn/moving_varianceAconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/sub_3*
_output_shapes
: *
use_locking( *
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance
?
conv_dw_1_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_dw_1_bn/cond/switch_tIdentityconv_dw_1_bn/cond/Switch:1*
_output_shapes
: *
T0

a
conv_dw_1_bn/cond/switch_fIdentityconv_dw_1_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_dw_1_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
_output_shapes
: *
T0

?
conv_dw_1_bn/cond/Switch_1Switchconv_dw_1_bn/FusedBatchNormconv_dw_1_bn/cond/pred_id*J
_output_shapes8
6:?????????pp :?????????pp *
T0*.
_class$
" loc:@conv_dw_1_bn/FusedBatchNorm
?
!conv_dw_1_bn/cond/batchnorm/add/yConst^conv_dw_1_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_1_bn/cond/batchnorm/addAdd&conv_dw_1_bn/cond/batchnorm/add/Switch!conv_dw_1_bn/cond/batchnorm/add/y*
T0*
_output_shapes
: 
?
&conv_dw_1_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_1_bn/moving_variance/readconv_dw_1_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance* 
_output_shapes
: : 
p
!conv_dw_1_bn/cond/batchnorm/RsqrtRsqrtconv_dw_1_bn/cond/batchnorm/add*
T0*
_output_shapes
: 
?
conv_dw_1_bn/cond/batchnorm/mulMul!conv_dw_1_bn/cond/batchnorm/Rsqrt&conv_dw_1_bn/cond/batchnorm/mul/Switch*
_output_shapes
: *
T0
?
&conv_dw_1_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_1_bn/gamma/readconv_dw_1_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_1_bn/gamma* 
_output_shapes
: : 
?
!conv_dw_1_bn/cond/batchnorm/mul_1Mul(conv_dw_1_bn/cond/batchnorm/mul_1/Switchconv_dw_1_bn/cond/batchnorm/mul*/
_output_shapes
:?????????pp *
T0
?
(conv_dw_1_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_1/depthwiseconv_dw_1_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_1/depthwise*J
_output_shapes8
6:?????????pp :?????????pp 
?
!conv_dw_1_bn/cond/batchnorm/mul_2Mul(conv_dw_1_bn/cond/batchnorm/mul_2/Switchconv_dw_1_bn/cond/batchnorm/mul*
T0*
_output_shapes
: 
?
(conv_dw_1_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_1_bn/moving_mean/readconv_dw_1_bn/cond/pred_id*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean* 
_output_shapes
: : 
?
conv_dw_1_bn/cond/batchnorm/subSub&conv_dw_1_bn/cond/batchnorm/sub/Switch!conv_dw_1_bn/cond/batchnorm/mul_2*
T0*
_output_shapes
: 
?
&conv_dw_1_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_1_bn/beta/readconv_dw_1_bn/cond/pred_id*$
_class
loc:@conv_dw_1_bn/beta* 
_output_shapes
: : *
T0
?
!conv_dw_1_bn/cond/batchnorm/add_1Add!conv_dw_1_bn/cond/batchnorm/mul_1conv_dw_1_bn/cond/batchnorm/sub*
T0*/
_output_shapes
:?????????pp 
?
conv_dw_1_bn/cond/MergeMerge!conv_dw_1_bn/cond/batchnorm/add_1conv_dw_1_bn/cond/Switch_1:1*
N*1
_output_shapes
:?????????pp : *
T0
n
conv_dw_1_relu/ReluReluconv_dw_1_bn/cond/Merge*/
_output_shapes
:?????????pp *
T0
Y
conv_dw_1_relu/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?@
?
conv_dw_1_relu/MinimumMinimumconv_dw_1_relu/Reluconv_dw_1_relu/Const*
T0*/
_output_shapes
:?????????pp 
w
conv_pw_1/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"          @   
a
conv_pw_1/random_uniform/minConst*
_output_shapes
: *
valueB
 *  ??*
dtype0
a
conv_pw_1/random_uniform/maxConst*
valueB
 *  ?>*
dtype0*
_output_shapes
: 
?
&conv_pw_1/random_uniform/RandomUniformRandomUniformconv_pw_1/random_uniform/shape*
seed???)*
T0*
dtype0*&
_output_shapes
: @*
seed2??
?
conv_pw_1/random_uniform/subSubconv_pw_1/random_uniform/maxconv_pw_1/random_uniform/min*
T0*
_output_shapes
: 
?
conv_pw_1/random_uniform/mulMul&conv_pw_1/random_uniform/RandomUniformconv_pw_1/random_uniform/sub*
T0*&
_output_shapes
: @
?
conv_pw_1/random_uniformAddconv_pw_1/random_uniform/mulconv_pw_1/random_uniform/min*&
_output_shapes
: @*
T0
?
conv_pw_1/kernel
VariableV2*
dtype0*&
_output_shapes
: @*
	container *
shape: @*
shared_name 
?
conv_pw_1/kernel/AssignAssignconv_pw_1/kernelconv_pw_1/random_uniform*
use_locking(*
T0*#
_class
loc:@conv_pw_1/kernel*
validate_shape(*&
_output_shapes
: @
?
conv_pw_1/kernel/readIdentityconv_pw_1/kernel*&
_output_shapes
: @*
T0*#
_class
loc:@conv_pw_1/kernel
t
#conv_pw_1/convolution/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
conv_pw_1/convolutionConv2Dconv_dw_1_relu/Minimumconv_pw_1/kernel/read*
use_cudnn_on_gpu(*
paddingSAME*/
_output_shapes
:?????????pp@*
	dilations
*
T0*
data_formatNHWC*
strides

_
conv_pw_1_bn/ConstConst*
valueB@*  ??*
dtype0*
_output_shapes
:@
~
conv_pw_1_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes
:@*
	container *
shape:@
?
conv_pw_1_bn/gamma/AssignAssignconv_pw_1_bn/gammaconv_pw_1_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_pw_1_bn/gamma*
validate_shape(*
_output_shapes
:@
?
conv_pw_1_bn/gamma/readIdentityconv_pw_1_bn/gamma*
_output_shapes
:@*
T0*%
_class
loc:@conv_pw_1_bn/gamma
a
conv_pw_1_bn/Const_1Const*
valueB@*    *
dtype0*
_output_shapes
:@
}
conv_pw_1_bn/beta
VariableV2*
_output_shapes
:@*
	container *
shape:@*
shared_name *
dtype0
?
conv_pw_1_bn/beta/AssignAssignconv_pw_1_bn/betaconv_pw_1_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_pw_1_bn/beta*
validate_shape(*
_output_shapes
:@
?
conv_pw_1_bn/beta/readIdentityconv_pw_1_bn/beta*
T0*$
_class
loc:@conv_pw_1_bn/beta*
_output_shapes
:@
a
conv_pw_1_bn/Const_2Const*
dtype0*
_output_shapes
:@*
valueB@*    
?
conv_pw_1_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes
:@*
	container *
shape:@
?
conv_pw_1_bn/moving_mean/AssignAssignconv_pw_1_bn/moving_meanconv_pw_1_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
validate_shape(*
_output_shapes
:@
?
conv_pw_1_bn/moving_mean/readIdentityconv_pw_1_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@
a
conv_pw_1_bn/Const_3Const*
valueB@*  ??*
dtype0*
_output_shapes
:@
?
conv_pw_1_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes
:@*
	container *
shape:@
?
#conv_pw_1_bn/moving_variance/AssignAssignconv_pw_1_bn/moving_varianceconv_pw_1_bn/Const_3*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
?
!conv_pw_1_bn/moving_variance/readIdentityconv_pw_1_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
:@
W
conv_pw_1_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_pw_1_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_1_bn/FusedBatchNormFusedBatchNormconv_pw_1/convolutionconv_pw_1_bn/gamma/readconv_pw_1_bn/beta/readconv_pw_1_bn/Const_4conv_pw_1_bn/Const_5*
data_formatNHWC*G
_output_shapes5
3:?????????pp@:@:@:@:@*
is_training(*
epsilon%o?:*
T0
g
conv_pw_1_bn/ShapeShapeconv_pw_1/convolution*
T0*
out_type0*
_output_shapes
:
j
 conv_pw_1_bn/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
l
"conv_pw_1_bn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
l
"conv_pw_1_bn/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_1_bn/strided_sliceStridedSliceconv_pw_1_bn/Shape conv_pw_1_bn/strided_slice/stack"conv_pw_1_bn/strided_slice/stack_1"conv_pw_1_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
i
conv_pw_1_bn/Shape_1Shapeconv_pw_1/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_1_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_1_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_1_bn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_1_bn/strided_slice_1StridedSliceconv_pw_1_bn/Shape_1"conv_pw_1_bn/strided_slice_1/stack$conv_pw_1_bn/strided_slice_1/stack_1$conv_pw_1_bn/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
i
conv_pw_1_bn/Shape_2Shapeconv_pw_1/convolution*
_output_shapes
:*
T0*
out_type0
l
"conv_pw_1_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_1_bn/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
n
$conv_pw_1_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_1_bn/strided_slice_2StridedSliceconv_pw_1_bn/Shape_2"conv_pw_1_bn/strided_slice_2/stack$conv_pw_1_bn/strided_slice_2/stack_1$conv_pw_1_bn/strided_slice_2/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask 
?
conv_pw_1_bn/Rank/packedPackconv_pw_1_bn/strided_sliceconv_pw_1_bn/strided_slice_1conv_pw_1_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_pw_1_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_pw_1_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_pw_1_bn/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
conv_pw_1_bn/rangeRangeconv_pw_1_bn/range/startconv_pw_1_bn/Rankconv_pw_1_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_1_bn/Prod/inputPackconv_pw_1_bn/strided_sliceconv_pw_1_bn/strided_slice_1conv_pw_1_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_1_bn/ProdProdconv_pw_1_bn/Prod/inputconv_pw_1_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
l
conv_pw_1_bn/CastCastconv_pw_1_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_1_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_pw_1_bn/subSubconv_pw_1_bn/Castconv_pw_1_bn/sub/y*
_output_shapes
: *
T0
e
conv_pw_1_bn/truedivRealDivconv_pw_1_bn/Castconv_pw_1_bn/sub*
T0*
_output_shapes
: 
q
conv_pw_1_bn/mulMulconv_pw_1_bn/FusedBatchNorm:2conv_pw_1_bn/truediv*
T0*
_output_shapes
:@
?
"conv_pw_1_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_pw_1_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/zerosConst*+
_class!
loc:@conv_pw_1_bn/moving_mean*
valueB@*    *
dtype0*
_output_shapes
:@
?
conv_pw_1_bn/moving_mean/biased
VariableV2*
shape:@*
dtype0*
_output_shapes
:@*
shared_name *+
_class!
loc:@conv_pw_1_bn/moving_mean*
	container 
?
&conv_pw_1_bn/moving_mean/biased/AssignAssignconv_pw_1_bn/moving_mean/biased;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/zeros*
_output_shapes
:@*
use_locking(*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
validate_shape(
?
$conv_pw_1_bn/moving_mean/biased/readIdentityconv_pw_1_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@
?
5conv_pw_1_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_pw_1_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_pw_1_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_pw_1_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_pw_1_bn/moving_mean/local_step/AssignAssign#conv_pw_1_bn/moving_mean/local_step5conv_pw_1_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
(conv_pw_1_bn/moving_mean/local_step/readIdentity#conv_pw_1_bn/moving_mean/local_step*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean
?
9conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/subSub$conv_pw_1_bn/moving_mean/biased/readconv_pw_1_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@
?
9conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/mulMul9conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub"conv_pw_1_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@
?
Nconv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/conv_pw_1_bn/moving_mean	AssignSubconv_pw_1_bn/moving_mean/biased9conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@
?
Econv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_pw_1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_1_bn/moving_mean/local_stepEconv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
: 
?
:conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/readIdentityconv_pw_1_bn/moving_mean/biased@^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/AssignAddO^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/conv_pw_1_bn/moving_mean*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@*
T0
?
=conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_1/xConst@^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/AssignAddO^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/conv_pw_1_bn/moving_mean*+
_class!
loc:@conv_pw_1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_1Sub=conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_1/x"conv_pw_1_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
: 
?
<conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/read_1Identity#conv_pw_1_bn/moving_mean/local_step@^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/AssignAddO^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/conv_pw_1_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean
?
9conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/PowPow;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_1<conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_2/xConst@^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/AssignAddO^conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/conv_pw_1_bn/moving_mean*+
_class!
loc:@conv_pw_1_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_2Sub=conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_2/x9conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/Pow*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/truedivRealDiv:conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/read;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_2*
_output_shapes
:@*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean
?
;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_3Subconv_pw_1_bn/moving_mean/read=conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@
?
conv_pw_1_bn/AssignMovingAvg	AssignSubconv_pw_1_bn/moving_mean;conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/sub_3*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
_output_shapes
:@*
use_locking( 
?
$conv_pw_1_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/zerosConst*
_output_shapes
:@*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
valueB@*    *
dtype0
?
#conv_pw_1_bn/moving_variance/biased
VariableV2*
shape:@*
dtype0*
_output_shapes
:@*
shared_name */
_class%
#!loc:@conv_pw_1_bn/moving_variance*
	container 
?
*conv_pw_1_bn/moving_variance/biased/AssignAssign#conv_pw_1_bn/moving_variance/biasedAconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/zeros*
_output_shapes
:@*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
validate_shape(
?
(conv_pw_1_bn/moving_variance/biased/readIdentity#conv_pw_1_bn/moving_variance/biased*
_output_shapes
:@*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
?
9conv_pw_1_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_1_bn/moving_variance/local_step
VariableV2*
shared_name */
_class%
#!loc:@conv_pw_1_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
.conv_pw_1_bn/moving_variance/local_step/AssignAssign'conv_pw_1_bn/moving_variance/local_step9conv_pw_1_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_pw_1_bn/moving_variance/local_step/readIdentity'conv_pw_1_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/subSub(conv_pw_1_bn/moving_variance/biased/readconv_pw_1_bn/mul*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
:@*
T0
?
?conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/mulMul?conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub$conv_pw_1_bn/AssignMovingAvg_1/decay*
_output_shapes
:@*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
?
Xconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/conv_pw_1_bn/moving_variance	AssignSub#conv_pw_1_bn/moving_variance/biased?conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
:@
?
Kconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/AssignAdd/valueConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_pw_1_bn/moving_variance*
valueB
 *  ??
?
Econv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_1_bn/moving_variance/local_stepKconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/AssignAdd/value*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
: *
use_locking( 
?
@conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/readIdentity#conv_pw_1_bn/moving_variance/biasedF^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/AssignAddY^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/conv_pw_1_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
:@
?
Cconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_1/xConstF^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/AssignAddY^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/conv_pw_1_bn/moving_variance*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_1SubCconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_1/x$conv_pw_1_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/read_1Identity'conv_pw_1_bn/moving_variance/local_stepF^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/AssignAddY^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/conv_pw_1_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/PowPowAconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_1Bconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/read_1*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
?
Cconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_2/xConstF^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/AssignAddY^conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/conv_pw_1_bn/moving_variance*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_2SubCconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_2/x?conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/Pow*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
?
Cconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/truedivRealDiv@conv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/readAconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_2*
_output_shapes
:@*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
?
Aconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_3Sub!conv_pw_1_bn/moving_variance/readCconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
:@
?
conv_pw_1_bn/AssignMovingAvg_1	AssignSubconv_pw_1_bn/moving_varianceAconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
_output_shapes
:@
?
conv_pw_1_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_pw_1_bn/cond/switch_tIdentityconv_pw_1_bn/cond/Switch:1*
_output_shapes
: *
T0

a
conv_pw_1_bn/cond/switch_fIdentityconv_pw_1_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_pw_1_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
_output_shapes
: *
T0

?
conv_pw_1_bn/cond/Switch_1Switchconv_pw_1_bn/FusedBatchNormconv_pw_1_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_pw_1_bn/FusedBatchNorm*J
_output_shapes8
6:?????????pp@:?????????pp@
?
!conv_pw_1_bn/cond/batchnorm/add/yConst^conv_pw_1_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_pw_1_bn/cond/batchnorm/addAdd&conv_pw_1_bn/cond/batchnorm/add/Switch!conv_pw_1_bn/cond/batchnorm/add/y*
_output_shapes
:@*
T0
?
&conv_pw_1_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_1_bn/moving_variance/readconv_pw_1_bn/cond/pred_id* 
_output_shapes
:@:@*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
p
!conv_pw_1_bn/cond/batchnorm/RsqrtRsqrtconv_pw_1_bn/cond/batchnorm/add*
T0*
_output_shapes
:@
?
conv_pw_1_bn/cond/batchnorm/mulMul!conv_pw_1_bn/cond/batchnorm/Rsqrt&conv_pw_1_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes
:@
?
&conv_pw_1_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_1_bn/gamma/readconv_pw_1_bn/cond/pred_id* 
_output_shapes
:@:@*
T0*%
_class
loc:@conv_pw_1_bn/gamma
?
!conv_pw_1_bn/cond/batchnorm/mul_1Mul(conv_pw_1_bn/cond/batchnorm/mul_1/Switchconv_pw_1_bn/cond/batchnorm/mul*/
_output_shapes
:?????????pp@*
T0
?
(conv_pw_1_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_1/convolutionconv_pw_1_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_1/convolution*J
_output_shapes8
6:?????????pp@:?????????pp@
?
!conv_pw_1_bn/cond/batchnorm/mul_2Mul(conv_pw_1_bn/cond/batchnorm/mul_2/Switchconv_pw_1_bn/cond/batchnorm/mul*
_output_shapes
:@*
T0
?
(conv_pw_1_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_1_bn/moving_mean/readconv_pw_1_bn/cond/pred_id*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean* 
_output_shapes
:@:@
?
conv_pw_1_bn/cond/batchnorm/subSub&conv_pw_1_bn/cond/batchnorm/sub/Switch!conv_pw_1_bn/cond/batchnorm/mul_2*
_output_shapes
:@*
T0
?
&conv_pw_1_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_1_bn/beta/readconv_pw_1_bn/cond/pred_id*
T0*$
_class
loc:@conv_pw_1_bn/beta* 
_output_shapes
:@:@
?
!conv_pw_1_bn/cond/batchnorm/add_1Add!conv_pw_1_bn/cond/batchnorm/mul_1conv_pw_1_bn/cond/batchnorm/sub*/
_output_shapes
:?????????pp@*
T0
?
conv_pw_1_bn/cond/MergeMerge!conv_pw_1_bn/cond/batchnorm/add_1conv_pw_1_bn/cond/Switch_1:1*
T0*
N*1
_output_shapes
:?????????pp@: 
n
conv_pw_1_relu/ReluReluconv_pw_1_bn/cond/Merge*
T0*/
_output_shapes
:?????????pp@
Y
conv_pw_1_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_1_relu/MinimumMinimumconv_pw_1_relu/Reluconv_pw_1_relu/Const*/
_output_shapes
:?????????pp@*
T0
?
conv_pad_2/Pad/paddingsConst*
_output_shapes

:*9
value0B."                             *
dtype0
?
conv_pad_2/PadPadconv_pw_1_relu/Minimumconv_pad_2/Pad/paddings*
T0*
	Tpaddings0*/
_output_shapes
:?????????rr@
w
conv_dw_2/random_uniform/shapeConst*%
valueB"      @      *
dtype0*
_output_shapes
:
a
conv_dw_2/random_uniform/minConst*
valueB
 *?hϽ*
dtype0*
_output_shapes
: 
a
conv_dw_2/random_uniform/maxConst*
valueB
 *?h?=*
dtype0*
_output_shapes
: 
?
&conv_dw_2/random_uniform/RandomUniformRandomUniformconv_dw_2/random_uniform/shape*
dtype0*&
_output_shapes
:@*
seed2???*
seed???)*
T0
?
conv_dw_2/random_uniform/subSubconv_dw_2/random_uniform/maxconv_dw_2/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_2/random_uniform/mulMul&conv_dw_2/random_uniform/RandomUniformconv_dw_2/random_uniform/sub*
T0*&
_output_shapes
:@
?
conv_dw_2/random_uniformAddconv_dw_2/random_uniform/mulconv_dw_2/random_uniform/min*&
_output_shapes
:@*
T0
?
conv_dw_2/depthwise_kernel
VariableV2*
shape:@*
shared_name *
dtype0*&
_output_shapes
:@*
	container 
?
!conv_dw_2/depthwise_kernel/AssignAssignconv_dw_2/depthwise_kernelconv_dw_2/random_uniform*&
_output_shapes
:@*
use_locking(*
T0*-
_class#
!loc:@conv_dw_2/depthwise_kernel*
validate_shape(
?
conv_dw_2/depthwise_kernel/readIdentityconv_dw_2/depthwise_kernel*
T0*-
_class#
!loc:@conv_dw_2/depthwise_kernel*&
_output_shapes
:@
r
conv_dw_2/depthwise/ShapeConst*%
valueB"      @      *
dtype0*
_output_shapes
:
r
!conv_dw_2/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_2/depthwiseDepthwiseConv2dNativeconv_pad_2/Padconv_dw_2/depthwise_kernel/read*/
_output_shapes
:?????????88@*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID
_
conv_dw_2_bn/ConstConst*
valueB@*  ??*
dtype0*
_output_shapes
:@
~
conv_dw_2_bn/gamma
VariableV2*
shape:@*
shared_name *
dtype0*
_output_shapes
:@*
	container 
?
conv_dw_2_bn/gamma/AssignAssignconv_dw_2_bn/gammaconv_dw_2_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_dw_2_bn/gamma*
validate_shape(*
_output_shapes
:@
?
conv_dw_2_bn/gamma/readIdentityconv_dw_2_bn/gamma*
T0*%
_class
loc:@conv_dw_2_bn/gamma*
_output_shapes
:@
a
conv_dw_2_bn/Const_1Const*
valueB@*    *
dtype0*
_output_shapes
:@
}
conv_dw_2_bn/beta
VariableV2*
dtype0*
_output_shapes
:@*
	container *
shape:@*
shared_name 
?
conv_dw_2_bn/beta/AssignAssignconv_dw_2_bn/betaconv_dw_2_bn/Const_1*
_output_shapes
:@*
use_locking(*
T0*$
_class
loc:@conv_dw_2_bn/beta*
validate_shape(
?
conv_dw_2_bn/beta/readIdentityconv_dw_2_bn/beta*
T0*$
_class
loc:@conv_dw_2_bn/beta*
_output_shapes
:@
a
conv_dw_2_bn/Const_2Const*
dtype0*
_output_shapes
:@*
valueB@*    
?
conv_dw_2_bn/moving_mean
VariableV2*
shape:@*
shared_name *
dtype0*
_output_shapes
:@*
	container 
?
conv_dw_2_bn/moving_mean/AssignAssignconv_dw_2_bn/moving_meanconv_dw_2_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
validate_shape(*
_output_shapes
:@
?
conv_dw_2_bn/moving_mean/readIdentityconv_dw_2_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
:@
a
conv_dw_2_bn/Const_3Const*
valueB@*  ??*
dtype0*
_output_shapes
:@
?
conv_dw_2_bn/moving_variance
VariableV2*
dtype0*
_output_shapes
:@*
	container *
shape:@*
shared_name 
?
#conv_dw_2_bn/moving_variance/AssignAssignconv_dw_2_bn/moving_varianceconv_dw_2_bn/Const_3*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
validate_shape(*
_output_shapes
:@*
use_locking(
?
!conv_dw_2_bn/moving_variance/readIdentityconv_dw_2_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
:@
W
conv_dw_2_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_dw_2_bn/Const_5Const*
dtype0*
_output_shapes
: *
valueB 
?
conv_dw_2_bn/FusedBatchNormFusedBatchNormconv_dw_2/depthwiseconv_dw_2_bn/gamma/readconv_dw_2_bn/beta/readconv_dw_2_bn/Const_4conv_dw_2_bn/Const_5*
T0*
data_formatNHWC*G
_output_shapes5
3:?????????88@:@:@:@:@*
is_training(*
epsilon%o?:
e
conv_dw_2_bn/ShapeShapeconv_dw_2/depthwise*
_output_shapes
:*
T0*
out_type0
j
 conv_dw_2_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_dw_2_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_dw_2_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_2_bn/strided_sliceStridedSliceconv_dw_2_bn/Shape conv_dw_2_bn/strided_slice/stack"conv_dw_2_bn/strided_slice/stack_1"conv_dw_2_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
g
conv_dw_2_bn/Shape_1Shapeconv_dw_2/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_2_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_2_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_2_bn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_dw_2_bn/strided_slice_1StridedSliceconv_dw_2_bn/Shape_1"conv_dw_2_bn/strided_slice_1/stack$conv_dw_2_bn/strided_slice_1/stack_1$conv_dw_2_bn/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
g
conv_dw_2_bn/Shape_2Shapeconv_dw_2/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_2_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_2_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_2_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_2_bn/strided_slice_2StridedSliceconv_dw_2_bn/Shape_2"conv_dw_2_bn/strided_slice_2/stack$conv_dw_2_bn/strided_slice_2/stack_1$conv_dw_2_bn/strided_slice_2/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask 
?
conv_dw_2_bn/Rank/packedPackconv_dw_2_bn/strided_sliceconv_dw_2_bn/strided_slice_1conv_dw_2_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_2_bn/RankConst*
dtype0*
_output_shapes
: *
value	B :
Z
conv_dw_2_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_dw_2_bn/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
?
conv_dw_2_bn/rangeRangeconv_dw_2_bn/range/startconv_dw_2_bn/Rankconv_dw_2_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_2_bn/Prod/inputPackconv_dw_2_bn/strided_sliceconv_dw_2_bn/strided_slice_1conv_dw_2_bn/strided_slice_2*
N*
_output_shapes
:*
T0*

axis 
?
conv_dw_2_bn/ProdProdconv_dw_2_bn/Prod/inputconv_dw_2_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_dw_2_bn/CastCastconv_dw_2_bn/Prod*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0
W
conv_dw_2_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_dw_2_bn/subSubconv_dw_2_bn/Castconv_dw_2_bn/sub/y*
T0*
_output_shapes
: 
e
conv_dw_2_bn/truedivRealDivconv_dw_2_bn/Castconv_dw_2_bn/sub*
T0*
_output_shapes
: 
q
conv_dw_2_bn/mulMulconv_dw_2_bn/FusedBatchNorm:2conv_dw_2_bn/truediv*
_output_shapes
:@*
T0
?
"conv_dw_2_bn/AssignMovingAvg/decayConst*
_output_shapes
: *+
_class!
loc:@conv_dw_2_bn/moving_mean*
valueB
 *
?#<*
dtype0
?
;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/zerosConst*+
_class!
loc:@conv_dw_2_bn/moving_mean*
valueB@*    *
dtype0*
_output_shapes
:@
?
conv_dw_2_bn/moving_mean/biased
VariableV2*
dtype0*
_output_shapes
:@*
shared_name *+
_class!
loc:@conv_dw_2_bn/moving_mean*
	container *
shape:@
?
&conv_dw_2_bn/moving_mean/biased/AssignAssignconv_dw_2_bn/moving_mean/biased;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/zeros*+
_class!
loc:@conv_dw_2_bn/moving_mean*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0
?
$conv_dw_2_bn/moving_mean/biased/readIdentityconv_dw_2_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
:@
?
5conv_dw_2_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_2_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_2_bn/moving_mean/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_dw_2_bn/moving_mean*
	container *
shape: 
?
*conv_dw_2_bn/moving_mean/local_step/AssignAssign#conv_dw_2_bn/moving_mean/local_step5conv_dw_2_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
(conv_dw_2_bn/moving_mean/local_step/readIdentity#conv_dw_2_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/subSub$conv_dw_2_bn/moving_mean/biased/readconv_dw_2_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
:@
?
9conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/mulMul9conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub"conv_dw_2_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
:@
?
Nconv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/conv_dw_2_bn/moving_mean	AssignSubconv_dw_2_bn/moving_mean/biased9conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
:@
?
Econv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/AssignAdd/valueConst*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_dw_2_bn/moving_mean*
valueB
 *  ??
?
?conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_2_bn/moving_mean/local_stepEconv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/AssignAdd/value*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
: *
use_locking( *
T0
?
:conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/readIdentityconv_dw_2_bn/moving_mean/biased@^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/AssignAddO^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/conv_dw_2_bn/moving_mean*
_output_shapes
:@*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean
?
=conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_1/xConst@^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/AssignAddO^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/conv_dw_2_bn/moving_mean*+
_class!
loc:@conv_dw_2_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_1Sub=conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_1/x"conv_dw_2_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/read_1Identity#conv_dw_2_bn/moving_mean/local_step@^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/AssignAddO^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/conv_dw_2_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean
?
9conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/PowPow;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_1<conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_2/xConst@^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/AssignAddO^conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/conv_dw_2_bn/moving_mean*+
_class!
loc:@conv_dw_2_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_2Sub=conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_2/x9conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/Pow*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/truedivRealDiv:conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/read;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
:@
?
;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_3Subconv_dw_2_bn/moving_mean/read=conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
_output_shapes
:@
?
conv_dw_2_bn/AssignMovingAvg	AssignSubconv_dw_2_bn/moving_mean;conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/sub_3*
_output_shapes
:@*
use_locking( *
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean
?
$conv_dw_2_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
valueB@*    *
dtype0*
_output_shapes
:@
?
#conv_dw_2_bn/moving_variance/biased
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_2_bn/moving_variance*
	container *
shape:@*
dtype0*
_output_shapes
:@
?
*conv_dw_2_bn/moving_variance/biased/AssignAssign#conv_dw_2_bn/moving_variance/biasedAconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
validate_shape(*
_output_shapes
:@
?
(conv_dw_2_bn/moving_variance/biased/readIdentity#conv_dw_2_bn/moving_variance/biased*
_output_shapes
:@*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance
?
9conv_dw_2_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_dw_2_bn/moving_variance/local_step
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_2_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
.conv_dw_2_bn/moving_variance/local_step/AssignAssign'conv_dw_2_bn/moving_variance/local_step9conv_dw_2_bn/moving_variance/local_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance
?
,conv_dw_2_bn/moving_variance/local_step/readIdentity'conv_dw_2_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/subSub(conv_dw_2_bn/moving_variance/biased/readconv_dw_2_bn/mul*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
:@
?
?conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/mulMul?conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub$conv_dw_2_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
:@
?
Xconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/conv_dw_2_bn/moving_variance	AssignSub#conv_dw_2_bn/moving_variance/biased?conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/mul*
_output_shapes
:@*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance
?
Kconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_2_bn/moving_variance/local_stepKconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
: 
?
@conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/readIdentity#conv_dw_2_bn/moving_variance/biasedF^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/AssignAddY^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/conv_dw_2_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
:@
?
Cconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_1/xConstF^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/AssignAddY^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/conv_dw_2_bn/moving_variance*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_1SubCconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_1/x$conv_dw_2_bn/AssignMovingAvg_1/decay*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
: *
T0
?
Bconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/read_1Identity'conv_dw_2_bn/moving_variance/local_stepF^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/AssignAddY^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/conv_dw_2_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/PowPowAconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_1Bconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/read_1*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
: *
T0
?
Cconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_2/xConstF^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/AssignAddY^conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/conv_dw_2_bn/moving_variance*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_2SubCconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_2/x?conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/truedivRealDiv@conv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/readAconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_2*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
:@*
T0
?
Aconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_3Sub!conv_dw_2_bn/moving_variance/readCconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/truediv*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
:@*
T0
?
conv_dw_2_bn/AssignMovingAvg_1	AssignSubconv_dw_2_bn/moving_varianceAconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
_output_shapes
:@
?
conv_dw_2_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_dw_2_bn/cond/switch_tIdentityconv_dw_2_bn/cond/Switch:1*
_output_shapes
: *
T0

a
conv_dw_2_bn/cond/switch_fIdentityconv_dw_2_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_dw_2_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_2_bn/cond/Switch_1Switchconv_dw_2_bn/FusedBatchNormconv_dw_2_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_dw_2_bn/FusedBatchNorm*J
_output_shapes8
6:?????????88@:?????????88@
?
!conv_dw_2_bn/cond/batchnorm/add/yConst^conv_dw_2_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_2_bn/cond/batchnorm/addAdd&conv_dw_2_bn/cond/batchnorm/add/Switch!conv_dw_2_bn/cond/batchnorm/add/y*
T0*
_output_shapes
:@
?
&conv_dw_2_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_2_bn/moving_variance/readconv_dw_2_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance* 
_output_shapes
:@:@
p
!conv_dw_2_bn/cond/batchnorm/RsqrtRsqrtconv_dw_2_bn/cond/batchnorm/add*
_output_shapes
:@*
T0
?
conv_dw_2_bn/cond/batchnorm/mulMul!conv_dw_2_bn/cond/batchnorm/Rsqrt&conv_dw_2_bn/cond/batchnorm/mul/Switch*
_output_shapes
:@*
T0
?
&conv_dw_2_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_2_bn/gamma/readconv_dw_2_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_2_bn/gamma* 
_output_shapes
:@:@
?
!conv_dw_2_bn/cond/batchnorm/mul_1Mul(conv_dw_2_bn/cond/batchnorm/mul_1/Switchconv_dw_2_bn/cond/batchnorm/mul*/
_output_shapes
:?????????88@*
T0
?
(conv_dw_2_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_2/depthwiseconv_dw_2_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_2/depthwise*J
_output_shapes8
6:?????????88@:?????????88@
?
!conv_dw_2_bn/cond/batchnorm/mul_2Mul(conv_dw_2_bn/cond/batchnorm/mul_2/Switchconv_dw_2_bn/cond/batchnorm/mul*
T0*
_output_shapes
:@
?
(conv_dw_2_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_2_bn/moving_mean/readconv_dw_2_bn/cond/pred_id* 
_output_shapes
:@:@*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean
?
conv_dw_2_bn/cond/batchnorm/subSub&conv_dw_2_bn/cond/batchnorm/sub/Switch!conv_dw_2_bn/cond/batchnorm/mul_2*
T0*
_output_shapes
:@
?
&conv_dw_2_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_2_bn/beta/readconv_dw_2_bn/cond/pred_id*$
_class
loc:@conv_dw_2_bn/beta* 
_output_shapes
:@:@*
T0
?
!conv_dw_2_bn/cond/batchnorm/add_1Add!conv_dw_2_bn/cond/batchnorm/mul_1conv_dw_2_bn/cond/batchnorm/sub*
T0*/
_output_shapes
:?????????88@
?
conv_dw_2_bn/cond/MergeMerge!conv_dw_2_bn/cond/batchnorm/add_1conv_dw_2_bn/cond/Switch_1:1*
N*1
_output_shapes
:?????????88@: *
T0
n
conv_dw_2_relu/ReluReluconv_dw_2_bn/cond/Merge*/
_output_shapes
:?????????88@*
T0
Y
conv_dw_2_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_2_relu/MinimumMinimumconv_dw_2_relu/Reluconv_dw_2_relu/Const*/
_output_shapes
:?????????88@*
T0
w
conv_pw_2/random_uniform/shapeConst*
_output_shapes
:*%
valueB"      @   ?   *
dtype0
a
conv_pw_2/random_uniform/minConst*
valueB
 *?5?*
dtype0*
_output_shapes
: 
a
conv_pw_2/random_uniform/maxConst*
_output_shapes
: *
valueB
 *?5>*
dtype0
?
&conv_pw_2/random_uniform/RandomUniformRandomUniformconv_pw_2/random_uniform/shape*'
_output_shapes
:@?*
seed2??*
seed???)*
T0*
dtype0
?
conv_pw_2/random_uniform/subSubconv_pw_2/random_uniform/maxconv_pw_2/random_uniform/min*
_output_shapes
: *
T0
?
conv_pw_2/random_uniform/mulMul&conv_pw_2/random_uniform/RandomUniformconv_pw_2/random_uniform/sub*
T0*'
_output_shapes
:@?
?
conv_pw_2/random_uniformAddconv_pw_2/random_uniform/mulconv_pw_2/random_uniform/min*
T0*'
_output_shapes
:@?
?
conv_pw_2/kernel
VariableV2*
shared_name *
dtype0*'
_output_shapes
:@?*
	container *
shape:@?
?
conv_pw_2/kernel/AssignAssignconv_pw_2/kernelconv_pw_2/random_uniform*
use_locking(*
T0*#
_class
loc:@conv_pw_2/kernel*
validate_shape(*'
_output_shapes
:@?
?
conv_pw_2/kernel/readIdentityconv_pw_2/kernel*#
_class
loc:@conv_pw_2/kernel*'
_output_shapes
:@?*
T0
t
#conv_pw_2/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_2/convolutionConv2Dconv_dw_2_relu/Minimumconv_pw_2/kernel/read*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME*0
_output_shapes
:?????????88?*
	dilations
*
T0
a
conv_pw_2_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_2_bn/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_2_bn/gamma/AssignAssignconv_pw_2_bn/gammaconv_pw_2_bn/Const*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_pw_2_bn/gamma
?
conv_pw_2_bn/gamma/readIdentityconv_pw_2_bn/gamma*
T0*%
_class
loc:@conv_pw_2_bn/gamma*
_output_shapes	
:?
c
conv_pw_2_bn/Const_1Const*
_output_shapes	
:?*
valueB?*    *
dtype0

conv_pw_2_bn/beta
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_2_bn/beta/AssignAssignconv_pw_2_bn/betaconv_pw_2_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_pw_2_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_pw_2_bn/beta/readIdentityconv_pw_2_bn/beta*
T0*$
_class
loc:@conv_pw_2_bn/beta*
_output_shapes	
:?
c
conv_pw_2_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_2_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_2_bn/moving_mean/AssignAssignconv_pw_2_bn/moving_meanconv_pw_2_bn/Const_2*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
conv_pw_2_bn/moving_mean/readIdentityconv_pw_2_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes	
:?
c
conv_pw_2_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_2_bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
#conv_pw_2_bn/moving_variance/AssignAssignconv_pw_2_bn/moving_varianceconv_pw_2_bn/Const_3*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
!conv_pw_2_bn/moving_variance/readIdentityconv_pw_2_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes	
:?
W
conv_pw_2_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_pw_2_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_2_bn/FusedBatchNormFusedBatchNormconv_pw_2/convolutionconv_pw_2_bn/gamma/readconv_pw_2_bn/beta/readconv_pw_2_bn/Const_4conv_pw_2_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:?????????88?:?:?:?:?*
is_training(*
epsilon%o?:
g
conv_pw_2_bn/ShapeShapeconv_pw_2/convolution*
T0*
out_type0*
_output_shapes
:
j
 conv_pw_2_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_2_bn/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
l
"conv_pw_2_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_2_bn/strided_sliceStridedSliceconv_pw_2_bn/Shape conv_pw_2_bn/strided_slice/stack"conv_pw_2_bn/strided_slice/stack_1"conv_pw_2_bn/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_2_bn/Shape_1Shapeconv_pw_2/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_2_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_2_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_2_bn/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_pw_2_bn/strided_slice_1StridedSliceconv_pw_2_bn/Shape_1"conv_pw_2_bn/strided_slice_1/stack$conv_pw_2_bn/strided_slice_1/stack_1$conv_pw_2_bn/strided_slice_1/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
i
conv_pw_2_bn/Shape_2Shapeconv_pw_2/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_2_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_2_bn/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
n
$conv_pw_2_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_2_bn/strided_slice_2StridedSliceconv_pw_2_bn/Shape_2"conv_pw_2_bn/strided_slice_2/stack$conv_pw_2_bn/strided_slice_2/stack_1$conv_pw_2_bn/strided_slice_2/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
?
conv_pw_2_bn/Rank/packedPackconv_pw_2_bn/strided_sliceconv_pw_2_bn/strided_slice_1conv_pw_2_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_pw_2_bn/RankConst*
_output_shapes
: *
value	B :*
dtype0
Z
conv_pw_2_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_pw_2_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_2_bn/rangeRangeconv_pw_2_bn/range/startconv_pw_2_bn/Rankconv_pw_2_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_2_bn/Prod/inputPackconv_pw_2_bn/strided_sliceconv_pw_2_bn/strided_slice_1conv_pw_2_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_2_bn/ProdProdconv_pw_2_bn/Prod/inputconv_pw_2_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
l
conv_pw_2_bn/CastCastconv_pw_2_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_2_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_pw_2_bn/subSubconv_pw_2_bn/Castconv_pw_2_bn/sub/y*
T0*
_output_shapes
: 
e
conv_pw_2_bn/truedivRealDivconv_pw_2_bn/Castconv_pw_2_bn/sub*
_output_shapes
: *
T0
r
conv_pw_2_bn/mulMulconv_pw_2_bn/FusedBatchNorm:2conv_pw_2_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_pw_2_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_pw_2_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/zerosConst*+
_class!
loc:@conv_pw_2_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_2_bn/moving_mean/biased
VariableV2*+
_class!
loc:@conv_pw_2_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
&conv_pw_2_bn/moving_mean/biased/AssignAssignconv_pw_2_bn/moving_mean/biased;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/zeros*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
$conv_pw_2_bn/moving_mean/biased/readIdentityconv_pw_2_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes	
:?
?
5conv_pw_2_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_pw_2_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_pw_2_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_pw_2_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_pw_2_bn/moving_mean/local_step/AssignAssign#conv_pw_2_bn/moving_mean/local_step5conv_pw_2_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
(conv_pw_2_bn/moving_mean/local_step/readIdentity#conv_pw_2_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/subSub$conv_pw_2_bn/moving_mean/biased/readconv_pw_2_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean
?
9conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/mulMul9conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub"conv_pw_2_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes	
:?
?
Nconv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/conv_pw_2_bn/moving_mean	AssignSubconv_pw_2_bn/moving_mean/biased9conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes	
:?
?
Econv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_pw_2_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_2_bn/moving_mean/local_stepEconv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/AssignAdd/value*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes
: *
use_locking( *
T0
?
:conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/readIdentityconv_pw_2_bn/moving_mean/biased@^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/AssignAddO^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/conv_pw_2_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes	
:?
?
=conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_1/xConst@^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/AssignAddO^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/conv_pw_2_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_pw_2_bn/moving_mean*
valueB
 *  ??*
dtype0
?
;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_1Sub=conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_1/x"conv_pw_2_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes
: 
?
<conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/read_1Identity#conv_pw_2_bn/moving_mean/local_step@^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/AssignAddO^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/conv_pw_2_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/PowPow;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_1<conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/read_1*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_2/xConst@^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/AssignAddO^conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/conv_pw_2_bn/moving_mean*+
_class!
loc:@conv_pw_2_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_2Sub=conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_2/x9conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/Pow*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean
?
=conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/truedivRealDiv:conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/read;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean
?
;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_3Subconv_pw_2_bn/moving_mean/read=conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/truediv*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean
?
conv_pw_2_bn/AssignMovingAvg	AssignSubconv_pw_2_bn/moving_mean;conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
_output_shapes	
:?
?
$conv_pw_2_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_pw_2_bn/moving_variance/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_pw_2_bn/moving_variance*
	container *
shape:?
?
*conv_pw_2_bn/moving_variance/biased/AssignAssign#conv_pw_2_bn/moving_variance/biasedAconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
(conv_pw_2_bn/moving_variance/biased/readIdentity#conv_pw_2_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes	
:?
?
9conv_pw_2_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_2_bn/moving_variance/local_step
VariableV2*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
.conv_pw_2_bn/moving_variance/local_step/AssignAssign'conv_pw_2_bn/moving_variance/local_step9conv_pw_2_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_pw_2_bn/moving_variance/local_step/readIdentity'conv_pw_2_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/subSub(conv_pw_2_bn/moving_variance/biased/readconv_pw_2_bn/mul*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
?conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/mulMul?conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub$conv_pw_2_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes	
:?
?
Xconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/conv_pw_2_bn/moving_variance	AssignSub#conv_pw_2_bn/moving_variance/biased?conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/mul*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
Kconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_2_bn/moving_variance/local_stepKconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/AssignAdd/value*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes
: *
use_locking( *
T0
?
@conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/readIdentity#conv_pw_2_bn/moving_variance/biasedF^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/AssignAddY^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/conv_pw_2_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
Cconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_1/xConstF^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/AssignAddY^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/conv_pw_2_bn/moving_variance*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_1SubCconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_1/x$conv_pw_2_bn/AssignMovingAvg_1/decay*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
Bconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/read_1Identity'conv_pw_2_bn/moving_variance/local_stepF^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/AssignAddY^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/conv_pw_2_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/PowPowAconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_1Bconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_2/xConstF^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/AssignAddY^conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/conv_pw_2_bn/moving_variance*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_2SubCconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_2/x?conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/Pow*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
Cconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/truedivRealDiv@conv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/readAconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
Aconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_3Sub!conv_pw_2_bn/moving_variance/readCconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_2_bn/AssignMovingAvg_1	AssignSubconv_pw_2_bn/moving_varianceAconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/sub_3*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance
?
conv_pw_2_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_pw_2_bn/cond/switch_tIdentityconv_pw_2_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_2_bn/cond/switch_fIdentityconv_pw_2_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_pw_2_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_2_bn/cond/Switch_1Switchconv_pw_2_bn/FusedBatchNormconv_pw_2_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_pw_2_bn/FusedBatchNorm*L
_output_shapes:
8:?????????88?:?????????88?
?
!conv_pw_2_bn/cond/batchnorm/add/yConst^conv_pw_2_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_pw_2_bn/cond/batchnorm/addAdd&conv_pw_2_bn/cond/batchnorm/add/Switch!conv_pw_2_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_pw_2_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_2_bn/moving_variance/readconv_pw_2_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_pw_2_bn/cond/batchnorm/RsqrtRsqrtconv_pw_2_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_pw_2_bn/cond/batchnorm/mulMul!conv_pw_2_bn/cond/batchnorm/Rsqrt&conv_pw_2_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_pw_2_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_2_bn/gamma/readconv_pw_2_bn/cond/pred_id*
T0*%
_class
loc:@conv_pw_2_bn/gamma*"
_output_shapes
:?:?
?
!conv_pw_2_bn/cond/batchnorm/mul_1Mul(conv_pw_2_bn/cond/batchnorm/mul_1/Switchconv_pw_2_bn/cond/batchnorm/mul*0
_output_shapes
:?????????88?*
T0
?
(conv_pw_2_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_2/convolutionconv_pw_2_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_2/convolution*L
_output_shapes:
8:?????????88?:?????????88?
?
!conv_pw_2_bn/cond/batchnorm/mul_2Mul(conv_pw_2_bn/cond/batchnorm/mul_2/Switchconv_pw_2_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_pw_2_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_2_bn/moving_mean/readconv_pw_2_bn/cond/pred_id*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*"
_output_shapes
:?:?
?
conv_pw_2_bn/cond/batchnorm/subSub&conv_pw_2_bn/cond/batchnorm/sub/Switch!conv_pw_2_bn/cond/batchnorm/mul_2*
_output_shapes	
:?*
T0
?
&conv_pw_2_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_2_bn/beta/readconv_pw_2_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*$
_class
loc:@conv_pw_2_bn/beta
?
!conv_pw_2_bn/cond/batchnorm/add_1Add!conv_pw_2_bn/cond/batchnorm/mul_1conv_pw_2_bn/cond/batchnorm/sub*0
_output_shapes
:?????????88?*
T0
?
conv_pw_2_bn/cond/MergeMerge!conv_pw_2_bn/cond/batchnorm/add_1conv_pw_2_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:?????????88?: 
o
conv_pw_2_relu/ReluReluconv_pw_2_bn/cond/Merge*
T0*0
_output_shapes
:?????????88?
Y
conv_pw_2_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_2_relu/MinimumMinimumconv_pw_2_relu/Reluconv_pw_2_relu/Const*
T0*0
_output_shapes
:?????????88?
?
conv_pad_3/Pad/paddingsConst*
dtype0*
_output_shapes

:*9
value0B."                             
?
conv_pad_3/PadPadconv_pw_2_relu/Minimumconv_pad_3/Pad/paddings*
	Tpaddings0*0
_output_shapes
:?????????::?*
T0
w
conv_dw_3/random_uniform/shapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
a
conv_dw_3/random_uniform/minConst*
_output_shapes
: *
valueB
 *I:??*
dtype0
a
conv_dw_3/random_uniform/maxConst*
valueB
 *I:?=*
dtype0*
_output_shapes
: 
?
&conv_dw_3/random_uniform/RandomUniformRandomUniformconv_dw_3/random_uniform/shape*
T0*
dtype0*'
_output_shapes
:?*
seed2???*
seed???)
?
conv_dw_3/random_uniform/subSubconv_dw_3/random_uniform/maxconv_dw_3/random_uniform/min*
_output_shapes
: *
T0
?
conv_dw_3/random_uniform/mulMul&conv_dw_3/random_uniform/RandomUniformconv_dw_3/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_3/random_uniformAddconv_dw_3/random_uniform/mulconv_dw_3/random_uniform/min*
T0*'
_output_shapes
:?
?
conv_dw_3/depthwise_kernel
VariableV2*
dtype0*'
_output_shapes
:?*
	container *
shape:?*
shared_name 
?
!conv_dw_3/depthwise_kernel/AssignAssignconv_dw_3/depthwise_kernelconv_dw_3/random_uniform*
validate_shape(*'
_output_shapes
:?*
use_locking(*
T0*-
_class#
!loc:@conv_dw_3/depthwise_kernel
?
conv_dw_3/depthwise_kernel/readIdentityconv_dw_3/depthwise_kernel*
T0*-
_class#
!loc:@conv_dw_3/depthwise_kernel*'
_output_shapes
:?
r
conv_dw_3/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
r
!conv_dw_3/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_3/depthwiseDepthwiseConv2dNativeconv_pad_3/Padconv_dw_3/depthwise_kernel/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID*0
_output_shapes
:?????????88?
a
conv_dw_3_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_3_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_dw_3_bn/gamma/AssignAssignconv_dw_3_bn/gammaconv_dw_3_bn/Const*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_3_bn/gamma*
validate_shape(
?
conv_dw_3_bn/gamma/readIdentityconv_dw_3_bn/gamma*
T0*%
_class
loc:@conv_dw_3_bn/gamma*
_output_shapes	
:?
c
conv_dw_3_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_dw_3_bn/beta
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_3_bn/beta/AssignAssignconv_dw_3_bn/betaconv_dw_3_bn/Const_1*$
_class
loc:@conv_dw_3_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_dw_3_bn/beta/readIdentityconv_dw_3_bn/beta*
T0*$
_class
loc:@conv_dw_3_bn/beta*
_output_shapes	
:?
c
conv_dw_3_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_3_bn/moving_mean
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_3_bn/moving_mean/AssignAssignconv_dw_3_bn/moving_meanconv_dw_3_bn/Const_2*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
conv_dw_3_bn/moving_mean/readIdentityconv_dw_3_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?
c
conv_dw_3_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_3_bn/moving_variance
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
#conv_dw_3_bn/moving_variance/AssignAssignconv_dw_3_bn/moving_varianceconv_dw_3_bn/Const_3*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
!conv_dw_3_bn/moving_variance/readIdentityconv_dw_3_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes	
:?
W
conv_dw_3_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_dw_3_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_3_bn/FusedBatchNormFusedBatchNormconv_dw_3/depthwiseconv_dw_3_bn/gamma/readconv_dw_3_bn/beta/readconv_dw_3_bn/Const_4conv_dw_3_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:?????????88?:?:?:?:?*
is_training(*
epsilon%o?:
e
conv_dw_3_bn/ShapeShapeconv_dw_3/depthwise*
T0*
out_type0*
_output_shapes
:
j
 conv_dw_3_bn/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
l
"conv_dw_3_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_dw_3_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_3_bn/strided_sliceStridedSliceconv_dw_3_bn/Shape conv_dw_3_bn/strided_slice/stack"conv_dw_3_bn/strided_slice/stack_1"conv_dw_3_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
g
conv_dw_3_bn/Shape_1Shapeconv_dw_3/depthwise*
_output_shapes
:*
T0*
out_type0
l
"conv_dw_3_bn/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
n
$conv_dw_3_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_3_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_3_bn/strided_slice_1StridedSliceconv_dw_3_bn/Shape_1"conv_dw_3_bn/strided_slice_1/stack$conv_dw_3_bn/strided_slice_1/stack_1$conv_dw_3_bn/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
g
conv_dw_3_bn/Shape_2Shapeconv_dw_3/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_3_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_3_bn/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
n
$conv_dw_3_bn/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_dw_3_bn/strided_slice_2StridedSliceconv_dw_3_bn/Shape_2"conv_dw_3_bn/strided_slice_2/stack$conv_dw_3_bn/strided_slice_2/stack_1$conv_dw_3_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
conv_dw_3_bn/Rank/packedPackconv_dw_3_bn/strided_sliceconv_dw_3_bn/strided_slice_1conv_dw_3_bn/strided_slice_2*

axis *
N*
_output_shapes
:*
T0
S
conv_dw_3_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_dw_3_bn/range/startConst*
_output_shapes
: *
value	B : *
dtype0
Z
conv_dw_3_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_3_bn/rangeRangeconv_dw_3_bn/range/startconv_dw_3_bn/Rankconv_dw_3_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_dw_3_bn/Prod/inputPackconv_dw_3_bn/strided_sliceconv_dw_3_bn/strided_slice_1conv_dw_3_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_3_bn/ProdProdconv_dw_3_bn/Prod/inputconv_dw_3_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_dw_3_bn/CastCastconv_dw_3_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_3_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_dw_3_bn/subSubconv_dw_3_bn/Castconv_dw_3_bn/sub/y*
_output_shapes
: *
T0
e
conv_dw_3_bn/truedivRealDivconv_dw_3_bn/Castconv_dw_3_bn/sub*
T0*
_output_shapes
: 
r
conv_dw_3_bn/mulMulconv_dw_3_bn/FusedBatchNorm:2conv_dw_3_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_dw_3_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_dw_3_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/zerosConst*+
_class!
loc:@conv_dw_3_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_3_bn/moving_mean/biased
VariableV2*+
_class!
loc:@conv_dw_3_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
&conv_dw_3_bn/moving_mean/biased/AssignAssignconv_dw_3_bn/moving_mean/biased;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_dw_3_bn/moving_mean/biased/readIdentityconv_dw_3_bn/moving_mean/biased*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean
?
5conv_dw_3_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_3_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_3_bn/moving_mean/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_dw_3_bn/moving_mean*
	container *
shape: 
?
*conv_dw_3_bn/moving_mean/local_step/AssignAssign#conv_dw_3_bn/moving_mean/local_step5conv_dw_3_bn/moving_mean/local_step/Initializer/zeros*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
validate_shape(
?
(conv_dw_3_bn/moving_mean/local_step/readIdentity#conv_dw_3_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/subSub$conv_dw_3_bn/moving_mean/biased/readconv_dw_3_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?
?
9conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/mulMul9conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub"conv_dw_3_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?
?
Nconv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/conv_dw_3_bn/moving_mean	AssignSubconv_dw_3_bn/moving_mean/biased9conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/mul*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?*
use_locking( *
T0
?
Econv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *+
_class!
loc:@conv_dw_3_bn/moving_mean*
valueB
 *  ??*
dtype0
?
?conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_3_bn/moving_mean/local_stepEconv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean
?
:conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/readIdentityconv_dw_3_bn/moving_mean/biased@^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/AssignAddO^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/conv_dw_3_bn/moving_mean*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?*
T0
?
=conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_1/xConst@^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/AssignAddO^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/conv_dw_3_bn/moving_mean*+
_class!
loc:@conv_dw_3_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_1Sub=conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_1/x"conv_dw_3_bn/AssignMovingAvg/decay*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean
?
<conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/read_1Identity#conv_dw_3_bn/moving_mean/local_step@^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/AssignAddO^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/conv_dw_3_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean
?
9conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/PowPow;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_1<conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_2/xConst@^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/AssignAddO^conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/conv_dw_3_bn/moving_mean*+
_class!
loc:@conv_dw_3_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_2Sub=conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_2/x9conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/Pow*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/truedivRealDiv:conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/read;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?
?
;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_3Subconv_dw_3_bn/moving_mean/read=conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_3_bn/AssignMovingAvg	AssignSubconv_dw_3_bn/moving_mean;conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
_output_shapes	
:?
?
$conv_dw_3_bn/AssignMovingAvg_1/decayConst*
_output_shapes
: */
_class%
#!loc:@conv_dw_3_bn/moving_variance*
valueB
 *
?#<*
dtype0
?
Aconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_dw_3_bn/moving_variance/biased
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_3_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
*conv_dw_3_bn/moving_variance/biased/AssignAssign#conv_dw_3_bn/moving_variance/biasedAconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_dw_3_bn/moving_variance/biased/readIdentity#conv_dw_3_bn/moving_variance/biased*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance
?
9conv_dw_3_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_dw_3_bn/moving_variance/local_step
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_3_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
.conv_dw_3_bn/moving_variance/local_step/AssignAssign'conv_dw_3_bn/moving_variance/local_step9conv_dw_3_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_dw_3_bn/moving_variance/local_step/readIdentity'conv_dw_3_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/subSub(conv_dw_3_bn/moving_variance/biased/readconv_dw_3_bn/mul*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes	
:?*
T0
?
?conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/mulMul?conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub$conv_dw_3_bn/AssignMovingAvg_1/decay*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes	
:?*
T0
?
Xconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/conv_dw_3_bn/moving_variance	AssignSub#conv_dw_3_bn/moving_variance/biased?conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes	
:?
?
Kconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/AssignAdd/valueConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_3_bn/moving_variance*
valueB
 *  ??
?
Econv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_3_bn/moving_variance/local_stepKconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes
: 
?
@conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/readIdentity#conv_dw_3_bn/moving_variance/biasedF^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/AssignAddY^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/conv_dw_3_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance
?
Cconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_1/xConstF^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/AssignAddY^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/conv_dw_3_bn/moving_variance*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_1SubCconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_1/x$conv_dw_3_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/read_1Identity'conv_dw_3_bn/moving_variance/local_stepF^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/AssignAddY^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/conv_dw_3_bn/moving_variance*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes
: *
T0
?
?conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/PowPowAconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_1Bconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_2/xConstF^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/AssignAddY^conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/conv_dw_3_bn/moving_variance*
_output_shapes
: */
_class%
#!loc:@conv_dw_3_bn/moving_variance*
valueB
 *  ??*
dtype0
?
Aconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_2SubCconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_2/x?conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/truedivRealDiv@conv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/readAconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance
?
Aconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_3Sub!conv_dw_3_bn/moving_variance/readCconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance
?
conv_dw_3_bn/AssignMovingAvg_1	AssignSubconv_dw_3_bn/moving_varianceAconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_3_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

c
conv_dw_3_bn/cond/switch_tIdentityconv_dw_3_bn/cond/Switch:1*
_output_shapes
: *
T0

a
conv_dw_3_bn/cond/switch_fIdentityconv_dw_3_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_dw_3_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_3_bn/cond/Switch_1Switchconv_dw_3_bn/FusedBatchNormconv_dw_3_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_dw_3_bn/FusedBatchNorm*L
_output_shapes:
8:?????????88?:?????????88?
?
!conv_dw_3_bn/cond/batchnorm/add/yConst^conv_dw_3_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_3_bn/cond/batchnorm/addAdd&conv_dw_3_bn/cond/batchnorm/add/Switch!conv_dw_3_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_dw_3_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_3_bn/moving_variance/readconv_dw_3_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance
q
!conv_dw_3_bn/cond/batchnorm/RsqrtRsqrtconv_dw_3_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
conv_dw_3_bn/cond/batchnorm/mulMul!conv_dw_3_bn/cond/batchnorm/Rsqrt&conv_dw_3_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
&conv_dw_3_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_3_bn/gamma/readconv_dw_3_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_3_bn/gamma*"
_output_shapes
:?:?
?
!conv_dw_3_bn/cond/batchnorm/mul_1Mul(conv_dw_3_bn/cond/batchnorm/mul_1/Switchconv_dw_3_bn/cond/batchnorm/mul*0
_output_shapes
:?????????88?*
T0
?
(conv_dw_3_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_3/depthwiseconv_dw_3_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_3/depthwise*L
_output_shapes:
8:?????????88?:?????????88?
?
!conv_dw_3_bn/cond/batchnorm/mul_2Mul(conv_dw_3_bn/cond/batchnorm/mul_2/Switchconv_dw_3_bn/cond/batchnorm/mul*
_output_shapes	
:?*
T0
?
(conv_dw_3_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_3_bn/moving_mean/readconv_dw_3_bn/cond/pred_id*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*"
_output_shapes
:?:?
?
conv_dw_3_bn/cond/batchnorm/subSub&conv_dw_3_bn/cond/batchnorm/sub/Switch!conv_dw_3_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_dw_3_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_3_bn/beta/readconv_dw_3_bn/cond/pred_id*
T0*$
_class
loc:@conv_dw_3_bn/beta*"
_output_shapes
:?:?
?
!conv_dw_3_bn/cond/batchnorm/add_1Add!conv_dw_3_bn/cond/batchnorm/mul_1conv_dw_3_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:?????????88?
?
conv_dw_3_bn/cond/MergeMerge!conv_dw_3_bn/cond/batchnorm/add_1conv_dw_3_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:?????????88?: 
o
conv_dw_3_relu/ReluReluconv_dw_3_bn/cond/Merge*0
_output_shapes
:?????????88?*
T0
Y
conv_dw_3_relu/ConstConst*
_output_shapes
: *
valueB
 *  ?@*
dtype0
?
conv_dw_3_relu/MinimumMinimumconv_dw_3_relu/Reluconv_dw_3_relu/Const*0
_output_shapes
:?????????88?*
T0
w
conv_pw_3/random_uniform/shapeConst*%
valueB"      ?   ?   *
dtype0*
_output_shapes
:
a
conv_pw_3/random_uniform/minConst*
valueB
 *q??*
dtype0*
_output_shapes
: 
a
conv_pw_3/random_uniform/maxConst*
valueB
 *q?>*
dtype0*
_output_shapes
: 
?
&conv_pw_3/random_uniform/RandomUniformRandomUniformconv_pw_3/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2???*
seed???)
?
conv_pw_3/random_uniform/subSubconv_pw_3/random_uniform/maxconv_pw_3/random_uniform/min*
_output_shapes
: *
T0
?
conv_pw_3/random_uniform/mulMul&conv_pw_3/random_uniform/RandomUniformconv_pw_3/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_3/random_uniformAddconv_pw_3/random_uniform/mulconv_pw_3/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_3/kernel
VariableV2*
shape:??*
shared_name *
dtype0*(
_output_shapes
:??*
	container 
?
conv_pw_3/kernel/AssignAssignconv_pw_3/kernelconv_pw_3/random_uniform*
use_locking(*
T0*#
_class
loc:@conv_pw_3/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_3/kernel/readIdentityconv_pw_3/kernel*
T0*#
_class
loc:@conv_pw_3/kernel*(
_output_shapes
:??
t
#conv_pw_3/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_3/convolutionConv2Dconv_dw_3_relu/Minimumconv_pw_3/kernel/read*0
_output_shapes
:?????????88?*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
a
conv_pw_3_bn/ConstConst*
_output_shapes	
:?*
valueB?*  ??*
dtype0
?
conv_pw_3_bn/gamma
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_pw_3_bn/gamma/AssignAssignconv_pw_3_bn/gammaconv_pw_3_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_pw_3_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_pw_3_bn/gamma/readIdentityconv_pw_3_bn/gamma*
T0*%
_class
loc:@conv_pw_3_bn/gamma*
_output_shapes	
:?
c
conv_pw_3_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_pw_3_bn/beta
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_pw_3_bn/beta/AssignAssignconv_pw_3_bn/betaconv_pw_3_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_pw_3_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_pw_3_bn/beta/readIdentityconv_pw_3_bn/beta*
_output_shapes	
:?*
T0*$
_class
loc:@conv_pw_3_bn/beta
c
conv_pw_3_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_3_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_3_bn/moving_mean/AssignAssignconv_pw_3_bn/moving_meanconv_pw_3_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_pw_3_bn/moving_mean/readIdentityconv_pw_3_bn/moving_mean*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean
c
conv_pw_3_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_3_bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
#conv_pw_3_bn/moving_variance/AssignAssignconv_pw_3_bn/moving_varianceconv_pw_3_bn/Const_3*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
!conv_pw_3_bn/moving_variance/readIdentityconv_pw_3_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?
W
conv_pw_3_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_pw_3_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_3_bn/FusedBatchNormFusedBatchNormconv_pw_3/convolutionconv_pw_3_bn/gamma/readconv_pw_3_bn/beta/readconv_pw_3_bn/Const_4conv_pw_3_bn/Const_5*
data_formatNHWC*L
_output_shapes:
8:?????????88?:?:?:?:?*
is_training(*
epsilon%o?:*
T0
g
conv_pw_3_bn/ShapeShapeconv_pw_3/convolution*
_output_shapes
:*
T0*
out_type0
j
 conv_pw_3_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_3_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_pw_3_bn/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_pw_3_bn/strided_sliceStridedSliceconv_pw_3_bn/Shape conv_pw_3_bn/strided_slice/stack"conv_pw_3_bn/strided_slice/stack_1"conv_pw_3_bn/strided_slice/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
i
conv_pw_3_bn/Shape_1Shapeconv_pw_3/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_3_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_3_bn/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
n
$conv_pw_3_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_3_bn/strided_slice_1StridedSliceconv_pw_3_bn/Shape_1"conv_pw_3_bn/strided_slice_1/stack$conv_pw_3_bn/strided_slice_1/stack_1$conv_pw_3_bn/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
i
conv_pw_3_bn/Shape_2Shapeconv_pw_3/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_3_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_3_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_3_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_3_bn/strided_slice_2StridedSliceconv_pw_3_bn/Shape_2"conv_pw_3_bn/strided_slice_2/stack$conv_pw_3_bn/strided_slice_2/stack_1$conv_pw_3_bn/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_pw_3_bn/Rank/packedPackconv_pw_3_bn/strided_sliceconv_pw_3_bn/strided_slice_1conv_pw_3_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_pw_3_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_pw_3_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_pw_3_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_3_bn/rangeRangeconv_pw_3_bn/range/startconv_pw_3_bn/Rankconv_pw_3_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_3_bn/Prod/inputPackconv_pw_3_bn/strided_sliceconv_pw_3_bn/strided_slice_1conv_pw_3_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_3_bn/ProdProdconv_pw_3_bn/Prod/inputconv_pw_3_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_pw_3_bn/CastCastconv_pw_3_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_3_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_pw_3_bn/subSubconv_pw_3_bn/Castconv_pw_3_bn/sub/y*
_output_shapes
: *
T0
e
conv_pw_3_bn/truedivRealDivconv_pw_3_bn/Castconv_pw_3_bn/sub*
_output_shapes
: *
T0
r
conv_pw_3_bn/mulMulconv_pw_3_bn/FusedBatchNorm:2conv_pw_3_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_pw_3_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_pw_3_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/zerosConst*+
_class!
loc:@conv_pw_3_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_3_bn/moving_mean/biased
VariableV2*+
_class!
loc:@conv_pw_3_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
&conv_pw_3_bn/moving_mean/biased/AssignAssignconv_pw_3_bn/moving_mean/biased;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_pw_3_bn/moving_mean/biased/readIdentityconv_pw_3_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes	
:?
?
5conv_pw_3_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_pw_3_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_pw_3_bn/moving_mean/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_pw_3_bn/moving_mean*
	container *
shape: 
?
*conv_pw_3_bn/moving_mean/local_step/AssignAssign#conv_pw_3_bn/moving_mean/local_step5conv_pw_3_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
(conv_pw_3_bn/moving_mean/local_step/readIdentity#conv_pw_3_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/subSub$conv_pw_3_bn/moving_mean/biased/readconv_pw_3_bn/FusedBatchNorm:1*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes	
:?*
T0
?
9conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/mulMul9conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub"conv_pw_3_bn/AssignMovingAvg/decay*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean
?
Nconv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/conv_pw_3_bn/moving_mean	AssignSubconv_pw_3_bn/moving_mean/biased9conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes	
:?
?
Econv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_pw_3_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_3_bn/moving_mean/local_stepEconv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean
?
:conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/readIdentityconv_pw_3_bn/moving_mean/biased@^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/AssignAddO^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/conv_pw_3_bn/moving_mean*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes	
:?*
T0
?
=conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_1/xConst@^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/AssignAddO^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/conv_pw_3_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_pw_3_bn/moving_mean*
valueB
 *  ??*
dtype0
?
;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_1Sub=conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_1/x"conv_pw_3_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes
: 
?
<conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/read_1Identity#conv_pw_3_bn/moving_mean/local_step@^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/AssignAddO^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/conv_pw_3_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean
?
9conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/PowPow;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_1<conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_2/xConst@^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/AssignAddO^conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/conv_pw_3_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_pw_3_bn/moving_mean*
valueB
 *  ??*
dtype0
?
;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_2Sub=conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_2/x9conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/Pow*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/truedivRealDiv:conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/read;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes	
:?
?
;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_3Subconv_pw_3_bn/moving_mean/read=conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
_output_shapes	
:?
?
conv_pw_3_bn/AssignMovingAvg	AssignSubconv_pw_3_bn/moving_mean;conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/sub_3*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean
?
$conv_pw_3_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_pw_3_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_pw_3_bn/moving_variance
?
*conv_pw_3_bn/moving_variance/biased/AssignAssign#conv_pw_3_bn/moving_variance/biasedAconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_pw_3_bn/moving_variance/biased/readIdentity#conv_pw_3_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?*
T0
?
9conv_pw_3_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_3_bn/moving_variance/local_step
VariableV2*
shared_name */
_class%
#!loc:@conv_pw_3_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
.conv_pw_3_bn/moving_variance/local_step/AssignAssign'conv_pw_3_bn/moving_variance/local_step9conv_pw_3_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_pw_3_bn/moving_variance/local_step/readIdentity'conv_pw_3_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/subSub(conv_pw_3_bn/moving_variance/biased/readconv_pw_3_bn/mul*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?
?
?conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/mulMul?conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub$conv_pw_3_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?
?
Xconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/conv_pw_3_bn/moving_variance	AssignSub#conv_pw_3_bn/moving_variance/biased?conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?
?
Kconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/AssignAdd/valueConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_pw_3_bn/moving_variance*
valueB
 *  ??
?
Econv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_3_bn/moving_variance/local_stepKconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/AssignAdd/value*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes
: *
use_locking( 
?
@conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/readIdentity#conv_pw_3_bn/moving_variance/biasedF^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/AssignAddY^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/conv_pw_3_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?
?
Cconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_1/xConstF^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/AssignAddY^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/conv_pw_3_bn/moving_variance*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_1SubCconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_1/x$conv_pw_3_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/read_1Identity'conv_pw_3_bn/moving_variance/local_stepF^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/AssignAddY^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/conv_pw_3_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/PowPowAconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_1Bconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_2/xConstF^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/AssignAddY^conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/conv_pw_3_bn/moving_variance*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_2SubCconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_2/x?conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/Pow*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes
: *
T0
?
Cconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/truedivRealDiv@conv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/readAconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_3Sub!conv_pw_3_bn/moving_variance/readCconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_3_bn/AssignMovingAvg_1	AssignSubconv_pw_3_bn/moving_varianceAconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/sub_3*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
conv_pw_3_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_pw_3_bn/cond/switch_tIdentityconv_pw_3_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_3_bn/cond/switch_fIdentityconv_pw_3_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_pw_3_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_3_bn/cond/Switch_1Switchconv_pw_3_bn/FusedBatchNormconv_pw_3_bn/cond/pred_id*L
_output_shapes:
8:?????????88?:?????????88?*
T0*.
_class$
" loc:@conv_pw_3_bn/FusedBatchNorm
?
!conv_pw_3_bn/cond/batchnorm/add/yConst^conv_pw_3_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_pw_3_bn/cond/batchnorm/addAdd&conv_pw_3_bn/cond/batchnorm/add/Switch!conv_pw_3_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
&conv_pw_3_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_3_bn/moving_variance/readconv_pw_3_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_pw_3_bn/cond/batchnorm/RsqrtRsqrtconv_pw_3_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_pw_3_bn/cond/batchnorm/mulMul!conv_pw_3_bn/cond/batchnorm/Rsqrt&conv_pw_3_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_pw_3_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_3_bn/gamma/readconv_pw_3_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*%
_class
loc:@conv_pw_3_bn/gamma
?
!conv_pw_3_bn/cond/batchnorm/mul_1Mul(conv_pw_3_bn/cond/batchnorm/mul_1/Switchconv_pw_3_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:?????????88?
?
(conv_pw_3_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_3/convolutionconv_pw_3_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_3/convolution*L
_output_shapes:
8:?????????88?:?????????88?
?
!conv_pw_3_bn/cond/batchnorm/mul_2Mul(conv_pw_3_bn/cond/batchnorm/mul_2/Switchconv_pw_3_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_pw_3_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_3_bn/moving_mean/readconv_pw_3_bn/cond/pred_id*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*"
_output_shapes
:?:?
?
conv_pw_3_bn/cond/batchnorm/subSub&conv_pw_3_bn/cond/batchnorm/sub/Switch!conv_pw_3_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_pw_3_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_3_bn/beta/readconv_pw_3_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*$
_class
loc:@conv_pw_3_bn/beta
?
!conv_pw_3_bn/cond/batchnorm/add_1Add!conv_pw_3_bn/cond/batchnorm/mul_1conv_pw_3_bn/cond/batchnorm/sub*0
_output_shapes
:?????????88?*
T0
?
conv_pw_3_bn/cond/MergeMerge!conv_pw_3_bn/cond/batchnorm/add_1conv_pw_3_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:?????????88?: 
o
conv_pw_3_relu/ReluReluconv_pw_3_bn/cond/Merge*
T0*0
_output_shapes
:?????????88?
Y
conv_pw_3_relu/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?@
?
conv_pw_3_relu/MinimumMinimumconv_pw_3_relu/Reluconv_pw_3_relu/Const*
T0*0
_output_shapes
:?????????88?
?
conv_pad_4/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_4/PadPadconv_pw_3_relu/Minimumconv_pad_4/Pad/paddings*
	Tpaddings0*0
_output_shapes
:?????????::?*
T0
w
conv_dw_4/random_uniform/shapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
a
conv_dw_4/random_uniform/minConst*
valueB
 *I:??*
dtype0*
_output_shapes
: 
a
conv_dw_4/random_uniform/maxConst*
_output_shapes
: *
valueB
 *I:?=*
dtype0
?
&conv_dw_4/random_uniform/RandomUniformRandomUniformconv_dw_4/random_uniform/shape*
dtype0*'
_output_shapes
:?*
seed2???*
seed???)*
T0
?
conv_dw_4/random_uniform/subSubconv_dw_4/random_uniform/maxconv_dw_4/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_4/random_uniform/mulMul&conv_dw_4/random_uniform/RandomUniformconv_dw_4/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_4/random_uniformAddconv_dw_4/random_uniform/mulconv_dw_4/random_uniform/min*
T0*'
_output_shapes
:?
?
conv_dw_4/depthwise_kernel
VariableV2*
shared_name *
dtype0*'
_output_shapes
:?*
	container *
shape:?
?
!conv_dw_4/depthwise_kernel/AssignAssignconv_dw_4/depthwise_kernelconv_dw_4/random_uniform*
T0*-
_class#
!loc:@conv_dw_4/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking(
?
conv_dw_4/depthwise_kernel/readIdentityconv_dw_4/depthwise_kernel*
T0*-
_class#
!loc:@conv_dw_4/depthwise_kernel*'
_output_shapes
:?
r
conv_dw_4/depthwise/ShapeConst*%
valueB"      ?      *
dtype0*
_output_shapes
:
r
!conv_dw_4/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_4/depthwiseDepthwiseConv2dNativeconv_pad_4/Padconv_dw_4/depthwise_kernel/read*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID
a
conv_dw_4_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_4_bn/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_4_bn/gamma/AssignAssignconv_dw_4_bn/gammaconv_dw_4_bn/Const*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_4_bn/gamma
?
conv_dw_4_bn/gamma/readIdentityconv_dw_4_bn/gamma*
_output_shapes	
:?*
T0*%
_class
loc:@conv_dw_4_bn/gamma
c
conv_dw_4_bn/Const_1Const*
dtype0*
_output_shapes	
:?*
valueB?*    

conv_dw_4_bn/beta
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_dw_4_bn/beta/AssignAssignconv_dw_4_bn/betaconv_dw_4_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_dw_4_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_dw_4_bn/beta/readIdentityconv_dw_4_bn/beta*
T0*$
_class
loc:@conv_dw_4_bn/beta*
_output_shapes	
:?
c
conv_dw_4_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_4_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_dw_4_bn/moving_mean/AssignAssignconv_dw_4_bn/moving_meanconv_dw_4_bn/Const_2*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean
?
conv_dw_4_bn/moving_mean/readIdentityconv_dw_4_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes	
:?
c
conv_dw_4_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_4_bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
#conv_dw_4_bn/moving_variance/AssignAssignconv_dw_4_bn/moving_varianceconv_dw_4_bn/Const_3*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
!conv_dw_4_bn/moving_variance/readIdentityconv_dw_4_bn/moving_variance*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes	
:?*
T0
W
conv_dw_4_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_dw_4_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_4_bn/FusedBatchNormFusedBatchNormconv_dw_4/depthwiseconv_dw_4_bn/gamma/readconv_dw_4_bn/beta/readconv_dw_4_bn/Const_4conv_dw_4_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
e
conv_dw_4_bn/ShapeShapeconv_dw_4/depthwise*
T0*
out_type0*
_output_shapes
:
j
 conv_dw_4_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_dw_4_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_dw_4_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_4_bn/strided_sliceStridedSliceconv_dw_4_bn/Shape conv_dw_4_bn/strided_slice/stack"conv_dw_4_bn/strided_slice/stack_1"conv_dw_4_bn/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
g
conv_dw_4_bn/Shape_1Shapeconv_dw_4/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_4_bn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
n
$conv_dw_4_bn/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
n
$conv_dw_4_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_4_bn/strided_slice_1StridedSliceconv_dw_4_bn/Shape_1"conv_dw_4_bn/strided_slice_1/stack$conv_dw_4_bn/strided_slice_1/stack_1$conv_dw_4_bn/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
g
conv_dw_4_bn/Shape_2Shapeconv_dw_4/depthwise*
out_type0*
_output_shapes
:*
T0
l
"conv_dw_4_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_4_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_4_bn/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_dw_4_bn/strided_slice_2StridedSliceconv_dw_4_bn/Shape_2"conv_dw_4_bn/strided_slice_2/stack$conv_dw_4_bn/strided_slice_2/stack_1$conv_dw_4_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
conv_dw_4_bn/Rank/packedPackconv_dw_4_bn/strided_sliceconv_dw_4_bn/strided_slice_1conv_dw_4_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_4_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_dw_4_bn/range/startConst*
_output_shapes
: *
value	B : *
dtype0
Z
conv_dw_4_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_4_bn/rangeRangeconv_dw_4_bn/range/startconv_dw_4_bn/Rankconv_dw_4_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_dw_4_bn/Prod/inputPackconv_dw_4_bn/strided_sliceconv_dw_4_bn/strided_slice_1conv_dw_4_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_4_bn/ProdProdconv_dw_4_bn/Prod/inputconv_dw_4_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_dw_4_bn/CastCastconv_dw_4_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_4_bn/sub/yConst*
_output_shapes
: *
valueB
 *? ??*
dtype0
_
conv_dw_4_bn/subSubconv_dw_4_bn/Castconv_dw_4_bn/sub/y*
T0*
_output_shapes
: 
e
conv_dw_4_bn/truedivRealDivconv_dw_4_bn/Castconv_dw_4_bn/sub*
T0*
_output_shapes
: 
r
conv_dw_4_bn/mulMulconv_dw_4_bn/FusedBatchNorm:2conv_dw_4_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_dw_4_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_dw_4_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/zerosConst*+
_class!
loc:@conv_dw_4_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_4_bn/moving_mean/biased
VariableV2*
shared_name *+
_class!
loc:@conv_dw_4_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
&conv_dw_4_bn/moving_mean/biased/AssignAssignconv_dw_4_bn/moving_mean/biased;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_dw_4_bn/moving_mean/biased/readIdentityconv_dw_4_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes	
:?
?
5conv_dw_4_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_4_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_4_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_dw_4_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_dw_4_bn/moving_mean/local_step/AssignAssign#conv_dw_4_bn/moving_mean/local_step5conv_dw_4_bn/moving_mean/local_step/Initializer/zeros*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
(conv_dw_4_bn/moving_mean/local_step/readIdentity#conv_dw_4_bn/moving_mean/local_step*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean
?
9conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/subSub$conv_dw_4_bn/moving_mean/biased/readconv_dw_4_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean
?
9conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/mulMul9conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub"conv_dw_4_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes	
:?
?
Nconv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/conv_dw_4_bn/moving_mean	AssignSubconv_dw_4_bn/moving_mean/biased9conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes	
:?
?
Econv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_dw_4_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_4_bn/moving_mean/local_stepEconv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/AssignAdd/value*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes
: *
use_locking( *
T0
?
:conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/readIdentityconv_dw_4_bn/moving_mean/biased@^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/AssignAddO^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/conv_dw_4_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes	
:?
?
=conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_1/xConst@^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/AssignAddO^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/conv_dw_4_bn/moving_mean*+
_class!
loc:@conv_dw_4_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_1Sub=conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_1/x"conv_dw_4_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/read_1Identity#conv_dw_4_bn/moving_mean/local_step@^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/AssignAddO^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/conv_dw_4_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/PowPow;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_1<conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/read_1*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean
?
=conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_2/xConst@^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/AssignAddO^conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/conv_dw_4_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_dw_4_bn/moving_mean*
valueB
 *  ??*
dtype0
?
;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_2Sub=conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_2/x9conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/Pow*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean
?
=conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/truedivRealDiv:conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/read;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes	
:?
?
;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_3Subconv_dw_4_bn/moving_mean/read=conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_4_bn/AssignMovingAvg	AssignSubconv_dw_4_bn/moving_mean;conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/sub_3*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean
?
$conv_dw_4_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_dw_4_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_dw_4_bn/moving_variance
?
*conv_dw_4_bn/moving_variance/biased/AssignAssign#conv_dw_4_bn/moving_variance/biasedAconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_dw_4_bn/moving_variance/biased/readIdentity#conv_dw_4_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes	
:?*
T0
?
9conv_dw_4_bn/moving_variance/local_step/Initializer/zerosConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_4_bn/moving_variance*
valueB
 *    
?
'conv_dw_4_bn/moving_variance/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_dw_4_bn/moving_variance*
	container *
shape: 
?
.conv_dw_4_bn/moving_variance/local_step/AssignAssign'conv_dw_4_bn/moving_variance/local_step9conv_dw_4_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_dw_4_bn/moving_variance/local_step/readIdentity'conv_dw_4_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/subSub(conv_dw_4_bn/moving_variance/biased/readconv_dw_4_bn/mul*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance
?
?conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/mulMul?conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub$conv_dw_4_bn/AssignMovingAvg_1/decay*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance
?
Xconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/conv_dw_4_bn/moving_variance	AssignSub#conv_dw_4_bn/moving_variance/biased?conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/mul*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes	
:?*
use_locking( 
?
Kconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/AssignAdd/valueConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_4_bn/moving_variance*
valueB
 *  ??
?
Econv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_4_bn/moving_variance/local_stepKconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes
: 
?
@conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/readIdentity#conv_dw_4_bn/moving_variance/biasedF^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/AssignAddY^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/conv_dw_4_bn/moving_variance*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes	
:?*
T0
?
Cconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_1/xConstF^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/AssignAddY^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/conv_dw_4_bn/moving_variance*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_1SubCconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_1/x$conv_dw_4_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/read_1Identity'conv_dw_4_bn/moving_variance/local_stepF^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/AssignAddY^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/conv_dw_4_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/PowPowAconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_1Bconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/read_1*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance
?
Cconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_2/xConstF^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/AssignAddY^conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/conv_dw_4_bn/moving_variance*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_2SubCconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_2/x?conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/truedivRealDiv@conv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/readAconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes	
:?
?
Aconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_3Sub!conv_dw_4_bn/moving_variance/readCconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_4_bn/AssignMovingAvg_1	AssignSubconv_dw_4_bn/moving_varianceAconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/sub_3*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
conv_dw_4_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_dw_4_bn/cond/switch_tIdentityconv_dw_4_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_dw_4_bn/cond/switch_fIdentityconv_dw_4_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_dw_4_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
_output_shapes
: *
T0

?
conv_dw_4_bn/cond/Switch_1Switchconv_dw_4_bn/FusedBatchNormconv_dw_4_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_dw_4_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_dw_4_bn/cond/batchnorm/add/yConst^conv_dw_4_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_4_bn/cond/batchnorm/addAdd&conv_dw_4_bn/cond/batchnorm/add/Switch!conv_dw_4_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
&conv_dw_4_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_4_bn/moving_variance/readconv_dw_4_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance
q
!conv_dw_4_bn/cond/batchnorm/RsqrtRsqrtconv_dw_4_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_dw_4_bn/cond/batchnorm/mulMul!conv_dw_4_bn/cond/batchnorm/Rsqrt&conv_dw_4_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_dw_4_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_4_bn/gamma/readconv_dw_4_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_4_bn/gamma*"
_output_shapes
:?:?
?
!conv_dw_4_bn/cond/batchnorm/mul_1Mul(conv_dw_4_bn/cond/batchnorm/mul_1/Switchconv_dw_4_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
(conv_dw_4_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_4/depthwiseconv_dw_4_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*&
_class
loc:@conv_dw_4/depthwise
?
!conv_dw_4_bn/cond/batchnorm/mul_2Mul(conv_dw_4_bn/cond/batchnorm/mul_2/Switchconv_dw_4_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_dw_4_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_4_bn/moving_mean/readconv_dw_4_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean
?
conv_dw_4_bn/cond/batchnorm/subSub&conv_dw_4_bn/cond/batchnorm/sub/Switch!conv_dw_4_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_dw_4_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_4_bn/beta/readconv_dw_4_bn/cond/pred_id*
T0*$
_class
loc:@conv_dw_4_bn/beta*"
_output_shapes
:?:?
?
!conv_dw_4_bn/cond/batchnorm/add_1Add!conv_dw_4_bn/cond/batchnorm/mul_1conv_dw_4_bn/cond/batchnorm/sub*0
_output_shapes
:??????????*
T0
?
conv_dw_4_bn/cond/MergeMerge!conv_dw_4_bn/cond/batchnorm/add_1conv_dw_4_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_dw_4_relu/ReluReluconv_dw_4_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_dw_4_relu/ConstConst*
_output_shapes
: *
valueB
 *  ?@*
dtype0
?
conv_dw_4_relu/MinimumMinimumconv_dw_4_relu/Reluconv_dw_4_relu/Const*
T0*0
_output_shapes
:??????????
w
conv_pw_4/random_uniform/shapeConst*
_output_shapes
:*%
valueB"      ?      *
dtype0
a
conv_pw_4/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *   ?
a
conv_pw_4/random_uniform/maxConst*
valueB
 *   >*
dtype0*
_output_shapes
: 
?
&conv_pw_4/random_uniform/RandomUniformRandomUniformconv_pw_4/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2???*
seed???)
?
conv_pw_4/random_uniform/subSubconv_pw_4/random_uniform/maxconv_pw_4/random_uniform/min*
_output_shapes
: *
T0
?
conv_pw_4/random_uniform/mulMul&conv_pw_4/random_uniform/RandomUniformconv_pw_4/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_4/random_uniformAddconv_pw_4/random_uniform/mulconv_pw_4/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_4/kernel
VariableV2*
shared_name *
dtype0*(
_output_shapes
:??*
	container *
shape:??
?
conv_pw_4/kernel/AssignAssignconv_pw_4/kernelconv_pw_4/random_uniform*#
_class
loc:@conv_pw_4/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking(*
T0
?
conv_pw_4/kernel/readIdentityconv_pw_4/kernel*
T0*#
_class
loc:@conv_pw_4/kernel*(
_output_shapes
:??
t
#conv_pw_4/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_4/convolutionConv2Dconv_dw_4_relu/Minimumconv_pw_4/kernel/read*0
_output_shapes
:??????????*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
a
conv_pw_4_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_4_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_4_bn/gamma/AssignAssignconv_pw_4_bn/gammaconv_pw_4_bn/Const*%
_class
loc:@conv_pw_4_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_pw_4_bn/gamma/readIdentityconv_pw_4_bn/gamma*
T0*%
_class
loc:@conv_pw_4_bn/gamma*
_output_shapes	
:?
c
conv_pw_4_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_pw_4_bn/beta
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_pw_4_bn/beta/AssignAssignconv_pw_4_bn/betaconv_pw_4_bn/Const_1*$
_class
loc:@conv_pw_4_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_pw_4_bn/beta/readIdentityconv_pw_4_bn/beta*
_output_shapes	
:?*
T0*$
_class
loc:@conv_pw_4_bn/beta
c
conv_pw_4_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_4_bn/moving_mean
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_pw_4_bn/moving_mean/AssignAssignconv_pw_4_bn/moving_meanconv_pw_4_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_pw_4_bn/moving_mean/readIdentityconv_pw_4_bn/moving_mean*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean
c
conv_pw_4_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_4_bn/moving_variance
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
#conv_pw_4_bn/moving_variance/AssignAssignconv_pw_4_bn/moving_varianceconv_pw_4_bn/Const_3*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
!conv_pw_4_bn/moving_variance/readIdentityconv_pw_4_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?
W
conv_pw_4_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_pw_4_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_4_bn/FusedBatchNormFusedBatchNormconv_pw_4/convolutionconv_pw_4_bn/gamma/readconv_pw_4_bn/beta/readconv_pw_4_bn/Const_4conv_pw_4_bn/Const_5*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0*
data_formatNHWC
g
conv_pw_4_bn/ShapeShapeconv_pw_4/convolution*
T0*
out_type0*
_output_shapes
:
j
 conv_pw_4_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_4_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_pw_4_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_4_bn/strided_sliceStridedSliceconv_pw_4_bn/Shape conv_pw_4_bn/strided_slice/stack"conv_pw_4_bn/strided_slice/stack_1"conv_pw_4_bn/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_4_bn/Shape_1Shapeconv_pw_4/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_4_bn/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
n
$conv_pw_4_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_4_bn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_4_bn/strided_slice_1StridedSliceconv_pw_4_bn/Shape_1"conv_pw_4_bn/strided_slice_1/stack$conv_pw_4_bn/strided_slice_1/stack_1$conv_pw_4_bn/strided_slice_1/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask 
i
conv_pw_4_bn/Shape_2Shapeconv_pw_4/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_4_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_4_bn/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
n
$conv_pw_4_bn/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_pw_4_bn/strided_slice_2StridedSliceconv_pw_4_bn/Shape_2"conv_pw_4_bn/strided_slice_2/stack$conv_pw_4_bn/strided_slice_2/stack_1$conv_pw_4_bn/strided_slice_2/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
?
conv_pw_4_bn/Rank/packedPackconv_pw_4_bn/strided_sliceconv_pw_4_bn/strided_slice_1conv_pw_4_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_pw_4_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_pw_4_bn/range/startConst*
_output_shapes
: *
value	B : *
dtype0
Z
conv_pw_4_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_4_bn/rangeRangeconv_pw_4_bn/range/startconv_pw_4_bn/Rankconv_pw_4_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_pw_4_bn/Prod/inputPackconv_pw_4_bn/strided_sliceconv_pw_4_bn/strided_slice_1conv_pw_4_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_4_bn/ProdProdconv_pw_4_bn/Prod/inputconv_pw_4_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_pw_4_bn/CastCastconv_pw_4_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_4_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_pw_4_bn/subSubconv_pw_4_bn/Castconv_pw_4_bn/sub/y*
_output_shapes
: *
T0
e
conv_pw_4_bn/truedivRealDivconv_pw_4_bn/Castconv_pw_4_bn/sub*
_output_shapes
: *
T0
r
conv_pw_4_bn/mulMulconv_pw_4_bn/FusedBatchNorm:2conv_pw_4_bn/truediv*
_output_shapes	
:?*
T0
?
"conv_pw_4_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_pw_4_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/zerosConst*
dtype0*
_output_shapes	
:?*+
_class!
loc:@conv_pw_4_bn/moving_mean*
valueB?*    
?
conv_pw_4_bn/moving_mean/biased
VariableV2*
shared_name *+
_class!
loc:@conv_pw_4_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
&conv_pw_4_bn/moving_mean/biased/AssignAssignconv_pw_4_bn/moving_mean/biased;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/zeros*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
$conv_pw_4_bn/moving_mean/biased/readIdentityconv_pw_4_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes	
:?
?
5conv_pw_4_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_pw_4_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_pw_4_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_pw_4_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_pw_4_bn/moving_mean/local_step/AssignAssign#conv_pw_4_bn/moving_mean/local_step5conv_pw_4_bn/moving_mean/local_step/Initializer/zeros*+
_class!
loc:@conv_pw_4_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
(conv_pw_4_bn/moving_mean/local_step/readIdentity#conv_pw_4_bn/moving_mean/local_step*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean
?
9conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/subSub$conv_pw_4_bn/moving_mean/biased/readconv_pw_4_bn/FusedBatchNorm:1*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes	
:?*
T0
?
9conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/mulMul9conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub"conv_pw_4_bn/AssignMovingAvg/decay*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean
?
Nconv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/conv_pw_4_bn/moving_mean	AssignSubconv_pw_4_bn/moving_mean/biased9conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/mul*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean
?
Econv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/AssignAdd/valueConst*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_pw_4_bn/moving_mean*
valueB
 *  ??
?
?conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_4_bn/moving_mean/local_stepEconv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes
: 
?
:conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/readIdentityconv_pw_4_bn/moving_mean/biased@^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/AssignAddO^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/conv_pw_4_bn/moving_mean*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes	
:?*
T0
?
=conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_1/xConst@^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/AssignAddO^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/conv_pw_4_bn/moving_mean*+
_class!
loc:@conv_pw_4_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_1Sub=conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_1/x"conv_pw_4_bn/AssignMovingAvg/decay*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes
: *
T0
?
<conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/read_1Identity#conv_pw_4_bn/moving_mean/local_step@^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/AssignAddO^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/conv_pw_4_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean
?
9conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/PowPow;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_1<conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_2/xConst@^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/AssignAddO^conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/conv_pw_4_bn/moving_mean*+
_class!
loc:@conv_pw_4_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_2Sub=conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_2/x9conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/Pow*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/truedivRealDiv:conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/read;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes	
:?
?
;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_3Subconv_pw_4_bn/moving_mean/read=conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
_output_shapes	
:?
?
conv_pw_4_bn/AssignMovingAvg	AssignSubconv_pw_4_bn/moving_mean;conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/sub_3*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean
?
$conv_pw_4_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_pw_4_bn/moving_variance/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_pw_4_bn/moving_variance*
	container *
shape:?
?
*conv_pw_4_bn/moving_variance/biased/AssignAssign#conv_pw_4_bn/moving_variance/biasedAconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/zeros*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
(conv_pw_4_bn/moving_variance/biased/readIdentity#conv_pw_4_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?
?
9conv_pw_4_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_4_bn/moving_variance/local_step
VariableV2*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_pw_4_bn/moving_variance*
	container *
shape: *
dtype0
?
.conv_pw_4_bn/moving_variance/local_step/AssignAssign'conv_pw_4_bn/moving_variance/local_step9conv_pw_4_bn/moving_variance/local_step/Initializer/zeros*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
,conv_pw_4_bn/moving_variance/local_step/readIdentity'conv_pw_4_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/subSub(conv_pw_4_bn/moving_variance/biased/readconv_pw_4_bn/mul*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?
?
?conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/mulMul?conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub$conv_pw_4_bn/AssignMovingAvg_1/decay*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?*
T0
?
Xconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/conv_pw_4_bn/moving_variance	AssignSub#conv_pw_4_bn/moving_variance/biased?conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/mul*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
Kconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_4_bn/moving_variance/local_stepKconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/AssignAdd/value*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes
: *
use_locking( *
T0
?
@conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/readIdentity#conv_pw_4_bn/moving_variance/biasedF^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/AssignAddY^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/conv_pw_4_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?
?
Cconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_1/xConstF^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/AssignAddY^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/conv_pw_4_bn/moving_variance*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_1SubCconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_1/x$conv_pw_4_bn/AssignMovingAvg_1/decay*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance
?
Bconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/read_1Identity'conv_pw_4_bn/moving_variance/local_stepF^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/AssignAddY^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/conv_pw_4_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/PowPowAconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_1Bconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_2/xConstF^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/AssignAddY^conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/conv_pw_4_bn/moving_variance*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_2SubCconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_2/x?conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/truedivRealDiv@conv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/readAconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_2*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?*
T0
?
Aconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_3Sub!conv_pw_4_bn/moving_variance/readCconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance
?
conv_pw_4_bn/AssignMovingAvg_1	AssignSubconv_pw_4_bn/moving_varianceAconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/sub_3*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
_output_shapes	
:?*
use_locking( 
?
conv_pw_4_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_pw_4_bn/cond/switch_tIdentityconv_pw_4_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_4_bn/cond/switch_fIdentityconv_pw_4_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_pw_4_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_4_bn/cond/Switch_1Switchconv_pw_4_bn/FusedBatchNormconv_pw_4_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_pw_4_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_4_bn/cond/batchnorm/add/yConst^conv_pw_4_bn/cond/switch_f*
_output_shapes
: *
valueB
 *o?:*
dtype0
?
conv_pw_4_bn/cond/batchnorm/addAdd&conv_pw_4_bn/cond/batchnorm/add/Switch!conv_pw_4_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
&conv_pw_4_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_4_bn/moving_variance/readconv_pw_4_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_pw_4_bn/cond/batchnorm/RsqrtRsqrtconv_pw_4_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_pw_4_bn/cond/batchnorm/mulMul!conv_pw_4_bn/cond/batchnorm/Rsqrt&conv_pw_4_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_pw_4_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_4_bn/gamma/readconv_pw_4_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*%
_class
loc:@conv_pw_4_bn/gamma
?
!conv_pw_4_bn/cond/batchnorm/mul_1Mul(conv_pw_4_bn/cond/batchnorm/mul_1/Switchconv_pw_4_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
(conv_pw_4_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_4/convolutionconv_pw_4_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_4/convolution*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_4_bn/cond/batchnorm/mul_2Mul(conv_pw_4_bn/cond/batchnorm/mul_2/Switchconv_pw_4_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_pw_4_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_4_bn/moving_mean/readconv_pw_4_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean
?
conv_pw_4_bn/cond/batchnorm/subSub&conv_pw_4_bn/cond/batchnorm/sub/Switch!conv_pw_4_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_pw_4_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_4_bn/beta/readconv_pw_4_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*$
_class
loc:@conv_pw_4_bn/beta
?
!conv_pw_4_bn/cond/batchnorm/add_1Add!conv_pw_4_bn/cond/batchnorm/mul_1conv_pw_4_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_pw_4_bn/cond/MergeMerge!conv_pw_4_bn/cond/batchnorm/add_1conv_pw_4_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_pw_4_relu/ReluReluconv_pw_4_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_pw_4_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_4_relu/MinimumMinimumconv_pw_4_relu/Reluconv_pw_4_relu/Const*
T0*0
_output_shapes
:??????????
?
conv_pad_5/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_5/PadPadconv_pw_4_relu/Minimumconv_pad_5/Pad/paddings*
T0*
	Tpaddings0*0
_output_shapes
:??????????
w
conv_dw_5/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
a
conv_dw_5/random_uniform/minConst*
_output_shapes
: *
valueB
 *??P?*
dtype0
a
conv_dw_5/random_uniform/maxConst*
valueB
 *??P=*
dtype0*
_output_shapes
: 
?
&conv_dw_5/random_uniform/RandomUniformRandomUniformconv_dw_5/random_uniform/shape*
dtype0*'
_output_shapes
:?*
seed2ʻ?*
seed???)*
T0
?
conv_dw_5/random_uniform/subSubconv_dw_5/random_uniform/maxconv_dw_5/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_5/random_uniform/mulMul&conv_dw_5/random_uniform/RandomUniformconv_dw_5/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_5/random_uniformAddconv_dw_5/random_uniform/mulconv_dw_5/random_uniform/min*'
_output_shapes
:?*
T0
?
conv_dw_5/depthwise_kernel
VariableV2*
shared_name *
dtype0*'
_output_shapes
:?*
	container *
shape:?
?
!conv_dw_5/depthwise_kernel/AssignAssignconv_dw_5/depthwise_kernelconv_dw_5/random_uniform*
use_locking(*
T0*-
_class#
!loc:@conv_dw_5/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
conv_dw_5/depthwise_kernel/readIdentityconv_dw_5/depthwise_kernel*'
_output_shapes
:?*
T0*-
_class#
!loc:@conv_dw_5/depthwise_kernel
r
conv_dw_5/depthwise/ShapeConst*
_output_shapes
:*%
valueB"            *
dtype0
r
!conv_dw_5/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_5/depthwiseDepthwiseConv2dNativeconv_pad_5/Padconv_dw_5/depthwise_kernel/read*
paddingVALID*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides

a
conv_dw_5_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_5_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_dw_5_bn/gamma/AssignAssignconv_dw_5_bn/gammaconv_dw_5_bn/Const*%
_class
loc:@conv_dw_5_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_dw_5_bn/gamma/readIdentityconv_dw_5_bn/gamma*
_output_shapes	
:?*
T0*%
_class
loc:@conv_dw_5_bn/gamma
c
conv_dw_5_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_dw_5_bn/beta
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_dw_5_bn/beta/AssignAssignconv_dw_5_bn/betaconv_dw_5_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_dw_5_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_dw_5_bn/beta/readIdentityconv_dw_5_bn/beta*
T0*$
_class
loc:@conv_dw_5_bn/beta*
_output_shapes	
:?
c
conv_dw_5_bn/Const_2Const*
_output_shapes	
:?*
valueB?*    *
dtype0
?
conv_dw_5_bn/moving_mean
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_dw_5_bn/moving_mean/AssignAssignconv_dw_5_bn/moving_meanconv_dw_5_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_dw_5_bn/moving_mean/readIdentityconv_dw_5_bn/moving_mean*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?*
T0
c
conv_dw_5_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_5_bn/moving_variance
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
#conv_dw_5_bn/moving_variance/AssignAssignconv_dw_5_bn/moving_varianceconv_dw_5_bn/Const_3*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
!conv_dw_5_bn/moving_variance/readIdentityconv_dw_5_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes	
:?
W
conv_dw_5_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_dw_5_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_5_bn/FusedBatchNormFusedBatchNormconv_dw_5/depthwiseconv_dw_5_bn/gamma/readconv_dw_5_bn/beta/readconv_dw_5_bn/Const_4conv_dw_5_bn/Const_5*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0
e
conv_dw_5_bn/ShapeShapeconv_dw_5/depthwise*
T0*
out_type0*
_output_shapes
:
j
 conv_dw_5_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_dw_5_bn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
l
"conv_dw_5_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_5_bn/strided_sliceStridedSliceconv_dw_5_bn/Shape conv_dw_5_bn/strided_slice/stack"conv_dw_5_bn/strided_slice/stack_1"conv_dw_5_bn/strided_slice/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask 
g
conv_dw_5_bn/Shape_1Shapeconv_dw_5/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_5_bn/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
n
$conv_dw_5_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_5_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_5_bn/strided_slice_1StridedSliceconv_dw_5_bn/Shape_1"conv_dw_5_bn/strided_slice_1/stack$conv_dw_5_bn/strided_slice_1/stack_1$conv_dw_5_bn/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
g
conv_dw_5_bn/Shape_2Shapeconv_dw_5/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_5_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_5_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_5_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_5_bn/strided_slice_2StridedSliceconv_dw_5_bn/Shape_2"conv_dw_5_bn/strided_slice_2/stack$conv_dw_5_bn/strided_slice_2/stack_1$conv_dw_5_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
conv_dw_5_bn/Rank/packedPackconv_dw_5_bn/strided_sliceconv_dw_5_bn/strided_slice_1conv_dw_5_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_5_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_dw_5_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_dw_5_bn/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
?
conv_dw_5_bn/rangeRangeconv_dw_5_bn/range/startconv_dw_5_bn/Rankconv_dw_5_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_dw_5_bn/Prod/inputPackconv_dw_5_bn/strided_sliceconv_dw_5_bn/strided_slice_1conv_dw_5_bn/strided_slice_2*
N*
_output_shapes
:*
T0*

axis 
?
conv_dw_5_bn/ProdProdconv_dw_5_bn/Prod/inputconv_dw_5_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
l
conv_dw_5_bn/CastCastconv_dw_5_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_5_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_dw_5_bn/subSubconv_dw_5_bn/Castconv_dw_5_bn/sub/y*
_output_shapes
: *
T0
e
conv_dw_5_bn/truedivRealDivconv_dw_5_bn/Castconv_dw_5_bn/sub*
_output_shapes
: *
T0
r
conv_dw_5_bn/mulMulconv_dw_5_bn/FusedBatchNorm:2conv_dw_5_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_dw_5_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_dw_5_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/zerosConst*+
_class!
loc:@conv_dw_5_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_5_bn/moving_mean/biased
VariableV2*
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_dw_5_bn/moving_mean*
	container 
?
&conv_dw_5_bn/moving_mean/biased/AssignAssignconv_dw_5_bn/moving_mean/biased;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_dw_5_bn/moving_mean/biased/readIdentityconv_dw_5_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?
?
5conv_dw_5_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_5_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_5_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_dw_5_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_dw_5_bn/moving_mean/local_step/AssignAssign#conv_dw_5_bn/moving_mean/local_step5conv_dw_5_bn/moving_mean/local_step/Initializer/zeros*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
validate_shape(
?
(conv_dw_5_bn/moving_mean/local_step/readIdentity#conv_dw_5_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/subSub$conv_dw_5_bn/moving_mean/biased/readconv_dw_5_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?
?
9conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/mulMul9conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub"conv_dw_5_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?
?
Nconv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/conv_dw_5_bn/moving_mean	AssignSubconv_dw_5_bn/moving_mean/biased9conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?
?
Econv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_dw_5_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_5_bn/moving_mean/local_stepEconv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes
: 
?
:conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/readIdentityconv_dw_5_bn/moving_mean/biased@^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/AssignAddO^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/conv_dw_5_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?
?
=conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_1/xConst@^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/AssignAddO^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/conv_dw_5_bn/moving_mean*+
_class!
loc:@conv_dw_5_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_1Sub=conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_1/x"conv_dw_5_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/read_1Identity#conv_dw_5_bn/moving_mean/local_step@^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/AssignAddO^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/conv_dw_5_bn/moving_mean*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes
: *
T0
?
9conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/PowPow;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_1<conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/read_1*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean
?
=conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_2/xConst@^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/AssignAddO^conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/conv_dw_5_bn/moving_mean*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_dw_5_bn/moving_mean*
valueB
 *  ??
?
;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_2Sub=conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_2/x9conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/Pow*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/truedivRealDiv:conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/read;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean
?
;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_3Subconv_dw_5_bn/moving_mean/read=conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_5_bn/AssignMovingAvg	AssignSubconv_dw_5_bn/moving_mean;conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/sub_3*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
_output_shapes	
:?*
use_locking( 
?
$conv_dw_5_bn/AssignMovingAvg_1/decayConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_5_bn/moving_variance*
valueB
 *
?#<
?
Aconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_dw_5_bn/moving_variance/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_dw_5_bn/moving_variance*
	container *
shape:?
?
*conv_dw_5_bn/moving_variance/biased/AssignAssign#conv_dw_5_bn/moving_variance/biasedAconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_dw_5_bn/moving_variance/biased/readIdentity#conv_dw_5_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes	
:?
?
9conv_dw_5_bn/moving_variance/local_step/Initializer/zerosConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_5_bn/moving_variance*
valueB
 *    
?
'conv_dw_5_bn/moving_variance/local_step
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_dw_5_bn/moving_variance
?
.conv_dw_5_bn/moving_variance/local_step/AssignAssign'conv_dw_5_bn/moving_variance/local_step9conv_dw_5_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_dw_5_bn/moving_variance/local_step/readIdentity'conv_dw_5_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/subSub(conv_dw_5_bn/moving_variance/biased/readconv_dw_5_bn/mul*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes	
:?
?
?conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/mulMul?conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub$conv_dw_5_bn/AssignMovingAvg_1/decay*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance
?
Xconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/conv_dw_5_bn/moving_variance	AssignSub#conv_dw_5_bn/moving_variance/biased?conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes	
:?
?
Kconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/AssignAdd/valueConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_5_bn/moving_variance*
valueB
 *  ??
?
Econv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_5_bn/moving_variance/local_stepKconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance
?
@conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/readIdentity#conv_dw_5_bn/moving_variance/biasedF^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/AssignAddY^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/conv_dw_5_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes	
:?
?
Cconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_1/xConstF^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/AssignAddY^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/conv_dw_5_bn/moving_variance*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_1SubCconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_1/x$conv_dw_5_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/read_1Identity'conv_dw_5_bn/moving_variance/local_stepF^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/AssignAddY^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/conv_dw_5_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/PowPowAconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_1Bconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_2/xConstF^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/AssignAddY^conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/conv_dw_5_bn/moving_variance*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_2SubCconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_2/x?conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/truedivRealDiv@conv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/readAconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance
?
Aconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_3Sub!conv_dw_5_bn/moving_variance/readCconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_5_bn/AssignMovingAvg_1	AssignSubconv_dw_5_bn/moving_varianceAconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/sub_3*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
_output_shapes	
:?*
use_locking( 
?
conv_dw_5_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_dw_5_bn/cond/switch_tIdentityconv_dw_5_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_dw_5_bn/cond/switch_fIdentityconv_dw_5_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_dw_5_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_5_bn/cond/Switch_1Switchconv_dw_5_bn/FusedBatchNormconv_dw_5_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*.
_class$
" loc:@conv_dw_5_bn/FusedBatchNorm
?
!conv_dw_5_bn/cond/batchnorm/add/yConst^conv_dw_5_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_5_bn/cond/batchnorm/addAdd&conv_dw_5_bn/cond/batchnorm/add/Switch!conv_dw_5_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_dw_5_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_5_bn/moving_variance/readconv_dw_5_bn/cond/pred_id*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*"
_output_shapes
:?:?*
T0
q
!conv_dw_5_bn/cond/batchnorm/RsqrtRsqrtconv_dw_5_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
conv_dw_5_bn/cond/batchnorm/mulMul!conv_dw_5_bn/cond/batchnorm/Rsqrt&conv_dw_5_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_dw_5_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_5_bn/gamma/readconv_dw_5_bn/cond/pred_id*%
_class
loc:@conv_dw_5_bn/gamma*"
_output_shapes
:?:?*
T0
?
!conv_dw_5_bn/cond/batchnorm/mul_1Mul(conv_dw_5_bn/cond/batchnorm/mul_1/Switchconv_dw_5_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
(conv_dw_5_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_5/depthwiseconv_dw_5_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*&
_class
loc:@conv_dw_5/depthwise
?
!conv_dw_5_bn/cond/batchnorm/mul_2Mul(conv_dw_5_bn/cond/batchnorm/mul_2/Switchconv_dw_5_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_dw_5_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_5_bn/moving_mean/readconv_dw_5_bn/cond/pred_id*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*"
_output_shapes
:?:?
?
conv_dw_5_bn/cond/batchnorm/subSub&conv_dw_5_bn/cond/batchnorm/sub/Switch!conv_dw_5_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_dw_5_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_5_bn/beta/readconv_dw_5_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*$
_class
loc:@conv_dw_5_bn/beta
?
!conv_dw_5_bn/cond/batchnorm/add_1Add!conv_dw_5_bn/cond/batchnorm/mul_1conv_dw_5_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_dw_5_bn/cond/MergeMerge!conv_dw_5_bn/cond/batchnorm/add_1conv_dw_5_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_dw_5_relu/ReluReluconv_dw_5_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_dw_5_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_5_relu/MinimumMinimumconv_dw_5_relu/Reluconv_dw_5_relu/Const*
T0*0
_output_shapes
:??????????
w
conv_pw_5/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
a
conv_pw_5/random_uniform/minConst*
valueB
 *׳ݽ*
dtype0*
_output_shapes
: 
a
conv_pw_5/random_uniform/maxConst*
valueB
 *׳?=*
dtype0*
_output_shapes
: 
?
&conv_pw_5/random_uniform/RandomUniformRandomUniformconv_pw_5/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2???*
seed???)
?
conv_pw_5/random_uniform/subSubconv_pw_5/random_uniform/maxconv_pw_5/random_uniform/min*
T0*
_output_shapes
: 
?
conv_pw_5/random_uniform/mulMul&conv_pw_5/random_uniform/RandomUniformconv_pw_5/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_5/random_uniformAddconv_pw_5/random_uniform/mulconv_pw_5/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_5/kernel
VariableV2*
dtype0*(
_output_shapes
:??*
	container *
shape:??*
shared_name 
?
conv_pw_5/kernel/AssignAssignconv_pw_5/kernelconv_pw_5/random_uniform*
use_locking(*
T0*#
_class
loc:@conv_pw_5/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_5/kernel/readIdentityconv_pw_5/kernel*
T0*#
_class
loc:@conv_pw_5/kernel*(
_output_shapes
:??
t
#conv_pw_5/convolution/dilation_rateConst*
_output_shapes
:*
valueB"      *
dtype0
?
conv_pw_5/convolutionConv2Dconv_dw_5_relu/Minimumconv_pw_5/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME*0
_output_shapes
:??????????
a
conv_pw_5_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_5_bn/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_5_bn/gamma/AssignAssignconv_pw_5_bn/gammaconv_pw_5_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_pw_5_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_pw_5_bn/gamma/readIdentityconv_pw_5_bn/gamma*
_output_shapes	
:?*
T0*%
_class
loc:@conv_pw_5_bn/gamma
c
conv_pw_5_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_pw_5_bn/beta
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_5_bn/beta/AssignAssignconv_pw_5_bn/betaconv_pw_5_bn/Const_1*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*$
_class
loc:@conv_pw_5_bn/beta
?
conv_pw_5_bn/beta/readIdentityconv_pw_5_bn/beta*
T0*$
_class
loc:@conv_pw_5_bn/beta*
_output_shapes	
:?
c
conv_pw_5_bn/Const_2Const*
_output_shapes	
:?*
valueB?*    *
dtype0
?
conv_pw_5_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_5_bn/moving_mean/AssignAssignconv_pw_5_bn/moving_meanconv_pw_5_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_pw_5_bn/moving_mean/readIdentityconv_pw_5_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes	
:?
c
conv_pw_5_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_5_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
#conv_pw_5_bn/moving_variance/AssignAssignconv_pw_5_bn/moving_varianceconv_pw_5_bn/Const_3*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
!conv_pw_5_bn/moving_variance/readIdentityconv_pw_5_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes	
:?
W
conv_pw_5_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_pw_5_bn/Const_5Const*
dtype0*
_output_shapes
: *
valueB 
?
conv_pw_5_bn/FusedBatchNormFusedBatchNormconv_pw_5/convolutionconv_pw_5_bn/gamma/readconv_pw_5_bn/beta/readconv_pw_5_bn/Const_4conv_pw_5_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
g
conv_pw_5_bn/ShapeShapeconv_pw_5/convolution*
out_type0*
_output_shapes
:*
T0
j
 conv_pw_5_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_5_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_pw_5_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_5_bn/strided_sliceStridedSliceconv_pw_5_bn/Shape conv_pw_5_bn/strided_slice/stack"conv_pw_5_bn/strided_slice/stack_1"conv_pw_5_bn/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_5_bn/Shape_1Shapeconv_pw_5/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_5_bn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
n
$conv_pw_5_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_5_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_5_bn/strided_slice_1StridedSliceconv_pw_5_bn/Shape_1"conv_pw_5_bn/strided_slice_1/stack$conv_pw_5_bn/strided_slice_1/stack_1$conv_pw_5_bn/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_5_bn/Shape_2Shapeconv_pw_5/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_5_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_5_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_5_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_5_bn/strided_slice_2StridedSliceconv_pw_5_bn/Shape_2"conv_pw_5_bn/strided_slice_2/stack$conv_pw_5_bn/strided_slice_2/stack_1$conv_pw_5_bn/strided_slice_2/stack_2*
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
?
conv_pw_5_bn/Rank/packedPackconv_pw_5_bn/strided_sliceconv_pw_5_bn/strided_slice_1conv_pw_5_bn/strided_slice_2*

axis *
N*
_output_shapes
:*
T0
S
conv_pw_5_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_pw_5_bn/range/startConst*
_output_shapes
: *
value	B : *
dtype0
Z
conv_pw_5_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_5_bn/rangeRangeconv_pw_5_bn/range/startconv_pw_5_bn/Rankconv_pw_5_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_5_bn/Prod/inputPackconv_pw_5_bn/strided_sliceconv_pw_5_bn/strided_slice_1conv_pw_5_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_5_bn/ProdProdconv_pw_5_bn/Prod/inputconv_pw_5_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
l
conv_pw_5_bn/CastCastconv_pw_5_bn/Prod*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0
W
conv_pw_5_bn/sub/yConst*
_output_shapes
: *
valueB
 *? ??*
dtype0
_
conv_pw_5_bn/subSubconv_pw_5_bn/Castconv_pw_5_bn/sub/y*
T0*
_output_shapes
: 
e
conv_pw_5_bn/truedivRealDivconv_pw_5_bn/Castconv_pw_5_bn/sub*
_output_shapes
: *
T0
r
conv_pw_5_bn/mulMulconv_pw_5_bn/FusedBatchNorm:2conv_pw_5_bn/truediv*
_output_shapes	
:?*
T0
?
"conv_pw_5_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_pw_5_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/zerosConst*
dtype0*
_output_shapes	
:?*+
_class!
loc:@conv_pw_5_bn/moving_mean*
valueB?*    
?
conv_pw_5_bn/moving_mean/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_pw_5_bn/moving_mean
?
&conv_pw_5_bn/moving_mean/biased/AssignAssignconv_pw_5_bn/moving_mean/biased;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_pw_5_bn/moving_mean/biased/readIdentityconv_pw_5_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes	
:?
?
5conv_pw_5_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_pw_5_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_pw_5_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_pw_5_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_pw_5_bn/moving_mean/local_step/AssignAssign#conv_pw_5_bn/moving_mean/local_step5conv_pw_5_bn/moving_mean/local_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean
?
(conv_pw_5_bn/moving_mean/local_step/readIdentity#conv_pw_5_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes
: *
T0
?
9conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/subSub$conv_pw_5_bn/moving_mean/biased/readconv_pw_5_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean
?
9conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/mulMul9conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub"conv_pw_5_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes	
:?
?
Nconv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/conv_pw_5_bn/moving_mean	AssignSubconv_pw_5_bn/moving_mean/biased9conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes	
:?
?
Econv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_pw_5_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_5_bn/moving_mean/local_stepEconv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes
: 
?
:conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/readIdentityconv_pw_5_bn/moving_mean/biased@^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/AssignAddO^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/conv_pw_5_bn/moving_mean*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean
?
=conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_1/xConst@^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/AssignAddO^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/conv_pw_5_bn/moving_mean*+
_class!
loc:@conv_pw_5_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_1Sub=conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_1/x"conv_pw_5_bn/AssignMovingAvg/decay*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean
?
<conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/read_1Identity#conv_pw_5_bn/moving_mean/local_step@^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/AssignAddO^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/conv_pw_5_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/PowPow;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_1<conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_2/xConst@^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/AssignAddO^conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/conv_pw_5_bn/moving_mean*+
_class!
loc:@conv_pw_5_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_2Sub=conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_2/x9conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/Pow*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/truedivRealDiv:conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/read;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes	
:?
?
;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_3Subconv_pw_5_bn/moving_mean/read=conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes	
:?
?
conv_pw_5_bn/AssignMovingAvg	AssignSubconv_pw_5_bn/moving_mean;conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
_output_shapes	
:?
?
$conv_pw_5_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/zerosConst*
dtype0*
_output_shapes	
:?*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
valueB?*    
?
#conv_pw_5_bn/moving_variance/biased
VariableV2*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
*conv_pw_5_bn/moving_variance/biased/AssignAssign#conv_pw_5_bn/moving_variance/biasedAconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/zeros*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
(conv_pw_5_bn/moving_variance/biased/readIdentity#conv_pw_5_bn/moving_variance/biased*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance
?
9conv_pw_5_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_5_bn/moving_variance/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_pw_5_bn/moving_variance*
	container *
shape: 
?
.conv_pw_5_bn/moving_variance/local_step/AssignAssign'conv_pw_5_bn/moving_variance/local_step9conv_pw_5_bn/moving_variance/local_step/Initializer/zeros*
_output_shapes
: *
use_locking(*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
validate_shape(
?
,conv_pw_5_bn/moving_variance/local_step/readIdentity'conv_pw_5_bn/moving_variance/local_step*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance
?
?conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/subSub(conv_pw_5_bn/moving_variance/biased/readconv_pw_5_bn/mul*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes	
:?*
T0
?
?conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/mulMul?conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub$conv_pw_5_bn/AssignMovingAvg_1/decay*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance
?
Xconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/conv_pw_5_bn/moving_variance	AssignSub#conv_pw_5_bn/moving_variance/biased?conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/mul*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes	
:?*
use_locking( 
?
Kconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_5_bn/moving_variance/local_stepKconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes
: 
?
@conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/readIdentity#conv_pw_5_bn/moving_variance/biasedF^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/AssignAddY^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/conv_pw_5_bn/moving_variance*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes	
:?*
T0
?
Cconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_1/xConstF^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/AssignAddY^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/conv_pw_5_bn/moving_variance*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_1SubCconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_1/x$conv_pw_5_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/read_1Identity'conv_pw_5_bn/moving_variance/local_stepF^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/AssignAddY^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/conv_pw_5_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/PowPowAconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_1Bconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/read_1*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance
?
Cconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_2/xConstF^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/AssignAddY^conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/conv_pw_5_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_pw_5_bn/moving_variance*
valueB
 *  ??
?
Aconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_2SubCconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_2/x?conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/truedivRealDiv@conv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/readAconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_3Sub!conv_pw_5_bn/moving_variance/readCconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_5_bn/AssignMovingAvg_1	AssignSubconv_pw_5_bn/moving_varianceAconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_5_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_pw_5_bn/cond/switch_tIdentityconv_pw_5_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_5_bn/cond/switch_fIdentityconv_pw_5_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_pw_5_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_5_bn/cond/Switch_1Switchconv_pw_5_bn/FusedBatchNormconv_pw_5_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_pw_5_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_5_bn/cond/batchnorm/add/yConst^conv_pw_5_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_pw_5_bn/cond/batchnorm/addAdd&conv_pw_5_bn/cond/batchnorm/add/Switch!conv_pw_5_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_pw_5_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_5_bn/moving_variance/readconv_pw_5_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_pw_5_bn/cond/batchnorm/RsqrtRsqrtconv_pw_5_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_pw_5_bn/cond/batchnorm/mulMul!conv_pw_5_bn/cond/batchnorm/Rsqrt&conv_pw_5_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
&conv_pw_5_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_5_bn/gamma/readconv_pw_5_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*%
_class
loc:@conv_pw_5_bn/gamma
?
!conv_pw_5_bn/cond/batchnorm/mul_1Mul(conv_pw_5_bn/cond/batchnorm/mul_1/Switchconv_pw_5_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
(conv_pw_5_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_5/convolutionconv_pw_5_bn/cond/pred_id*(
_class
loc:@conv_pw_5/convolution*L
_output_shapes:
8:??????????:??????????*
T0
?
!conv_pw_5_bn/cond/batchnorm/mul_2Mul(conv_pw_5_bn/cond/batchnorm/mul_2/Switchconv_pw_5_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_pw_5_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_5_bn/moving_mean/readconv_pw_5_bn/cond/pred_id*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*"
_output_shapes
:?:?
?
conv_pw_5_bn/cond/batchnorm/subSub&conv_pw_5_bn/cond/batchnorm/sub/Switch!conv_pw_5_bn/cond/batchnorm/mul_2*
_output_shapes	
:?*
T0
?
&conv_pw_5_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_5_bn/beta/readconv_pw_5_bn/cond/pred_id*$
_class
loc:@conv_pw_5_bn/beta*"
_output_shapes
:?:?*
T0
?
!conv_pw_5_bn/cond/batchnorm/add_1Add!conv_pw_5_bn/cond/batchnorm/mul_1conv_pw_5_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_pw_5_bn/cond/MergeMerge!conv_pw_5_bn/cond/batchnorm/add_1conv_pw_5_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_pw_5_relu/ReluReluconv_pw_5_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_pw_5_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_5_relu/MinimumMinimumconv_pw_5_relu/Reluconv_pw_5_relu/Const*0
_output_shapes
:??????????*
T0
?
conv_pad_6/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_6/PadPadconv_pw_5_relu/Minimumconv_pad_6/Pad/paddings*
	Tpaddings0*0
_output_shapes
:??????????*
T0
w
conv_dw_6/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
a
conv_dw_6/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *??P?
a
conv_dw_6/random_uniform/maxConst*
valueB
 *??P=*
dtype0*
_output_shapes
: 
?
&conv_dw_6/random_uniform/RandomUniformRandomUniformconv_dw_6/random_uniform/shape*
T0*
dtype0*'
_output_shapes
:?*
seed2???*
seed???)
?
conv_dw_6/random_uniform/subSubconv_dw_6/random_uniform/maxconv_dw_6/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_6/random_uniform/mulMul&conv_dw_6/random_uniform/RandomUniformconv_dw_6/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_6/random_uniformAddconv_dw_6/random_uniform/mulconv_dw_6/random_uniform/min*'
_output_shapes
:?*
T0
?
conv_dw_6/depthwise_kernel
VariableV2*
shared_name *
dtype0*'
_output_shapes
:?*
	container *
shape:?
?
!conv_dw_6/depthwise_kernel/AssignAssignconv_dw_6/depthwise_kernelconv_dw_6/random_uniform*'
_output_shapes
:?*
use_locking(*
T0*-
_class#
!loc:@conv_dw_6/depthwise_kernel*
validate_shape(
?
conv_dw_6/depthwise_kernel/readIdentityconv_dw_6/depthwise_kernel*
T0*-
_class#
!loc:@conv_dw_6/depthwise_kernel*'
_output_shapes
:?
r
conv_dw_6/depthwise/ShapeConst*%
valueB"            *
dtype0*
_output_shapes
:
r
!conv_dw_6/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_6/depthwiseDepthwiseConv2dNativeconv_pad_6/Padconv_dw_6/depthwise_kernel/read*
paddingVALID*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides

a
conv_dw_6_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_6_bn/gamma
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_dw_6_bn/gamma/AssignAssignconv_dw_6_bn/gammaconv_dw_6_bn/Const*%
_class
loc:@conv_dw_6_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_dw_6_bn/gamma/readIdentityconv_dw_6_bn/gamma*
_output_shapes	
:?*
T0*%
_class
loc:@conv_dw_6_bn/gamma
c
conv_dw_6_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_dw_6_bn/beta
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_dw_6_bn/beta/AssignAssignconv_dw_6_bn/betaconv_dw_6_bn/Const_1*$
_class
loc:@conv_dw_6_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_dw_6_bn/beta/readIdentityconv_dw_6_bn/beta*
T0*$
_class
loc:@conv_dw_6_bn/beta*
_output_shapes	
:?
c
conv_dw_6_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_6_bn/moving_mean
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_6_bn/moving_mean/AssignAssignconv_dw_6_bn/moving_meanconv_dw_6_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_dw_6_bn/moving_mean/readIdentityconv_dw_6_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes	
:?
c
conv_dw_6_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_6_bn/moving_variance
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
#conv_dw_6_bn/moving_variance/AssignAssignconv_dw_6_bn/moving_varianceconv_dw_6_bn/Const_3*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
!conv_dw_6_bn/moving_variance/readIdentityconv_dw_6_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes	
:?
W
conv_dw_6_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_dw_6_bn/Const_5Const*
_output_shapes
: *
valueB *
dtype0
?
conv_dw_6_bn/FusedBatchNormFusedBatchNormconv_dw_6/depthwiseconv_dw_6_bn/gamma/readconv_dw_6_bn/beta/readconv_dw_6_bn/Const_4conv_dw_6_bn/Const_5*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0
e
conv_dw_6_bn/ShapeShapeconv_dw_6/depthwise*
T0*
out_type0*
_output_shapes
:
j
 conv_dw_6_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_dw_6_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_dw_6_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_6_bn/strided_sliceStridedSliceconv_dw_6_bn/Shape conv_dw_6_bn/strided_slice/stack"conv_dw_6_bn/strided_slice/stack_1"conv_dw_6_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
g
conv_dw_6_bn/Shape_1Shapeconv_dw_6/depthwise*
_output_shapes
:*
T0*
out_type0
l
"conv_dw_6_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_6_bn/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
n
$conv_dw_6_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_6_bn/strided_slice_1StridedSliceconv_dw_6_bn/Shape_1"conv_dw_6_bn/strided_slice_1/stack$conv_dw_6_bn/strided_slice_1/stack_1$conv_dw_6_bn/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
g
conv_dw_6_bn/Shape_2Shapeconv_dw_6/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_6_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_6_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_6_bn/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_dw_6_bn/strided_slice_2StridedSliceconv_dw_6_bn/Shape_2"conv_dw_6_bn/strided_slice_2/stack$conv_dw_6_bn/strided_slice_2/stack_1$conv_dw_6_bn/strided_slice_2/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_dw_6_bn/Rank/packedPackconv_dw_6_bn/strided_sliceconv_dw_6_bn/strided_slice_1conv_dw_6_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_6_bn/RankConst*
_output_shapes
: *
value	B :*
dtype0
Z
conv_dw_6_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_dw_6_bn/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
?
conv_dw_6_bn/rangeRangeconv_dw_6_bn/range/startconv_dw_6_bn/Rankconv_dw_6_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_dw_6_bn/Prod/inputPackconv_dw_6_bn/strided_sliceconv_dw_6_bn/strided_slice_1conv_dw_6_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_6_bn/ProdProdconv_dw_6_bn/Prod/inputconv_dw_6_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_dw_6_bn/CastCastconv_dw_6_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_6_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_dw_6_bn/subSubconv_dw_6_bn/Castconv_dw_6_bn/sub/y*
T0*
_output_shapes
: 
e
conv_dw_6_bn/truedivRealDivconv_dw_6_bn/Castconv_dw_6_bn/sub*
_output_shapes
: *
T0
r
conv_dw_6_bn/mulMulconv_dw_6_bn/FusedBatchNorm:2conv_dw_6_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_dw_6_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_dw_6_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/zerosConst*+
_class!
loc:@conv_dw_6_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_6_bn/moving_mean/biased
VariableV2*
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_dw_6_bn/moving_mean*
	container 
?
&conv_dw_6_bn/moving_mean/biased/AssignAssignconv_dw_6_bn/moving_mean/biased;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
$conv_dw_6_bn/moving_mean/biased/readIdentityconv_dw_6_bn/moving_mean/biased*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
5conv_dw_6_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_6_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_6_bn/moving_mean/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_dw_6_bn/moving_mean*
	container *
shape: 
?
*conv_dw_6_bn/moving_mean/local_step/AssignAssign#conv_dw_6_bn/moving_mean/local_step5conv_dw_6_bn/moving_mean/local_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
(conv_dw_6_bn/moving_mean/local_step/readIdentity#conv_dw_6_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/subSub$conv_dw_6_bn/moving_mean/biased/readconv_dw_6_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes	
:?
?
9conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/mulMul9conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub"conv_dw_6_bn/AssignMovingAvg/decay*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
Nconv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/conv_dw_6_bn/moving_mean	AssignSubconv_dw_6_bn/moving_mean/biased9conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes	
:?
?
Econv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_dw_6_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_6_bn/moving_mean/local_stepEconv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/AssignAdd/value*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes
: *
use_locking( 
?
:conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/readIdentityconv_dw_6_bn/moving_mean/biased@^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/AssignAddO^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/conv_dw_6_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes	
:?
?
=conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_1/xConst@^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/AssignAddO^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/conv_dw_6_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_dw_6_bn/moving_mean*
valueB
 *  ??*
dtype0
?
;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_1Sub=conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_1/x"conv_dw_6_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/read_1Identity#conv_dw_6_bn/moving_mean/local_step@^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/AssignAddO^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/conv_dw_6_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
9conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/PowPow;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_1<conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/read_1*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
=conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_2/xConst@^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/AssignAddO^conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/conv_dw_6_bn/moving_mean*+
_class!
loc:@conv_dw_6_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_2Sub=conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_2/x9conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/Pow*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/truedivRealDiv:conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/read;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes	
:?
?
;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_3Subconv_dw_6_bn/moving_mean/read=conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/truediv*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
conv_dw_6_bn/AssignMovingAvg	AssignSubconv_dw_6_bn/moving_mean;conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/sub_3*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
_output_shapes	
:?*
use_locking( 
?
$conv_dw_6_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_dw_6_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_dw_6_bn/moving_variance
?
*conv_dw_6_bn/moving_variance/biased/AssignAssign#conv_dw_6_bn/moving_variance/biasedAconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_dw_6_bn/moving_variance/biased/readIdentity#conv_dw_6_bn/moving_variance/biased*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance
?
9conv_dw_6_bn/moving_variance/local_step/Initializer/zerosConst*
_output_shapes
: */
_class%
#!loc:@conv_dw_6_bn/moving_variance*
valueB
 *    *
dtype0
?
'conv_dw_6_bn/moving_variance/local_step
VariableV2*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_dw_6_bn/moving_variance*
	container *
shape: *
dtype0
?
.conv_dw_6_bn/moving_variance/local_step/AssignAssign'conv_dw_6_bn/moving_variance/local_step9conv_dw_6_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_dw_6_bn/moving_variance/local_step/readIdentity'conv_dw_6_bn/moving_variance/local_step*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance
?
?conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/subSub(conv_dw_6_bn/moving_variance/biased/readconv_dw_6_bn/mul*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes	
:?*
T0
?
?conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/mulMul?conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub$conv_dw_6_bn/AssignMovingAvg_1/decay*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance
?
Xconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/conv_dw_6_bn/moving_variance	AssignSub#conv_dw_6_bn/moving_variance/biased?conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/mul*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance
?
Kconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_6_bn/moving_variance/local_stepKconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes
: 
?
@conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/readIdentity#conv_dw_6_bn/moving_variance/biasedF^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/AssignAddY^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/conv_dw_6_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes	
:?
?
Cconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_1/xConstF^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/AssignAddY^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/conv_dw_6_bn/moving_variance*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_1SubCconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_1/x$conv_dw_6_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/read_1Identity'conv_dw_6_bn/moving_variance/local_stepF^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/AssignAddY^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/conv_dw_6_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/PowPowAconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_1Bconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_2/xConstF^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/AssignAddY^conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/conv_dw_6_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_6_bn/moving_variance*
valueB
 *  ??
?
Aconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_2SubCconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_2/x?conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/Pow*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance
?
Cconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/truedivRealDiv@conv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/readAconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_2*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes	
:?*
T0
?
Aconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_3Sub!conv_dw_6_bn/moving_variance/readCconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_6_bn/AssignMovingAvg_1	AssignSubconv_dw_6_bn/moving_varianceAconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_6_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_dw_6_bn/cond/switch_tIdentityconv_dw_6_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_dw_6_bn/cond/switch_fIdentityconv_dw_6_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_dw_6_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_6_bn/cond/Switch_1Switchconv_dw_6_bn/FusedBatchNormconv_dw_6_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_dw_6_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_dw_6_bn/cond/batchnorm/add/yConst^conv_dw_6_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_6_bn/cond/batchnorm/addAdd&conv_dw_6_bn/cond/batchnorm/add/Switch!conv_dw_6_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_dw_6_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_6_bn/moving_variance/readconv_dw_6_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_dw_6_bn/cond/batchnorm/RsqrtRsqrtconv_dw_6_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_dw_6_bn/cond/batchnorm/mulMul!conv_dw_6_bn/cond/batchnorm/Rsqrt&conv_dw_6_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_dw_6_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_6_bn/gamma/readconv_dw_6_bn/cond/pred_id*%
_class
loc:@conv_dw_6_bn/gamma*"
_output_shapes
:?:?*
T0
?
!conv_dw_6_bn/cond/batchnorm/mul_1Mul(conv_dw_6_bn/cond/batchnorm/mul_1/Switchconv_dw_6_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
(conv_dw_6_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_6/depthwiseconv_dw_6_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_6/depthwise*L
_output_shapes:
8:??????????:??????????
?
!conv_dw_6_bn/cond/batchnorm/mul_2Mul(conv_dw_6_bn/cond/batchnorm/mul_2/Switchconv_dw_6_bn/cond/batchnorm/mul*
_output_shapes	
:?*
T0
?
(conv_dw_6_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_6_bn/moving_mean/readconv_dw_6_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
conv_dw_6_bn/cond/batchnorm/subSub&conv_dw_6_bn/cond/batchnorm/sub/Switch!conv_dw_6_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_dw_6_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_6_bn/beta/readconv_dw_6_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*$
_class
loc:@conv_dw_6_bn/beta
?
!conv_dw_6_bn/cond/batchnorm/add_1Add!conv_dw_6_bn/cond/batchnorm/mul_1conv_dw_6_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_dw_6_bn/cond/MergeMerge!conv_dw_6_bn/cond/batchnorm/add_1conv_dw_6_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_dw_6_relu/ReluReluconv_dw_6_bn/cond/Merge*
T0*0
_output_shapes
:??????????
Y
conv_dw_6_relu/ConstConst*
_output_shapes
: *
valueB
 *  ?@*
dtype0
?
conv_dw_6_relu/MinimumMinimumconv_dw_6_relu/Reluconv_dw_6_relu/Const*
T0*0
_output_shapes
:??????????
w
conv_pw_6/random_uniform/shapeConst*
_output_shapes
:*%
valueB"            *
dtype0
a
conv_pw_6/random_uniform/minConst*
valueB
 *???*
dtype0*
_output_shapes
: 
a
conv_pw_6/random_uniform/maxConst*
valueB
 *??=*
dtype0*
_output_shapes
: 
?
&conv_pw_6/random_uniform/RandomUniformRandomUniformconv_pw_6/random_uniform/shape*
dtype0*(
_output_shapes
:??*
seed2???*
seed???)*
T0
?
conv_pw_6/random_uniform/subSubconv_pw_6/random_uniform/maxconv_pw_6/random_uniform/min*
T0*
_output_shapes
: 
?
conv_pw_6/random_uniform/mulMul&conv_pw_6/random_uniform/RandomUniformconv_pw_6/random_uniform/sub*(
_output_shapes
:??*
T0
?
conv_pw_6/random_uniformAddconv_pw_6/random_uniform/mulconv_pw_6/random_uniform/min*(
_output_shapes
:??*
T0
?
conv_pw_6/kernel
VariableV2*(
_output_shapes
:??*
	container *
shape:??*
shared_name *
dtype0
?
conv_pw_6/kernel/AssignAssignconv_pw_6/kernelconv_pw_6/random_uniform*
use_locking(*
T0*#
_class
loc:@conv_pw_6/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_6/kernel/readIdentityconv_pw_6/kernel*#
_class
loc:@conv_pw_6/kernel*(
_output_shapes
:??*
T0
t
#conv_pw_6/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_6/convolutionConv2Dconv_dw_6_relu/Minimumconv_pw_6/kernel/read*0
_output_shapes
:??????????*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
a
conv_pw_6_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_6_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_6_bn/gamma/AssignAssignconv_pw_6_bn/gammaconv_pw_6_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_pw_6_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_pw_6_bn/gamma/readIdentityconv_pw_6_bn/gamma*
_output_shapes	
:?*
T0*%
_class
loc:@conv_pw_6_bn/gamma
c
conv_pw_6_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_pw_6_bn/beta
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_6_bn/beta/AssignAssignconv_pw_6_bn/betaconv_pw_6_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_pw_6_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_pw_6_bn/beta/readIdentityconv_pw_6_bn/beta*
T0*$
_class
loc:@conv_pw_6_bn/beta*
_output_shapes	
:?
c
conv_pw_6_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_6_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_6_bn/moving_mean/AssignAssignconv_pw_6_bn/moving_meanconv_pw_6_bn/Const_2*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean
?
conv_pw_6_bn/moving_mean/readIdentityconv_pw_6_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
c
conv_pw_6_bn/Const_3Const*
dtype0*
_output_shapes	
:?*
valueB?*  ??
?
conv_pw_6_bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
#conv_pw_6_bn/moving_variance/AssignAssignconv_pw_6_bn/moving_varianceconv_pw_6_bn/Const_3*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
!conv_pw_6_bn/moving_variance/readIdentityconv_pw_6_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance
W
conv_pw_6_bn/Const_4Const*
dtype0*
_output_shapes
: *
valueB 
W
conv_pw_6_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_6_bn/FusedBatchNormFusedBatchNormconv_pw_6/convolutionconv_pw_6_bn/gamma/readconv_pw_6_bn/beta/readconv_pw_6_bn/Const_4conv_pw_6_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
g
conv_pw_6_bn/ShapeShapeconv_pw_6/convolution*
out_type0*
_output_shapes
:*
T0
j
 conv_pw_6_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_6_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_pw_6_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_6_bn/strided_sliceStridedSliceconv_pw_6_bn/Shape conv_pw_6_bn/strided_slice/stack"conv_pw_6_bn/strided_slice/stack_1"conv_pw_6_bn/strided_slice/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
i
conv_pw_6_bn/Shape_1Shapeconv_pw_6/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_6_bn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
n
$conv_pw_6_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_6_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_6_bn/strided_slice_1StridedSliceconv_pw_6_bn/Shape_1"conv_pw_6_bn/strided_slice_1/stack$conv_pw_6_bn/strided_slice_1/stack_1$conv_pw_6_bn/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
i
conv_pw_6_bn/Shape_2Shapeconv_pw_6/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_6_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_6_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_6_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_6_bn/strided_slice_2StridedSliceconv_pw_6_bn/Shape_2"conv_pw_6_bn/strided_slice_2/stack$conv_pw_6_bn/strided_slice_2/stack_1$conv_pw_6_bn/strided_slice_2/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
?
conv_pw_6_bn/Rank/packedPackconv_pw_6_bn/strided_sliceconv_pw_6_bn/strided_slice_1conv_pw_6_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_pw_6_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_pw_6_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_pw_6_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_6_bn/rangeRangeconv_pw_6_bn/range/startconv_pw_6_bn/Rankconv_pw_6_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_6_bn/Prod/inputPackconv_pw_6_bn/strided_sliceconv_pw_6_bn/strided_slice_1conv_pw_6_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_6_bn/ProdProdconv_pw_6_bn/Prod/inputconv_pw_6_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_pw_6_bn/CastCastconv_pw_6_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_6_bn/sub/yConst*
_output_shapes
: *
valueB
 *? ??*
dtype0
_
conv_pw_6_bn/subSubconv_pw_6_bn/Castconv_pw_6_bn/sub/y*
T0*
_output_shapes
: 
e
conv_pw_6_bn/truedivRealDivconv_pw_6_bn/Castconv_pw_6_bn/sub*
T0*
_output_shapes
: 
r
conv_pw_6_bn/mulMulconv_pw_6_bn/FusedBatchNorm:2conv_pw_6_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_pw_6_bn/AssignMovingAvg/decayConst*
_output_shapes
: *+
_class!
loc:@conv_pw_6_bn/moving_mean*
valueB
 *
?#<*
dtype0
?
;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/zerosConst*+
_class!
loc:@conv_pw_6_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_6_bn/moving_mean/biased
VariableV2*
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_pw_6_bn/moving_mean*
	container 
?
&conv_pw_6_bn/moving_mean/biased/AssignAssignconv_pw_6_bn/moving_mean/biased;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_pw_6_bn/moving_mean/biased/readIdentityconv_pw_6_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
?
5conv_pw_6_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_pw_6_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_pw_6_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_pw_6_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_pw_6_bn/moving_mean/local_step/AssignAssign#conv_pw_6_bn/moving_mean/local_step5conv_pw_6_bn/moving_mean/local_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean
?
(conv_pw_6_bn/moving_mean/local_step/readIdentity#conv_pw_6_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/subSub$conv_pw_6_bn/moving_mean/biased/readconv_pw_6_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
?
9conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/mulMul9conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub"conv_pw_6_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
?
Nconv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/conv_pw_6_bn/moving_mean	AssignSubconv_pw_6_bn/moving_mean/biased9conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
?
Econv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *+
_class!
loc:@conv_pw_6_bn/moving_mean*
valueB
 *  ??*
dtype0
?
?conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_6_bn/moving_mean/local_stepEconv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean
?
:conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/readIdentityconv_pw_6_bn/moving_mean/biased@^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/AssignAddO^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/conv_pw_6_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
?
=conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_1/xConst@^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/AssignAddO^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/conv_pw_6_bn/moving_mean*+
_class!
loc:@conv_pw_6_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_1Sub=conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_1/x"conv_pw_6_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes
: 
?
<conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/read_1Identity#conv_pw_6_bn/moving_mean/local_step@^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/AssignAddO^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/conv_pw_6_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/PowPow;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_1<conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_2/xConst@^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/AssignAddO^conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/conv_pw_6_bn/moving_mean*+
_class!
loc:@conv_pw_6_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_2Sub=conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_2/x9conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/Pow*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/truedivRealDiv:conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/read;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean
?
;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_3Subconv_pw_6_bn/moving_mean/read=conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
?
conv_pw_6_bn/AssignMovingAvg	AssignSubconv_pw_6_bn/moving_mean;conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
_output_shapes	
:?
?
$conv_pw_6_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/zerosConst*
_output_shapes	
:?*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
valueB?*    *
dtype0
?
#conv_pw_6_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_pw_6_bn/moving_variance
?
*conv_pw_6_bn/moving_variance/biased/AssignAssign#conv_pw_6_bn/moving_variance/biasedAconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_pw_6_bn/moving_variance/biased/readIdentity#conv_pw_6_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes	
:?*
T0
?
9conv_pw_6_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_6_bn/moving_variance/local_step
VariableV2*
shared_name */
_class%
#!loc:@conv_pw_6_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
.conv_pw_6_bn/moving_variance/local_step/AssignAssign'conv_pw_6_bn/moving_variance/local_step9conv_pw_6_bn/moving_variance/local_step/Initializer/zeros*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
,conv_pw_6_bn/moving_variance/local_step/readIdentity'conv_pw_6_bn/moving_variance/local_step*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance
?
?conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/subSub(conv_pw_6_bn/moving_variance/biased/readconv_pw_6_bn/mul*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes	
:?
?
?conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/mulMul?conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub$conv_pw_6_bn/AssignMovingAvg_1/decay*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes	
:?*
T0
?
Xconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/conv_pw_6_bn/moving_variance	AssignSub#conv_pw_6_bn/moving_variance/biased?conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/mul*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance
?
Kconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_6_bn/moving_variance/local_stepKconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes
: 
?
@conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/readIdentity#conv_pw_6_bn/moving_variance/biasedF^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/AssignAddY^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/conv_pw_6_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance
?
Cconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_1/xConstF^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/AssignAddY^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/conv_pw_6_bn/moving_variance*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_1SubCconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_1/x$conv_pw_6_bn/AssignMovingAvg_1/decay*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes
: *
T0
?
Bconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/read_1Identity'conv_pw_6_bn/moving_variance/local_stepF^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/AssignAddY^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/conv_pw_6_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/PowPowAconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_1Bconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_2/xConstF^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/AssignAddY^conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/conv_pw_6_bn/moving_variance*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_2SubCconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_2/x?conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/truedivRealDiv@conv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/readAconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance
?
Aconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_3Sub!conv_pw_6_bn/moving_variance/readCconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/truediv*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes	
:?*
T0
?
conv_pw_6_bn/AssignMovingAvg_1	AssignSubconv_pw_6_bn/moving_varianceAconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/sub_3*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
conv_pw_6_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

c
conv_pw_6_bn/cond/switch_tIdentityconv_pw_6_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_6_bn/cond/switch_fIdentityconv_pw_6_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_pw_6_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_6_bn/cond/Switch_1Switchconv_pw_6_bn/FusedBatchNormconv_pw_6_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_pw_6_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_6_bn/cond/batchnorm/add/yConst^conv_pw_6_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_pw_6_bn/cond/batchnorm/addAdd&conv_pw_6_bn/cond/batchnorm/add/Switch!conv_pw_6_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_pw_6_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_6_bn/moving_variance/readconv_pw_6_bn/cond/pred_id*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*"
_output_shapes
:?:?*
T0
q
!conv_pw_6_bn/cond/batchnorm/RsqrtRsqrtconv_pw_6_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_pw_6_bn/cond/batchnorm/mulMul!conv_pw_6_bn/cond/batchnorm/Rsqrt&conv_pw_6_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_pw_6_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_6_bn/gamma/readconv_pw_6_bn/cond/pred_id*
T0*%
_class
loc:@conv_pw_6_bn/gamma*"
_output_shapes
:?:?
?
!conv_pw_6_bn/cond/batchnorm/mul_1Mul(conv_pw_6_bn/cond/batchnorm/mul_1/Switchconv_pw_6_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
(conv_pw_6_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_6/convolutionconv_pw_6_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_6/convolution*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_6_bn/cond/batchnorm/mul_2Mul(conv_pw_6_bn/cond/batchnorm/mul_2/Switchconv_pw_6_bn/cond/batchnorm/mul*
_output_shapes	
:?*
T0
?
(conv_pw_6_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_6_bn/moving_mean/readconv_pw_6_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean
?
conv_pw_6_bn/cond/batchnorm/subSub&conv_pw_6_bn/cond/batchnorm/sub/Switch!conv_pw_6_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_pw_6_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_6_bn/beta/readconv_pw_6_bn/cond/pred_id*
T0*$
_class
loc:@conv_pw_6_bn/beta*"
_output_shapes
:?:?
?
!conv_pw_6_bn/cond/batchnorm/add_1Add!conv_pw_6_bn/cond/batchnorm/mul_1conv_pw_6_bn/cond/batchnorm/sub*0
_output_shapes
:??????????*
T0
?
conv_pw_6_bn/cond/MergeMerge!conv_pw_6_bn/cond/batchnorm/add_1conv_pw_6_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_pw_6_relu/ReluReluconv_pw_6_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_pw_6_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_6_relu/MinimumMinimumconv_pw_6_relu/Reluconv_pw_6_relu/Const*
T0*0
_output_shapes
:??????????
?
conv_pad_7/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_7/PadPadconv_pw_6_relu/Minimumconv_pad_7/Pad/paddings*0
_output_shapes
:??????????*
T0*
	Tpaddings0
w
conv_dw_7/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
a
conv_dw_7/random_uniform/minConst*
valueB
 *U??*
dtype0*
_output_shapes
: 
a
conv_dw_7/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *U?=
?
&conv_dw_7/random_uniform/RandomUniformRandomUniformconv_dw_7/random_uniform/shape*
seed???)*
T0*
dtype0*'
_output_shapes
:?*
seed2ۊ?
?
conv_dw_7/random_uniform/subSubconv_dw_7/random_uniform/maxconv_dw_7/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_7/random_uniform/mulMul&conv_dw_7/random_uniform/RandomUniformconv_dw_7/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_7/random_uniformAddconv_dw_7/random_uniform/mulconv_dw_7/random_uniform/min*
T0*'
_output_shapes
:?
?
conv_dw_7/depthwise_kernel
VariableV2*
dtype0*'
_output_shapes
:?*
	container *
shape:?*
shared_name 
?
!conv_dw_7/depthwise_kernel/AssignAssignconv_dw_7/depthwise_kernelconv_dw_7/random_uniform*'
_output_shapes
:?*
use_locking(*
T0*-
_class#
!loc:@conv_dw_7/depthwise_kernel*
validate_shape(
?
conv_dw_7/depthwise_kernel/readIdentityconv_dw_7/depthwise_kernel*'
_output_shapes
:?*
T0*-
_class#
!loc:@conv_dw_7/depthwise_kernel
r
conv_dw_7/depthwise/ShapeConst*%
valueB"            *
dtype0*
_output_shapes
:
r
!conv_dw_7/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_7/depthwiseDepthwiseConv2dNativeconv_pad_7/Padconv_dw_7/depthwise_kernel/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID*0
_output_shapes
:??????????
a
conv_dw_7_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_7_bn/gamma
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_7_bn/gamma/AssignAssignconv_dw_7_bn/gammaconv_dw_7_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_dw_7_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_dw_7_bn/gamma/readIdentityconv_dw_7_bn/gamma*%
_class
loc:@conv_dw_7_bn/gamma*
_output_shapes	
:?*
T0
c
conv_dw_7_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_dw_7_bn/beta
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_7_bn/beta/AssignAssignconv_dw_7_bn/betaconv_dw_7_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_dw_7_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_dw_7_bn/beta/readIdentityconv_dw_7_bn/beta*
T0*$
_class
loc:@conv_dw_7_bn/beta*
_output_shapes	
:?
c
conv_dw_7_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_7_bn/moving_mean
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_7_bn/moving_mean/AssignAssignconv_dw_7_bn/moving_meanconv_dw_7_bn/Const_2*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
conv_dw_7_bn/moving_mean/readIdentityconv_dw_7_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
c
conv_dw_7_bn/Const_3Const*
dtype0*
_output_shapes	
:?*
valueB?*  ??
?
conv_dw_7_bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
#conv_dw_7_bn/moving_variance/AssignAssignconv_dw_7_bn/moving_varianceconv_dw_7_bn/Const_3*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
!conv_dw_7_bn/moving_variance/readIdentityconv_dw_7_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes	
:?
W
conv_dw_7_bn/Const_4Const*
dtype0*
_output_shapes
: *
valueB 
W
conv_dw_7_bn/Const_5Const*
dtype0*
_output_shapes
: *
valueB 
?
conv_dw_7_bn/FusedBatchNormFusedBatchNormconv_dw_7/depthwiseconv_dw_7_bn/gamma/readconv_dw_7_bn/beta/readconv_dw_7_bn/Const_4conv_dw_7_bn/Const_5*
epsilon%o?:*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(
e
conv_dw_7_bn/ShapeShapeconv_dw_7/depthwise*
T0*
out_type0*
_output_shapes
:
j
 conv_dw_7_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_dw_7_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_dw_7_bn/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_dw_7_bn/strided_sliceStridedSliceconv_dw_7_bn/Shape conv_dw_7_bn/strided_slice/stack"conv_dw_7_bn/strided_slice/stack_1"conv_dw_7_bn/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
g
conv_dw_7_bn/Shape_1Shapeconv_dw_7/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_7_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_7_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_7_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_7_bn/strided_slice_1StridedSliceconv_dw_7_bn/Shape_1"conv_dw_7_bn/strided_slice_1/stack$conv_dw_7_bn/strided_slice_1/stack_1$conv_dw_7_bn/strided_slice_1/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
g
conv_dw_7_bn/Shape_2Shapeconv_dw_7/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_7_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_7_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_7_bn/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_dw_7_bn/strided_slice_2StridedSliceconv_dw_7_bn/Shape_2"conv_dw_7_bn/strided_slice_2/stack$conv_dw_7_bn/strided_slice_2/stack_1$conv_dw_7_bn/strided_slice_2/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
?
conv_dw_7_bn/Rank/packedPackconv_dw_7_bn/strided_sliceconv_dw_7_bn/strided_slice_1conv_dw_7_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_7_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_dw_7_bn/range/startConst*
_output_shapes
: *
value	B : *
dtype0
Z
conv_dw_7_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_7_bn/rangeRangeconv_dw_7_bn/range/startconv_dw_7_bn/Rankconv_dw_7_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_7_bn/Prod/inputPackconv_dw_7_bn/strided_sliceconv_dw_7_bn/strided_slice_1conv_dw_7_bn/strided_slice_2*

axis *
N*
_output_shapes
:*
T0
?
conv_dw_7_bn/ProdProdconv_dw_7_bn/Prod/inputconv_dw_7_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
l
conv_dw_7_bn/CastCastconv_dw_7_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_7_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_dw_7_bn/subSubconv_dw_7_bn/Castconv_dw_7_bn/sub/y*
_output_shapes
: *
T0
e
conv_dw_7_bn/truedivRealDivconv_dw_7_bn/Castconv_dw_7_bn/sub*
T0*
_output_shapes
: 
r
conv_dw_7_bn/mulMulconv_dw_7_bn/FusedBatchNorm:2conv_dw_7_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_dw_7_bn/AssignMovingAvg/decayConst*
_output_shapes
: *+
_class!
loc:@conv_dw_7_bn/moving_mean*
valueB
 *
?#<*
dtype0
?
;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/zerosConst*+
_class!
loc:@conv_dw_7_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_7_bn/moving_mean/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_dw_7_bn/moving_mean*
	container *
shape:?
?
&conv_dw_7_bn/moving_mean/biased/AssignAssignconv_dw_7_bn/moving_mean/biased;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean
?
$conv_dw_7_bn/moving_mean/biased/readIdentityconv_dw_7_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
?
5conv_dw_7_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_7_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_7_bn/moving_mean/local_step
VariableV2*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_dw_7_bn/moving_mean*
	container *
shape: *
dtype0
?
*conv_dw_7_bn/moving_mean/local_step/AssignAssign#conv_dw_7_bn/moving_mean/local_step5conv_dw_7_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
(conv_dw_7_bn/moving_mean/local_step/readIdentity#conv_dw_7_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/subSub$conv_dw_7_bn/moving_mean/biased/readconv_dw_7_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean
?
9conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/mulMul9conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub"conv_dw_7_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
?
Nconv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/conv_dw_7_bn/moving_mean	AssignSubconv_dw_7_bn/moving_mean/biased9conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
?
Econv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *+
_class!
loc:@conv_dw_7_bn/moving_mean*
valueB
 *  ??*
dtype0
?
?conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_7_bn/moving_mean/local_stepEconv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes
: 
?
:conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/readIdentityconv_dw_7_bn/moving_mean/biased@^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/AssignAddO^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/conv_dw_7_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
?
=conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_1/xConst@^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/AssignAddO^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/conv_dw_7_bn/moving_mean*+
_class!
loc:@conv_dw_7_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_1Sub=conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_1/x"conv_dw_7_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/read_1Identity#conv_dw_7_bn/moving_mean/local_step@^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/AssignAddO^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/conv_dw_7_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean
?
9conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/PowPow;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_1<conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/read_1*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean
?
=conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_2/xConst@^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/AssignAddO^conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/conv_dw_7_bn/moving_mean*+
_class!
loc:@conv_dw_7_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_2Sub=conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_2/x9conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/Pow*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/truedivRealDiv:conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/read;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
?
;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_3Subconv_dw_7_bn/moving_mean/read=conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_7_bn/AssignMovingAvg	AssignSubconv_dw_7_bn/moving_mean;conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
_output_shapes	
:?
?
$conv_dw_7_bn/AssignMovingAvg_1/decayConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_7_bn/moving_variance*
valueB
 *
?#<
?
Aconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_dw_7_bn/moving_variance/biased
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_7_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
*conv_dw_7_bn/moving_variance/biased/AssignAssign#conv_dw_7_bn/moving_variance/biasedAconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/zeros*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
(conv_dw_7_bn/moving_variance/biased/readIdentity#conv_dw_7_bn/moving_variance/biased*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
9conv_dw_7_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_dw_7_bn/moving_variance/local_step
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_dw_7_bn/moving_variance*
	container 
?
.conv_dw_7_bn/moving_variance/local_step/AssignAssign'conv_dw_7_bn/moving_variance/local_step9conv_dw_7_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_dw_7_bn/moving_variance/local_step/readIdentity'conv_dw_7_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/subSub(conv_dw_7_bn/moving_variance/biased/readconv_dw_7_bn/mul*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes	
:?*
T0
?
?conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/mulMul?conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub$conv_dw_7_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes	
:?
?
Xconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/conv_dw_7_bn/moving_variance	AssignSub#conv_dw_7_bn/moving_variance/biased?conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes	
:?
?
Kconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_7_bn/moving_variance/local_stepKconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes
: 
?
@conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/readIdentity#conv_dw_7_bn/moving_variance/biasedF^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/AssignAddY^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/conv_dw_7_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
Cconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_1/xConstF^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/AssignAddY^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/conv_dw_7_bn/moving_variance*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_1SubCconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_1/x$conv_dw_7_bn/AssignMovingAvg_1/decay*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
Bconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/read_1Identity'conv_dw_7_bn/moving_variance/local_stepF^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/AssignAddY^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/conv_dw_7_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/PowPowAconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_1Bconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/read_1*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
Cconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_2/xConstF^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/AssignAddY^conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/conv_dw_7_bn/moving_variance*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_2SubCconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_2/x?conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/Pow*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
Cconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/truedivRealDiv@conv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/readAconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes	
:?
?
Aconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_3Sub!conv_dw_7_bn/moving_variance/readCconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
conv_dw_7_bn/AssignMovingAvg_1	AssignSubconv_dw_7_bn/moving_varianceAconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/sub_3*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
conv_dw_7_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

c
conv_dw_7_bn/cond/switch_tIdentityconv_dw_7_bn/cond/Switch:1*
_output_shapes
: *
T0

a
conv_dw_7_bn/cond/switch_fIdentityconv_dw_7_bn/cond/Switch*
_output_shapes
: *
T0

e
conv_dw_7_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_7_bn/cond/Switch_1Switchconv_dw_7_bn/FusedBatchNormconv_dw_7_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*.
_class$
" loc:@conv_dw_7_bn/FusedBatchNorm
?
!conv_dw_7_bn/cond/batchnorm/add/yConst^conv_dw_7_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_7_bn/cond/batchnorm/addAdd&conv_dw_7_bn/cond/batchnorm/add/Switch!conv_dw_7_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
&conv_dw_7_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_7_bn/moving_variance/readconv_dw_7_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_dw_7_bn/cond/batchnorm/RsqrtRsqrtconv_dw_7_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
conv_dw_7_bn/cond/batchnorm/mulMul!conv_dw_7_bn/cond/batchnorm/Rsqrt&conv_dw_7_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
&conv_dw_7_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_7_bn/gamma/readconv_dw_7_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_7_bn/gamma*"
_output_shapes
:?:?
?
!conv_dw_7_bn/cond/batchnorm/mul_1Mul(conv_dw_7_bn/cond/batchnorm/mul_1/Switchconv_dw_7_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
(conv_dw_7_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_7/depthwiseconv_dw_7_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*&
_class
loc:@conv_dw_7/depthwise
?
!conv_dw_7_bn/cond/batchnorm/mul_2Mul(conv_dw_7_bn/cond/batchnorm/mul_2/Switchconv_dw_7_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_dw_7_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_7_bn/moving_mean/readconv_dw_7_bn/cond/pred_id*+
_class!
loc:@conv_dw_7_bn/moving_mean*"
_output_shapes
:?:?*
T0
?
conv_dw_7_bn/cond/batchnorm/subSub&conv_dw_7_bn/cond/batchnorm/sub/Switch!conv_dw_7_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_dw_7_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_7_bn/beta/readconv_dw_7_bn/cond/pred_id*
T0*$
_class
loc:@conv_dw_7_bn/beta*"
_output_shapes
:?:?
?
!conv_dw_7_bn/cond/batchnorm/add_1Add!conv_dw_7_bn/cond/batchnorm/mul_1conv_dw_7_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_dw_7_bn/cond/MergeMerge!conv_dw_7_bn/cond/batchnorm/add_1conv_dw_7_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_dw_7_relu/ReluReluconv_dw_7_bn/cond/Merge*
T0*0
_output_shapes
:??????????
Y
conv_dw_7_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_7_relu/MinimumMinimumconv_dw_7_relu/Reluconv_dw_7_relu/Const*
T0*0
_output_shapes
:??????????
w
conv_pw_7/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"            
a
conv_pw_7/random_uniform/minConst*
valueB
 *qĜ?*
dtype0*
_output_shapes
: 
a
conv_pw_7/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *qĜ=
?
&conv_pw_7/random_uniform/RandomUniformRandomUniformconv_pw_7/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2???*
seed???)
?
conv_pw_7/random_uniform/subSubconv_pw_7/random_uniform/maxconv_pw_7/random_uniform/min*
_output_shapes
: *
T0
?
conv_pw_7/random_uniform/mulMul&conv_pw_7/random_uniform/RandomUniformconv_pw_7/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_7/random_uniformAddconv_pw_7/random_uniform/mulconv_pw_7/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_7/kernel
VariableV2*
shape:??*
shared_name *
dtype0*(
_output_shapes
:??*
	container 
?
conv_pw_7/kernel/AssignAssignconv_pw_7/kernelconv_pw_7/random_uniform*
use_locking(*
T0*#
_class
loc:@conv_pw_7/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_7/kernel/readIdentityconv_pw_7/kernel*
T0*#
_class
loc:@conv_pw_7/kernel*(
_output_shapes
:??
t
#conv_pw_7/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_7/convolutionConv2Dconv_dw_7_relu/Minimumconv_pw_7/kernel/read*0
_output_shapes
:??????????*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
a
conv_pw_7_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_7_bn/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_7_bn/gamma/AssignAssignconv_pw_7_bn/gammaconv_pw_7_bn/Const*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_pw_7_bn/gamma*
validate_shape(
?
conv_pw_7_bn/gamma/readIdentityconv_pw_7_bn/gamma*%
_class
loc:@conv_pw_7_bn/gamma*
_output_shapes	
:?*
T0
c
conv_pw_7_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_pw_7_bn/beta
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_7_bn/beta/AssignAssignconv_pw_7_bn/betaconv_pw_7_bn/Const_1*
_output_shapes	
:?*
use_locking(*
T0*$
_class
loc:@conv_pw_7_bn/beta*
validate_shape(
?
conv_pw_7_bn/beta/readIdentityconv_pw_7_bn/beta*
_output_shapes	
:?*
T0*$
_class
loc:@conv_pw_7_bn/beta
c
conv_pw_7_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_7_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_7_bn/moving_mean/AssignAssignconv_pw_7_bn/moving_meanconv_pw_7_bn/Const_2*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean
?
conv_pw_7_bn/moving_mean/readIdentityconv_pw_7_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes	
:?
c
conv_pw_7_bn/Const_3Const*
_output_shapes	
:?*
valueB?*  ??*
dtype0
?
conv_pw_7_bn/moving_variance
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
#conv_pw_7_bn/moving_variance/AssignAssignconv_pw_7_bn/moving_varianceconv_pw_7_bn/Const_3*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
!conv_pw_7_bn/moving_variance/readIdentityconv_pw_7_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance
W
conv_pw_7_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_pw_7_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_7_bn/FusedBatchNormFusedBatchNormconv_pw_7/convolutionconv_pw_7_bn/gamma/readconv_pw_7_bn/beta/readconv_pw_7_bn/Const_4conv_pw_7_bn/Const_5*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0
g
conv_pw_7_bn/ShapeShapeconv_pw_7/convolution*
T0*
out_type0*
_output_shapes
:
j
 conv_pw_7_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_7_bn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
l
"conv_pw_7_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_7_bn/strided_sliceStridedSliceconv_pw_7_bn/Shape conv_pw_7_bn/strided_slice/stack"conv_pw_7_bn/strided_slice/stack_1"conv_pw_7_bn/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_7_bn/Shape_1Shapeconv_pw_7/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_7_bn/strided_slice_1/stackConst*
_output_shapes
:*
valueB:*
dtype0
n
$conv_pw_7_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_7_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_7_bn/strided_slice_1StridedSliceconv_pw_7_bn/Shape_1"conv_pw_7_bn/strided_slice_1/stack$conv_pw_7_bn/strided_slice_1/stack_1$conv_pw_7_bn/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_7_bn/Shape_2Shapeconv_pw_7/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_7_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_7_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_7_bn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_7_bn/strided_slice_2StridedSliceconv_pw_7_bn/Shape_2"conv_pw_7_bn/strided_slice_2/stack$conv_pw_7_bn/strided_slice_2/stack_1$conv_pw_7_bn/strided_slice_2/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask 
?
conv_pw_7_bn/Rank/packedPackconv_pw_7_bn/strided_sliceconv_pw_7_bn/strided_slice_1conv_pw_7_bn/strided_slice_2*

axis *
N*
_output_shapes
:*
T0
S
conv_pw_7_bn/RankConst*
dtype0*
_output_shapes
: *
value	B :
Z
conv_pw_7_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_pw_7_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_7_bn/rangeRangeconv_pw_7_bn/range/startconv_pw_7_bn/Rankconv_pw_7_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_7_bn/Prod/inputPackconv_pw_7_bn/strided_sliceconv_pw_7_bn/strided_slice_1conv_pw_7_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_7_bn/ProdProdconv_pw_7_bn/Prod/inputconv_pw_7_bn/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
l
conv_pw_7_bn/CastCastconv_pw_7_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_7_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_pw_7_bn/subSubconv_pw_7_bn/Castconv_pw_7_bn/sub/y*
T0*
_output_shapes
: 
e
conv_pw_7_bn/truedivRealDivconv_pw_7_bn/Castconv_pw_7_bn/sub*
_output_shapes
: *
T0
r
conv_pw_7_bn/mulMulconv_pw_7_bn/FusedBatchNorm:2conv_pw_7_bn/truediv*
_output_shapes	
:?*
T0
?
"conv_pw_7_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_pw_7_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/zerosConst*
_output_shapes	
:?*+
_class!
loc:@conv_pw_7_bn/moving_mean*
valueB?*    *
dtype0
?
conv_pw_7_bn/moving_mean/biased
VariableV2*+
_class!
loc:@conv_pw_7_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
&conv_pw_7_bn/moving_mean/biased/AssignAssignconv_pw_7_bn/moving_mean/biased;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/zeros*+
_class!
loc:@conv_pw_7_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
$conv_pw_7_bn/moving_mean/biased/readIdentityconv_pw_7_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes	
:?
?
5conv_pw_7_bn/moving_mean/local_step/Initializer/zerosConst*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_pw_7_bn/moving_mean*
valueB
 *    
?
#conv_pw_7_bn/moving_mean/local_step
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_pw_7_bn/moving_mean
?
*conv_pw_7_bn/moving_mean/local_step/AssignAssign#conv_pw_7_bn/moving_mean/local_step5conv_pw_7_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
(conv_pw_7_bn/moving_mean/local_step/readIdentity#conv_pw_7_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/subSub$conv_pw_7_bn/moving_mean/biased/readconv_pw_7_bn/FusedBatchNorm:1*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes	
:?*
T0
?
9conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/mulMul9conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub"conv_pw_7_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes	
:?
?
Nconv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/conv_pw_7_bn/moving_mean	AssignSubconv_pw_7_bn/moving_mean/biased9conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/mul*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean
?
Econv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_pw_7_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_7_bn/moving_mean/local_stepEconv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes
: 
?
:conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/readIdentityconv_pw_7_bn/moving_mean/biased@^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/AssignAddO^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/conv_pw_7_bn/moving_mean*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean
?
=conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_1/xConst@^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/AssignAddO^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/conv_pw_7_bn/moving_mean*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_pw_7_bn/moving_mean*
valueB
 *  ??
?
;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_1Sub=conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_1/x"conv_pw_7_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes
: 
?
<conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/read_1Identity#conv_pw_7_bn/moving_mean/local_step@^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/AssignAddO^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/conv_pw_7_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/PowPow;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_1<conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/read_1*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean
?
=conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_2/xConst@^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/AssignAddO^conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/conv_pw_7_bn/moving_mean*+
_class!
loc:@conv_pw_7_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_2Sub=conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_2/x9conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/Pow*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean
?
=conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/truedivRealDiv:conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/read;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes	
:?
?
;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_3Subconv_pw_7_bn/moving_mean/read=conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes	
:?
?
conv_pw_7_bn/AssignMovingAvg	AssignSubconv_pw_7_bn/moving_mean;conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
_output_shapes	
:?
?
$conv_pw_7_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_pw_7_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_pw_7_bn/moving_variance
?
*conv_pw_7_bn/moving_variance/biased/AssignAssign#conv_pw_7_bn/moving_variance/biasedAconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_pw_7_bn/moving_variance/biased/readIdentity#conv_pw_7_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes	
:?*
T0
?
9conv_pw_7_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_7_bn/moving_variance/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_pw_7_bn/moving_variance*
	container *
shape: 
?
.conv_pw_7_bn/moving_variance/local_step/AssignAssign'conv_pw_7_bn/moving_variance/local_step9conv_pw_7_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_pw_7_bn/moving_variance/local_step/readIdentity'conv_pw_7_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/subSub(conv_pw_7_bn/moving_variance/biased/readconv_pw_7_bn/mul*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes	
:?
?
?conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/mulMul?conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub$conv_pw_7_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes	
:?
?
Xconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/conv_pw_7_bn/moving_variance	AssignSub#conv_pw_7_bn/moving_variance/biased?conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/mul*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
Kconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_7_bn/moving_variance/local_stepKconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance
?
@conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/readIdentity#conv_pw_7_bn/moving_variance/biasedF^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/AssignAddY^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/conv_pw_7_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes	
:?
?
Cconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_1/xConstF^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/AssignAddY^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/conv_pw_7_bn/moving_variance*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_1SubCconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_1/x$conv_pw_7_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/read_1Identity'conv_pw_7_bn/moving_variance/local_stepF^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/AssignAddY^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/conv_pw_7_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/PowPowAconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_1Bconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/read_1*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes
: *
T0
?
Cconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_2/xConstF^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/AssignAddY^conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/conv_pw_7_bn/moving_variance*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_2SubCconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_2/x?conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/Pow*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance
?
Cconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/truedivRealDiv@conv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/readAconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_3Sub!conv_pw_7_bn/moving_variance/readCconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_7_bn/AssignMovingAvg_1	AssignSubconv_pw_7_bn/moving_varianceAconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/sub_3*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance
?
conv_pw_7_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_pw_7_bn/cond/switch_tIdentityconv_pw_7_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_7_bn/cond/switch_fIdentityconv_pw_7_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_pw_7_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_7_bn/cond/Switch_1Switchconv_pw_7_bn/FusedBatchNormconv_pw_7_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_pw_7_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_7_bn/cond/batchnorm/add/yConst^conv_pw_7_bn/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *o?:
?
conv_pw_7_bn/cond/batchnorm/addAdd&conv_pw_7_bn/cond/batchnorm/add/Switch!conv_pw_7_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
&conv_pw_7_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_7_bn/moving_variance/readconv_pw_7_bn/cond/pred_id*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*"
_output_shapes
:?:?*
T0
q
!conv_pw_7_bn/cond/batchnorm/RsqrtRsqrtconv_pw_7_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
conv_pw_7_bn/cond/batchnorm/mulMul!conv_pw_7_bn/cond/batchnorm/Rsqrt&conv_pw_7_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
&conv_pw_7_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_7_bn/gamma/readconv_pw_7_bn/cond/pred_id*
T0*%
_class
loc:@conv_pw_7_bn/gamma*"
_output_shapes
:?:?
?
!conv_pw_7_bn/cond/batchnorm/mul_1Mul(conv_pw_7_bn/cond/batchnorm/mul_1/Switchconv_pw_7_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
(conv_pw_7_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_7/convolutionconv_pw_7_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_7/convolution*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_7_bn/cond/batchnorm/mul_2Mul(conv_pw_7_bn/cond/batchnorm/mul_2/Switchconv_pw_7_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_pw_7_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_7_bn/moving_mean/readconv_pw_7_bn/cond/pred_id*+
_class!
loc:@conv_pw_7_bn/moving_mean*"
_output_shapes
:?:?*
T0
?
conv_pw_7_bn/cond/batchnorm/subSub&conv_pw_7_bn/cond/batchnorm/sub/Switch!conv_pw_7_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_pw_7_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_7_bn/beta/readconv_pw_7_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*$
_class
loc:@conv_pw_7_bn/beta
?
!conv_pw_7_bn/cond/batchnorm/add_1Add!conv_pw_7_bn/cond/batchnorm/mul_1conv_pw_7_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_pw_7_bn/cond/MergeMerge!conv_pw_7_bn/cond/batchnorm/add_1conv_pw_7_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_pw_7_relu/ReluReluconv_pw_7_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_pw_7_relu/ConstConst*
_output_shapes
: *
valueB
 *  ?@*
dtype0
?
conv_pw_7_relu/MinimumMinimumconv_pw_7_relu/Reluconv_pw_7_relu/Const*
T0*0
_output_shapes
:??????????
?
conv_pad_8/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_8/PadPadconv_pw_7_relu/Minimumconv_pad_8/Pad/paddings*
T0*
	Tpaddings0*0
_output_shapes
:??????????
w
conv_dw_8/random_uniform/shapeConst*
_output_shapes
:*%
valueB"            *
dtype0
a
conv_dw_8/random_uniform/minConst*
valueB
 *U??*
dtype0*
_output_shapes
: 
a
conv_dw_8/random_uniform/maxConst*
valueB
 *U?=*
dtype0*
_output_shapes
: 
?
&conv_dw_8/random_uniform/RandomUniformRandomUniformconv_dw_8/random_uniform/shape*
T0*
dtype0*'
_output_shapes
:?*
seed2???*
seed???)
?
conv_dw_8/random_uniform/subSubconv_dw_8/random_uniform/maxconv_dw_8/random_uniform/min*
_output_shapes
: *
T0
?
conv_dw_8/random_uniform/mulMul&conv_dw_8/random_uniform/RandomUniformconv_dw_8/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_8/random_uniformAddconv_dw_8/random_uniform/mulconv_dw_8/random_uniform/min*
T0*'
_output_shapes
:?
?
conv_dw_8/depthwise_kernel
VariableV2*
shared_name *
dtype0*'
_output_shapes
:?*
	container *
shape:?
?
!conv_dw_8/depthwise_kernel/AssignAssignconv_dw_8/depthwise_kernelconv_dw_8/random_uniform*
use_locking(*
T0*-
_class#
!loc:@conv_dw_8/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
conv_dw_8/depthwise_kernel/readIdentityconv_dw_8/depthwise_kernel*
T0*-
_class#
!loc:@conv_dw_8/depthwise_kernel*'
_output_shapes
:?
r
conv_dw_8/depthwise/ShapeConst*
_output_shapes
:*%
valueB"            *
dtype0
r
!conv_dw_8/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_8/depthwiseDepthwiseConv2dNativeconv_pad_8/Padconv_dw_8/depthwise_kernel/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID*0
_output_shapes
:??????????
a
conv_dw_8_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_8_bn/gamma
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_dw_8_bn/gamma/AssignAssignconv_dw_8_bn/gammaconv_dw_8_bn/Const*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_8_bn/gamma*
validate_shape(
?
conv_dw_8_bn/gamma/readIdentityconv_dw_8_bn/gamma*
_output_shapes	
:?*
T0*%
_class
loc:@conv_dw_8_bn/gamma
c
conv_dw_8_bn/Const_1Const*
dtype0*
_output_shapes	
:?*
valueB?*    

conv_dw_8_bn/beta
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_8_bn/beta/AssignAssignconv_dw_8_bn/betaconv_dw_8_bn/Const_1*$
_class
loc:@conv_dw_8_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_dw_8_bn/beta/readIdentityconv_dw_8_bn/beta*
_output_shapes	
:?*
T0*$
_class
loc:@conv_dw_8_bn/beta
c
conv_dw_8_bn/Const_2Const*
dtype0*
_output_shapes	
:?*
valueB?*    
?
conv_dw_8_bn/moving_mean
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_8_bn/moving_mean/AssignAssignconv_dw_8_bn/moving_meanconv_dw_8_bn/Const_2*
use_locking(*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_dw_8_bn/moving_mean/readIdentityconv_dw_8_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes	
:?
c
conv_dw_8_bn/Const_3Const*
_output_shapes	
:?*
valueB?*  ??*
dtype0
?
conv_dw_8_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
#conv_dw_8_bn/moving_variance/AssignAssignconv_dw_8_bn/moving_varianceconv_dw_8_bn/Const_3*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
!conv_dw_8_bn/moving_variance/readIdentityconv_dw_8_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
W
conv_dw_8_bn/Const_4Const*
dtype0*
_output_shapes
: *
valueB 
W
conv_dw_8_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_8_bn/FusedBatchNormFusedBatchNormconv_dw_8/depthwiseconv_dw_8_bn/gamma/readconv_dw_8_bn/beta/readconv_dw_8_bn/Const_4conv_dw_8_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
e
conv_dw_8_bn/ShapeShapeconv_dw_8/depthwise*
T0*
out_type0*
_output_shapes
:
j
 conv_dw_8_bn/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
l
"conv_dw_8_bn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
l
"conv_dw_8_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_8_bn/strided_sliceStridedSliceconv_dw_8_bn/Shape conv_dw_8_bn/strided_slice/stack"conv_dw_8_bn/strided_slice/stack_1"conv_dw_8_bn/strided_slice/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask 
g
conv_dw_8_bn/Shape_1Shapeconv_dw_8/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_8_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_8_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_8_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_8_bn/strided_slice_1StridedSliceconv_dw_8_bn/Shape_1"conv_dw_8_bn/strided_slice_1/stack$conv_dw_8_bn/strided_slice_1/stack_1$conv_dw_8_bn/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
g
conv_dw_8_bn/Shape_2Shapeconv_dw_8/depthwise*
_output_shapes
:*
T0*
out_type0
l
"conv_dw_8_bn/strided_slice_2/stackConst*
_output_shapes
:*
valueB:*
dtype0
n
$conv_dw_8_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_8_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_8_bn/strided_slice_2StridedSliceconv_dw_8_bn/Shape_2"conv_dw_8_bn/strided_slice_2/stack$conv_dw_8_bn/strided_slice_2/stack_1$conv_dw_8_bn/strided_slice_2/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
conv_dw_8_bn/Rank/packedPackconv_dw_8_bn/strided_sliceconv_dw_8_bn/strided_slice_1conv_dw_8_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_8_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_dw_8_bn/range/startConst*
_output_shapes
: *
value	B : *
dtype0
Z
conv_dw_8_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_8_bn/rangeRangeconv_dw_8_bn/range/startconv_dw_8_bn/Rankconv_dw_8_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_8_bn/Prod/inputPackconv_dw_8_bn/strided_sliceconv_dw_8_bn/strided_slice_1conv_dw_8_bn/strided_slice_2*
_output_shapes
:*
T0*

axis *
N
?
conv_dw_8_bn/ProdProdconv_dw_8_bn/Prod/inputconv_dw_8_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
l
conv_dw_8_bn/CastCastconv_dw_8_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_8_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_dw_8_bn/subSubconv_dw_8_bn/Castconv_dw_8_bn/sub/y*
T0*
_output_shapes
: 
e
conv_dw_8_bn/truedivRealDivconv_dw_8_bn/Castconv_dw_8_bn/sub*
_output_shapes
: *
T0
r
conv_dw_8_bn/mulMulconv_dw_8_bn/FusedBatchNorm:2conv_dw_8_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_dw_8_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_dw_8_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/zerosConst*
dtype0*
_output_shapes	
:?*+
_class!
loc:@conv_dw_8_bn/moving_mean*
valueB?*    
?
conv_dw_8_bn/moving_mean/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_dw_8_bn/moving_mean
?
&conv_dw_8_bn/moving_mean/biased/AssignAssignconv_dw_8_bn/moving_mean/biased;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/zeros*+
_class!
loc:@conv_dw_8_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
$conv_dw_8_bn/moving_mean/biased/readIdentityconv_dw_8_bn/moving_mean/biased*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean
?
5conv_dw_8_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_8_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_8_bn/moving_mean/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_dw_8_bn/moving_mean*
	container *
shape: 
?
*conv_dw_8_bn/moving_mean/local_step/AssignAssign#conv_dw_8_bn/moving_mean/local_step5conv_dw_8_bn/moving_mean/local_step/Initializer/zeros*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
(conv_dw_8_bn/moving_mean/local_step/readIdentity#conv_dw_8_bn/moving_mean/local_step*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean
?
9conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/subSub$conv_dw_8_bn/moving_mean/biased/readconv_dw_8_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean
?
9conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/mulMul9conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub"conv_dw_8_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes	
:?
?
Nconv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/conv_dw_8_bn/moving_mean	AssignSubconv_dw_8_bn/moving_mean/biased9conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/mul*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes	
:?*
use_locking( *
T0
?
Econv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/AssignAdd/valueConst*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_dw_8_bn/moving_mean*
valueB
 *  ??
?
?conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_8_bn/moving_mean/local_stepEconv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes
: 
?
:conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/readIdentityconv_dw_8_bn/moving_mean/biased@^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/AssignAddO^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/conv_dw_8_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes	
:?
?
=conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_1/xConst@^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/AssignAddO^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/conv_dw_8_bn/moving_mean*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_dw_8_bn/moving_mean*
valueB
 *  ??
?
;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_1Sub=conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_1/x"conv_dw_8_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/read_1Identity#conv_dw_8_bn/moving_mean/local_step@^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/AssignAddO^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/conv_dw_8_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/PowPow;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_1<conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_2/xConst@^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/AssignAddO^conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/conv_dw_8_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_dw_8_bn/moving_mean*
valueB
 *  ??*
dtype0
?
;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_2Sub=conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_2/x9conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/Pow*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes
: 
?
=conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/truedivRealDiv:conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/read;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean
?
;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_3Subconv_dw_8_bn/moving_mean/read=conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/truediv*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_8_bn/AssignMovingAvg	AssignSubconv_dw_8_bn/moving_mean;conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/sub_3*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
_output_shapes	
:?*
use_locking( 
?
$conv_dw_8_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/zerosConst*
dtype0*
_output_shapes	
:?*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
valueB?*    
?
#conv_dw_8_bn/moving_variance/biased
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_8_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
*conv_dw_8_bn/moving_variance/biased/AssignAssign#conv_dw_8_bn/moving_variance/biasedAconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_dw_8_bn/moving_variance/biased/readIdentity#conv_dw_8_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
?
9conv_dw_8_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_dw_8_bn/moving_variance/local_step
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_8_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
.conv_dw_8_bn/moving_variance/local_step/AssignAssign'conv_dw_8_bn/moving_variance/local_step9conv_dw_8_bn/moving_variance/local_step/Initializer/zeros*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
,conv_dw_8_bn/moving_variance/local_step/readIdentity'conv_dw_8_bn/moving_variance/local_step*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/subSub(conv_dw_8_bn/moving_variance/biased/readconv_dw_8_bn/mul*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
?
?conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/mulMul?conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub$conv_dw_8_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
?
Xconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/conv_dw_8_bn/moving_variance	AssignSub#conv_dw_8_bn/moving_variance/biased?conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
?
Kconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_8_bn/moving_variance/local_stepKconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/AssignAdd/value*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes
: *
use_locking( *
T0
?
@conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/readIdentity#conv_dw_8_bn/moving_variance/biasedF^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/AssignAddY^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/conv_dw_8_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance
?
Cconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_1/xConstF^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/AssignAddY^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/conv_dw_8_bn/moving_variance*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_1SubCconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_1/x$conv_dw_8_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/read_1Identity'conv_dw_8_bn/moving_variance/local_stepF^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/AssignAddY^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/conv_dw_8_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/PowPowAconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_1Bconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_2/xConstF^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/AssignAddY^conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/conv_dw_8_bn/moving_variance*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_2SubCconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_2/x?conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/truedivRealDiv@conv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/readAconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
?
Aconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_3Sub!conv_dw_8_bn/moving_variance/readCconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/truediv*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_8_bn/AssignMovingAvg_1	AssignSubconv_dw_8_bn/moving_varianceAconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_8_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_dw_8_bn/cond/switch_tIdentityconv_dw_8_bn/cond/Switch:1*
_output_shapes
: *
T0

a
conv_dw_8_bn/cond/switch_fIdentityconv_dw_8_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_dw_8_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_8_bn/cond/Switch_1Switchconv_dw_8_bn/FusedBatchNormconv_dw_8_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_dw_8_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_dw_8_bn/cond/batchnorm/add/yConst^conv_dw_8_bn/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *o?:
?
conv_dw_8_bn/cond/batchnorm/addAdd&conv_dw_8_bn/cond/batchnorm/add/Switch!conv_dw_8_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_dw_8_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_8_bn/moving_variance/readconv_dw_8_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_dw_8_bn/cond/batchnorm/RsqrtRsqrtconv_dw_8_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
conv_dw_8_bn/cond/batchnorm/mulMul!conv_dw_8_bn/cond/batchnorm/Rsqrt&conv_dw_8_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
&conv_dw_8_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_8_bn/gamma/readconv_dw_8_bn/cond/pred_id*%
_class
loc:@conv_dw_8_bn/gamma*"
_output_shapes
:?:?*
T0
?
!conv_dw_8_bn/cond/batchnorm/mul_1Mul(conv_dw_8_bn/cond/batchnorm/mul_1/Switchconv_dw_8_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
(conv_dw_8_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_8/depthwiseconv_dw_8_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_8/depthwise*L
_output_shapes:
8:??????????:??????????
?
!conv_dw_8_bn/cond/batchnorm/mul_2Mul(conv_dw_8_bn/cond/batchnorm/mul_2/Switchconv_dw_8_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_dw_8_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_8_bn/moving_mean/readconv_dw_8_bn/cond/pred_id*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*"
_output_shapes
:?:?
?
conv_dw_8_bn/cond/batchnorm/subSub&conv_dw_8_bn/cond/batchnorm/sub/Switch!conv_dw_8_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_dw_8_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_8_bn/beta/readconv_dw_8_bn/cond/pred_id*$
_class
loc:@conv_dw_8_bn/beta*"
_output_shapes
:?:?*
T0
?
!conv_dw_8_bn/cond/batchnorm/add_1Add!conv_dw_8_bn/cond/batchnorm/mul_1conv_dw_8_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_dw_8_bn/cond/MergeMerge!conv_dw_8_bn/cond/batchnorm/add_1conv_dw_8_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_dw_8_relu/ReluReluconv_dw_8_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_dw_8_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_8_relu/MinimumMinimumconv_dw_8_relu/Reluconv_dw_8_relu/Const*
T0*0
_output_shapes
:??????????
w
conv_pw_8/random_uniform/shapeConst*
_output_shapes
:*%
valueB"            *
dtype0
a
conv_pw_8/random_uniform/minConst*
_output_shapes
: *
valueB
 *qĜ?*
dtype0
a
conv_pw_8/random_uniform/maxConst*
valueB
 *qĜ=*
dtype0*
_output_shapes
: 
?
&conv_pw_8/random_uniform/RandomUniformRandomUniformconv_pw_8/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2ǀ?*
seed???)
?
conv_pw_8/random_uniform/subSubconv_pw_8/random_uniform/maxconv_pw_8/random_uniform/min*
T0*
_output_shapes
: 
?
conv_pw_8/random_uniform/mulMul&conv_pw_8/random_uniform/RandomUniformconv_pw_8/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_8/random_uniformAddconv_pw_8/random_uniform/mulconv_pw_8/random_uniform/min*(
_output_shapes
:??*
T0
?
conv_pw_8/kernel
VariableV2*
shape:??*
shared_name *
dtype0*(
_output_shapes
:??*
	container 
?
conv_pw_8/kernel/AssignAssignconv_pw_8/kernelconv_pw_8/random_uniform*(
_output_shapes
:??*
use_locking(*
T0*#
_class
loc:@conv_pw_8/kernel*
validate_shape(
?
conv_pw_8/kernel/readIdentityconv_pw_8/kernel*
T0*#
_class
loc:@conv_pw_8/kernel*(
_output_shapes
:??
t
#conv_pw_8/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_8/convolutionConv2Dconv_dw_8_relu/Minimumconv_pw_8/kernel/read*0
_output_shapes
:??????????*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
a
conv_pw_8_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_8_bn/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_8_bn/gamma/AssignAssignconv_pw_8_bn/gammaconv_pw_8_bn/Const*%
_class
loc:@conv_pw_8_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_pw_8_bn/gamma/readIdentityconv_pw_8_bn/gamma*
T0*%
_class
loc:@conv_pw_8_bn/gamma*
_output_shapes	
:?
c
conv_pw_8_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_pw_8_bn/beta
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_pw_8_bn/beta/AssignAssignconv_pw_8_bn/betaconv_pw_8_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_pw_8_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_pw_8_bn/beta/readIdentityconv_pw_8_bn/beta*
T0*$
_class
loc:@conv_pw_8_bn/beta*
_output_shapes	
:?
c
conv_pw_8_bn/Const_2Const*
dtype0*
_output_shapes	
:?*
valueB?*    
?
conv_pw_8_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_8_bn/moving_mean/AssignAssignconv_pw_8_bn/moving_meanconv_pw_8_bn/Const_2*+
_class!
loc:@conv_pw_8_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_pw_8_bn/moving_mean/readIdentityconv_pw_8_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes	
:?
c
conv_pw_8_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_8_bn/moving_variance
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
#conv_pw_8_bn/moving_variance/AssignAssignconv_pw_8_bn/moving_varianceconv_pw_8_bn/Const_3*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
!conv_pw_8_bn/moving_variance/readIdentityconv_pw_8_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?
W
conv_pw_8_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_pw_8_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_8_bn/FusedBatchNormFusedBatchNormconv_pw_8/convolutionconv_pw_8_bn/gamma/readconv_pw_8_bn/beta/readconv_pw_8_bn/Const_4conv_pw_8_bn/Const_5*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0*
data_formatNHWC
g
conv_pw_8_bn/ShapeShapeconv_pw_8/convolution*
T0*
out_type0*
_output_shapes
:
j
 conv_pw_8_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_8_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_pw_8_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_8_bn/strided_sliceStridedSliceconv_pw_8_bn/Shape conv_pw_8_bn/strided_slice/stack"conv_pw_8_bn/strided_slice/stack_1"conv_pw_8_bn/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_8_bn/Shape_1Shapeconv_pw_8/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_8_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_8_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_8_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_8_bn/strided_slice_1StridedSliceconv_pw_8_bn/Shape_1"conv_pw_8_bn/strided_slice_1/stack$conv_pw_8_bn/strided_slice_1/stack_1$conv_pw_8_bn/strided_slice_1/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
i
conv_pw_8_bn/Shape_2Shapeconv_pw_8/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_8_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_8_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_8_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_8_bn/strided_slice_2StridedSliceconv_pw_8_bn/Shape_2"conv_pw_8_bn/strided_slice_2/stack$conv_pw_8_bn/strided_slice_2/stack_1$conv_pw_8_bn/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_pw_8_bn/Rank/packedPackconv_pw_8_bn/strided_sliceconv_pw_8_bn/strided_slice_1conv_pw_8_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_pw_8_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_pw_8_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_pw_8_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_8_bn/rangeRangeconv_pw_8_bn/range/startconv_pw_8_bn/Rankconv_pw_8_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_pw_8_bn/Prod/inputPackconv_pw_8_bn/strided_sliceconv_pw_8_bn/strided_slice_1conv_pw_8_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_8_bn/ProdProdconv_pw_8_bn/Prod/inputconv_pw_8_bn/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
l
conv_pw_8_bn/CastCastconv_pw_8_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_8_bn/sub/yConst*
dtype0*
_output_shapes
: *
valueB
 *? ??
_
conv_pw_8_bn/subSubconv_pw_8_bn/Castconv_pw_8_bn/sub/y*
T0*
_output_shapes
: 
e
conv_pw_8_bn/truedivRealDivconv_pw_8_bn/Castconv_pw_8_bn/sub*
T0*
_output_shapes
: 
r
conv_pw_8_bn/mulMulconv_pw_8_bn/FusedBatchNorm:2conv_pw_8_bn/truediv*
_output_shapes	
:?*
T0
?
"conv_pw_8_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_pw_8_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/zerosConst*+
_class!
loc:@conv_pw_8_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_8_bn/moving_mean/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_pw_8_bn/moving_mean*
	container *
shape:?
?
&conv_pw_8_bn/moving_mean/biased/AssignAssignconv_pw_8_bn/moving_mean/biased;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean
?
$conv_pw_8_bn/moving_mean/biased/readIdentityconv_pw_8_bn/moving_mean/biased*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes	
:?*
T0
?
5conv_pw_8_bn/moving_mean/local_step/Initializer/zerosConst*
_output_shapes
: *+
_class!
loc:@conv_pw_8_bn/moving_mean*
valueB
 *    *
dtype0
?
#conv_pw_8_bn/moving_mean/local_step
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *+
_class!
loc:@conv_pw_8_bn/moving_mean
?
*conv_pw_8_bn/moving_mean/local_step/AssignAssign#conv_pw_8_bn/moving_mean/local_step5conv_pw_8_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
(conv_pw_8_bn/moving_mean/local_step/readIdentity#conv_pw_8_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes
: 
?
9conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/subSub$conv_pw_8_bn/moving_mean/biased/readconv_pw_8_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes	
:?
?
9conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/mulMul9conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub"conv_pw_8_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes	
:?
?
Nconv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/conv_pw_8_bn/moving_mean	AssignSubconv_pw_8_bn/moving_mean/biased9conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/mul*
use_locking( *
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes	
:?
?
Econv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *+
_class!
loc:@conv_pw_8_bn/moving_mean*
valueB
 *  ??*
dtype0
?
?conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_8_bn/moving_mean/local_stepEconv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes
: 
?
:conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/readIdentityconv_pw_8_bn/moving_mean/biased@^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/AssignAddO^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/conv_pw_8_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes	
:?
?
=conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_1/xConst@^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/AssignAddO^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/conv_pw_8_bn/moving_mean*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_pw_8_bn/moving_mean*
valueB
 *  ??
?
;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_1Sub=conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_1/x"conv_pw_8_bn/AssignMovingAvg/decay*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes
: *
T0
?
<conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/read_1Identity#conv_pw_8_bn/moving_mean/local_step@^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/AssignAddO^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/conv_pw_8_bn/moving_mean*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes
: *
T0
?
9conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/PowPow;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_1<conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/read_1*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_2/xConst@^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/AssignAddO^conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/conv_pw_8_bn/moving_mean*+
_class!
loc:@conv_pw_8_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_2Sub=conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_2/x9conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/Pow*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes
: 
?
=conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/truedivRealDiv:conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/read;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_2*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
_output_shapes	
:?
?
;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_3Subconv_pw_8_bn/moving_mean/read=conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/truediv*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean
?
conv_pw_8_bn/AssignMovingAvg	AssignSubconv_pw_8_bn/moving_mean;conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/sub_3*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean
?
$conv_pw_8_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_pw_8_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_pw_8_bn/moving_variance
?
*conv_pw_8_bn/moving_variance/biased/AssignAssign#conv_pw_8_bn/moving_variance/biasedAconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_pw_8_bn/moving_variance/biased/readIdentity#conv_pw_8_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?
?
9conv_pw_8_bn/moving_variance/local_step/Initializer/zerosConst*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_pw_8_bn/moving_variance*
valueB
 *    
?
'conv_pw_8_bn/moving_variance/local_step
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_pw_8_bn/moving_variance*
	container 
?
.conv_pw_8_bn/moving_variance/local_step/AssignAssign'conv_pw_8_bn/moving_variance/local_step9conv_pw_8_bn/moving_variance/local_step/Initializer/zeros*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(
?
,conv_pw_8_bn/moving_variance/local_step/readIdentity'conv_pw_8_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes
: *
T0
?
?conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/subSub(conv_pw_8_bn/moving_variance/biased/readconv_pw_8_bn/mul*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?
?
?conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/mulMul?conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub$conv_pw_8_bn/AssignMovingAvg_1/decay*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance
?
Xconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/conv_pw_8_bn/moving_variance	AssignSub#conv_pw_8_bn/moving_variance/biased?conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?
?
Kconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_8_bn/moving_variance/local_stepKconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes
: 
?
@conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/readIdentity#conv_pw_8_bn/moving_variance/biasedF^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/AssignAddY^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/conv_pw_8_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?
?
Cconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_1/xConstF^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/AssignAddY^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/conv_pw_8_bn/moving_variance*
_output_shapes
: */
_class%
#!loc:@conv_pw_8_bn/moving_variance*
valueB
 *  ??*
dtype0
?
Aconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_1SubCconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_1/x$conv_pw_8_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/read_1Identity'conv_pw_8_bn/moving_variance/local_stepF^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/AssignAddY^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/conv_pw_8_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/PowPowAconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_1Bconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_2/xConstF^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/AssignAddY^conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/conv_pw_8_bn/moving_variance*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_2SubCconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_2/x?conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/truedivRealDiv@conv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/readAconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_3Sub!conv_pw_8_bn/moving_variance/readCconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/truediv*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?*
T0
?
conv_pw_8_bn/AssignMovingAvg_1	AssignSubconv_pw_8_bn/moving_varianceAconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_8_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

c
conv_pw_8_bn/cond/switch_tIdentityconv_pw_8_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_8_bn/cond/switch_fIdentityconv_pw_8_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_pw_8_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_8_bn/cond/Switch_1Switchconv_pw_8_bn/FusedBatchNormconv_pw_8_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_pw_8_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_8_bn/cond/batchnorm/add/yConst^conv_pw_8_bn/cond/switch_f*
_output_shapes
: *
valueB
 *o?:*
dtype0
?
conv_pw_8_bn/cond/batchnorm/addAdd&conv_pw_8_bn/cond/batchnorm/add/Switch!conv_pw_8_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_pw_8_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_8_bn/moving_variance/readconv_pw_8_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance
q
!conv_pw_8_bn/cond/batchnorm/RsqrtRsqrtconv_pw_8_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
conv_pw_8_bn/cond/batchnorm/mulMul!conv_pw_8_bn/cond/batchnorm/Rsqrt&conv_pw_8_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
&conv_pw_8_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_8_bn/gamma/readconv_pw_8_bn/cond/pred_id*%
_class
loc:@conv_pw_8_bn/gamma*"
_output_shapes
:?:?*
T0
?
!conv_pw_8_bn/cond/batchnorm/mul_1Mul(conv_pw_8_bn/cond/batchnorm/mul_1/Switchconv_pw_8_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
(conv_pw_8_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_8/convolutionconv_pw_8_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_8/convolution*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_8_bn/cond/batchnorm/mul_2Mul(conv_pw_8_bn/cond/batchnorm/mul_2/Switchconv_pw_8_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_pw_8_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_8_bn/moving_mean/readconv_pw_8_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean
?
conv_pw_8_bn/cond/batchnorm/subSub&conv_pw_8_bn/cond/batchnorm/sub/Switch!conv_pw_8_bn/cond/batchnorm/mul_2*
_output_shapes	
:?*
T0
?
&conv_pw_8_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_8_bn/beta/readconv_pw_8_bn/cond/pred_id*
T0*$
_class
loc:@conv_pw_8_bn/beta*"
_output_shapes
:?:?
?
!conv_pw_8_bn/cond/batchnorm/add_1Add!conv_pw_8_bn/cond/batchnorm/mul_1conv_pw_8_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_pw_8_bn/cond/MergeMerge!conv_pw_8_bn/cond/batchnorm/add_1conv_pw_8_bn/cond/Switch_1:1*2
_output_shapes 
:??????????: *
T0*
N
o
conv_pw_8_relu/ReluReluconv_pw_8_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_pw_8_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_8_relu/MinimumMinimumconv_pw_8_relu/Reluconv_pw_8_relu/Const*
T0*0
_output_shapes
:??????????
?
conv_pad_9/Pad/paddingsConst*
_output_shapes

:*9
value0B."                             *
dtype0
?
conv_pad_9/PadPadconv_pw_8_relu/Minimumconv_pad_9/Pad/paddings*
T0*
	Tpaddings0*0
_output_shapes
:??????????
w
conv_dw_9/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"            
a
conv_dw_9/random_uniform/minConst*
valueB
 *U??*
dtype0*
_output_shapes
: 
a
conv_dw_9/random_uniform/maxConst*
valueB
 *U?=*
dtype0*
_output_shapes
: 
?
&conv_dw_9/random_uniform/RandomUniformRandomUniformconv_dw_9/random_uniform/shape*
seed???)*
T0*
dtype0*'
_output_shapes
:?*
seed2?ܫ
?
conv_dw_9/random_uniform/subSubconv_dw_9/random_uniform/maxconv_dw_9/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_9/random_uniform/mulMul&conv_dw_9/random_uniform/RandomUniformconv_dw_9/random_uniform/sub*'
_output_shapes
:?*
T0
?
conv_dw_9/random_uniformAddconv_dw_9/random_uniform/mulconv_dw_9/random_uniform/min*
T0*'
_output_shapes
:?
?
conv_dw_9/depthwise_kernel
VariableV2*
dtype0*'
_output_shapes
:?*
	container *
shape:?*
shared_name 
?
!conv_dw_9/depthwise_kernel/AssignAssignconv_dw_9/depthwise_kernelconv_dw_9/random_uniform*
use_locking(*
T0*-
_class#
!loc:@conv_dw_9/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
conv_dw_9/depthwise_kernel/readIdentityconv_dw_9/depthwise_kernel*
T0*-
_class#
!loc:@conv_dw_9/depthwise_kernel*'
_output_shapes
:?
r
conv_dw_9/depthwise/ShapeConst*%
valueB"            *
dtype0*
_output_shapes
:
r
!conv_dw_9/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_9/depthwiseDepthwiseConv2dNativeconv_pad_9/Padconv_dw_9/depthwise_kernel/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID*0
_output_shapes
:??????????
a
conv_dw_9_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_9_bn/gamma
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_9_bn/gamma/AssignAssignconv_dw_9_bn/gammaconv_dw_9_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_dw_9_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_dw_9_bn/gamma/readIdentityconv_dw_9_bn/gamma*
T0*%
_class
loc:@conv_dw_9_bn/gamma*
_output_shapes	
:?
c
conv_dw_9_bn/Const_1Const*
dtype0*
_output_shapes	
:?*
valueB?*    

conv_dw_9_bn/beta
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_9_bn/beta/AssignAssignconv_dw_9_bn/betaconv_dw_9_bn/Const_1*
_output_shapes	
:?*
use_locking(*
T0*$
_class
loc:@conv_dw_9_bn/beta*
validate_shape(
?
conv_dw_9_bn/beta/readIdentityconv_dw_9_bn/beta*
T0*$
_class
loc:@conv_dw_9_bn/beta*
_output_shapes	
:?
c
conv_dw_9_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_9_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_dw_9_bn/moving_mean/AssignAssignconv_dw_9_bn/moving_meanconv_dw_9_bn/Const_2*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
validate_shape(
?
conv_dw_9_bn/moving_mean/readIdentityconv_dw_9_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes	
:?
c
conv_dw_9_bn/Const_3Const*
dtype0*
_output_shapes	
:?*
valueB?*  ??
?
conv_dw_9_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
#conv_dw_9_bn/moving_variance/AssignAssignconv_dw_9_bn/moving_varianceconv_dw_9_bn/Const_3*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
validate_shape(
?
!conv_dw_9_bn/moving_variance/readIdentityconv_dw_9_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance
W
conv_dw_9_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
W
conv_dw_9_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_9_bn/FusedBatchNormFusedBatchNormconv_dw_9/depthwiseconv_dw_9_bn/gamma/readconv_dw_9_bn/beta/readconv_dw_9_bn/Const_4conv_dw_9_bn/Const_5*
epsilon%o?:*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(
e
conv_dw_9_bn/ShapeShapeconv_dw_9/depthwise*
T0*
out_type0*
_output_shapes
:
j
 conv_dw_9_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_dw_9_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
l
"conv_dw_9_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_9_bn/strided_sliceStridedSliceconv_dw_9_bn/Shape conv_dw_9_bn/strided_slice/stack"conv_dw_9_bn/strided_slice/stack_1"conv_dw_9_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
g
conv_dw_9_bn/Shape_1Shapeconv_dw_9/depthwise*
out_type0*
_output_shapes
:*
T0
l
"conv_dw_9_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_9_bn/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
n
$conv_dw_9_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_9_bn/strided_slice_1StridedSliceconv_dw_9_bn/Shape_1"conv_dw_9_bn/strided_slice_1/stack$conv_dw_9_bn/strided_slice_1/stack_1$conv_dw_9_bn/strided_slice_1/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask 
g
conv_dw_9_bn/Shape_2Shapeconv_dw_9/depthwise*
T0*
out_type0*
_output_shapes
:
l
"conv_dw_9_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_9_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_dw_9_bn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_dw_9_bn/strided_slice_2StridedSliceconv_dw_9_bn/Shape_2"conv_dw_9_bn/strided_slice_2/stack$conv_dw_9_bn/strided_slice_2/stack_1$conv_dw_9_bn/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_dw_9_bn/Rank/packedPackconv_dw_9_bn/strided_sliceconv_dw_9_bn/strided_slice_1conv_dw_9_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_dw_9_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_dw_9_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_dw_9_bn/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
?
conv_dw_9_bn/rangeRangeconv_dw_9_bn/range/startconv_dw_9_bn/Rankconv_dw_9_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_9_bn/Prod/inputPackconv_dw_9_bn/strided_sliceconv_dw_9_bn/strided_slice_1conv_dw_9_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_9_bn/ProdProdconv_dw_9_bn/Prod/inputconv_dw_9_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
l
conv_dw_9_bn/CastCastconv_dw_9_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_dw_9_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
_
conv_dw_9_bn/subSubconv_dw_9_bn/Castconv_dw_9_bn/sub/y*
_output_shapes
: *
T0
e
conv_dw_9_bn/truedivRealDivconv_dw_9_bn/Castconv_dw_9_bn/sub*
T0*
_output_shapes
: 
r
conv_dw_9_bn/mulMulconv_dw_9_bn/FusedBatchNorm:2conv_dw_9_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_dw_9_bn/AssignMovingAvg/decayConst*+
_class!
loc:@conv_dw_9_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/zerosConst*
_output_shapes	
:?*+
_class!
loc:@conv_dw_9_bn/moving_mean*
valueB?*    *
dtype0
?
conv_dw_9_bn/moving_mean/biased
VariableV2*
_output_shapes	
:?*
shared_name *+
_class!
loc:@conv_dw_9_bn/moving_mean*
	container *
shape:?*
dtype0
?
&conv_dw_9_bn/moving_mean/biased/AssignAssignconv_dw_9_bn/moving_mean/biased;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_dw_9_bn/moving_mean/biased/readIdentityconv_dw_9_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes	
:?
?
5conv_dw_9_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_dw_9_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_dw_9_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_dw_9_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_dw_9_bn/moving_mean/local_step/AssignAssign#conv_dw_9_bn/moving_mean/local_step5conv_dw_9_bn/moving_mean/local_step/Initializer/zeros*+
_class!
loc:@conv_dw_9_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
(conv_dw_9_bn/moving_mean/local_step/readIdentity#conv_dw_9_bn/moving_mean/local_step*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/subSub$conv_dw_9_bn/moving_mean/biased/readconv_dw_9_bn/FusedBatchNorm:1*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes	
:?*
T0
?
9conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/mulMul9conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub"conv_dw_9_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes	
:?
?
Nconv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/conv_dw_9_bn/moving_mean	AssignSubconv_dw_9_bn/moving_mean/biased9conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/mul*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean
?
Econv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_dw_9_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/AssignAdd	AssignAdd#conv_dw_9_bn/moving_mean/local_stepEconv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes
: 
?
:conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/readIdentityconv_dw_9_bn/moving_mean/biased@^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/AssignAddO^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/conv_dw_9_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes	
:?
?
=conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_1/xConst@^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/AssignAddO^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/conv_dw_9_bn/moving_mean*+
_class!
loc:@conv_dw_9_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_1Sub=conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_1/x"conv_dw_9_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/read_1Identity#conv_dw_9_bn/moving_mean/local_step@^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/AssignAddO^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/conv_dw_9_bn/moving_mean*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes
: 
?
9conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/PowPow;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_1<conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/read_1*+
_class!
loc:@conv_dw_9_bn/moving_mean*
_output_shapes
: *
T0
?
=conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_2/xConst@^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/AssignAddO^conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/conv_dw_9_bn/moving_mean*+
_class!
loc:@conv_dw_9_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_2Sub=conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_2/x9conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/Pow*
_output_shapes
: *
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean
?
=conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/truedivRealDiv:conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/read;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean
?
;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_3Subconv_dw_9_bn/moving_mean/read=conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/truediv*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean
?
conv_dw_9_bn/AssignMovingAvg	AssignSubconv_dw_9_bn/moving_mean;conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/sub_3*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean
?
$conv_dw_9_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/zerosConst*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
#conv_dw_9_bn/moving_variance/biased
VariableV2*
shared_name */
_class%
#!loc:@conv_dw_9_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
*conv_dw_9_bn/moving_variance/biased/AssignAssign#conv_dw_9_bn/moving_variance/biasedAconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
(conv_dw_9_bn/moving_variance/biased/readIdentity#conv_dw_9_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?
?
9conv_dw_9_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_dw_9_bn/moving_variance/local_step
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_dw_9_bn/moving_variance
?
.conv_dw_9_bn/moving_variance/local_step/AssignAssign'conv_dw_9_bn/moving_variance/local_step9conv_dw_9_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
,conv_dw_9_bn/moving_variance/local_step/readIdentity'conv_dw_9_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes
: *
T0
?
?conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/subSub(conv_dw_9_bn/moving_variance/biased/readconv_dw_9_bn/mul*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?
?
?conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/mulMul?conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub$conv_dw_9_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?
?
Xconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/conv_dw_9_bn/moving_variance	AssignSub#conv_dw_9_bn/moving_variance/biased?conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/mul*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?*
use_locking( 
?
Kconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/AssignAdd	AssignAdd'conv_dw_9_bn/moving_variance/local_stepKconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance
?
@conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/readIdentity#conv_dw_9_bn/moving_variance/biasedF^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/AssignAddY^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/conv_dw_9_bn/moving_variance*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?*
T0
?
Cconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_1/xConstF^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/AssignAddY^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/conv_dw_9_bn/moving_variance*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_1SubCconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_1/x$conv_dw_9_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/read_1Identity'conv_dw_9_bn/moving_variance/local_stepF^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/AssignAddY^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/conv_dw_9_bn/moving_variance*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes
: 
?
?conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/PowPowAconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_1Bconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/read_1*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_2/xConstF^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/AssignAddY^conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/conv_dw_9_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_9_bn/moving_variance*
valueB
 *  ??
?
Aconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_2SubCconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_2/x?conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes
: 
?
Cconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/truedivRealDiv@conv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/readAconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?
?
Aconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_3Sub!conv_dw_9_bn/moving_variance/readCconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/truediv*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?*
T0
?
conv_dw_9_bn/AssignMovingAvg_1	AssignSubconv_dw_9_bn/moving_varianceAconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_9_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

c
conv_dw_9_bn/cond/switch_tIdentityconv_dw_9_bn/cond/Switch:1*
_output_shapes
: *
T0

a
conv_dw_9_bn/cond/switch_fIdentityconv_dw_9_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_dw_9_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_9_bn/cond/Switch_1Switchconv_dw_9_bn/FusedBatchNormconv_dw_9_bn/cond/pred_id*
T0*.
_class$
" loc:@conv_dw_9_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
!conv_dw_9_bn/cond/batchnorm/add/yConst^conv_dw_9_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_dw_9_bn/cond/batchnorm/addAdd&conv_dw_9_bn/cond/batchnorm/add/Switch!conv_dw_9_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
&conv_dw_9_bn/cond/batchnorm/add/SwitchSwitch!conv_dw_9_bn/moving_variance/readconv_dw_9_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*"
_output_shapes
:?:?
q
!conv_dw_9_bn/cond/batchnorm/RsqrtRsqrtconv_dw_9_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
conv_dw_9_bn/cond/batchnorm/mulMul!conv_dw_9_bn/cond/batchnorm/Rsqrt&conv_dw_9_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
&conv_dw_9_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_9_bn/gamma/readconv_dw_9_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_9_bn/gamma*"
_output_shapes
:?:?
?
!conv_dw_9_bn/cond/batchnorm/mul_1Mul(conv_dw_9_bn/cond/batchnorm/mul_1/Switchconv_dw_9_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
(conv_dw_9_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_9/depthwiseconv_dw_9_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_9/depthwise*L
_output_shapes:
8:??????????:??????????
?
!conv_dw_9_bn/cond/batchnorm/mul_2Mul(conv_dw_9_bn/cond/batchnorm/mul_2/Switchconv_dw_9_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_dw_9_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_9_bn/moving_mean/readconv_dw_9_bn/cond/pred_id*+
_class!
loc:@conv_dw_9_bn/moving_mean*"
_output_shapes
:?:?*
T0
?
conv_dw_9_bn/cond/batchnorm/subSub&conv_dw_9_bn/cond/batchnorm/sub/Switch!conv_dw_9_bn/cond/batchnorm/mul_2*
_output_shapes	
:?*
T0
?
&conv_dw_9_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_9_bn/beta/readconv_dw_9_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*$
_class
loc:@conv_dw_9_bn/beta
?
!conv_dw_9_bn/cond/batchnorm/add_1Add!conv_dw_9_bn/cond/batchnorm/mul_1conv_dw_9_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_dw_9_bn/cond/MergeMerge!conv_dw_9_bn/cond/batchnorm/add_1conv_dw_9_bn/cond/Switch_1:1*
N*2
_output_shapes 
:??????????: *
T0
o
conv_dw_9_relu/ReluReluconv_dw_9_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_dw_9_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_9_relu/MinimumMinimumconv_dw_9_relu/Reluconv_dw_9_relu/Const*
T0*0
_output_shapes
:??????????
w
conv_pw_9/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
a
conv_pw_9/random_uniform/minConst*
valueB
 *qĜ?*
dtype0*
_output_shapes
: 
a
conv_pw_9/random_uniform/maxConst*
valueB
 *qĜ=*
dtype0*
_output_shapes
: 
?
&conv_pw_9/random_uniform/RandomUniformRandomUniformconv_pw_9/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2ˬ?*
seed???)
?
conv_pw_9/random_uniform/subSubconv_pw_9/random_uniform/maxconv_pw_9/random_uniform/min*
_output_shapes
: *
T0
?
conv_pw_9/random_uniform/mulMul&conv_pw_9/random_uniform/RandomUniformconv_pw_9/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_9/random_uniformAddconv_pw_9/random_uniform/mulconv_pw_9/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_9/kernel
VariableV2*
dtype0*(
_output_shapes
:??*
	container *
shape:??*
shared_name 
?
conv_pw_9/kernel/AssignAssignconv_pw_9/kernelconv_pw_9/random_uniform*
use_locking(*
T0*#
_class
loc:@conv_pw_9/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_9/kernel/readIdentityconv_pw_9/kernel*
T0*#
_class
loc:@conv_pw_9/kernel*(
_output_shapes
:??
t
#conv_pw_9/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_9/convolutionConv2Dconv_dw_9_relu/Minimumconv_pw_9/kernel/read*
paddingSAME*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(
a
conv_pw_9_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_9_bn/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_9_bn/gamma/AssignAssignconv_pw_9_bn/gammaconv_pw_9_bn/Const*
use_locking(*
T0*%
_class
loc:@conv_pw_9_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_pw_9_bn/gamma/readIdentityconv_pw_9_bn/gamma*
T0*%
_class
loc:@conv_pw_9_bn/gamma*
_output_shapes	
:?
c
conv_pw_9_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?

conv_pw_9_bn/beta
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_pw_9_bn/beta/AssignAssignconv_pw_9_bn/betaconv_pw_9_bn/Const_1*
use_locking(*
T0*$
_class
loc:@conv_pw_9_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_pw_9_bn/beta/readIdentityconv_pw_9_bn/beta*
T0*$
_class
loc:@conv_pw_9_bn/beta*
_output_shapes	
:?
c
conv_pw_9_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_9_bn/moving_mean
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_9_bn/moving_mean/AssignAssignconv_pw_9_bn/moving_meanconv_pw_9_bn/Const_2*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
validate_shape(
?
conv_pw_9_bn/moving_mean/readIdentityconv_pw_9_bn/moving_mean*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes	
:?
c
conv_pw_9_bn/Const_3Const*
dtype0*
_output_shapes	
:?*
valueB?*  ??
?
conv_pw_9_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
#conv_pw_9_bn/moving_variance/AssignAssignconv_pw_9_bn/moving_varianceconv_pw_9_bn/Const_3*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
validate_shape(
?
!conv_pw_9_bn/moving_variance/readIdentityconv_pw_9_bn/moving_variance*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance
W
conv_pw_9_bn/Const_4Const*
_output_shapes
: *
valueB *
dtype0
W
conv_pw_9_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_9_bn/FusedBatchNormFusedBatchNormconv_pw_9/convolutionconv_pw_9_bn/gamma/readconv_pw_9_bn/beta/readconv_pw_9_bn/Const_4conv_pw_9_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
g
conv_pw_9_bn/ShapeShapeconv_pw_9/convolution*
_output_shapes
:*
T0*
out_type0
j
 conv_pw_9_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
l
"conv_pw_9_bn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
l
"conv_pw_9_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_9_bn/strided_sliceStridedSliceconv_pw_9_bn/Shape conv_pw_9_bn/strided_slice/stack"conv_pw_9_bn/strided_slice/stack_1"conv_pw_9_bn/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_9_bn/Shape_1Shapeconv_pw_9/convolution*
T0*
out_type0*
_output_shapes
:
l
"conv_pw_9_bn/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
n
$conv_pw_9_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_9_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_9_bn/strided_slice_1StridedSliceconv_pw_9_bn/Shape_1"conv_pw_9_bn/strided_slice_1/stack$conv_pw_9_bn/strided_slice_1/stack_1$conv_pw_9_bn/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_pw_9_bn/Shape_2Shapeconv_pw_9/convolution*
_output_shapes
:*
T0*
out_type0
l
"conv_pw_9_bn/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB:
n
$conv_pw_9_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
n
$conv_pw_9_bn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_9_bn/strided_slice_2StridedSliceconv_pw_9_bn/Shape_2"conv_pw_9_bn/strided_slice_2/stack$conv_pw_9_bn/strided_slice_2/stack_1$conv_pw_9_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
conv_pw_9_bn/Rank/packedPackconv_pw_9_bn/strided_sliceconv_pw_9_bn/strided_slice_1conv_pw_9_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
S
conv_pw_9_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
Z
conv_pw_9_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
Z
conv_pw_9_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_9_bn/rangeRangeconv_pw_9_bn/range/startconv_pw_9_bn/Rankconv_pw_9_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_9_bn/Prod/inputPackconv_pw_9_bn/strided_sliceconv_pw_9_bn/strided_slice_1conv_pw_9_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_9_bn/ProdProdconv_pw_9_bn/Prod/inputconv_pw_9_bn/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
l
conv_pw_9_bn/CastCastconv_pw_9_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
W
conv_pw_9_bn/sub/yConst*
_output_shapes
: *
valueB
 *? ??*
dtype0
_
conv_pw_9_bn/subSubconv_pw_9_bn/Castconv_pw_9_bn/sub/y*
T0*
_output_shapes
: 
e
conv_pw_9_bn/truedivRealDivconv_pw_9_bn/Castconv_pw_9_bn/sub*
_output_shapes
: *
T0
r
conv_pw_9_bn/mulMulconv_pw_9_bn/FusedBatchNorm:2conv_pw_9_bn/truediv*
T0*
_output_shapes	
:?
?
"conv_pw_9_bn/AssignMovingAvg/decayConst*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_pw_9_bn/moving_mean*
valueB
 *
?#<
?
;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/zerosConst*+
_class!
loc:@conv_pw_9_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_9_bn/moving_mean/biased
VariableV2*
shared_name *+
_class!
loc:@conv_pw_9_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
&conv_pw_9_bn/moving_mean/biased/AssignAssignconv_pw_9_bn/moving_mean/biased;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/zeros*
use_locking(*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
$conv_pw_9_bn/moving_mean/biased/readIdentityconv_pw_9_bn/moving_mean/biased*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes	
:?
?
5conv_pw_9_bn/moving_mean/local_step/Initializer/zerosConst*+
_class!
loc:@conv_pw_9_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
#conv_pw_9_bn/moving_mean/local_step
VariableV2*
shared_name *+
_class!
loc:@conv_pw_9_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
*conv_pw_9_bn/moving_mean/local_step/AssignAssign#conv_pw_9_bn/moving_mean/local_step5conv_pw_9_bn/moving_mean/local_step/Initializer/zeros*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
validate_shape(
?
(conv_pw_9_bn/moving_mean/local_step/readIdentity#conv_pw_9_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes
: *
T0
?
9conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/subSub$conv_pw_9_bn/moving_mean/biased/readconv_pw_9_bn/FusedBatchNorm:1*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes	
:?
?
9conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/mulMul9conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub"conv_pw_9_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes	
:?
?
Nconv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/conv_pw_9_bn/moving_mean	AssignSubconv_pw_9_bn/moving_mean/biased9conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/mul*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes	
:?*
use_locking( 
?
Econv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/AssignAdd/valueConst*+
_class!
loc:@conv_pw_9_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
?conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/AssignAdd	AssignAdd#conv_pw_9_bn/moving_mean/local_stepEconv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes
: 
?
:conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/readIdentityconv_pw_9_bn/moving_mean/biased@^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/AssignAddO^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/conv_pw_9_bn/moving_mean*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean
?
=conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_1/xConst@^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/AssignAddO^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/conv_pw_9_bn/moving_mean*+
_class!
loc:@conv_pw_9_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_1Sub=conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_1/x"conv_pw_9_bn/AssignMovingAvg/decay*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes
: 
?
<conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/read_1Identity#conv_pw_9_bn/moving_mean/local_step@^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/AssignAddO^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/conv_pw_9_bn/moving_mean*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean
?
9conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/PowPow;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_1<conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/read_1*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean
?
=conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_2/xConst@^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/AssignAddO^conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/conv_pw_9_bn/moving_mean*+
_class!
loc:@conv_pw_9_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_2Sub=conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_2/x9conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/Pow*
_output_shapes
: *
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean
?
=conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/truedivRealDiv:conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/read;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean
?
;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_3Subconv_pw_9_bn/moving_mean/read=conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/truediv*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes	
:?*
T0
?
conv_pw_9_bn/AssignMovingAvg	AssignSubconv_pw_9_bn/moving_mean;conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/sub_3*
use_locking( *
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
_output_shapes	
:?
?
$conv_pw_9_bn/AssignMovingAvg_1/decayConst*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Aconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/zerosConst*
_output_shapes	
:?*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
valueB?*    *
dtype0
?
#conv_pw_9_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name */
_class%
#!loc:@conv_pw_9_bn/moving_variance
?
*conv_pw_9_bn/moving_variance/biased/AssignAssign#conv_pw_9_bn/moving_variance/biasedAconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/zeros*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
validate_shape(
?
(conv_pw_9_bn/moving_variance/biased/readIdentity#conv_pw_9_bn/moving_variance/biased*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes	
:?
?
9conv_pw_9_bn/moving_variance/local_step/Initializer/zerosConst*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
'conv_pw_9_bn/moving_variance/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name */
_class%
#!loc:@conv_pw_9_bn/moving_variance*
	container *
shape: 
?
.conv_pw_9_bn/moving_variance/local_step/AssignAssign'conv_pw_9_bn/moving_variance/local_step9conv_pw_9_bn/moving_variance/local_step/Initializer/zeros*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(
?
,conv_pw_9_bn/moving_variance/local_step/readIdentity'conv_pw_9_bn/moving_variance/local_step*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance
?
?conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/subSub(conv_pw_9_bn/moving_variance/biased/readconv_pw_9_bn/mul*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes	
:?
?
?conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/mulMul?conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub$conv_pw_9_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes	
:?
?
Xconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/conv_pw_9_bn/moving_variance	AssignSub#conv_pw_9_bn/moving_variance/biased?conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/mul*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes	
:?
?
Kconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/AssignAdd/valueConst*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Econv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/AssignAdd	AssignAdd'conv_pw_9_bn/moving_variance/local_stepKconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance
?
@conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/readIdentity#conv_pw_9_bn/moving_variance/biasedF^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/AssignAddY^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/conv_pw_9_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes	
:?
?
Cconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_1/xConstF^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/AssignAddY^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/conv_pw_9_bn/moving_variance*
_output_shapes
: */
_class%
#!loc:@conv_pw_9_bn/moving_variance*
valueB
 *  ??*
dtype0
?
Aconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_1SubCconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_1/x$conv_pw_9_bn/AssignMovingAvg_1/decay*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/read_1Identity'conv_pw_9_bn/moving_variance/local_stepF^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/AssignAddY^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/conv_pw_9_bn/moving_variance*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes
: 
?
?conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/PowPowAconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_1Bconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/read_1*
_output_shapes
: *
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance
?
Cconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_2/xConstF^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/AssignAddY^conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/conv_pw_9_bn/moving_variance*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_2SubCconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_2/x?conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/Pow*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes
: 
?
Cconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/truedivRealDiv@conv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/readAconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_2*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_3Sub!conv_pw_9_bn/moving_variance/readCconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance
?
conv_pw_9_bn/AssignMovingAvg_1	AssignSubconv_pw_9_bn/moving_varianceAconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/sub_3*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_9_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
c
conv_pw_9_bn/cond/switch_tIdentityconv_pw_9_bn/cond/Switch:1*
T0
*
_output_shapes
: 
a
conv_pw_9_bn/cond/switch_fIdentityconv_pw_9_bn/cond/Switch*
T0
*
_output_shapes
: 
e
conv_pw_9_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_9_bn/cond/Switch_1Switchconv_pw_9_bn/FusedBatchNormconv_pw_9_bn/cond/pred_id*.
_class$
" loc:@conv_pw_9_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????*
T0
?
!conv_pw_9_bn/cond/batchnorm/add/yConst^conv_pw_9_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
conv_pw_9_bn/cond/batchnorm/addAdd&conv_pw_9_bn/cond/batchnorm/add/Switch!conv_pw_9_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
&conv_pw_9_bn/cond/batchnorm/add/SwitchSwitch!conv_pw_9_bn/moving_variance/readconv_pw_9_bn/cond/pred_id*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*"
_output_shapes
:?:?*
T0
q
!conv_pw_9_bn/cond/batchnorm/RsqrtRsqrtconv_pw_9_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
conv_pw_9_bn/cond/batchnorm/mulMul!conv_pw_9_bn/cond/batchnorm/Rsqrt&conv_pw_9_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
&conv_pw_9_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_9_bn/gamma/readconv_pw_9_bn/cond/pred_id*%
_class
loc:@conv_pw_9_bn/gamma*"
_output_shapes
:?:?*
T0
?
!conv_pw_9_bn/cond/batchnorm/mul_1Mul(conv_pw_9_bn/cond/batchnorm/mul_1/Switchconv_pw_9_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
(conv_pw_9_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_9/convolutionconv_pw_9_bn/cond/pred_id*
T0*(
_class
loc:@conv_pw_9/convolution*L
_output_shapes:
8:??????????:??????????
?
!conv_pw_9_bn/cond/batchnorm/mul_2Mul(conv_pw_9_bn/cond/batchnorm/mul_2/Switchconv_pw_9_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
(conv_pw_9_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_9_bn/moving_mean/readconv_pw_9_bn/cond/pred_id*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*"
_output_shapes
:?:?
?
conv_pw_9_bn/cond/batchnorm/subSub&conv_pw_9_bn/cond/batchnorm/sub/Switch!conv_pw_9_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
&conv_pw_9_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_9_bn/beta/readconv_pw_9_bn/cond/pred_id*
T0*$
_class
loc:@conv_pw_9_bn/beta*"
_output_shapes
:?:?
?
!conv_pw_9_bn/cond/batchnorm/add_1Add!conv_pw_9_bn/cond/batchnorm/mul_1conv_pw_9_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_pw_9_bn/cond/MergeMerge!conv_pw_9_bn/cond/batchnorm/add_1conv_pw_9_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
o
conv_pw_9_relu/ReluReluconv_pw_9_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Y
conv_pw_9_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_9_relu/MinimumMinimumconv_pw_9_relu/Reluconv_pw_9_relu/Const*0
_output_shapes
:??????????*
T0
?
conv_pad_10/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_10/PadPadconv_pw_9_relu/Minimumconv_pad_10/Pad/paddings*
T0*
	Tpaddings0*0
_output_shapes
:??????????
x
conv_dw_10/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_dw_10/random_uniform/minConst*
valueB
 *U??*
dtype0*
_output_shapes
: 
b
conv_dw_10/random_uniform/maxConst*
valueB
 *U?=*
dtype0*
_output_shapes
: 
?
'conv_dw_10/random_uniform/RandomUniformRandomUniformconv_dw_10/random_uniform/shape*
seed???)*
T0*
dtype0*'
_output_shapes
:?*
seed2??H
?
conv_dw_10/random_uniform/subSubconv_dw_10/random_uniform/maxconv_dw_10/random_uniform/min*
_output_shapes
: *
T0
?
conv_dw_10/random_uniform/mulMul'conv_dw_10/random_uniform/RandomUniformconv_dw_10/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_10/random_uniformAddconv_dw_10/random_uniform/mulconv_dw_10/random_uniform/min*'
_output_shapes
:?*
T0
?
conv_dw_10/depthwise_kernel
VariableV2*
dtype0*'
_output_shapes
:?*
	container *
shape:?*
shared_name 
?
"conv_dw_10/depthwise_kernel/AssignAssignconv_dw_10/depthwise_kernelconv_dw_10/random_uniform*
use_locking(*
T0*.
_class$
" loc:@conv_dw_10/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
 conv_dw_10/depthwise_kernel/readIdentityconv_dw_10/depthwise_kernel*
T0*.
_class$
" loc:@conv_dw_10/depthwise_kernel*'
_output_shapes
:?
s
conv_dw_10/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"            
s
"conv_dw_10/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_10/depthwiseDepthwiseConv2dNativeconv_pad_10/Pad conv_dw_10/depthwise_kernel/read*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID
b
conv_dw_10_bn/ConstConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??
?
conv_dw_10_bn/gamma
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_10_bn/gamma/AssignAssignconv_dw_10_bn/gammaconv_dw_10_bn/Const*
use_locking(*
T0*&
_class
loc:@conv_dw_10_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_dw_10_bn/gamma/readIdentityconv_dw_10_bn/gamma*
_output_shapes	
:?*
T0*&
_class
loc:@conv_dw_10_bn/gamma
d
conv_dw_10_bn/Const_1Const*
dtype0*
_output_shapes	
:?*
valueB?*    
?
conv_dw_10_bn/beta
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_10_bn/beta/AssignAssignconv_dw_10_bn/betaconv_dw_10_bn/Const_1*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_10_bn/beta*
validate_shape(
?
conv_dw_10_bn/beta/readIdentityconv_dw_10_bn/beta*
T0*%
_class
loc:@conv_dw_10_bn/beta*
_output_shapes	
:?
d
conv_dw_10_bn/Const_2Const*
dtype0*
_output_shapes	
:?*
valueB?*    
?
conv_dw_10_bn/moving_mean
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
 conv_dw_10_bn/moving_mean/AssignAssignconv_dw_10_bn/moving_meanconv_dw_10_bn/Const_2*
use_locking(*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_dw_10_bn/moving_mean/readIdentityconv_dw_10_bn/moving_mean*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes	
:?*
T0
d
conv_dw_10_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_10_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
$conv_dw_10_bn/moving_variance/AssignAssignconv_dw_10_bn/moving_varianceconv_dw_10_bn/Const_3*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
"conv_dw_10_bn/moving_variance/readIdentityconv_dw_10_bn/moving_variance*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes	
:?*
T0
X
conv_dw_10_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
X
conv_dw_10_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_10_bn/FusedBatchNormFusedBatchNormconv_dw_10/depthwiseconv_dw_10_bn/gamma/readconv_dw_10_bn/beta/readconv_dw_10_bn/Const_4conv_dw_10_bn/Const_5*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0*
data_formatNHWC
g
conv_dw_10_bn/ShapeShapeconv_dw_10/depthwise*
_output_shapes
:*
T0*
out_type0
k
!conv_dw_10_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
m
#conv_dw_10_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
m
#conv_dw_10_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_10_bn/strided_sliceStridedSliceconv_dw_10_bn/Shape!conv_dw_10_bn/strided_slice/stack#conv_dw_10_bn/strided_slice/stack_1#conv_dw_10_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
i
conv_dw_10_bn/Shape_1Shapeconv_dw_10/depthwise*
T0*
out_type0*
_output_shapes
:
m
#conv_dw_10_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_10_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_10_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_10_bn/strided_slice_1StridedSliceconv_dw_10_bn/Shape_1#conv_dw_10_bn/strided_slice_1/stack%conv_dw_10_bn/strided_slice_1/stack_1%conv_dw_10_bn/strided_slice_1/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
i
conv_dw_10_bn/Shape_2Shapeconv_dw_10/depthwise*
out_type0*
_output_shapes
:*
T0
m
#conv_dw_10_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_10_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_10_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_10_bn/strided_slice_2StridedSliceconv_dw_10_bn/Shape_2#conv_dw_10_bn/strided_slice_2/stack%conv_dw_10_bn/strided_slice_2/stack_1%conv_dw_10_bn/strided_slice_2/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_dw_10_bn/Rank/packedPackconv_dw_10_bn/strided_sliceconv_dw_10_bn/strided_slice_1conv_dw_10_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
T
conv_dw_10_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_dw_10_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
[
conv_dw_10_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_10_bn/rangeRangeconv_dw_10_bn/range/startconv_dw_10_bn/Rankconv_dw_10_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_10_bn/Prod/inputPackconv_dw_10_bn/strided_sliceconv_dw_10_bn/strided_slice_1conv_dw_10_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_10_bn/ProdProdconv_dw_10_bn/Prod/inputconv_dw_10_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
n
conv_dw_10_bn/CastCastconv_dw_10_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
X
conv_dw_10_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
b
conv_dw_10_bn/subSubconv_dw_10_bn/Castconv_dw_10_bn/sub/y*
T0*
_output_shapes
: 
h
conv_dw_10_bn/truedivRealDivconv_dw_10_bn/Castconv_dw_10_bn/sub*
T0*
_output_shapes
: 
u
conv_dw_10_bn/mulMulconv_dw_10_bn/FusedBatchNorm:2conv_dw_10_bn/truediv*
T0*
_output_shapes	
:?
?
#conv_dw_10_bn/AssignMovingAvg/decayConst*
_output_shapes
: *,
_class"
 loc:@conv_dw_10_bn/moving_mean*
valueB
 *
?#<*
dtype0
?
=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/zerosConst*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
 conv_dw_10_bn/moving_mean/biased
VariableV2*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
'conv_dw_10_bn/moving_mean/biased/AssignAssign conv_dw_10_bn/moving_mean/biased=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean
?
%conv_dw_10_bn/moving_mean/biased/readIdentity conv_dw_10_bn/moving_mean/biased*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes	
:?
?
6conv_dw_10_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_dw_10_bn/moving_mean/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *,
_class"
 loc:@conv_dw_10_bn/moving_mean*
	container *
shape: 
?
+conv_dw_10_bn/moving_mean/local_step/AssignAssign$conv_dw_10_bn/moving_mean/local_step6conv_dw_10_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
)conv_dw_10_bn/moving_mean/local_step/readIdentity$conv_dw_10_bn/moving_mean/local_step*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes
: 
?
;conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/subSub%conv_dw_10_bn/moving_mean/biased/readconv_dw_10_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean
?
;conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/mulMul;conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub#conv_dw_10_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes	
:?
?
Qconv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/conv_dw_10_bn/moving_mean	AssignSub conv_dw_10_bn/moving_mean/biased;conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/mul*
_output_shapes	
:?*
use_locking( *
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean
?
Gconv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/AssignAdd/valueConst*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/AssignAdd	AssignAdd$conv_dw_10_bn/moving_mean/local_stepGconv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes
: 
?
<conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/readIdentity conv_dw_10_bn/moving_mean/biasedB^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/AssignAddR^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/conv_dw_10_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes	
:?
?
?conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_1/xConstB^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/AssignAddR^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/conv_dw_10_bn/moving_mean*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_1Sub?conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_1/x#conv_dw_10_bn/AssignMovingAvg/decay*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes
: *
T0
?
>conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/read_1Identity$conv_dw_10_bn/moving_mean/local_stepB^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/AssignAddR^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/conv_dw_10_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes
: 
?
;conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/PowPow=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_1>conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/read_1*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes
: 
?
?conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_2/xConstB^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/AssignAddR^conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/conv_dw_10_bn/moving_mean*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_2Sub?conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_2/x;conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/Pow*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes
: 
?
?conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/truedivRealDiv<conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/read=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean
?
=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_3Subconv_dw_10_bn/moving_mean/read?conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/truediv*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes	
:?*
T0
?
conv_dw_10_bn/AssignMovingAvg	AssignSubconv_dw_10_bn/moving_mean=conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/sub_3*
use_locking( *
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
_output_shapes	
:?
?
%conv_dw_10_bn/AssignMovingAvg_1/decayConst*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Cconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/zerosConst*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
$conv_dw_10_bn/moving_variance/biased
VariableV2*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
+conv_dw_10_bn/moving_variance/biased/AssignAssign$conv_dw_10_bn/moving_variance/biasedCconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/zeros*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
)conv_dw_10_bn/moving_variance/biased/readIdentity$conv_dw_10_bn/moving_variance/biased*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes	
:?
?
:conv_dw_10_bn/moving_variance/local_step/Initializer/zerosConst*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
(conv_dw_10_bn/moving_variance/local_step
VariableV2*
shared_name *0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
/conv_dw_10_bn/moving_variance/local_step/AssignAssign(conv_dw_10_bn/moving_variance/local_step:conv_dw_10_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
-conv_dw_10_bn/moving_variance/local_step/readIdentity(conv_dw_10_bn/moving_variance/local_step*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes
: 
?
Aconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/subSub)conv_dw_10_bn/moving_variance/biased/readconv_dw_10_bn/mul*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes	
:?
?
Aconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/mulMulAconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub%conv_dw_10_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes	
:?
?
[conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/conv_dw_10_bn/moving_variance	AssignSub$conv_dw_10_bn/moving_variance/biasedAconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/mul*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes	
:?
?
Mconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/AssignAdd/valueConst*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/AssignAdd	AssignAdd(conv_dw_10_bn/moving_variance/local_stepMconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/AssignAdd/value*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes
: *
use_locking( 
?
Bconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/readIdentity$conv_dw_10_bn/moving_variance/biasedH^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/AssignAdd\^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/conv_dw_10_bn/moving_variance*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes	
:?*
T0
?
Econv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_1/xConstH^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/AssignAdd\^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/conv_dw_10_bn/moving_variance*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_1SubEconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_1/x%conv_dw_10_bn/AssignMovingAvg_1/decay*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes
: *
T0
?
Dconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/read_1Identity(conv_dw_10_bn/moving_variance/local_stepH^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/AssignAdd\^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/conv_dw_10_bn/moving_variance*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes
: 
?
Aconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/PowPowCconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_1Dconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/read_1*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes
: 
?
Econv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_2/xConstH^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/AssignAdd\^conv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/conv_dw_10_bn/moving_variance*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_2SubEconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_2/xAconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/Pow*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance
?
Econv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/truedivRealDivBconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/readCconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance
?
Cconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_3Sub"conv_dw_10_bn/moving_variance/readEconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/truediv*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_10_bn/AssignMovingAvg_1	AssignSubconv_dw_10_bn/moving_varianceCconv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/sub_3*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance
?
conv_dw_10_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

e
conv_dw_10_bn/cond/switch_tIdentityconv_dw_10_bn/cond/Switch:1*
T0
*
_output_shapes
: 
c
conv_dw_10_bn/cond/switch_fIdentityconv_dw_10_bn/cond/Switch*
T0
*
_output_shapes
: 
f
conv_dw_10_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_10_bn/cond/Switch_1Switchconv_dw_10_bn/FusedBatchNormconv_dw_10_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*/
_class%
#!loc:@conv_dw_10_bn/FusedBatchNorm
?
"conv_dw_10_bn/cond/batchnorm/add/yConst^conv_dw_10_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
 conv_dw_10_bn/cond/batchnorm/addAdd'conv_dw_10_bn/cond/batchnorm/add/Switch"conv_dw_10_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
'conv_dw_10_bn/cond/batchnorm/add/SwitchSwitch"conv_dw_10_bn/moving_variance/readconv_dw_10_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance
s
"conv_dw_10_bn/cond/batchnorm/RsqrtRsqrt conv_dw_10_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
 conv_dw_10_bn/cond/batchnorm/mulMul"conv_dw_10_bn/cond/batchnorm/Rsqrt'conv_dw_10_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
'conv_dw_10_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_10_bn/gamma/readconv_dw_10_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*&
_class
loc:@conv_dw_10_bn/gamma
?
"conv_dw_10_bn/cond/batchnorm/mul_1Mul)conv_dw_10_bn/cond/batchnorm/mul_1/Switch conv_dw_10_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
)conv_dw_10_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_10/depthwiseconv_dw_10_bn/cond/pred_id*
T0*'
_class
loc:@conv_dw_10/depthwise*L
_output_shapes:
8:??????????:??????????
?
"conv_dw_10_bn/cond/batchnorm/mul_2Mul)conv_dw_10_bn/cond/batchnorm/mul_2/Switch conv_dw_10_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
)conv_dw_10_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_10_bn/moving_mean/readconv_dw_10_bn/cond/pred_id*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*"
_output_shapes
:?:?
?
 conv_dw_10_bn/cond/batchnorm/subSub'conv_dw_10_bn/cond/batchnorm/sub/Switch"conv_dw_10_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
'conv_dw_10_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_10_bn/beta/readconv_dw_10_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_10_bn/beta*"
_output_shapes
:?:?
?
"conv_dw_10_bn/cond/batchnorm/add_1Add"conv_dw_10_bn/cond/batchnorm/mul_1 conv_dw_10_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_dw_10_bn/cond/MergeMerge"conv_dw_10_bn/cond/batchnorm/add_1conv_dw_10_bn/cond/Switch_1:1*2
_output_shapes 
:??????????: *
T0*
N
q
conv_dw_10_relu/ReluReluconv_dw_10_bn/cond/Merge*
T0*0
_output_shapes
:??????????
Z
conv_dw_10_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_10_relu/MinimumMinimumconv_dw_10_relu/Reluconv_dw_10_relu/Const*
T0*0
_output_shapes
:??????????
x
conv_pw_10/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_pw_10/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *qĜ?
b
conv_pw_10/random_uniform/maxConst*
valueB
 *qĜ=*
dtype0*
_output_shapes
: 
?
'conv_pw_10/random_uniform/RandomUniformRandomUniformconv_pw_10/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2?ï*
seed???)
?
conv_pw_10/random_uniform/subSubconv_pw_10/random_uniform/maxconv_pw_10/random_uniform/min*
T0*
_output_shapes
: 
?
conv_pw_10/random_uniform/mulMul'conv_pw_10/random_uniform/RandomUniformconv_pw_10/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_10/random_uniformAddconv_pw_10/random_uniform/mulconv_pw_10/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_10/kernel
VariableV2*
dtype0*(
_output_shapes
:??*
	container *
shape:??*
shared_name 
?
conv_pw_10/kernel/AssignAssignconv_pw_10/kernelconv_pw_10/random_uniform*
use_locking(*
T0*$
_class
loc:@conv_pw_10/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_10/kernel/readIdentityconv_pw_10/kernel*
T0*$
_class
loc:@conv_pw_10/kernel*(
_output_shapes
:??
u
$conv_pw_10/convolution/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
?
conv_pw_10/convolutionConv2Dconv_dw_10_relu/Minimumconv_pw_10/kernel/read*
use_cudnn_on_gpu(*
paddingSAME*0
_output_shapes
:??????????*
	dilations
*
T0*
strides
*
data_formatNHWC
b
conv_pw_10_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_10_bn/gamma
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_pw_10_bn/gamma/AssignAssignconv_pw_10_bn/gammaconv_pw_10_bn/Const*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*&
_class
loc:@conv_pw_10_bn/gamma
?
conv_pw_10_bn/gamma/readIdentityconv_pw_10_bn/gamma*
T0*&
_class
loc:@conv_pw_10_bn/gamma*
_output_shapes	
:?
d
conv_pw_10_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_10_bn/beta
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_pw_10_bn/beta/AssignAssignconv_pw_10_bn/betaconv_pw_10_bn/Const_1*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_pw_10_bn/beta*
validate_shape(
?
conv_pw_10_bn/beta/readIdentityconv_pw_10_bn/beta*
T0*%
_class
loc:@conv_pw_10_bn/beta*
_output_shapes	
:?
d
conv_pw_10_bn/Const_2Const*
_output_shapes	
:?*
valueB?*    *
dtype0
?
conv_pw_10_bn/moving_mean
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
 conv_pw_10_bn/moving_mean/AssignAssignconv_pw_10_bn/moving_meanconv_pw_10_bn/Const_2*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
validate_shape(
?
conv_pw_10_bn/moving_mean/readIdentityconv_pw_10_bn/moving_mean*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?
d
conv_pw_10_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_10_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
$conv_pw_10_bn/moving_variance/AssignAssignconv_pw_10_bn/moving_varianceconv_pw_10_bn/Const_3*
_output_shapes	
:?*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
validate_shape(
?
"conv_pw_10_bn/moving_variance/readIdentityconv_pw_10_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?
X
conv_pw_10_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
X
conv_pw_10_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_10_bn/FusedBatchNormFusedBatchNormconv_pw_10/convolutionconv_pw_10_bn/gamma/readconv_pw_10_bn/beta/readconv_pw_10_bn/Const_4conv_pw_10_bn/Const_5*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0*
data_formatNHWC
i
conv_pw_10_bn/ShapeShapeconv_pw_10/convolution*
T0*
out_type0*
_output_shapes
:
k
!conv_pw_10_bn/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
m
#conv_pw_10_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
m
#conv_pw_10_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_10_bn/strided_sliceStridedSliceconv_pw_10_bn/Shape!conv_pw_10_bn/strided_slice/stack#conv_pw_10_bn/strided_slice/stack_1#conv_pw_10_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
k
conv_pw_10_bn/Shape_1Shapeconv_pw_10/convolution*
T0*
out_type0*
_output_shapes
:
m
#conv_pw_10_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_10_bn/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
o
%conv_pw_10_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_10_bn/strided_slice_1StridedSliceconv_pw_10_bn/Shape_1#conv_pw_10_bn/strided_slice_1/stack%conv_pw_10_bn/strided_slice_1/stack_1%conv_pw_10_bn/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
k
conv_pw_10_bn/Shape_2Shapeconv_pw_10/convolution*
out_type0*
_output_shapes
:*
T0
m
#conv_pw_10_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_10_bn/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
o
%conv_pw_10_bn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_10_bn/strided_slice_2StridedSliceconv_pw_10_bn/Shape_2#conv_pw_10_bn/strided_slice_2/stack%conv_pw_10_bn/strided_slice_2/stack_1%conv_pw_10_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
conv_pw_10_bn/Rank/packedPackconv_pw_10_bn/strided_sliceconv_pw_10_bn/strided_slice_1conv_pw_10_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
T
conv_pw_10_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_pw_10_bn/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
[
conv_pw_10_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_10_bn/rangeRangeconv_pw_10_bn/range/startconv_pw_10_bn/Rankconv_pw_10_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_10_bn/Prod/inputPackconv_pw_10_bn/strided_sliceconv_pw_10_bn/strided_slice_1conv_pw_10_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_10_bn/ProdProdconv_pw_10_bn/Prod/inputconv_pw_10_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
n
conv_pw_10_bn/CastCastconv_pw_10_bn/Prod*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0
X
conv_pw_10_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
b
conv_pw_10_bn/subSubconv_pw_10_bn/Castconv_pw_10_bn/sub/y*
T0*
_output_shapes
: 
h
conv_pw_10_bn/truedivRealDivconv_pw_10_bn/Castconv_pw_10_bn/sub*
_output_shapes
: *
T0
u
conv_pw_10_bn/mulMulconv_pw_10_bn/FusedBatchNorm:2conv_pw_10_bn/truediv*
_output_shapes	
:?*
T0
?
#conv_pw_10_bn/AssignMovingAvg/decayConst*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/zerosConst*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
 conv_pw_10_bn/moving_mean/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *,
_class"
 loc:@conv_pw_10_bn/moving_mean*
	container *
shape:?
?
'conv_pw_10_bn/moving_mean/biased/AssignAssign conv_pw_10_bn/moving_mean/biased=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/zeros*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
%conv_pw_10_bn/moving_mean/biased/readIdentity conv_pw_10_bn/moving_mean/biased*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean
?
6conv_pw_10_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_pw_10_bn/moving_mean/local_step
VariableV2*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
+conv_pw_10_bn/moving_mean/local_step/AssignAssign$conv_pw_10_bn/moving_mean/local_step6conv_pw_10_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
)conv_pw_10_bn/moving_mean/local_step/readIdentity$conv_pw_10_bn/moving_mean/local_step*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes
: 
?
;conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/subSub%conv_pw_10_bn/moving_mean/biased/readconv_pw_10_bn/FusedBatchNorm:1*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?*
T0
?
;conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/mulMul;conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub#conv_pw_10_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?
?
Qconv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/conv_pw_10_bn/moving_mean	AssignSub conv_pw_10_bn/moving_mean/biased;conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/mul*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?*
use_locking( 
?
Gconv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/AssignAdd/valueConst*
dtype0*
_output_shapes
: *,
_class"
 loc:@conv_pw_10_bn/moving_mean*
valueB
 *  ??
?
Aconv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/AssignAdd	AssignAdd$conv_pw_10_bn/moving_mean/local_stepGconv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean
?
<conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/readIdentity conv_pw_10_bn/moving_mean/biasedB^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/AssignAddR^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/conv_pw_10_bn/moving_mean*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?
?
?conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_1/xConstB^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/AssignAddR^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/conv_pw_10_bn/moving_mean*
_output_shapes
: *,
_class"
 loc:@conv_pw_10_bn/moving_mean*
valueB
 *  ??*
dtype0
?
=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_1Sub?conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_1/x#conv_pw_10_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes
: 
?
>conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/read_1Identity$conv_pw_10_bn/moving_mean/local_stepB^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/AssignAddR^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/conv_pw_10_bn/moving_mean*
_output_shapes
: *
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean
?
;conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/PowPow=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_1>conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/read_1*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes
: 
?
?conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_2/xConstB^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/AssignAddR^conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/conv_pw_10_bn/moving_mean*
_output_shapes
: *,
_class"
 loc:@conv_pw_10_bn/moving_mean*
valueB
 *  ??*
dtype0
?
=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_2Sub?conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_2/x;conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/Pow*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes
: *
T0
?
?conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/truedivRealDiv<conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/read=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_2*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?
?
=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_3Subconv_pw_10_bn/moving_mean/read?conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/truediv*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?
?
conv_pw_10_bn/AssignMovingAvg	AssignSubconv_pw_10_bn/moving_mean=conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/sub_3*
use_locking( *
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
_output_shapes	
:?
?
%conv_pw_10_bn/AssignMovingAvg_1/decayConst*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Cconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/zerosConst*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
$conv_pw_10_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *0
_class&
$"loc:@conv_pw_10_bn/moving_variance
?
+conv_pw_10_bn/moving_variance/biased/AssignAssign$conv_pw_10_bn/moving_variance/biasedCconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/zeros*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
)conv_pw_10_bn/moving_variance/biased/readIdentity$conv_pw_10_bn/moving_variance/biased*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?*
T0
?
:conv_pw_10_bn/moving_variance/local_step/Initializer/zerosConst*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
(conv_pw_10_bn/moving_variance/local_step
VariableV2*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@conv_pw_10_bn/moving_variance
?
/conv_pw_10_bn/moving_variance/local_step/AssignAssign(conv_pw_10_bn/moving_variance/local_step:conv_pw_10_bn/moving_variance/local_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance
?
-conv_pw_10_bn/moving_variance/local_step/readIdentity(conv_pw_10_bn/moving_variance/local_step*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes
: 
?
Aconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/subSub)conv_pw_10_bn/moving_variance/biased/readconv_pw_10_bn/mul*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/mulMulAconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub%conv_pw_10_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?
?
[conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/conv_pw_10_bn/moving_variance	AssignSub$conv_pw_10_bn/moving_variance/biasedAconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/mul*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
Mconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/AssignAdd/valueConst*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/AssignAdd	AssignAdd(conv_pw_10_bn/moving_variance/local_stepMconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance
?
Bconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/readIdentity$conv_pw_10_bn/moving_variance/biasedH^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/AssignAdd\^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/conv_pw_10_bn/moving_variance*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?*
T0
?
Econv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_1/xConstH^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/AssignAdd\^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/conv_pw_10_bn/moving_variance*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_1SubEconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_1/x%conv_pw_10_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes
: 
?
Dconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/read_1Identity(conv_pw_10_bn/moving_variance/local_stepH^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/AssignAdd\^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/conv_pw_10_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes
: 
?
Aconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/PowPowCconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_1Dconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/read_1*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes
: *
T0
?
Econv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_2/xConstH^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/AssignAdd\^conv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/conv_pw_10_bn/moving_variance*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_2SubEconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_2/xAconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/Pow*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes
: 
?
Econv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/truedivRealDivBconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/readCconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance
?
Cconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_3Sub"conv_pw_10_bn/moving_variance/readEconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/truediv*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_10_bn/AssignMovingAvg_1	AssignSubconv_pw_10_bn/moving_varianceCconv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/sub_3*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
_output_shapes	
:?*
use_locking( 
?
conv_pw_10_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
e
conv_pw_10_bn/cond/switch_tIdentityconv_pw_10_bn/cond/Switch:1*
T0
*
_output_shapes
: 
c
conv_pw_10_bn/cond/switch_fIdentityconv_pw_10_bn/cond/Switch*
_output_shapes
: *
T0

f
conv_pw_10_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_10_bn/cond/Switch_1Switchconv_pw_10_bn/FusedBatchNormconv_pw_10_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*/
_class%
#!loc:@conv_pw_10_bn/FusedBatchNorm
?
"conv_pw_10_bn/cond/batchnorm/add/yConst^conv_pw_10_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
 conv_pw_10_bn/cond/batchnorm/addAdd'conv_pw_10_bn/cond/batchnorm/add/Switch"conv_pw_10_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
'conv_pw_10_bn/cond/batchnorm/add/SwitchSwitch"conv_pw_10_bn/moving_variance/readconv_pw_10_bn/cond/pred_id*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*"
_output_shapes
:?:?*
T0
s
"conv_pw_10_bn/cond/batchnorm/RsqrtRsqrt conv_pw_10_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
 conv_pw_10_bn/cond/batchnorm/mulMul"conv_pw_10_bn/cond/batchnorm/Rsqrt'conv_pw_10_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
'conv_pw_10_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_10_bn/gamma/readconv_pw_10_bn/cond/pred_id*
T0*&
_class
loc:@conv_pw_10_bn/gamma*"
_output_shapes
:?:?
?
"conv_pw_10_bn/cond/batchnorm/mul_1Mul)conv_pw_10_bn/cond/batchnorm/mul_1/Switch conv_pw_10_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
)conv_pw_10_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_10/convolutionconv_pw_10_bn/cond/pred_id*)
_class
loc:@conv_pw_10/convolution*L
_output_shapes:
8:??????????:??????????*
T0
?
"conv_pw_10_bn/cond/batchnorm/mul_2Mul)conv_pw_10_bn/cond/batchnorm/mul_2/Switch conv_pw_10_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
)conv_pw_10_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_10_bn/moving_mean/readconv_pw_10_bn/cond/pred_id*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*"
_output_shapes
:?:?
?
 conv_pw_10_bn/cond/batchnorm/subSub'conv_pw_10_bn/cond/batchnorm/sub/Switch"conv_pw_10_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
'conv_pw_10_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_10_bn/beta/readconv_pw_10_bn/cond/pred_id*
T0*%
_class
loc:@conv_pw_10_bn/beta*"
_output_shapes
:?:?
?
"conv_pw_10_bn/cond/batchnorm/add_1Add"conv_pw_10_bn/cond/batchnorm/mul_1 conv_pw_10_bn/cond/batchnorm/sub*0
_output_shapes
:??????????*
T0
?
conv_pw_10_bn/cond/MergeMerge"conv_pw_10_bn/cond/batchnorm/add_1conv_pw_10_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
q
conv_pw_10_relu/ReluReluconv_pw_10_bn/cond/Merge*
T0*0
_output_shapes
:??????????
Z
conv_pw_10_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_10_relu/MinimumMinimumconv_pw_10_relu/Reluconv_pw_10_relu/Const*0
_output_shapes
:??????????*
T0
?
conv_pad_11/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_11/PadPadconv_pw_10_relu/Minimumconv_pad_11/Pad/paddings*
T0*
	Tpaddings0*0
_output_shapes
:??????????
x
conv_dw_11/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_dw_11/random_uniform/minConst*
valueB
 *U??*
dtype0*
_output_shapes
: 
b
conv_dw_11/random_uniform/maxConst*
valueB
 *U?=*
dtype0*
_output_shapes
: 
?
'conv_dw_11/random_uniform/RandomUniformRandomUniformconv_dw_11/random_uniform/shape*
T0*
dtype0*'
_output_shapes
:?*
seed2?*
seed???)
?
conv_dw_11/random_uniform/subSubconv_dw_11/random_uniform/maxconv_dw_11/random_uniform/min*
_output_shapes
: *
T0
?
conv_dw_11/random_uniform/mulMul'conv_dw_11/random_uniform/RandomUniformconv_dw_11/random_uniform/sub*
T0*'
_output_shapes
:?
?
conv_dw_11/random_uniformAddconv_dw_11/random_uniform/mulconv_dw_11/random_uniform/min*'
_output_shapes
:?*
T0
?
conv_dw_11/depthwise_kernel
VariableV2*
shared_name *
dtype0*'
_output_shapes
:?*
	container *
shape:?
?
"conv_dw_11/depthwise_kernel/AssignAssignconv_dw_11/depthwise_kernelconv_dw_11/random_uniform*.
_class$
" loc:@conv_dw_11/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking(*
T0
?
 conv_dw_11/depthwise_kernel/readIdentityconv_dw_11/depthwise_kernel*
T0*.
_class$
" loc:@conv_dw_11/depthwise_kernel*'
_output_shapes
:?
s
conv_dw_11/depthwise/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"            
s
"conv_dw_11/depthwise/dilation_rateConst*
_output_shapes
:*
valueB"      *
dtype0
?
conv_dw_11/depthwiseDepthwiseConv2dNativeconv_pad_11/Pad conv_dw_11/depthwise_kernel/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID*0
_output_shapes
:??????????
b
conv_dw_11_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_11_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_dw_11_bn/gamma/AssignAssignconv_dw_11_bn/gammaconv_dw_11_bn/Const*
use_locking(*
T0*&
_class
loc:@conv_dw_11_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_dw_11_bn/gamma/readIdentityconv_dw_11_bn/gamma*
T0*&
_class
loc:@conv_dw_11_bn/gamma*
_output_shapes	
:?
d
conv_dw_11_bn/Const_1Const*
_output_shapes	
:?*
valueB?*    *
dtype0
?
conv_dw_11_bn/beta
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
conv_dw_11_bn/beta/AssignAssignconv_dw_11_bn/betaconv_dw_11_bn/Const_1*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_11_bn/beta
?
conv_dw_11_bn/beta/readIdentityconv_dw_11_bn/beta*
T0*%
_class
loc:@conv_dw_11_bn/beta*
_output_shapes	
:?
d
conv_dw_11_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_11_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
 conv_dw_11_bn/moving_mean/AssignAssignconv_dw_11_bn/moving_meanconv_dw_11_bn/Const_2*
use_locking(*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_dw_11_bn/moving_mean/readIdentityconv_dw_11_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes	
:?
d
conv_dw_11_bn/Const_3Const*
_output_shapes	
:?*
valueB?*  ??*
dtype0
?
conv_dw_11_bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
$conv_dw_11_bn/moving_variance/AssignAssignconv_dw_11_bn/moving_varianceconv_dw_11_bn/Const_3*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
"conv_dw_11_bn/moving_variance/readIdentityconv_dw_11_bn/moving_variance*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
X
conv_dw_11_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
X
conv_dw_11_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_11_bn/FusedBatchNormFusedBatchNormconv_dw_11/depthwiseconv_dw_11_bn/gamma/readconv_dw_11_bn/beta/readconv_dw_11_bn/Const_4conv_dw_11_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
g
conv_dw_11_bn/ShapeShapeconv_dw_11/depthwise*
T0*
out_type0*
_output_shapes
:
k
!conv_dw_11_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
m
#conv_dw_11_bn/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
m
#conv_dw_11_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_11_bn/strided_sliceStridedSliceconv_dw_11_bn/Shape!conv_dw_11_bn/strided_slice/stack#conv_dw_11_bn/strided_slice/stack_1#conv_dw_11_bn/strided_slice/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask 
i
conv_dw_11_bn/Shape_1Shapeconv_dw_11/depthwise*
T0*
out_type0*
_output_shapes
:
m
#conv_dw_11_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_11_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_11_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_11_bn/strided_slice_1StridedSliceconv_dw_11_bn/Shape_1#conv_dw_11_bn/strided_slice_1/stack%conv_dw_11_bn/strided_slice_1/stack_1%conv_dw_11_bn/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_dw_11_bn/Shape_2Shapeconv_dw_11/depthwise*
T0*
out_type0*
_output_shapes
:
m
#conv_dw_11_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_11_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_11_bn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_dw_11_bn/strided_slice_2StridedSliceconv_dw_11_bn/Shape_2#conv_dw_11_bn/strided_slice_2/stack%conv_dw_11_bn/strided_slice_2/stack_1%conv_dw_11_bn/strided_slice_2/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_dw_11_bn/Rank/packedPackconv_dw_11_bn/strided_sliceconv_dw_11_bn/strided_slice_1conv_dw_11_bn/strided_slice_2*
N*
_output_shapes
:*
T0*

axis 
T
conv_dw_11_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_dw_11_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
[
conv_dw_11_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_11_bn/rangeRangeconv_dw_11_bn/range/startconv_dw_11_bn/Rankconv_dw_11_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_11_bn/Prod/inputPackconv_dw_11_bn/strided_sliceconv_dw_11_bn/strided_slice_1conv_dw_11_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_11_bn/ProdProdconv_dw_11_bn/Prod/inputconv_dw_11_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
n
conv_dw_11_bn/CastCastconv_dw_11_bn/Prod*
Truncate( *
_output_shapes
: *

DstT0*

SrcT0
X
conv_dw_11_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
b
conv_dw_11_bn/subSubconv_dw_11_bn/Castconv_dw_11_bn/sub/y*
_output_shapes
: *
T0
h
conv_dw_11_bn/truedivRealDivconv_dw_11_bn/Castconv_dw_11_bn/sub*
T0*
_output_shapes
: 
u
conv_dw_11_bn/mulMulconv_dw_11_bn/FusedBatchNorm:2conv_dw_11_bn/truediv*
T0*
_output_shapes	
:?
?
#conv_dw_11_bn/AssignMovingAvg/decayConst*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/zerosConst*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
 conv_dw_11_bn/moving_mean/biased
VariableV2*
_output_shapes	
:?*
shared_name *,
_class"
 loc:@conv_dw_11_bn/moving_mean*
	container *
shape:?*
dtype0
?
'conv_dw_11_bn/moving_mean/biased/AssignAssign conv_dw_11_bn/moving_mean/biased=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
%conv_dw_11_bn/moving_mean/biased/readIdentity conv_dw_11_bn/moving_mean/biased*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes	
:?
?
6conv_dw_11_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_dw_11_bn/moving_mean/local_step
VariableV2*
_output_shapes
: *
shared_name *,
_class"
 loc:@conv_dw_11_bn/moving_mean*
	container *
shape: *
dtype0
?
+conv_dw_11_bn/moving_mean/local_step/AssignAssign$conv_dw_11_bn/moving_mean/local_step6conv_dw_11_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
)conv_dw_11_bn/moving_mean/local_step/readIdentity$conv_dw_11_bn/moving_mean/local_step*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes
: 
?
;conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/subSub%conv_dw_11_bn/moving_mean/biased/readconv_dw_11_bn/FusedBatchNorm:1*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes	
:?
?
;conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/mulMul;conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub#conv_dw_11_bn/AssignMovingAvg/decay*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean
?
Qconv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/conv_dw_11_bn/moving_mean	AssignSub conv_dw_11_bn/moving_mean/biased;conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/mul*
use_locking( *
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes	
:?
?
Gconv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *,
_class"
 loc:@conv_dw_11_bn/moving_mean*
valueB
 *  ??*
dtype0
?
Aconv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/AssignAdd	AssignAdd$conv_dw_11_bn/moving_mean/local_stepGconv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean
?
<conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/readIdentity conv_dw_11_bn/moving_mean/biasedB^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/AssignAddR^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/conv_dw_11_bn/moving_mean*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean
?
?conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_1/xConstB^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/AssignAddR^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/conv_dw_11_bn/moving_mean*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_1Sub?conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_1/x#conv_dw_11_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes
: 
?
>conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/read_1Identity$conv_dw_11_bn/moving_mean/local_stepB^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/AssignAddR^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/conv_dw_11_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes
: 
?
;conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/PowPow=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_1>conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/read_1*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes
: 
?
?conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_2/xConstB^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/AssignAddR^conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/conv_dw_11_bn/moving_mean*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_2Sub?conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_2/x;conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/Pow*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes
: 
?
?conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/truedivRealDiv<conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/read=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_2*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes	
:?
?
=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_3Subconv_dw_11_bn/moving_mean/read?conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/truediv*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_11_bn/AssignMovingAvg	AssignSubconv_dw_11_bn/moving_mean=conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/sub_3*
use_locking( *
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
_output_shapes	
:?
?
%conv_dw_11_bn/AssignMovingAvg_1/decayConst*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Cconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/zerosConst*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
$conv_dw_11_bn/moving_variance/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
	container *
shape:?
?
+conv_dw_11_bn/moving_variance/biased/AssignAssign$conv_dw_11_bn/moving_variance/biasedCconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/zeros*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
)conv_dw_11_bn/moving_variance/biased/readIdentity$conv_dw_11_bn/moving_variance/biased*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
_output_shapes	
:?
?
:conv_dw_11_bn/moving_variance/local_step/Initializer/zerosConst*
_output_shapes
: *0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
valueB
 *    *
dtype0
?
(conv_dw_11_bn/moving_variance/local_step
VariableV2*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
/conv_dw_11_bn/moving_variance/local_step/AssignAssign(conv_dw_11_bn/moving_variance/local_step:conv_dw_11_bn/moving_variance/local_step/Initializer/zeros*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(
?
-conv_dw_11_bn/moving_variance/local_step/readIdentity(conv_dw_11_bn/moving_variance/local_step*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
Aconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/subSub)conv_dw_11_bn/moving_variance/biased/readconv_dw_11_bn/mul*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
Aconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/mulMulAconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub%conv_dw_11_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
_output_shapes	
:?
?
[conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/conv_dw_11_bn/moving_variance	AssignSub$conv_dw_11_bn/moving_variance/biasedAconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/mul*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
_output_shapes	
:?*
use_locking( 
?
Mconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/AssignAdd/valueConst*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/AssignAdd	AssignAdd(conv_dw_11_bn/moving_variance/local_stepMconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/readIdentity$conv_dw_11_bn/moving_variance/biasedH^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/AssignAdd\^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/conv_dw_11_bn/moving_variance*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
Econv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_1/xConstH^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/AssignAdd\^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/conv_dw_11_bn/moving_variance*
dtype0*
_output_shapes
: *0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
valueB
 *  ??
?
Cconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_1SubEconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_1/x%conv_dw_11_bn/AssignMovingAvg_1/decay*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
Dconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/read_1Identity(conv_dw_11_bn/moving_variance/local_stepH^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/AssignAdd\^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/conv_dw_11_bn/moving_variance*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
_output_shapes
: *
T0
?
Aconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/PowPowCconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_1Dconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/read_1*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
Econv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_2/xConstH^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/AssignAdd\^conv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/conv_dw_11_bn/moving_variance*
dtype0*
_output_shapes
: *0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
valueB
 *  ??
?
Cconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_2SubEconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_2/xAconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/Pow*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
_output_shapes
: 
?
Econv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/truedivRealDivBconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/readCconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
Cconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_3Sub"conv_dw_11_bn/moving_variance/readEconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
conv_dw_11_bn/AssignMovingAvg_1	AssignSubconv_dw_11_bn/moving_varianceCconv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/sub_3*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
conv_dw_11_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
e
conv_dw_11_bn/cond/switch_tIdentityconv_dw_11_bn/cond/Switch:1*
_output_shapes
: *
T0

c
conv_dw_11_bn/cond/switch_fIdentityconv_dw_11_bn/cond/Switch*
T0
*
_output_shapes
: 
f
conv_dw_11_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_11_bn/cond/Switch_1Switchconv_dw_11_bn/FusedBatchNormconv_dw_11_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_11_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
"conv_dw_11_bn/cond/batchnorm/add/yConst^conv_dw_11_bn/cond/switch_f*
_output_shapes
: *
valueB
 *o?:*
dtype0
?
 conv_dw_11_bn/cond/batchnorm/addAdd'conv_dw_11_bn/cond/batchnorm/add/Switch"conv_dw_11_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
'conv_dw_11_bn/cond/batchnorm/add/SwitchSwitch"conv_dw_11_bn/moving_variance/readconv_dw_11_bn/cond/pred_id*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*"
_output_shapes
:?:?
s
"conv_dw_11_bn/cond/batchnorm/RsqrtRsqrt conv_dw_11_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
 conv_dw_11_bn/cond/batchnorm/mulMul"conv_dw_11_bn/cond/batchnorm/Rsqrt'conv_dw_11_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
'conv_dw_11_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_11_bn/gamma/readconv_dw_11_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_11_bn/gamma*"
_output_shapes
:?:?
?
"conv_dw_11_bn/cond/batchnorm/mul_1Mul)conv_dw_11_bn/cond/batchnorm/mul_1/Switch conv_dw_11_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
)conv_dw_11_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_11/depthwiseconv_dw_11_bn/cond/pred_id*
T0*'
_class
loc:@conv_dw_11/depthwise*L
_output_shapes:
8:??????????:??????????
?
"conv_dw_11_bn/cond/batchnorm/mul_2Mul)conv_dw_11_bn/cond/batchnorm/mul_2/Switch conv_dw_11_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
)conv_dw_11_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_11_bn/moving_mean/readconv_dw_11_bn/cond/pred_id*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*"
_output_shapes
:?:?
?
 conv_dw_11_bn/cond/batchnorm/subSub'conv_dw_11_bn/cond/batchnorm/sub/Switch"conv_dw_11_bn/cond/batchnorm/mul_2*
_output_shapes	
:?*
T0
?
'conv_dw_11_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_11_bn/beta/readconv_dw_11_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_11_bn/beta*"
_output_shapes
:?:?
?
"conv_dw_11_bn/cond/batchnorm/add_1Add"conv_dw_11_bn/cond/batchnorm/mul_1 conv_dw_11_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_dw_11_bn/cond/MergeMerge"conv_dw_11_bn/cond/batchnorm/add_1conv_dw_11_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
q
conv_dw_11_relu/ReluReluconv_dw_11_bn/cond/Merge*
T0*0
_output_shapes
:??????????
Z
conv_dw_11_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_11_relu/MinimumMinimumconv_dw_11_relu/Reluconv_dw_11_relu/Const*
T0*0
_output_shapes
:??????????
x
conv_pw_11/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_pw_11/random_uniform/minConst*
valueB
 *qĜ?*
dtype0*
_output_shapes
: 
b
conv_pw_11/random_uniform/maxConst*
valueB
 *qĜ=*
dtype0*
_output_shapes
: 
?
'conv_pw_11/random_uniform/RandomUniformRandomUniformconv_pw_11/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2???*
seed???)
?
conv_pw_11/random_uniform/subSubconv_pw_11/random_uniform/maxconv_pw_11/random_uniform/min*
T0*
_output_shapes
: 
?
conv_pw_11/random_uniform/mulMul'conv_pw_11/random_uniform/RandomUniformconv_pw_11/random_uniform/sub*(
_output_shapes
:??*
T0
?
conv_pw_11/random_uniformAddconv_pw_11/random_uniform/mulconv_pw_11/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_11/kernel
VariableV2*
shared_name *
dtype0*(
_output_shapes
:??*
	container *
shape:??
?
conv_pw_11/kernel/AssignAssignconv_pw_11/kernelconv_pw_11/random_uniform*
use_locking(*
T0*$
_class
loc:@conv_pw_11/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_11/kernel/readIdentityconv_pw_11/kernel*(
_output_shapes
:??*
T0*$
_class
loc:@conv_pw_11/kernel
u
$conv_pw_11/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_11/convolutionConv2Dconv_dw_11_relu/Minimumconv_pw_11/kernel/read*
use_cudnn_on_gpu(*
paddingSAME*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides

b
conv_pw_11_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_11_bn/gamma
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_pw_11_bn/gamma/AssignAssignconv_pw_11_bn/gammaconv_pw_11_bn/Const*&
_class
loc:@conv_pw_11_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_pw_11_bn/gamma/readIdentityconv_pw_11_bn/gamma*
T0*&
_class
loc:@conv_pw_11_bn/gamma*
_output_shapes	
:?
d
conv_pw_11_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_11_bn/beta
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_11_bn/beta/AssignAssignconv_pw_11_bn/betaconv_pw_11_bn/Const_1*%
_class
loc:@conv_pw_11_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_pw_11_bn/beta/readIdentityconv_pw_11_bn/beta*%
_class
loc:@conv_pw_11_bn/beta*
_output_shapes	
:?*
T0
d
conv_pw_11_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_11_bn/moving_mean
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
 conv_pw_11_bn/moving_mean/AssignAssignconv_pw_11_bn/moving_meanconv_pw_11_bn/Const_2*
use_locking(*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_pw_11_bn/moving_mean/readIdentityconv_pw_11_bn/moving_mean*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes	
:?
d
conv_pw_11_bn/Const_3Const*
_output_shapes	
:?*
valueB?*  ??*
dtype0
?
conv_pw_11_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
$conv_pw_11_bn/moving_variance/AssignAssignconv_pw_11_bn/moving_varianceconv_pw_11_bn/Const_3*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
"conv_pw_11_bn/moving_variance/readIdentityconv_pw_11_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes	
:?
X
conv_pw_11_bn/Const_4Const*
dtype0*
_output_shapes
: *
valueB 
X
conv_pw_11_bn/Const_5Const*
_output_shapes
: *
valueB *
dtype0
?
conv_pw_11_bn/FusedBatchNormFusedBatchNormconv_pw_11/convolutionconv_pw_11_bn/gamma/readconv_pw_11_bn/beta/readconv_pw_11_bn/Const_4conv_pw_11_bn/Const_5*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0
i
conv_pw_11_bn/ShapeShapeconv_pw_11/convolution*
T0*
out_type0*
_output_shapes
:
k
!conv_pw_11_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
m
#conv_pw_11_bn/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
m
#conv_pw_11_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_11_bn/strided_sliceStridedSliceconv_pw_11_bn/Shape!conv_pw_11_bn/strided_slice/stack#conv_pw_11_bn/strided_slice/stack_1#conv_pw_11_bn/strided_slice/stack_2*
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
k
conv_pw_11_bn/Shape_1Shapeconv_pw_11/convolution*
T0*
out_type0*
_output_shapes
:
m
#conv_pw_11_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_11_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_11_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_11_bn/strided_slice_1StridedSliceconv_pw_11_bn/Shape_1#conv_pw_11_bn/strided_slice_1/stack%conv_pw_11_bn/strided_slice_1/stack_1%conv_pw_11_bn/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
k
conv_pw_11_bn/Shape_2Shapeconv_pw_11/convolution*
out_type0*
_output_shapes
:*
T0
m
#conv_pw_11_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_11_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_11_bn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_11_bn/strided_slice_2StridedSliceconv_pw_11_bn/Shape_2#conv_pw_11_bn/strided_slice_2/stack%conv_pw_11_bn/strided_slice_2/stack_1%conv_pw_11_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
?
conv_pw_11_bn/Rank/packedPackconv_pw_11_bn/strided_sliceconv_pw_11_bn/strided_slice_1conv_pw_11_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
T
conv_pw_11_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_pw_11_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
[
conv_pw_11_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_11_bn/rangeRangeconv_pw_11_bn/range/startconv_pw_11_bn/Rankconv_pw_11_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_pw_11_bn/Prod/inputPackconv_pw_11_bn/strided_sliceconv_pw_11_bn/strided_slice_1conv_pw_11_bn/strided_slice_2*

axis *
N*
_output_shapes
:*
T0
?
conv_pw_11_bn/ProdProdconv_pw_11_bn/Prod/inputconv_pw_11_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
n
conv_pw_11_bn/CastCastconv_pw_11_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
X
conv_pw_11_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
b
conv_pw_11_bn/subSubconv_pw_11_bn/Castconv_pw_11_bn/sub/y*
T0*
_output_shapes
: 
h
conv_pw_11_bn/truedivRealDivconv_pw_11_bn/Castconv_pw_11_bn/sub*
T0*
_output_shapes
: 
u
conv_pw_11_bn/mulMulconv_pw_11_bn/FusedBatchNorm:2conv_pw_11_bn/truediv*
T0*
_output_shapes	
:?
?
#conv_pw_11_bn/AssignMovingAvg/decayConst*
dtype0*
_output_shapes
: *,
_class"
 loc:@conv_pw_11_bn/moving_mean*
valueB
 *
?#<
?
=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/zerosConst*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
 conv_pw_11_bn/moving_mean/biased
VariableV2*
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *,
_class"
 loc:@conv_pw_11_bn/moving_mean*
	container 
?
'conv_pw_11_bn/moving_mean/biased/AssignAssign conv_pw_11_bn/moving_mean/biased=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
%conv_pw_11_bn/moving_mean/biased/readIdentity conv_pw_11_bn/moving_mean/biased*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes	
:?*
T0
?
6conv_pw_11_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_pw_11_bn/moving_mean/local_step
VariableV2*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
+conv_pw_11_bn/moving_mean/local_step/AssignAssign$conv_pw_11_bn/moving_mean/local_step6conv_pw_11_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
)conv_pw_11_bn/moving_mean/local_step/readIdentity$conv_pw_11_bn/moving_mean/local_step*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes
: 
?
;conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/subSub%conv_pw_11_bn/moving_mean/biased/readconv_pw_11_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean
?
;conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/mulMul;conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub#conv_pw_11_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes	
:?
?
Qconv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/conv_pw_11_bn/moving_mean	AssignSub conv_pw_11_bn/moving_mean/biased;conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/mul*
use_locking( *
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes	
:?
?
Gconv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *,
_class"
 loc:@conv_pw_11_bn/moving_mean*
valueB
 *  ??*
dtype0
?
Aconv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/AssignAdd	AssignAdd$conv_pw_11_bn/moving_mean/local_stepGconv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/AssignAdd/value*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes
: *
use_locking( 
?
<conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/readIdentity conv_pw_11_bn/moving_mean/biasedB^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/AssignAddR^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/conv_pw_11_bn/moving_mean*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes	
:?
?
?conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_1/xConstB^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/AssignAddR^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/conv_pw_11_bn/moving_mean*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_1Sub?conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_1/x#conv_pw_11_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes
: 
?
>conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/read_1Identity$conv_pw_11_bn/moving_mean/local_stepB^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/AssignAddR^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/conv_pw_11_bn/moving_mean*
_output_shapes
: *
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean
?
;conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/PowPow=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_1>conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/read_1*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes
: 
?
?conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_2/xConstB^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/AssignAddR^conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/conv_pw_11_bn/moving_mean*
_output_shapes
: *,
_class"
 loc:@conv_pw_11_bn/moving_mean*
valueB
 *  ??*
dtype0
?
=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_2Sub?conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_2/x;conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/Pow*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes
: 
?
?conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/truedivRealDiv<conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/read=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_2*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes	
:?
?
=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_3Subconv_pw_11_bn/moving_mean/read?conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/truediv*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
_output_shapes	
:?*
T0
?
conv_pw_11_bn/AssignMovingAvg	AssignSubconv_pw_11_bn/moving_mean=conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/sub_3*
_output_shapes	
:?*
use_locking( *
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean
?
%conv_pw_11_bn/AssignMovingAvg_1/decayConst*
_output_shapes
: *0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
valueB
 *
?#<*
dtype0
?
Cconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/zerosConst*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
valueB?*    *
dtype0*
_output_shapes	
:?
?
$conv_pw_11_bn/moving_variance/biased
VariableV2*
_output_shapes	
:?*
shared_name *0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
	container *
shape:?*
dtype0
?
+conv_pw_11_bn/moving_variance/biased/AssignAssign$conv_pw_11_bn/moving_variance/biasedCconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/zeros*
_output_shapes	
:?*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
validate_shape(
?
)conv_pw_11_bn/moving_variance/biased/readIdentity$conv_pw_11_bn/moving_variance/biased*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance
?
:conv_pw_11_bn/moving_variance/local_step/Initializer/zerosConst*
_output_shapes
: *0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
valueB
 *    *
dtype0
?
(conv_pw_11_bn/moving_variance/local_step
VariableV2*
shared_name *0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
/conv_pw_11_bn/moving_variance/local_step/AssignAssign(conv_pw_11_bn/moving_variance/local_step:conv_pw_11_bn/moving_variance/local_step/Initializer/zeros*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
-conv_pw_11_bn/moving_variance/local_step/readIdentity(conv_pw_11_bn/moving_variance/local_step*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes
: 
?
Aconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/subSub)conv_pw_11_bn/moving_variance/biased/readconv_pw_11_bn/mul*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/mulMulAconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub%conv_pw_11_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes	
:?
?
[conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/conv_pw_11_bn/moving_variance	AssignSub$conv_pw_11_bn/moving_variance/biasedAconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/mul*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes	
:?
?
Mconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/AssignAdd/valueConst*
_output_shapes
: *0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
valueB
 *  ??*
dtype0
?
Gconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/AssignAdd	AssignAdd(conv_pw_11_bn/moving_variance/local_stepMconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/readIdentity$conv_pw_11_bn/moving_variance/biasedH^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/AssignAdd\^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/conv_pw_11_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes	
:?
?
Econv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_1/xConstH^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/AssignAdd\^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/conv_pw_11_bn/moving_variance*
_output_shapes
: *0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
valueB
 *  ??*
dtype0
?
Cconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_1SubEconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_1/x%conv_pw_11_bn/AssignMovingAvg_1/decay*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance
?
Dconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/read_1Identity(conv_pw_11_bn/moving_variance/local_stepH^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/AssignAdd\^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/conv_pw_11_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes
: 
?
Aconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/PowPowCconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_1Dconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/read_1*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance
?
Econv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_2/xConstH^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/AssignAdd\^conv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/conv_pw_11_bn/moving_variance*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_2SubEconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_2/xAconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/Pow*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes
: 
?
Econv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/truedivRealDivBconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/readCconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance
?
Cconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_3Sub"conv_pw_11_bn/moving_variance/readEconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance
?
conv_pw_11_bn/AssignMovingAvg_1	AssignSubconv_pw_11_bn/moving_varianceCconv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/sub_3*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_11_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
e
conv_pw_11_bn/cond/switch_tIdentityconv_pw_11_bn/cond/Switch:1*
T0
*
_output_shapes
: 
c
conv_pw_11_bn/cond/switch_fIdentityconv_pw_11_bn/cond/Switch*
T0
*
_output_shapes
: 
f
conv_pw_11_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_11_bn/cond/Switch_1Switchconv_pw_11_bn/FusedBatchNormconv_pw_11_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*/
_class%
#!loc:@conv_pw_11_bn/FusedBatchNorm
?
"conv_pw_11_bn/cond/batchnorm/add/yConst^conv_pw_11_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
 conv_pw_11_bn/cond/batchnorm/addAdd'conv_pw_11_bn/cond/batchnorm/add/Switch"conv_pw_11_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
'conv_pw_11_bn/cond/batchnorm/add/SwitchSwitch"conv_pw_11_bn/moving_variance/readconv_pw_11_bn/cond/pred_id*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*"
_output_shapes
:?:?
s
"conv_pw_11_bn/cond/batchnorm/RsqrtRsqrt conv_pw_11_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
 conv_pw_11_bn/cond/batchnorm/mulMul"conv_pw_11_bn/cond/batchnorm/Rsqrt'conv_pw_11_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
'conv_pw_11_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_11_bn/gamma/readconv_pw_11_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*&
_class
loc:@conv_pw_11_bn/gamma
?
"conv_pw_11_bn/cond/batchnorm/mul_1Mul)conv_pw_11_bn/cond/batchnorm/mul_1/Switch conv_pw_11_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
)conv_pw_11_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_11/convolutionconv_pw_11_bn/cond/pred_id*
T0*)
_class
loc:@conv_pw_11/convolution*L
_output_shapes:
8:??????????:??????????
?
"conv_pw_11_bn/cond/batchnorm/mul_2Mul)conv_pw_11_bn/cond/batchnorm/mul_2/Switch conv_pw_11_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
)conv_pw_11_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_11_bn/moving_mean/readconv_pw_11_bn/cond/pred_id*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*"
_output_shapes
:?:?
?
 conv_pw_11_bn/cond/batchnorm/subSub'conv_pw_11_bn/cond/batchnorm/sub/Switch"conv_pw_11_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
'conv_pw_11_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_11_bn/beta/readconv_pw_11_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*%
_class
loc:@conv_pw_11_bn/beta
?
"conv_pw_11_bn/cond/batchnorm/add_1Add"conv_pw_11_bn/cond/batchnorm/mul_1 conv_pw_11_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_pw_11_bn/cond/MergeMerge"conv_pw_11_bn/cond/batchnorm/add_1conv_pw_11_bn/cond/Switch_1:1*
N*2
_output_shapes 
:??????????: *
T0
q
conv_pw_11_relu/ReluReluconv_pw_11_bn/cond/Merge*
T0*0
_output_shapes
:??????????
Z
conv_pw_11_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_11_relu/MinimumMinimumconv_pw_11_relu/Reluconv_pw_11_relu/Const*
T0*0
_output_shapes
:??????????
?
conv_pad_12/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_12/PadPadconv_pw_11_relu/Minimumconv_pad_12/Pad/paddings*0
_output_shapes
:??????????*
T0*
	Tpaddings0
x
conv_dw_12/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_dw_12/random_uniform/minConst*
valueB
 *U??*
dtype0*
_output_shapes
: 
b
conv_dw_12/random_uniform/maxConst*
valueB
 *U?=*
dtype0*
_output_shapes
: 
?
'conv_dw_12/random_uniform/RandomUniformRandomUniformconv_dw_12/random_uniform/shape*
T0*
dtype0*'
_output_shapes
:?*
seed2???*
seed???)
?
conv_dw_12/random_uniform/subSubconv_dw_12/random_uniform/maxconv_dw_12/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_12/random_uniform/mulMul'conv_dw_12/random_uniform/RandomUniformconv_dw_12/random_uniform/sub*'
_output_shapes
:?*
T0
?
conv_dw_12/random_uniformAddconv_dw_12/random_uniform/mulconv_dw_12/random_uniform/min*
T0*'
_output_shapes
:?
?
conv_dw_12/depthwise_kernel
VariableV2*
dtype0*'
_output_shapes
:?*
	container *
shape:?*
shared_name 
?
"conv_dw_12/depthwise_kernel/AssignAssignconv_dw_12/depthwise_kernelconv_dw_12/random_uniform*
use_locking(*
T0*.
_class$
" loc:@conv_dw_12/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
 conv_dw_12/depthwise_kernel/readIdentityconv_dw_12/depthwise_kernel*'
_output_shapes
:?*
T0*.
_class$
" loc:@conv_dw_12/depthwise_kernel
s
conv_dw_12/depthwise/ShapeConst*%
valueB"            *
dtype0*
_output_shapes
:
s
"conv_dw_12/depthwise/dilation_rateConst*
_output_shapes
:*
valueB"      *
dtype0
?
conv_dw_12/depthwiseDepthwiseConv2dNativeconv_pad_12/Pad conv_dw_12/depthwise_kernel/read*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides
*
paddingVALID
b
conv_dw_12_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_12_bn/gamma
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_12_bn/gamma/AssignAssignconv_dw_12_bn/gammaconv_dw_12_bn/Const*
_output_shapes	
:?*
use_locking(*
T0*&
_class
loc:@conv_dw_12_bn/gamma*
validate_shape(
?
conv_dw_12_bn/gamma/readIdentityconv_dw_12_bn/gamma*
_output_shapes	
:?*
T0*&
_class
loc:@conv_dw_12_bn/gamma
d
conv_dw_12_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_12_bn/beta
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_dw_12_bn/beta/AssignAssignconv_dw_12_bn/betaconv_dw_12_bn/Const_1*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_12_bn/beta
?
conv_dw_12_bn/beta/readIdentityconv_dw_12_bn/beta*
_output_shapes	
:?*
T0*%
_class
loc:@conv_dw_12_bn/beta
d
conv_dw_12_bn/Const_2Const*
_output_shapes	
:?*
valueB?*    *
dtype0
?
conv_dw_12_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
 conv_dw_12_bn/moving_mean/AssignAssignconv_dw_12_bn/moving_meanconv_dw_12_bn/Const_2*
use_locking(*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_dw_12_bn/moving_mean/readIdentityconv_dw_12_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes	
:?
d
conv_dw_12_bn/Const_3Const*
dtype0*
_output_shapes	
:?*
valueB?*  ??
?
conv_dw_12_bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
$conv_dw_12_bn/moving_variance/AssignAssignconv_dw_12_bn/moving_varianceconv_dw_12_bn/Const_3*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
"conv_dw_12_bn/moving_variance/readIdentityconv_dw_12_bn/moving_variance*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes	
:?
X
conv_dw_12_bn/Const_4Const*
dtype0*
_output_shapes
: *
valueB 
X
conv_dw_12_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_12_bn/FusedBatchNormFusedBatchNormconv_dw_12/depthwiseconv_dw_12_bn/gamma/readconv_dw_12_bn/beta/readconv_dw_12_bn/Const_4conv_dw_12_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
g
conv_dw_12_bn/ShapeShapeconv_dw_12/depthwise*
_output_shapes
:*
T0*
out_type0
k
!conv_dw_12_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
m
#conv_dw_12_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
m
#conv_dw_12_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_12_bn/strided_sliceStridedSliceconv_dw_12_bn/Shape!conv_dw_12_bn/strided_slice/stack#conv_dw_12_bn/strided_slice/stack_1#conv_dw_12_bn/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
i
conv_dw_12_bn/Shape_1Shapeconv_dw_12/depthwise*
T0*
out_type0*
_output_shapes
:
m
#conv_dw_12_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_12_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_12_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_12_bn/strided_slice_1StridedSliceconv_dw_12_bn/Shape_1#conv_dw_12_bn/strided_slice_1/stack%conv_dw_12_bn/strided_slice_1/stack_1%conv_dw_12_bn/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_dw_12_bn/Shape_2Shapeconv_dw_12/depthwise*
out_type0*
_output_shapes
:*
T0
m
#conv_dw_12_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_12_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_12_bn/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_dw_12_bn/strided_slice_2StridedSliceconv_dw_12_bn/Shape_2#conv_dw_12_bn/strided_slice_2/stack%conv_dw_12_bn/strided_slice_2/stack_1%conv_dw_12_bn/strided_slice_2/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
?
conv_dw_12_bn/Rank/packedPackconv_dw_12_bn/strided_sliceconv_dw_12_bn/strided_slice_1conv_dw_12_bn/strided_slice_2*

axis *
N*
_output_shapes
:*
T0
T
conv_dw_12_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_dw_12_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
[
conv_dw_12_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_12_bn/rangeRangeconv_dw_12_bn/range/startconv_dw_12_bn/Rankconv_dw_12_bn/range/delta*
_output_shapes
:*

Tidx0
?
conv_dw_12_bn/Prod/inputPackconv_dw_12_bn/strided_sliceconv_dw_12_bn/strided_slice_1conv_dw_12_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_dw_12_bn/ProdProdconv_dw_12_bn/Prod/inputconv_dw_12_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
n
conv_dw_12_bn/CastCastconv_dw_12_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
X
conv_dw_12_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
b
conv_dw_12_bn/subSubconv_dw_12_bn/Castconv_dw_12_bn/sub/y*
T0*
_output_shapes
: 
h
conv_dw_12_bn/truedivRealDivconv_dw_12_bn/Castconv_dw_12_bn/sub*
_output_shapes
: *
T0
u
conv_dw_12_bn/mulMulconv_dw_12_bn/FusedBatchNorm:2conv_dw_12_bn/truediv*
_output_shapes	
:?*
T0
?
#conv_dw_12_bn/AssignMovingAvg/decayConst*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/zerosConst*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
valueB?*    *
dtype0*
_output_shapes	
:?
?
 conv_dw_12_bn/moving_mean/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *,
_class"
 loc:@conv_dw_12_bn/moving_mean*
	container *
shape:?
?
'conv_dw_12_bn/moving_mean/biased/AssignAssign conv_dw_12_bn/moving_mean/biased=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
%conv_dw_12_bn/moving_mean/biased/readIdentity conv_dw_12_bn/moving_mean/biased*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean
?
6conv_dw_12_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_dw_12_bn/moving_mean/local_step
VariableV2*
shared_name *,
_class"
 loc:@conv_dw_12_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
+conv_dw_12_bn/moving_mean/local_step/AssignAssign$conv_dw_12_bn/moving_mean/local_step6conv_dw_12_bn/moving_mean/local_step/Initializer/zeros*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
)conv_dw_12_bn/moving_mean/local_step/readIdentity$conv_dw_12_bn/moving_mean/local_step*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes
: 
?
;conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/subSub%conv_dw_12_bn/moving_mean/biased/readconv_dw_12_bn/FusedBatchNorm:1*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes	
:?
?
;conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/mulMul;conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub#conv_dw_12_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes	
:?
?
Qconv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/conv_dw_12_bn/moving_mean	AssignSub conv_dw_12_bn/moving_mean/biased;conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/mul*
use_locking( *
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes	
:?
?
Gconv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/AssignAdd/valueConst*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Aconv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/AssignAdd	AssignAdd$conv_dw_12_bn/moving_mean/local_stepGconv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/AssignAdd/value*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes
: *
use_locking( 
?
<conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/readIdentity conv_dw_12_bn/moving_mean/biasedB^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/AssignAddR^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/conv_dw_12_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes	
:?
?
?conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_1/xConstB^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/AssignAddR^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/conv_dw_12_bn/moving_mean*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_1Sub?conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_1/x#conv_dw_12_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes
: 
?
>conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/read_1Identity$conv_dw_12_bn/moving_mean/local_stepB^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/AssignAddR^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/conv_dw_12_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes
: 
?
;conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/PowPow=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_1>conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/read_1*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes
: 
?
?conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_2/xConstB^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/AssignAddR^conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/conv_dw_12_bn/moving_mean*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_2Sub?conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_2/x;conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/Pow*
_output_shapes
: *
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean
?
?conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/truedivRealDiv<conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/read=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean
?
=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_3Subconv_dw_12_bn/moving_mean/read?conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/truediv*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_12_bn/AssignMovingAvg	AssignSubconv_dw_12_bn/moving_mean=conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/sub_3*
use_locking( *
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
_output_shapes	
:?
?
%conv_dw_12_bn/AssignMovingAvg_1/decayConst*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Cconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/zerosConst*
_output_shapes	
:?*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
valueB?*    *
dtype0
?
$conv_dw_12_bn/moving_variance/biased
VariableV2*
shared_name *0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
+conv_dw_12_bn/moving_variance/biased/AssignAssign$conv_dw_12_bn/moving_variance/biasedCconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/zeros*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
)conv_dw_12_bn/moving_variance/biased/readIdentity$conv_dw_12_bn/moving_variance/biased*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes	
:?*
T0
?
:conv_dw_12_bn/moving_variance/local_step/Initializer/zerosConst*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
(conv_dw_12_bn/moving_variance/local_step
VariableV2*
shared_name *0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
/conv_dw_12_bn/moving_variance/local_step/AssignAssign(conv_dw_12_bn/moving_variance/local_step:conv_dw_12_bn/moving_variance/local_step/Initializer/zeros*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
-conv_dw_12_bn/moving_variance/local_step/readIdentity(conv_dw_12_bn/moving_variance/local_step*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes
: 
?
Aconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/subSub)conv_dw_12_bn/moving_variance/biased/readconv_dw_12_bn/mul*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes	
:?
?
Aconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/mulMulAconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub%conv_dw_12_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes	
:?
?
[conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/conv_dw_12_bn/moving_variance	AssignSub$conv_dw_12_bn/moving_variance/biasedAconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/mul*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
Mconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/AssignAdd/valueConst*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/AssignAdd	AssignAdd(conv_dw_12_bn/moving_variance/local_stepMconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance
?
Bconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/readIdentity$conv_dw_12_bn/moving_variance/biasedH^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/AssignAdd\^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/conv_dw_12_bn/moving_variance*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance
?
Econv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_1/xConstH^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/AssignAdd\^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/conv_dw_12_bn/moving_variance*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_1SubEconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_1/x%conv_dw_12_bn/AssignMovingAvg_1/decay*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes
: *
T0
?
Dconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/read_1Identity(conv_dw_12_bn/moving_variance/local_stepH^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/AssignAdd\^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/conv_dw_12_bn/moving_variance*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes
: 
?
Aconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/PowPowCconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_1Dconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/read_1*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes
: 
?
Econv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_2/xConstH^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/AssignAdd\^conv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/conv_dw_12_bn/moving_variance*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_2SubEconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_2/xAconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/Pow*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes
: 
?
Econv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/truedivRealDivBconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/readCconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_2*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance
?
Cconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_3Sub"conv_dw_12_bn/moving_variance/readEconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/truediv*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes	
:?
?
conv_dw_12_bn/AssignMovingAvg_1	AssignSubconv_dw_12_bn/moving_varianceCconv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/sub_3*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
_output_shapes	
:?*
use_locking( *
T0
?
conv_dw_12_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: : 
e
conv_dw_12_bn/cond/switch_tIdentityconv_dw_12_bn/cond/Switch:1*
_output_shapes
: *
T0

c
conv_dw_12_bn/cond/switch_fIdentityconv_dw_12_bn/cond/Switch*
T0
*
_output_shapes
: 
f
conv_dw_12_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
_output_shapes
: *
T0

?
conv_dw_12_bn/cond/Switch_1Switchconv_dw_12_bn/FusedBatchNormconv_dw_12_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*/
_class%
#!loc:@conv_dw_12_bn/FusedBatchNorm
?
"conv_dw_12_bn/cond/batchnorm/add/yConst^conv_dw_12_bn/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *o?:
?
 conv_dw_12_bn/cond/batchnorm/addAdd'conv_dw_12_bn/cond/batchnorm/add/Switch"conv_dw_12_bn/cond/batchnorm/add/y*
_output_shapes	
:?*
T0
?
'conv_dw_12_bn/cond/batchnorm/add/SwitchSwitch"conv_dw_12_bn/moving_variance/readconv_dw_12_bn/cond/pred_id*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*"
_output_shapes
:?:?
s
"conv_dw_12_bn/cond/batchnorm/RsqrtRsqrt conv_dw_12_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
 conv_dw_12_bn/cond/batchnorm/mulMul"conv_dw_12_bn/cond/batchnorm/Rsqrt'conv_dw_12_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
'conv_dw_12_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_12_bn/gamma/readconv_dw_12_bn/cond/pred_id*
T0*&
_class
loc:@conv_dw_12_bn/gamma*"
_output_shapes
:?:?
?
"conv_dw_12_bn/cond/batchnorm/mul_1Mul)conv_dw_12_bn/cond/batchnorm/mul_1/Switch conv_dw_12_bn/cond/batchnorm/mul*0
_output_shapes
:??????????*
T0
?
)conv_dw_12_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_12/depthwiseconv_dw_12_bn/cond/pred_id*'
_class
loc:@conv_dw_12/depthwise*L
_output_shapes:
8:??????????:??????????*
T0
?
"conv_dw_12_bn/cond/batchnorm/mul_2Mul)conv_dw_12_bn/cond/batchnorm/mul_2/Switch conv_dw_12_bn/cond/batchnorm/mul*
_output_shapes	
:?*
T0
?
)conv_dw_12_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_12_bn/moving_mean/readconv_dw_12_bn/cond/pred_id*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*"
_output_shapes
:?:?
?
 conv_dw_12_bn/cond/batchnorm/subSub'conv_dw_12_bn/cond/batchnorm/sub/Switch"conv_dw_12_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
'conv_dw_12_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_12_bn/beta/readconv_dw_12_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*%
_class
loc:@conv_dw_12_bn/beta
?
"conv_dw_12_bn/cond/batchnorm/add_1Add"conv_dw_12_bn/cond/batchnorm/mul_1 conv_dw_12_bn/cond/batchnorm/sub*0
_output_shapes
:??????????*
T0
?
conv_dw_12_bn/cond/MergeMerge"conv_dw_12_bn/cond/batchnorm/add_1conv_dw_12_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
q
conv_dw_12_relu/ReluReluconv_dw_12_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Z
conv_dw_12_relu/ConstConst*
_output_shapes
: *
valueB
 *  ?@*
dtype0
?
conv_dw_12_relu/MinimumMinimumconv_dw_12_relu/Reluconv_dw_12_relu/Const*0
_output_shapes
:??????????*
T0
x
conv_pw_12/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_pw_12/random_uniform/minConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
b
conv_pw_12/random_uniform/maxConst*
valueB
 *  ?=*
dtype0*
_output_shapes
: 
?
'conv_pw_12/random_uniform/RandomUniformRandomUniformconv_pw_12/random_uniform/shape*
dtype0*(
_output_shapes
:??*
seed2?ɽ*
seed???)*
T0
?
conv_pw_12/random_uniform/subSubconv_pw_12/random_uniform/maxconv_pw_12/random_uniform/min*
_output_shapes
: *
T0
?
conv_pw_12/random_uniform/mulMul'conv_pw_12/random_uniform/RandomUniformconv_pw_12/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_12/random_uniformAddconv_pw_12/random_uniform/mulconv_pw_12/random_uniform/min*
T0*(
_output_shapes
:??
?
conv_pw_12/kernel
VariableV2*
dtype0*(
_output_shapes
:??*
	container *
shape:??*
shared_name 
?
conv_pw_12/kernel/AssignAssignconv_pw_12/kernelconv_pw_12/random_uniform*
use_locking(*
T0*$
_class
loc:@conv_pw_12/kernel*
validate_shape(*(
_output_shapes
:??
?
conv_pw_12/kernel/readIdentityconv_pw_12/kernel*
T0*$
_class
loc:@conv_pw_12/kernel*(
_output_shapes
:??
u
$conv_pw_12/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_12/convolutionConv2Dconv_dw_12_relu/Minimumconv_pw_12/kernel/read*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME*0
_output_shapes
:??????????
b
conv_pw_12_bn/ConstConst*
dtype0*
_output_shapes	
:?*
valueB?*  ??
?
conv_pw_12_bn/gamma
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_pw_12_bn/gamma/AssignAssignconv_pw_12_bn/gammaconv_pw_12_bn/Const*&
_class
loc:@conv_pw_12_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_pw_12_bn/gamma/readIdentityconv_pw_12_bn/gamma*
T0*&
_class
loc:@conv_pw_12_bn/gamma*
_output_shapes	
:?
d
conv_pw_12_bn/Const_1Const*
_output_shapes	
:?*
valueB?*    *
dtype0
?
conv_pw_12_bn/beta
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_pw_12_bn/beta/AssignAssignconv_pw_12_bn/betaconv_pw_12_bn/Const_1*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_pw_12_bn/beta
?
conv_pw_12_bn/beta/readIdentityconv_pw_12_bn/beta*
T0*%
_class
loc:@conv_pw_12_bn/beta*
_output_shapes	
:?
d
conv_pw_12_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_12_bn/moving_mean
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
 conv_pw_12_bn/moving_mean/AssignAssignconv_pw_12_bn/moving_meanconv_pw_12_bn/Const_2*
use_locking(*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_pw_12_bn/moving_mean/readIdentityconv_pw_12_bn/moving_mean*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes	
:?
d
conv_pw_12_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_12_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
$conv_pw_12_bn/moving_variance/AssignAssignconv_pw_12_bn/moving_varianceconv_pw_12_bn/Const_3*
_output_shapes	
:?*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
validate_shape(
?
"conv_pw_12_bn/moving_variance/readIdentityconv_pw_12_bn/moving_variance*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes	
:?*
T0
X
conv_pw_12_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
X
conv_pw_12_bn/Const_5Const*
dtype0*
_output_shapes
: *
valueB 
?
conv_pw_12_bn/FusedBatchNormFusedBatchNormconv_pw_12/convolutionconv_pw_12_bn/gamma/readconv_pw_12_bn/beta/readconv_pw_12_bn/Const_4conv_pw_12_bn/Const_5*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:
i
conv_pw_12_bn/ShapeShapeconv_pw_12/convolution*
T0*
out_type0*
_output_shapes
:
k
!conv_pw_12_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
m
#conv_pw_12_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
m
#conv_pw_12_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_12_bn/strided_sliceStridedSliceconv_pw_12_bn/Shape!conv_pw_12_bn/strided_slice/stack#conv_pw_12_bn/strided_slice/stack_1#conv_pw_12_bn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
k
conv_pw_12_bn/Shape_1Shapeconv_pw_12/convolution*
T0*
out_type0*
_output_shapes
:
m
#conv_pw_12_bn/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
o
%conv_pw_12_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_12_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_12_bn/strided_slice_1StridedSliceconv_pw_12_bn/Shape_1#conv_pw_12_bn/strided_slice_1/stack%conv_pw_12_bn/strided_slice_1/stack_1%conv_pw_12_bn/strided_slice_1/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
k
conv_pw_12_bn/Shape_2Shapeconv_pw_12/convolution*
T0*
out_type0*
_output_shapes
:
m
#conv_pw_12_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_12_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_12_bn/strided_slice_2/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_pw_12_bn/strided_slice_2StridedSliceconv_pw_12_bn/Shape_2#conv_pw_12_bn/strided_slice_2/stack%conv_pw_12_bn/strided_slice_2/stack_1%conv_pw_12_bn/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_pw_12_bn/Rank/packedPackconv_pw_12_bn/strided_sliceconv_pw_12_bn/strided_slice_1conv_pw_12_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
T
conv_pw_12_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_pw_12_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
[
conv_pw_12_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_12_bn/rangeRangeconv_pw_12_bn/range/startconv_pw_12_bn/Rankconv_pw_12_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_pw_12_bn/Prod/inputPackconv_pw_12_bn/strided_sliceconv_pw_12_bn/strided_slice_1conv_pw_12_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_12_bn/ProdProdconv_pw_12_bn/Prod/inputconv_pw_12_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
n
conv_pw_12_bn/CastCastconv_pw_12_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
X
conv_pw_12_bn/sub/yConst*
dtype0*
_output_shapes
: *
valueB
 *? ??
b
conv_pw_12_bn/subSubconv_pw_12_bn/Castconv_pw_12_bn/sub/y*
T0*
_output_shapes
: 
h
conv_pw_12_bn/truedivRealDivconv_pw_12_bn/Castconv_pw_12_bn/sub*
T0*
_output_shapes
: 
u
conv_pw_12_bn/mulMulconv_pw_12_bn/FusedBatchNorm:2conv_pw_12_bn/truediv*
_output_shapes	
:?*
T0
?
#conv_pw_12_bn/AssignMovingAvg/decayConst*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Mconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/zeros/shape_as_tensorConst*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
valueB:?*
dtype0*
_output_shapes
:
?
Cconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/zeros/ConstConst*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/zerosFillMconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/zeros/shape_as_tensorCconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/zeros/Const*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*

index_type0*
_output_shapes	
:?
?
 conv_pw_12_bn/moving_mean/biased
VariableV2*
shared_name *,
_class"
 loc:@conv_pw_12_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
'conv_pw_12_bn/moving_mean/biased/AssignAssign conv_pw_12_bn/moving_mean/biased=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/zeros*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
%conv_pw_12_bn/moving_mean/biased/readIdentity conv_pw_12_bn/moving_mean/biased*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean
?
6conv_pw_12_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_pw_12_bn/moving_mean/local_step
VariableV2*
shared_name *,
_class"
 loc:@conv_pw_12_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: 
?
+conv_pw_12_bn/moving_mean/local_step/AssignAssign$conv_pw_12_bn/moving_mean/local_step6conv_pw_12_bn/moving_mean/local_step/Initializer/zeros*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
)conv_pw_12_bn/moving_mean/local_step/readIdentity$conv_pw_12_bn/moving_mean/local_step*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes
: 
?
;conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/subSub%conv_pw_12_bn/moving_mean/biased/readconv_pw_12_bn/FusedBatchNorm:1*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes	
:?
?
;conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/mulMul;conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub#conv_pw_12_bn/AssignMovingAvg/decay*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes	
:?
?
Qconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/conv_pw_12_bn/moving_mean	AssignSub conv_pw_12_bn/moving_mean/biased;conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/mul*
_output_shapes	
:?*
use_locking( *
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean
?
Gconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/AssignAdd/valueConst*
dtype0*
_output_shapes
: *,
_class"
 loc:@conv_pw_12_bn/moving_mean*
valueB
 *  ??
?
Aconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/AssignAdd	AssignAdd$conv_pw_12_bn/moving_mean/local_stepGconv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/AssignAdd/value*
use_locking( *
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes
: 
?
<conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/readIdentity conv_pw_12_bn/moving_mean/biasedB^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/AssignAddR^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/conv_pw_12_bn/moving_mean*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes	
:?
?
?conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_1/xConstB^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/AssignAddR^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/conv_pw_12_bn/moving_mean*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_1Sub?conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_1/x#conv_pw_12_bn/AssignMovingAvg/decay*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes
: *
T0
?
>conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/read_1Identity$conv_pw_12_bn/moving_mean/local_stepB^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/AssignAddR^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/conv_pw_12_bn/moving_mean*
_output_shapes
: *
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean
?
;conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/PowPow=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_1>conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/read_1*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes
: 
?
?conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_2/xConstB^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/AssignAddR^conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/conv_pw_12_bn/moving_mean*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_2Sub?conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_2/x;conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/Pow*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes
: 
?
?conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/truedivRealDiv<conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/read=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_2*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes	
:?
?
=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_3Subconv_pw_12_bn/moving_mean/read?conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/truediv*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes	
:?*
T0
?
conv_pw_12_bn/AssignMovingAvg	AssignSubconv_pw_12_bn/moving_mean=conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/sub_3*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
_output_shapes	
:?*
use_locking( 
?
%conv_pw_12_bn/AssignMovingAvg_1/decayConst*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Sconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/zeros/shape_as_tensorConst*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
valueB:?*
dtype0*
_output_shapes
:
?
Iconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/zeros/ConstConst*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
Cconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/zerosFillSconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/zeros/shape_as_tensorIconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/zeros/Const*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*

index_type0*
_output_shapes	
:?
?
$conv_pw_12_bn/moving_variance/biased
VariableV2*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name *0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
+conv_pw_12_bn/moving_variance/biased/AssignAssign$conv_pw_12_bn/moving_variance/biasedCconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/zeros*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
)conv_pw_12_bn/moving_variance/biased/readIdentity$conv_pw_12_bn/moving_variance/biased*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
:conv_pw_12_bn/moving_variance/local_step/Initializer/zerosConst*
_output_shapes
: *0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
valueB
 *    *
dtype0
?
(conv_pw_12_bn/moving_variance/local_step
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
	container 
?
/conv_pw_12_bn/moving_variance/local_step/AssignAssign(conv_pw_12_bn/moving_variance/local_step:conv_pw_12_bn/moving_variance/local_step/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
-conv_pw_12_bn/moving_variance/local_step/readIdentity(conv_pw_12_bn/moving_variance/local_step*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes
: *
T0
?
Aconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/subSub)conv_pw_12_bn/moving_variance/biased/readconv_pw_12_bn/mul*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
Aconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/mulMulAconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub%conv_pw_12_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes	
:?
?
[conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/conv_pw_12_bn/moving_variance	AssignSub$conv_pw_12_bn/moving_variance/biasedAconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/mul*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
Mconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/AssignAdd/valueConst*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/AssignAdd	AssignAdd(conv_pw_12_bn/moving_variance/local_stepMconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/AssignAdd/value*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes
: *
use_locking( 
?
Bconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/readIdentity$conv_pw_12_bn/moving_variance/biasedH^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/AssignAdd\^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/conv_pw_12_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes	
:?
?
Econv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_1/xConstH^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/AssignAdd\^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/conv_pw_12_bn/moving_variance*
_output_shapes
: *0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
valueB
 *  ??*
dtype0
?
Cconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_1SubEconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_1/x%conv_pw_12_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes
: 
?
Dconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/read_1Identity(conv_pw_12_bn/moving_variance/local_stepH^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/AssignAdd\^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/conv_pw_12_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes
: 
?
Aconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/PowPowCconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_1Dconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/read_1*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes
: 
?
Econv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_2/xConstH^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/AssignAdd\^conv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/conv_pw_12_bn/moving_variance*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_2SubEconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_2/xAconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/Pow*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
Econv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/truedivRealDivBconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/readCconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_2*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
_output_shapes	
:?
?
Cconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_3Sub"conv_pw_12_bn/moving_variance/readEconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
conv_pw_12_bn/AssignMovingAvg_1	AssignSubconv_pw_12_bn/moving_varianceCconv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/sub_3*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
conv_pw_12_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

e
conv_pw_12_bn/cond/switch_tIdentityconv_pw_12_bn/cond/Switch:1*
T0
*
_output_shapes
: 
c
conv_pw_12_bn/cond/switch_fIdentityconv_pw_12_bn/cond/Switch*
T0
*
_output_shapes
: 
f
conv_pw_12_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_pw_12_bn/cond/Switch_1Switchconv_pw_12_bn/FusedBatchNormconv_pw_12_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_pw_12_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
"conv_pw_12_bn/cond/batchnorm/add/yConst^conv_pw_12_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
 conv_pw_12_bn/cond/batchnorm/addAdd'conv_pw_12_bn/cond/batchnorm/add/Switch"conv_pw_12_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
'conv_pw_12_bn/cond/batchnorm/add/SwitchSwitch"conv_pw_12_bn/moving_variance/readconv_pw_12_bn/cond/pred_id*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*"
_output_shapes
:?:?*
T0
s
"conv_pw_12_bn/cond/batchnorm/RsqrtRsqrt conv_pw_12_bn/cond/batchnorm/add*
_output_shapes	
:?*
T0
?
 conv_pw_12_bn/cond/batchnorm/mulMul"conv_pw_12_bn/cond/batchnorm/Rsqrt'conv_pw_12_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
'conv_pw_12_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_12_bn/gamma/readconv_pw_12_bn/cond/pred_id*
T0*&
_class
loc:@conv_pw_12_bn/gamma*"
_output_shapes
:?:?
?
"conv_pw_12_bn/cond/batchnorm/mul_1Mul)conv_pw_12_bn/cond/batchnorm/mul_1/Switch conv_pw_12_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
)conv_pw_12_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_12/convolutionconv_pw_12_bn/cond/pred_id*
T0*)
_class
loc:@conv_pw_12/convolution*L
_output_shapes:
8:??????????:??????????
?
"conv_pw_12_bn/cond/batchnorm/mul_2Mul)conv_pw_12_bn/cond/batchnorm/mul_2/Switch conv_pw_12_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
)conv_pw_12_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_12_bn/moving_mean/readconv_pw_12_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean
?
 conv_pw_12_bn/cond/batchnorm/subSub'conv_pw_12_bn/cond/batchnorm/sub/Switch"conv_pw_12_bn/cond/batchnorm/mul_2*
T0*
_output_shapes	
:?
?
'conv_pw_12_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_12_bn/beta/readconv_pw_12_bn/cond/pred_id*
T0*%
_class
loc:@conv_pw_12_bn/beta*"
_output_shapes
:?:?
?
"conv_pw_12_bn/cond/batchnorm/add_1Add"conv_pw_12_bn/cond/batchnorm/mul_1 conv_pw_12_bn/cond/batchnorm/sub*0
_output_shapes
:??????????*
T0
?
conv_pw_12_bn/cond/MergeMerge"conv_pw_12_bn/cond/batchnorm/add_1conv_pw_12_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
q
conv_pw_12_relu/ReluReluconv_pw_12_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Z
conv_pw_12_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_12_relu/MinimumMinimumconv_pw_12_relu/Reluconv_pw_12_relu/Const*
T0*0
_output_shapes
:??????????
?
conv_pad_13/Pad/paddingsConst*9
value0B."                             *
dtype0*
_output_shapes

:
?
conv_pad_13/PadPadconv_pw_12_relu/Minimumconv_pad_13/Pad/paddings*
T0*
	Tpaddings0*0
_output_shapes
:?????????		?
x
conv_dw_13/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_dw_13/random_uniform/minConst*
valueB
 *??м*
dtype0*
_output_shapes
: 
b
conv_dw_13/random_uniform/maxConst*
valueB
 *???<*
dtype0*
_output_shapes
: 
?
'conv_dw_13/random_uniform/RandomUniformRandomUniformconv_dw_13/random_uniform/shape*
T0*
dtype0*'
_output_shapes
:?*
seed2?Ǚ*
seed???)
?
conv_dw_13/random_uniform/subSubconv_dw_13/random_uniform/maxconv_dw_13/random_uniform/min*
T0*
_output_shapes
: 
?
conv_dw_13/random_uniform/mulMul'conv_dw_13/random_uniform/RandomUniformconv_dw_13/random_uniform/sub*'
_output_shapes
:?*
T0
?
conv_dw_13/random_uniformAddconv_dw_13/random_uniform/mulconv_dw_13/random_uniform/min*
T0*'
_output_shapes
:?
?
conv_dw_13/depthwise_kernel
VariableV2*
dtype0*'
_output_shapes
:?*
	container *
shape:?*
shared_name 
?
"conv_dw_13/depthwise_kernel/AssignAssignconv_dw_13/depthwise_kernelconv_dw_13/random_uniform*
T0*.
_class$
" loc:@conv_dw_13/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking(
?
 conv_dw_13/depthwise_kernel/readIdentityconv_dw_13/depthwise_kernel*
T0*.
_class$
" loc:@conv_dw_13/depthwise_kernel*'
_output_shapes
:?
s
conv_dw_13/depthwise/ShapeConst*%
valueB"            *
dtype0*
_output_shapes
:
s
"conv_dw_13/depthwise/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_dw_13/depthwiseDepthwiseConv2dNativeconv_pad_13/Pad conv_dw_13/depthwise_kernel/read*
paddingVALID*0
_output_shapes
:??????????*
	dilations
*
T0*
data_formatNHWC*
strides

b
conv_dw_13_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_13_bn/gamma
VariableV2*
shape:?*
shared_name *
dtype0*
_output_shapes	
:?*
	container 
?
conv_dw_13_bn/gamma/AssignAssignconv_dw_13_bn/gammaconv_dw_13_bn/Const*&
_class
loc:@conv_dw_13_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_dw_13_bn/gamma/readIdentityconv_dw_13_bn/gamma*
T0*&
_class
loc:@conv_dw_13_bn/gamma*
_output_shapes	
:?
d
conv_dw_13_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_dw_13_bn/beta
VariableV2*
dtype0*
_output_shapes	
:?*
	container *
shape:?*
shared_name 
?
conv_dw_13_bn/beta/AssignAssignconv_dw_13_bn/betaconv_dw_13_bn/Const_1*%
_class
loc:@conv_dw_13_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
conv_dw_13_bn/beta/readIdentityconv_dw_13_bn/beta*
T0*%
_class
loc:@conv_dw_13_bn/beta*
_output_shapes	
:?
d
conv_dw_13_bn/Const_2Const*
dtype0*
_output_shapes	
:?*
valueB?*    
?
conv_dw_13_bn/moving_mean
VariableV2*
_output_shapes	
:?*
	container *
shape:?*
shared_name *
dtype0
?
 conv_dw_13_bn/moving_mean/AssignAssignconv_dw_13_bn/moving_meanconv_dw_13_bn/Const_2*
use_locking(*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_dw_13_bn/moving_mean/readIdentityconv_dw_13_bn/moving_mean*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
d
conv_dw_13_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_dw_13_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
$conv_dw_13_bn/moving_variance/AssignAssignconv_dw_13_bn/moving_varianceconv_dw_13_bn/Const_3*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
"conv_dw_13_bn/moving_variance/readIdentityconv_dw_13_bn/moving_variance*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes	
:?
X
conv_dw_13_bn/Const_4Const*
dtype0*
_output_shapes
: *
valueB 
X
conv_dw_13_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_dw_13_bn/FusedBatchNormFusedBatchNormconv_dw_13/depthwiseconv_dw_13_bn/gamma/readconv_dw_13_bn/beta/readconv_dw_13_bn/Const_4conv_dw_13_bn/Const_5*
epsilon%o?:*
T0*
data_formatNHWC*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(
g
conv_dw_13_bn/ShapeShapeconv_dw_13/depthwise*
T0*
out_type0*
_output_shapes
:
k
!conv_dw_13_bn/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
m
#conv_dw_13_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
m
#conv_dw_13_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_13_bn/strided_sliceStridedSliceconv_dw_13_bn/Shape!conv_dw_13_bn/strided_slice/stack#conv_dw_13_bn/strided_slice/stack_1#conv_dw_13_bn/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
i
conv_dw_13_bn/Shape_1Shapeconv_dw_13/depthwise*
T0*
out_type0*
_output_shapes
:
m
#conv_dw_13_bn/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB:
o
%conv_dw_13_bn/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_13_bn/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
conv_dw_13_bn/strided_slice_1StridedSliceconv_dw_13_bn/Shape_1#conv_dw_13_bn/strided_slice_1/stack%conv_dw_13_bn/strided_slice_1/stack_1%conv_dw_13_bn/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
i
conv_dw_13_bn/Shape_2Shapeconv_dw_13/depthwise*
T0*
out_type0*
_output_shapes
:
m
#conv_dw_13_bn/strided_slice_2/stackConst*
_output_shapes
:*
valueB:*
dtype0
o
%conv_dw_13_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_dw_13_bn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_dw_13_bn/strided_slice_2StridedSliceconv_dw_13_bn/Shape_2#conv_dw_13_bn/strided_slice_2/stack%conv_dw_13_bn/strided_slice_2/stack_1%conv_dw_13_bn/strided_slice_2/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
?
conv_dw_13_bn/Rank/packedPackconv_dw_13_bn/strided_sliceconv_dw_13_bn/strided_slice_1conv_dw_13_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
T
conv_dw_13_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_dw_13_bn/range/startConst*
_output_shapes
: *
value	B : *
dtype0
[
conv_dw_13_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_dw_13_bn/rangeRangeconv_dw_13_bn/range/startconv_dw_13_bn/Rankconv_dw_13_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_dw_13_bn/Prod/inputPackconv_dw_13_bn/strided_sliceconv_dw_13_bn/strided_slice_1conv_dw_13_bn/strided_slice_2*
_output_shapes
:*
T0*

axis *
N
?
conv_dw_13_bn/ProdProdconv_dw_13_bn/Prod/inputconv_dw_13_bn/range*
T0*
_output_shapes
: *
	keep_dims( *

Tidx0
n
conv_dw_13_bn/CastCastconv_dw_13_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
X
conv_dw_13_bn/sub/yConst*
_output_shapes
: *
valueB
 *? ??*
dtype0
b
conv_dw_13_bn/subSubconv_dw_13_bn/Castconv_dw_13_bn/sub/y*
T0*
_output_shapes
: 
h
conv_dw_13_bn/truedivRealDivconv_dw_13_bn/Castconv_dw_13_bn/sub*
_output_shapes
: *
T0
u
conv_dw_13_bn/mulMulconv_dw_13_bn/FusedBatchNorm:2conv_dw_13_bn/truediv*
T0*
_output_shapes	
:?
?
#conv_dw_13_bn/AssignMovingAvg/decayConst*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Mconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/zeros/shape_as_tensorConst*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
valueB:?*
dtype0*
_output_shapes
:
?
Cconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/zeros/ConstConst*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/zerosFillMconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/zeros/shape_as_tensorCconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/zeros/Const*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*

index_type0*
_output_shapes	
:?
?
 conv_dw_13_bn/moving_mean/biased
VariableV2*
dtype0*
_output_shapes	
:?*
shared_name *,
_class"
 loc:@conv_dw_13_bn/moving_mean*
	container *
shape:?
?
'conv_dw_13_bn/moving_mean/biased/AssignAssign conv_dw_13_bn/moving_mean/biased=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
%conv_dw_13_bn/moving_mean/biased/readIdentity conv_dw_13_bn/moving_mean/biased*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
?
6conv_dw_13_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_dw_13_bn/moving_mean/local_step
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *,
_class"
 loc:@conv_dw_13_bn/moving_mean*
	container 
?
+conv_dw_13_bn/moving_mean/local_step/AssignAssign$conv_dw_13_bn/moving_mean/local_step6conv_dw_13_bn/moving_mean/local_step/Initializer/zeros*
_output_shapes
: *
use_locking(*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
validate_shape(
?
)conv_dw_13_bn/moving_mean/local_step/readIdentity$conv_dw_13_bn/moving_mean/local_step*
_output_shapes
: *
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
?
;conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/subSub%conv_dw_13_bn/moving_mean/biased/readconv_dw_13_bn/FusedBatchNorm:1*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes	
:?
?
;conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/mulMul;conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub#conv_dw_13_bn/AssignMovingAvg/decay*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes	
:?*
T0
?
Qconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/conv_dw_13_bn/moving_mean	AssignSub conv_dw_13_bn/moving_mean/biased;conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/mul*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes	
:?*
use_locking( 
?
Gconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *,
_class"
 loc:@conv_dw_13_bn/moving_mean*
valueB
 *  ??*
dtype0
?
Aconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/AssignAdd	AssignAdd$conv_dw_13_bn/moving_mean/local_stepGconv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/AssignAdd/value*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes
: *
use_locking( 
?
<conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/readIdentity conv_dw_13_bn/moving_mean/biasedB^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/AssignAddR^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/conv_dw_13_bn/moving_mean*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes	
:?
?
?conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_1/xConstB^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/AssignAddR^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/conv_dw_13_bn/moving_mean*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_1Sub?conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_1/x#conv_dw_13_bn/AssignMovingAvg/decay*
_output_shapes
: *
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
?
>conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/read_1Identity$conv_dw_13_bn/moving_mean/local_stepB^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/AssignAddR^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/conv_dw_13_bn/moving_mean*
_output_shapes
: *
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
?
;conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/PowPow=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_1>conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/read_1*
_output_shapes
: *
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
?
?conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_2/xConstB^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/AssignAddR^conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/conv_dw_13_bn/moving_mean*
_output_shapes
: *,
_class"
 loc:@conv_dw_13_bn/moving_mean*
valueB
 *  ??*
dtype0
?
=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_2Sub?conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_2/x;conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/Pow*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes
: 
?
?conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/truedivRealDiv<conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/read=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_2*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
?
=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_3Subconv_dw_13_bn/moving_mean/read?conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/truediv*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes	
:?
?
conv_dw_13_bn/AssignMovingAvg	AssignSubconv_dw_13_bn/moving_mean=conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/sub_3*
use_locking( *
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
_output_shapes	
:?
?
%conv_dw_13_bn/AssignMovingAvg_1/decayConst*
dtype0*
_output_shapes
: *0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
valueB
 *
?#<
?
Sconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/zeros/shape_as_tensorConst*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
valueB:?*
dtype0*
_output_shapes
:
?
Iconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/zeros/ConstConst*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
Cconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/zerosFillSconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/zeros/shape_as_tensorIconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/zeros/Const*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*

index_type0*
_output_shapes	
:?
?
$conv_dw_13_bn/moving_variance/biased
VariableV2*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
+conv_dw_13_bn/moving_variance/biased/AssignAssign$conv_dw_13_bn/moving_variance/biasedCconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/zeros*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
)conv_dw_13_bn/moving_variance/biased/readIdentity$conv_dw_13_bn/moving_variance/biased*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes	
:?
?
:conv_dw_13_bn/moving_variance/local_step/Initializer/zerosConst*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
(conv_dw_13_bn/moving_variance/local_step
VariableV2*
shared_name *0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
	container *
shape: *
dtype0*
_output_shapes
: 
?
/conv_dw_13_bn/moving_variance/local_step/AssignAssign(conv_dw_13_bn/moving_variance/local_step:conv_dw_13_bn/moving_variance/local_step/Initializer/zeros*
_output_shapes
: *
use_locking(*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
validate_shape(
?
-conv_dw_13_bn/moving_variance/local_step/readIdentity(conv_dw_13_bn/moving_variance/local_step*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance
?
Aconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/subSub)conv_dw_13_bn/moving_variance/biased/readconv_dw_13_bn/mul*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance
?
Aconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/mulMulAconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub%conv_dw_13_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes	
:?
?
[conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/conv_dw_13_bn/moving_variance	AssignSub$conv_dw_13_bn/moving_variance/biasedAconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/mul*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance
?
Mconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/AssignAdd/valueConst*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/AssignAdd	AssignAdd(conv_dw_13_bn/moving_variance/local_stepMconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes
: 
?
Bconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/readIdentity$conv_dw_13_bn/moving_variance/biasedH^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/AssignAdd\^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/conv_dw_13_bn/moving_variance*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance
?
Econv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_1/xConstH^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/AssignAdd\^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/conv_dw_13_bn/moving_variance*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_1SubEconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_1/x%conv_dw_13_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes
: 
?
Dconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/read_1Identity(conv_dw_13_bn/moving_variance/local_stepH^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/AssignAdd\^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/conv_dw_13_bn/moving_variance*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes
: 
?
Aconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/PowPowCconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_1Dconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/read_1*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes
: 
?
Econv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_2/xConstH^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/AssignAdd\^conv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/conv_dw_13_bn/moving_variance*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_2SubEconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_2/xAconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/Pow*
_output_shapes
: *
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance
?
Econv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/truedivRealDivBconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/readCconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_2*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
_output_shapes	
:?*
T0
?
Cconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_3Sub"conv_dw_13_bn/moving_variance/readEconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/truediv*
_output_shapes	
:?*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance
?
conv_dw_13_bn/AssignMovingAvg_1	AssignSubconv_dw_13_bn/moving_varianceCconv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/sub_3*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance
?
conv_dw_13_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

e
conv_dw_13_bn/cond/switch_tIdentityconv_dw_13_bn/cond/Switch:1*
_output_shapes
: *
T0

c
conv_dw_13_bn/cond/switch_fIdentityconv_dw_13_bn/cond/Switch*
T0
*
_output_shapes
: 
f
conv_dw_13_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
T0
*
_output_shapes
: 
?
conv_dw_13_bn/cond/Switch_1Switchconv_dw_13_bn/FusedBatchNormconv_dw_13_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_dw_13_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
"conv_dw_13_bn/cond/batchnorm/add/yConst^conv_dw_13_bn/cond/switch_f*
valueB
 *o?:*
dtype0*
_output_shapes
: 
?
 conv_dw_13_bn/cond/batchnorm/addAdd'conv_dw_13_bn/cond/batchnorm/add/Switch"conv_dw_13_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
'conv_dw_13_bn/cond/batchnorm/add/SwitchSwitch"conv_dw_13_bn/moving_variance/readconv_dw_13_bn/cond/pred_id*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*"
_output_shapes
:?:?*
T0
s
"conv_dw_13_bn/cond/batchnorm/RsqrtRsqrt conv_dw_13_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
 conv_dw_13_bn/cond/batchnorm/mulMul"conv_dw_13_bn/cond/batchnorm/Rsqrt'conv_dw_13_bn/cond/batchnorm/mul/Switch*
_output_shapes	
:?*
T0
?
'conv_dw_13_bn/cond/batchnorm/mul/SwitchSwitchconv_dw_13_bn/gamma/readconv_dw_13_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*&
_class
loc:@conv_dw_13_bn/gamma
?
"conv_dw_13_bn/cond/batchnorm/mul_1Mul)conv_dw_13_bn/cond/batchnorm/mul_1/Switch conv_dw_13_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
)conv_dw_13_bn/cond/batchnorm/mul_1/SwitchSwitchconv_dw_13/depthwiseconv_dw_13_bn/cond/pred_id*
T0*'
_class
loc:@conv_dw_13/depthwise*L
_output_shapes:
8:??????????:??????????
?
"conv_dw_13_bn/cond/batchnorm/mul_2Mul)conv_dw_13_bn/cond/batchnorm/mul_2/Switch conv_dw_13_bn/cond/batchnorm/mul*
_output_shapes	
:?*
T0
?
)conv_dw_13_bn/cond/batchnorm/mul_2/SwitchSwitchconv_dw_13_bn/moving_mean/readconv_dw_13_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
?
 conv_dw_13_bn/cond/batchnorm/subSub'conv_dw_13_bn/cond/batchnorm/sub/Switch"conv_dw_13_bn/cond/batchnorm/mul_2*
_output_shapes	
:?*
T0
?
'conv_dw_13_bn/cond/batchnorm/sub/SwitchSwitchconv_dw_13_bn/beta/readconv_dw_13_bn/cond/pred_id*
T0*%
_class
loc:@conv_dw_13_bn/beta*"
_output_shapes
:?:?
?
"conv_dw_13_bn/cond/batchnorm/add_1Add"conv_dw_13_bn/cond/batchnorm/mul_1 conv_dw_13_bn/cond/batchnorm/sub*0
_output_shapes
:??????????*
T0
?
conv_dw_13_bn/cond/MergeMerge"conv_dw_13_bn/cond/batchnorm/add_1conv_dw_13_bn/cond/Switch_1:1*
N*2
_output_shapes 
:??????????: *
T0
q
conv_dw_13_relu/ReluReluconv_dw_13_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Z
conv_dw_13_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_dw_13_relu/MinimumMinimumconv_dw_13_relu/Reluconv_dw_13_relu/Const*0
_output_shapes
:??????????*
T0
x
conv_pw_13/random_uniform/shapeConst*%
valueB"            *
dtype0*
_output_shapes
:
b
conv_pw_13/random_uniform/minConst*
valueB
 *׳]?*
dtype0*
_output_shapes
: 
b
conv_pw_13/random_uniform/maxConst*
valueB
 *׳]=*
dtype0*
_output_shapes
: 
?
'conv_pw_13/random_uniform/RandomUniformRandomUniformconv_pw_13/random_uniform/shape*
T0*
dtype0*(
_output_shapes
:??*
seed2???*
seed???)
?
conv_pw_13/random_uniform/subSubconv_pw_13/random_uniform/maxconv_pw_13/random_uniform/min*
_output_shapes
: *
T0
?
conv_pw_13/random_uniform/mulMul'conv_pw_13/random_uniform/RandomUniformconv_pw_13/random_uniform/sub*
T0*(
_output_shapes
:??
?
conv_pw_13/random_uniformAddconv_pw_13/random_uniform/mulconv_pw_13/random_uniform/min*(
_output_shapes
:??*
T0
?
conv_pw_13/kernel
VariableV2*
shared_name *
dtype0*(
_output_shapes
:??*
	container *
shape:??
?
conv_pw_13/kernel/AssignAssignconv_pw_13/kernelconv_pw_13/random_uniform*
T0*$
_class
loc:@conv_pw_13/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking(
?
conv_pw_13/kernel/readIdentityconv_pw_13/kernel*
T0*$
_class
loc:@conv_pw_13/kernel*(
_output_shapes
:??
u
$conv_pw_13/convolution/dilation_rateConst*
valueB"      *
dtype0*
_output_shapes
:
?
conv_pw_13/convolutionConv2Dconv_dw_13_relu/Minimumconv_pw_13/kernel/read*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME*0
_output_shapes
:??????????
b
conv_pw_13_bn/ConstConst*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_13_bn/gamma
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_13_bn/gamma/AssignAssignconv_pw_13_bn/gammaconv_pw_13_bn/Const*
use_locking(*
T0*&
_class
loc:@conv_pw_13_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
conv_pw_13_bn/gamma/readIdentityconv_pw_13_bn/gamma*
T0*&
_class
loc:@conv_pw_13_bn/gamma*
_output_shapes	
:?
d
conv_pw_13_bn/Const_1Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_13_bn/beta
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
conv_pw_13_bn/beta/AssignAssignconv_pw_13_bn/betaconv_pw_13_bn/Const_1*
use_locking(*
T0*%
_class
loc:@conv_pw_13_bn/beta*
validate_shape(*
_output_shapes	
:?
?
conv_pw_13_bn/beta/readIdentityconv_pw_13_bn/beta*%
_class
loc:@conv_pw_13_bn/beta*
_output_shapes	
:?*
T0
d
conv_pw_13_bn/Const_2Const*
valueB?*    *
dtype0*
_output_shapes	
:?
?
conv_pw_13_bn/moving_mean
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
 conv_pw_13_bn/moving_mean/AssignAssignconv_pw_13_bn/moving_meanconv_pw_13_bn/Const_2*
use_locking(*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
conv_pw_13_bn/moving_mean/readIdentityconv_pw_13_bn/moving_mean*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes	
:?*
T0
d
conv_pw_13_bn/Const_3Const*
valueB?*  ??*
dtype0*
_output_shapes	
:?
?
conv_pw_13_bn/moving_variance
VariableV2*
shared_name *
dtype0*
_output_shapes	
:?*
	container *
shape:?
?
$conv_pw_13_bn/moving_variance/AssignAssignconv_pw_13_bn/moving_varianceconv_pw_13_bn/Const_3*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
"conv_pw_13_bn/moving_variance/readIdentityconv_pw_13_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
X
conv_pw_13_bn/Const_4Const*
valueB *
dtype0*
_output_shapes
: 
X
conv_pw_13_bn/Const_5Const*
valueB *
dtype0*
_output_shapes
: 
?
conv_pw_13_bn/FusedBatchNormFusedBatchNormconv_pw_13/convolutionconv_pw_13_bn/gamma/readconv_pw_13_bn/beta/readconv_pw_13_bn/Const_4conv_pw_13_bn/Const_5*L
_output_shapes:
8:??????????:?:?:?:?*
is_training(*
epsilon%o?:*
T0*
data_formatNHWC
i
conv_pw_13_bn/ShapeShapeconv_pw_13/convolution*
T0*
out_type0*
_output_shapes
:
k
!conv_pw_13_bn/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
m
#conv_pw_13_bn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
m
#conv_pw_13_bn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_13_bn/strided_sliceStridedSliceconv_pw_13_bn/Shape!conv_pw_13_bn/strided_slice/stack#conv_pw_13_bn/strided_slice/stack_1#conv_pw_13_bn/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
k
conv_pw_13_bn/Shape_1Shapeconv_pw_13/convolution*
T0*
out_type0*
_output_shapes
:
m
#conv_pw_13_bn/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_13_bn/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
o
%conv_pw_13_bn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
conv_pw_13_bn/strided_slice_1StridedSliceconv_pw_13_bn/Shape_1#conv_pw_13_bn/strided_slice_1/stack%conv_pw_13_bn/strided_slice_1/stack_1%conv_pw_13_bn/strided_slice_1/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
k
conv_pw_13_bn/Shape_2Shapeconv_pw_13/convolution*
T0*
out_type0*
_output_shapes
:
m
#conv_pw_13_bn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_13_bn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
o
%conv_pw_13_bn/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
conv_pw_13_bn/strided_slice_2StridedSliceconv_pw_13_bn/Shape_2#conv_pw_13_bn/strided_slice_2/stack%conv_pw_13_bn/strided_slice_2/stack_1%conv_pw_13_bn/strided_slice_2/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
?
conv_pw_13_bn/Rank/packedPackconv_pw_13_bn/strided_sliceconv_pw_13_bn/strided_slice_1conv_pw_13_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
T
conv_pw_13_bn/RankConst*
value	B :*
dtype0*
_output_shapes
: 
[
conv_pw_13_bn/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
[
conv_pw_13_bn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
?
conv_pw_13_bn/rangeRangeconv_pw_13_bn/range/startconv_pw_13_bn/Rankconv_pw_13_bn/range/delta*

Tidx0*
_output_shapes
:
?
conv_pw_13_bn/Prod/inputPackconv_pw_13_bn/strided_sliceconv_pw_13_bn/strided_slice_1conv_pw_13_bn/strided_slice_2*
T0*

axis *
N*
_output_shapes
:
?
conv_pw_13_bn/ProdProdconv_pw_13_bn/Prod/inputconv_pw_13_bn/range*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
n
conv_pw_13_bn/CastCastconv_pw_13_bn/Prod*

SrcT0*
Truncate( *
_output_shapes
: *

DstT0
X
conv_pw_13_bn/sub/yConst*
valueB
 *? ??*
dtype0*
_output_shapes
: 
b
conv_pw_13_bn/subSubconv_pw_13_bn/Castconv_pw_13_bn/sub/y*
T0*
_output_shapes
: 
h
conv_pw_13_bn/truedivRealDivconv_pw_13_bn/Castconv_pw_13_bn/sub*
T0*
_output_shapes
: 
u
conv_pw_13_bn/mulMulconv_pw_13_bn/FusedBatchNorm:2conv_pw_13_bn/truediv*
_output_shapes	
:?*
T0
?
#conv_pw_13_bn/AssignMovingAvg/decayConst*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Mconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/zeros/shape_as_tensorConst*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
valueB:?*
dtype0*
_output_shapes
:
?
Cconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/zeros/ConstConst*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/zerosFillMconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/zeros/shape_as_tensorCconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/zeros/Const*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*

index_type0*
_output_shapes	
:?
?
 conv_pw_13_bn/moving_mean/biased
VariableV2*
shared_name *,
_class"
 loc:@conv_pw_13_bn/moving_mean*
	container *
shape:?*
dtype0*
_output_shapes	
:?
?
'conv_pw_13_bn/moving_mean/biased/AssignAssign conv_pw_13_bn/moving_mean/biased=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/zeros*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
%conv_pw_13_bn/moving_mean/biased/readIdentity conv_pw_13_bn/moving_mean/biased*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes	
:?
?
6conv_pw_13_bn/moving_mean/local_step/Initializer/zerosConst*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
valueB
 *    *
dtype0*
_output_shapes
: 
?
$conv_pw_13_bn/moving_mean/local_step
VariableV2*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
	container *
shape: *
dtype0*
_output_shapes
: *
shared_name 
?
+conv_pw_13_bn/moving_mean/local_step/AssignAssign$conv_pw_13_bn/moving_mean/local_step6conv_pw_13_bn/moving_mean/local_step/Initializer/zeros*
use_locking(*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
)conv_pw_13_bn/moving_mean/local_step/readIdentity$conv_pw_13_bn/moving_mean/local_step*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes
: 
?
;conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/subSub%conv_pw_13_bn/moving_mean/biased/readconv_pw_13_bn/FusedBatchNorm:1*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
;conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/mulMul;conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub#conv_pw_13_bn/AssignMovingAvg/decay*
_output_shapes	
:?*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
Qconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/conv_pw_13_bn/moving_mean	AssignSub conv_pw_13_bn/moving_mean/biased;conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/mul*
_output_shapes	
:?*
use_locking( *
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
Gconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/AssignAdd/valueConst*
_output_shapes
: *,
_class"
 loc:@conv_pw_13_bn/moving_mean*
valueB
 *  ??*
dtype0
?
Aconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/AssignAdd	AssignAdd$conv_pw_13_bn/moving_mean/local_stepGconv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/AssignAdd/value*
_output_shapes
: *
use_locking( *
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
<conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/readIdentity conv_pw_13_bn/moving_mean/biasedB^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/AssignAddR^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/conv_pw_13_bn/moving_mean*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes	
:?*
T0
?
?conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_1/xConstB^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/AssignAddR^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/conv_pw_13_bn/moving_mean*
_output_shapes
: *,
_class"
 loc:@conv_pw_13_bn/moving_mean*
valueB
 *  ??*
dtype0
?
=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_1Sub?conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_1/x#conv_pw_13_bn/AssignMovingAvg/decay*
_output_shapes
: *
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
>conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/read_1Identity$conv_pw_13_bn/moving_mean/local_stepB^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/AssignAddR^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/conv_pw_13_bn/moving_mean*
_output_shapes
: *
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
;conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/PowPow=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_1>conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/read_1*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes
: 
?
?conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_2/xConstB^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/AssignAddR^conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/conv_pw_13_bn/moving_mean*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_2Sub?conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_2/x;conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/Pow*
_output_shapes
: *
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
?conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/truedivRealDiv<conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/read=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_2*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes	
:?*
T0
?
=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_3Subconv_pw_13_bn/moving_mean/read?conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/truediv*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes	
:?*
T0
?
conv_pw_13_bn/AssignMovingAvg	AssignSubconv_pw_13_bn/moving_mean=conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/sub_3*
use_locking( *
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
_output_shapes	
:?
?
%conv_pw_13_bn/AssignMovingAvg_1/decayConst*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
valueB
 *
?#<*
dtype0*
_output_shapes
: 
?
Sconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
valueB:?
?
Iconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/zeros/ConstConst*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
Cconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/zerosFillSconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/zeros/shape_as_tensorIconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/zeros/Const*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*

index_type0*
_output_shapes	
:?
?
$conv_pw_13_bn/moving_variance/biased
VariableV2*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
	container *
shape:?*
dtype0*
_output_shapes	
:?*
shared_name 
?
+conv_pw_13_bn/moving_variance/biased/AssignAssign$conv_pw_13_bn/moving_variance/biasedCconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/zeros*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance
?
)conv_pw_13_bn/moving_variance/biased/readIdentity$conv_pw_13_bn/moving_variance/biased*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
?
:conv_pw_13_bn/moving_variance/local_step/Initializer/zerosConst*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
valueB
 *    *
dtype0*
_output_shapes
: 
?
(conv_pw_13_bn/moving_variance/local_step
VariableV2*
dtype0*
_output_shapes
: *
shared_name *0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
	container *
shape: 
?
/conv_pw_13_bn/moving_variance/local_step/AssignAssign(conv_pw_13_bn/moving_variance/local_step:conv_pw_13_bn/moving_variance/local_step/Initializer/zeros*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(
?
-conv_pw_13_bn/moving_variance/local_step/readIdentity(conv_pw_13_bn/moving_variance/local_step*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes
: 
?
Aconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/subSub)conv_pw_13_bn/moving_variance/biased/readconv_pw_13_bn/mul*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
?
Aconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/mulMulAconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub%conv_pw_13_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
?
[conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/conv_pw_13_bn/moving_variance	AssignSub$conv_pw_13_bn/moving_variance/biasedAconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/mul*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance
?
Mconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/AssignAdd/valueConst*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Gconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/AssignAdd	AssignAdd(conv_pw_13_bn/moving_variance/local_stepMconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/AssignAdd/value*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes
: 
?
Bconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/readIdentity$conv_pw_13_bn/moving_variance/biasedH^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/AssignAdd\^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/conv_pw_13_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
?
Econv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_1/xConstH^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/AssignAdd\^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/conv_pw_13_bn/moving_variance*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_1SubEconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_1/x%conv_pw_13_bn/AssignMovingAvg_1/decay*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes
: 
?
Dconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/read_1Identity(conv_pw_13_bn/moving_variance/local_stepH^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/AssignAdd\^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/conv_pw_13_bn/moving_variance*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes
: 
?
Aconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/PowPowCconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_1Dconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/read_1*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes
: 
?
Econv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_2/xConstH^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/AssignAdd\^conv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/conv_pw_13_bn/moving_variance*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
Cconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_2SubEconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_2/xAconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/Pow*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes
: *
T0
?
Econv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/truedivRealDivBconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/readCconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_2*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
?
Cconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_3Sub"conv_pw_13_bn/moving_variance/readEconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/truediv*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_13_bn/AssignMovingAvg_1	AssignSubconv_pw_13_bn/moving_varianceCconv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/sub_3*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
_output_shapes	
:?
?
conv_pw_13_bn/cond/SwitchSwitchconv1_bn/keras_learning_phaseconv1_bn/keras_learning_phase*
_output_shapes
: : *
T0

e
conv_pw_13_bn/cond/switch_tIdentityconv_pw_13_bn/cond/Switch:1*
_output_shapes
: *
T0

c
conv_pw_13_bn/cond/switch_fIdentityconv_pw_13_bn/cond/Switch*
T0
*
_output_shapes
: 
f
conv_pw_13_bn/cond/pred_idIdentityconv1_bn/keras_learning_phase*
_output_shapes
: *
T0

?
conv_pw_13_bn/cond/Switch_1Switchconv_pw_13_bn/FusedBatchNormconv_pw_13_bn/cond/pred_id*
T0*/
_class%
#!loc:@conv_pw_13_bn/FusedBatchNorm*L
_output_shapes:
8:??????????:??????????
?
"conv_pw_13_bn/cond/batchnorm/add/yConst^conv_pw_13_bn/cond/switch_f*
dtype0*
_output_shapes
: *
valueB
 *o?:
?
 conv_pw_13_bn/cond/batchnorm/addAdd'conv_pw_13_bn/cond/batchnorm/add/Switch"conv_pw_13_bn/cond/batchnorm/add/y*
T0*
_output_shapes	
:?
?
'conv_pw_13_bn/cond/batchnorm/add/SwitchSwitch"conv_pw_13_bn/moving_variance/readconv_pw_13_bn/cond/pred_id*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*"
_output_shapes
:?:?
s
"conv_pw_13_bn/cond/batchnorm/RsqrtRsqrt conv_pw_13_bn/cond/batchnorm/add*
T0*
_output_shapes	
:?
?
 conv_pw_13_bn/cond/batchnorm/mulMul"conv_pw_13_bn/cond/batchnorm/Rsqrt'conv_pw_13_bn/cond/batchnorm/mul/Switch*
T0*
_output_shapes	
:?
?
'conv_pw_13_bn/cond/batchnorm/mul/SwitchSwitchconv_pw_13_bn/gamma/readconv_pw_13_bn/cond/pred_id*
T0*&
_class
loc:@conv_pw_13_bn/gamma*"
_output_shapes
:?:?
?
"conv_pw_13_bn/cond/batchnorm/mul_1Mul)conv_pw_13_bn/cond/batchnorm/mul_1/Switch conv_pw_13_bn/cond/batchnorm/mul*
T0*0
_output_shapes
:??????????
?
)conv_pw_13_bn/cond/batchnorm/mul_1/SwitchSwitchconv_pw_13/convolutionconv_pw_13_bn/cond/pred_id*L
_output_shapes:
8:??????????:??????????*
T0*)
_class
loc:@conv_pw_13/convolution
?
"conv_pw_13_bn/cond/batchnorm/mul_2Mul)conv_pw_13_bn/cond/batchnorm/mul_2/Switch conv_pw_13_bn/cond/batchnorm/mul*
T0*
_output_shapes	
:?
?
)conv_pw_13_bn/cond/batchnorm/mul_2/SwitchSwitchconv_pw_13_bn/moving_mean/readconv_pw_13_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
 conv_pw_13_bn/cond/batchnorm/subSub'conv_pw_13_bn/cond/batchnorm/sub/Switch"conv_pw_13_bn/cond/batchnorm/mul_2*
_output_shapes	
:?*
T0
?
'conv_pw_13_bn/cond/batchnorm/sub/SwitchSwitchconv_pw_13_bn/beta/readconv_pw_13_bn/cond/pred_id*"
_output_shapes
:?:?*
T0*%
_class
loc:@conv_pw_13_bn/beta
?
"conv_pw_13_bn/cond/batchnorm/add_1Add"conv_pw_13_bn/cond/batchnorm/mul_1 conv_pw_13_bn/cond/batchnorm/sub*
T0*0
_output_shapes
:??????????
?
conv_pw_13_bn/cond/MergeMerge"conv_pw_13_bn/cond/batchnorm/add_1conv_pw_13_bn/cond/Switch_1:1*
T0*
N*2
_output_shapes 
:??????????: 
q
conv_pw_13_relu/ReluReluconv_pw_13_bn/cond/Merge*0
_output_shapes
:??????????*
T0
Z
conv_pw_13_relu/ConstConst*
valueB
 *  ?@*
dtype0*
_output_shapes
: 
?
conv_pw_13_relu/MinimumMinimumconv_pw_13_relu/Reluconv_pw_13_relu/Const*
T0*0
_output_shapes
:??????????
?
1global_average_pooling2d_1/Mean/reduction_indicesConst*
valueB"      *
dtype0*
_output_shapes
:
?
global_average_pooling2d_1/MeanMeanconv_pw_13_relu/Minimum1global_average_pooling2d_1/Mean/reduction_indices*
	keep_dims( *

Tidx0*
T0*(
_output_shapes
:??????????
r
dropout_1/IdentityIdentityglobal_average_pooling2d_1/Mean*(
_output_shapes
:??????????*
T0
m
dense_1/random_uniform/shapeConst*
valueB"   
   *
dtype0*
_output_shapes
:
_
dense_1/random_uniform/minConst*
valueB
 *???*
dtype0*
_output_shapes
: 
_
dense_1/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *??=
?
$dense_1/random_uniform/RandomUniformRandomUniformdense_1/random_uniform/shape*
seed???)*
T0*
dtype0*
_output_shapes
:	?
*
seed2??:
z
dense_1/random_uniform/subSubdense_1/random_uniform/maxdense_1/random_uniform/min*
T0*
_output_shapes
: 
?
dense_1/random_uniform/mulMul$dense_1/random_uniform/RandomUniformdense_1/random_uniform/sub*
_output_shapes
:	?
*
T0

dense_1/random_uniformAdddense_1/random_uniform/muldense_1/random_uniform/min*
T0*
_output_shapes
:	?

?
dense_1/kernel
VariableV2*
shape:	?
*
shared_name *
dtype0*
_output_shapes
:	?
*
	container 
?
dense_1/kernel/AssignAssigndense_1/kerneldense_1/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(*
_output_shapes
:	?

|
dense_1/kernel/readIdentitydense_1/kernel*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	?

Z
dense_1/ConstConst*
valueB
*    *
dtype0*
_output_shapes
:

x
dense_1/bias
VariableV2*
shape:
*
shared_name *
dtype0*
_output_shapes
:
*
	container 
?
dense_1/bias/AssignAssigndense_1/biasdense_1/Const*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:

q
dense_1/bias/readIdentitydense_1/bias*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:

?
dense_1/MatMulMatMuldropout_1/Identitydense_1/kernel/read*'
_output_shapes
:?????????
*
transpose_a( *
transpose_b( *
T0
?
dense_1/BiasAddBiasAdddense_1/MatMuldense_1/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:?????????

]
dense_1/SoftmaxSoftmaxdense_1/BiasAdd*
T0*'
_output_shapes
:?????????

l
PlaceholderPlaceholder*
shape: *
dtype0*&
_output_shapes
: 
?
AssignAssignconv1/kernelPlaceholder*
_class
loc:@conv1/kernel*
validate_shape(*&
_output_shapes
: *
use_locking( *
T0
V
Placeholder_1Placeholder*
_output_shapes
: *
shape: *
dtype0
?
Assign_1Assignconv1_bn/gammaPlaceholder_1*
validate_shape(*
_output_shapes
: *
use_locking( *
T0*!
_class
loc:@conv1_bn/gamma
V
Placeholder_2Placeholder*
dtype0*
_output_shapes
: *
shape: 
?
Assign_2Assignconv1_bn/betaPlaceholder_2*
_output_shapes
: *
use_locking( *
T0* 
_class
loc:@conv1_bn/beta*
validate_shape(
V
Placeholder_3Placeholder*
_output_shapes
: *
shape: *
dtype0
?
Assign_3Assignconv1_bn/moving_meanPlaceholder_3*
use_locking( *
T0*'
_class
loc:@conv1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
V
Placeholder_4Placeholder*
dtype0*
_output_shapes
: *
shape: 
?
Assign_4Assignconv1_bn/moving_variancePlaceholder_4*
validate_shape(*
_output_shapes
: *
use_locking( *
T0*+
_class!
loc:@conv1_bn/moving_variance
n
Placeholder_5Placeholder*
dtype0*&
_output_shapes
: *
shape: 
?
Assign_5Assignconv_dw_1/depthwise_kernelPlaceholder_5*
use_locking( *
T0*-
_class#
!loc:@conv_dw_1/depthwise_kernel*
validate_shape(*&
_output_shapes
: 
V
Placeholder_6Placeholder*
dtype0*
_output_shapes
: *
shape: 
?
Assign_6Assignconv_dw_1_bn/gammaPlaceholder_6*
use_locking( *
T0*%
_class
loc:@conv_dw_1_bn/gamma*
validate_shape(*
_output_shapes
: 
V
Placeholder_7Placeholder*
dtype0*
_output_shapes
: *
shape: 
?
Assign_7Assignconv_dw_1_bn/betaPlaceholder_7*
use_locking( *
T0*$
_class
loc:@conv_dw_1_bn/beta*
validate_shape(*
_output_shapes
: 
V
Placeholder_8Placeholder*
shape: *
dtype0*
_output_shapes
: 
?
Assign_8Assignconv_dw_1_bn/moving_meanPlaceholder_8*
validate_shape(*
_output_shapes
: *
use_locking( *
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean
V
Placeholder_9Placeholder*
dtype0*
_output_shapes
: *
shape: 
?
Assign_9Assignconv_dw_1_bn/moving_variancePlaceholder_9*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
o
Placeholder_10Placeholder*
dtype0*&
_output_shapes
: @*
shape: @
?
	Assign_10Assignconv_pw_1/kernelPlaceholder_10*
validate_shape(*&
_output_shapes
: @*
use_locking( *
T0*#
_class
loc:@conv_pw_1/kernel
W
Placeholder_11Placeholder*
dtype0*
_output_shapes
:@*
shape:@
?
	Assign_11Assignconv_pw_1_bn/gammaPlaceholder_11*
use_locking( *
T0*%
_class
loc:@conv_pw_1_bn/gamma*
validate_shape(*
_output_shapes
:@
W
Placeholder_12Placeholder*
dtype0*
_output_shapes
:@*
shape:@
?
	Assign_12Assignconv_pw_1_bn/betaPlaceholder_12*
use_locking( *
T0*$
_class
loc:@conv_pw_1_bn/beta*
validate_shape(*
_output_shapes
:@
W
Placeholder_13Placeholder*
dtype0*
_output_shapes
:@*
shape:@
?
	Assign_13Assignconv_pw_1_bn/moving_meanPlaceholder_13*
use_locking( *
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
validate_shape(*
_output_shapes
:@
W
Placeholder_14Placeholder*
dtype0*
_output_shapes
:@*
shape:@
?
	Assign_14Assignconv_pw_1_bn/moving_variancePlaceholder_14*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
validate_shape(*
_output_shapes
:@
o
Placeholder_15Placeholder*&
_output_shapes
:@*
shape:@*
dtype0
?
	Assign_15Assignconv_dw_2/depthwise_kernelPlaceholder_15*
use_locking( *
T0*-
_class#
!loc:@conv_dw_2/depthwise_kernel*
validate_shape(*&
_output_shapes
:@
W
Placeholder_16Placeholder*
dtype0*
_output_shapes
:@*
shape:@
?
	Assign_16Assignconv_dw_2_bn/gammaPlaceholder_16*
validate_shape(*
_output_shapes
:@*
use_locking( *
T0*%
_class
loc:@conv_dw_2_bn/gamma
W
Placeholder_17Placeholder*
shape:@*
dtype0*
_output_shapes
:@
?
	Assign_17Assignconv_dw_2_bn/betaPlaceholder_17*
use_locking( *
T0*$
_class
loc:@conv_dw_2_bn/beta*
validate_shape(*
_output_shapes
:@
W
Placeholder_18Placeholder*
dtype0*
_output_shapes
:@*
shape:@
?
	Assign_18Assignconv_dw_2_bn/moving_meanPlaceholder_18*
use_locking( *
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
validate_shape(*
_output_shapes
:@
W
Placeholder_19Placeholder*
_output_shapes
:@*
shape:@*
dtype0
?
	Assign_19Assignconv_dw_2_bn/moving_variancePlaceholder_19*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
validate_shape(*
_output_shapes
:@
q
Placeholder_20Placeholder*
dtype0*'
_output_shapes
:@?*
shape:@?
?
	Assign_20Assignconv_pw_2/kernelPlaceholder_20*
validate_shape(*'
_output_shapes
:@?*
use_locking( *
T0*#
_class
loc:@conv_pw_2/kernel
Y
Placeholder_21Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_21Assignconv_pw_2_bn/gammaPlaceholder_21*
use_locking( *
T0*%
_class
loc:@conv_pw_2_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_22Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_22Assignconv_pw_2_bn/betaPlaceholder_22*
T0*$
_class
loc:@conv_pw_2_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Y
Placeholder_23Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_23Assignconv_pw_2_bn/moving_meanPlaceholder_23*
use_locking( *
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_24Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_24Assignconv_pw_2_bn/moving_variancePlaceholder_24*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
validate_shape(
q
Placeholder_25Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?
	Assign_25Assignconv_dw_3/depthwise_kernelPlaceholder_25*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0*-
_class#
!loc:@conv_dw_3/depthwise_kernel
Y
Placeholder_26Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_26Assignconv_dw_3_bn/gammaPlaceholder_26*%
_class
loc:@conv_dw_3_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Y
Placeholder_27Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_27Assignconv_dw_3_bn/betaPlaceholder_27*
T0*$
_class
loc:@conv_dw_3_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Y
Placeholder_28Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_28Assignconv_dw_3_bn/moving_meanPlaceholder_28*
use_locking( *
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_29Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_29Assignconv_dw_3_bn/moving_variancePlaceholder_29*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
s
Placeholder_30Placeholder*
shape:??*
dtype0*(
_output_shapes
:??
?
	Assign_30Assignconv_pw_3/kernelPlaceholder_30*
T0*#
_class
loc:@conv_pw_3/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking( 
Y
Placeholder_31Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_31Assignconv_pw_3_bn/gammaPlaceholder_31*
use_locking( *
T0*%
_class
loc:@conv_pw_3_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_32Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_32Assignconv_pw_3_bn/betaPlaceholder_32*
use_locking( *
T0*$
_class
loc:@conv_pw_3_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_33Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_33Assignconv_pw_3_bn/moving_meanPlaceholder_33*
use_locking( *
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_34Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_34Assignconv_pw_3_bn/moving_variancePlaceholder_34*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
q
Placeholder_35Placeholder*
shape:?*
dtype0*'
_output_shapes
:?
?
	Assign_35Assignconv_dw_4/depthwise_kernelPlaceholder_35*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0*-
_class#
!loc:@conv_dw_4/depthwise_kernel
Y
Placeholder_36Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_36Assignconv_dw_4_bn/gammaPlaceholder_36*
T0*%
_class
loc:@conv_dw_4_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Y
Placeholder_37Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_37Assignconv_dw_4_bn/betaPlaceholder_37*$
_class
loc:@conv_dw_4_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Y
Placeholder_38Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_38Assignconv_dw_4_bn/moving_meanPlaceholder_38*
use_locking( *
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_39Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_39Assignconv_dw_4_bn/moving_variancePlaceholder_39*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
validate_shape(
s
Placeholder_40Placeholder*
shape:??*
dtype0*(
_output_shapes
:??
?
	Assign_40Assignconv_pw_4/kernelPlaceholder_40*(
_output_shapes
:??*
use_locking( *
T0*#
_class
loc:@conv_pw_4/kernel*
validate_shape(
Y
Placeholder_41Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_41Assignconv_pw_4_bn/gammaPlaceholder_41*
T0*%
_class
loc:@conv_pw_4_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Y
Placeholder_42Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_42Assignconv_pw_4_bn/betaPlaceholder_42*$
_class
loc:@conv_pw_4_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Y
Placeholder_43Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_43Assignconv_pw_4_bn/moving_meanPlaceholder_43*
use_locking( *
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_44Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_44Assignconv_pw_4_bn/moving_variancePlaceholder_44*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking( 
q
Placeholder_45Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?
	Assign_45Assignconv_dw_5/depthwise_kernelPlaceholder_45*-
_class#
!loc:@conv_dw_5/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0
Y
Placeholder_46Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_46Assignconv_dw_5_bn/gammaPlaceholder_46*
T0*%
_class
loc:@conv_dw_5_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Y
Placeholder_47Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_47Assignconv_dw_5_bn/betaPlaceholder_47*
use_locking( *
T0*$
_class
loc:@conv_dw_5_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_48Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_48Assignconv_dw_5_bn/moving_meanPlaceholder_48*
use_locking( *
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_49Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_49Assignconv_dw_5_bn/moving_variancePlaceholder_49*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking( 
s
Placeholder_50Placeholder*
dtype0*(
_output_shapes
:??*
shape:??
?
	Assign_50Assignconv_pw_5/kernelPlaceholder_50*#
_class
loc:@conv_pw_5/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking( *
T0
Y
Placeholder_51Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_51Assignconv_pw_5_bn/gammaPlaceholder_51*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*%
_class
loc:@conv_pw_5_bn/gamma
Y
Placeholder_52Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_52Assignconv_pw_5_bn/betaPlaceholder_52*
use_locking( *
T0*$
_class
loc:@conv_pw_5_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_53Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_53Assignconv_pw_5_bn/moving_meanPlaceholder_53*
use_locking( *
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_54Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_54Assignconv_pw_5_bn/moving_variancePlaceholder_54*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
q
Placeholder_55Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?
	Assign_55Assignconv_dw_6/depthwise_kernelPlaceholder_55*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0*-
_class#
!loc:@conv_dw_6/depthwise_kernel
Y
Placeholder_56Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_56Assignconv_dw_6_bn/gammaPlaceholder_56*
use_locking( *
T0*%
_class
loc:@conv_dw_6_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_57Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_57Assignconv_dw_6_bn/betaPlaceholder_57*$
_class
loc:@conv_dw_6_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Y
Placeholder_58Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_58Assignconv_dw_6_bn/moving_meanPlaceholder_58*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
Y
Placeholder_59Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_59Assignconv_dw_6_bn/moving_variancePlaceholder_59*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
s
Placeholder_60Placeholder*
dtype0*(
_output_shapes
:??*
shape:??
?
	Assign_60Assignconv_pw_6/kernelPlaceholder_60*
T0*#
_class
loc:@conv_pw_6/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking( 
Y
Placeholder_61Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_61Assignconv_pw_6_bn/gammaPlaceholder_61*
T0*%
_class
loc:@conv_pw_6_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Y
Placeholder_62Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_62Assignconv_pw_6_bn/betaPlaceholder_62*
use_locking( *
T0*$
_class
loc:@conv_pw_6_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_63Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_63Assignconv_pw_6_bn/moving_meanPlaceholder_63*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Y
Placeholder_64Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_64Assignconv_pw_6_bn/moving_variancePlaceholder_64*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
q
Placeholder_65Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?
	Assign_65Assignconv_dw_7/depthwise_kernelPlaceholder_65*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0*-
_class#
!loc:@conv_dw_7/depthwise_kernel
Y
Placeholder_66Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_66Assignconv_dw_7_bn/gammaPlaceholder_66*
use_locking( *
T0*%
_class
loc:@conv_dw_7_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_67Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_67Assignconv_dw_7_bn/betaPlaceholder_67*
use_locking( *
T0*$
_class
loc:@conv_dw_7_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_68Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_68Assignconv_dw_7_bn/moving_meanPlaceholder_68*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean
Y
Placeholder_69Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_69Assignconv_dw_7_bn/moving_variancePlaceholder_69*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
s
Placeholder_70Placeholder*
dtype0*(
_output_shapes
:??*
shape:??
?
	Assign_70Assignconv_pw_7/kernelPlaceholder_70*
use_locking( *
T0*#
_class
loc:@conv_pw_7/kernel*
validate_shape(*(
_output_shapes
:??
Y
Placeholder_71Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_71Assignconv_pw_7_bn/gammaPlaceholder_71*
use_locking( *
T0*%
_class
loc:@conv_pw_7_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_72Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_72Assignconv_pw_7_bn/betaPlaceholder_72*
use_locking( *
T0*$
_class
loc:@conv_pw_7_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_73Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_73Assignconv_pw_7_bn/moving_meanPlaceholder_73*+
_class!
loc:@conv_pw_7_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Y
Placeholder_74Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_74Assignconv_pw_7_bn/moving_variancePlaceholder_74*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
q
Placeholder_75Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?
	Assign_75Assignconv_dw_8/depthwise_kernelPlaceholder_75*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0*-
_class#
!loc:@conv_dw_8/depthwise_kernel
Y
Placeholder_76Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_76Assignconv_dw_8_bn/gammaPlaceholder_76*
use_locking( *
T0*%
_class
loc:@conv_dw_8_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_77Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_77Assignconv_dw_8_bn/betaPlaceholder_77*
_output_shapes	
:?*
use_locking( *
T0*$
_class
loc:@conv_dw_8_bn/beta*
validate_shape(
Y
Placeholder_78Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_78Assignconv_dw_8_bn/moving_meanPlaceholder_78*
use_locking( *
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_79Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_79Assignconv_dw_8_bn/moving_variancePlaceholder_79*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
s
Placeholder_80Placeholder*
dtype0*(
_output_shapes
:??*
shape:??
?
	Assign_80Assignconv_pw_8/kernelPlaceholder_80*
use_locking( *
T0*#
_class
loc:@conv_pw_8/kernel*
validate_shape(*(
_output_shapes
:??
Y
Placeholder_81Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_81Assignconv_pw_8_bn/gammaPlaceholder_81*
use_locking( *
T0*%
_class
loc:@conv_pw_8_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_82Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_82Assignconv_pw_8_bn/betaPlaceholder_82*$
_class
loc:@conv_pw_8_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Y
Placeholder_83Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_83Assignconv_pw_8_bn/moving_meanPlaceholder_83*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean
Y
Placeholder_84Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_84Assignconv_pw_8_bn/moving_variancePlaceholder_84*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
q
Placeholder_85Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?
	Assign_85Assignconv_dw_9/depthwise_kernelPlaceholder_85*-
_class#
!loc:@conv_dw_9/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0
Y
Placeholder_86Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_86Assignconv_dw_9_bn/gammaPlaceholder_86*
use_locking( *
T0*%
_class
loc:@conv_dw_9_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_87Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_87Assignconv_dw_9_bn/betaPlaceholder_87*
use_locking( *
T0*$
_class
loc:@conv_dw_9_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_88Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_88Assignconv_dw_9_bn/moving_meanPlaceholder_88*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean
Y
Placeholder_89Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_89Assignconv_dw_9_bn/moving_variancePlaceholder_89*
use_locking( *
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
s
Placeholder_90Placeholder*
shape:??*
dtype0*(
_output_shapes
:??
?
	Assign_90Assignconv_pw_9/kernelPlaceholder_90*
use_locking( *
T0*#
_class
loc:@conv_pw_9/kernel*
validate_shape(*(
_output_shapes
:??
Y
Placeholder_91Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?
	Assign_91Assignconv_pw_9_bn/gammaPlaceholder_91*
use_locking( *
T0*%
_class
loc:@conv_pw_9_bn/gamma*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_92Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_92Assignconv_pw_9_bn/betaPlaceholder_92*
use_locking( *
T0*$
_class
loc:@conv_pw_9_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_93Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_93Assignconv_pw_9_bn/moving_meanPlaceholder_93*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean
Y
Placeholder_94Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?
	Assign_94Assignconv_pw_9_bn/moving_variancePlaceholder_94*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance
q
Placeholder_95Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?
	Assign_95Assignconv_dw_10/depthwise_kernelPlaceholder_95*
use_locking( *
T0*.
_class$
" loc:@conv_dw_10/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
Y
Placeholder_96Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_96Assignconv_dw_10_bn/gammaPlaceholder_96*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*&
_class
loc:@conv_dw_10_bn/gamma
Y
Placeholder_97Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_97Assignconv_dw_10_bn/betaPlaceholder_97*
use_locking( *
T0*%
_class
loc:@conv_dw_10_bn/beta*
validate_shape(*
_output_shapes	
:?
Y
Placeholder_98Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_98Assignconv_dw_10_bn/moving_meanPlaceholder_98*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean
Y
Placeholder_99Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?
	Assign_99Assignconv_dw_10_bn/moving_variancePlaceholder_99*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
t
Placeholder_100Placeholder*
dtype0*(
_output_shapes
:??*
shape:??
?

Assign_100Assignconv_pw_10/kernelPlaceholder_100*
T0*$
_class
loc:@conv_pw_10/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking( 
Z
Placeholder_101Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_101Assignconv_pw_10_bn/gammaPlaceholder_101*
T0*&
_class
loc:@conv_pw_10_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Z
Placeholder_102Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_102Assignconv_pw_10_bn/betaPlaceholder_102*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*%
_class
loc:@conv_pw_10_bn/beta
Z
Placeholder_103Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_103Assignconv_pw_10_bn/moving_meanPlaceholder_103*
use_locking( *
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_104Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_104Assignconv_pw_10_bn/moving_variancePlaceholder_104*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
r
Placeholder_105Placeholder*
shape:?*
dtype0*'
_output_shapes
:?
?

Assign_105Assignconv_dw_11/depthwise_kernelPlaceholder_105*
use_locking( *
T0*.
_class$
" loc:@conv_dw_11/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
Z
Placeholder_106Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_106Assignconv_dw_11_bn/gammaPlaceholder_106*
T0*&
_class
loc:@conv_dw_11_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Z
Placeholder_107Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_107Assignconv_dw_11_bn/betaPlaceholder_107*%
_class
loc:@conv_dw_11_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Z
Placeholder_108Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_108Assignconv_dw_11_bn/moving_meanPlaceholder_108*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Z
Placeholder_109Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_109Assignconv_dw_11_bn/moving_variancePlaceholder_109*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
t
Placeholder_110Placeholder*
dtype0*(
_output_shapes
:??*
shape:??
?

Assign_110Assignconv_pw_11/kernelPlaceholder_110*
use_locking( *
T0*$
_class
loc:@conv_pw_11/kernel*
validate_shape(*(
_output_shapes
:??
Z
Placeholder_111Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_111Assignconv_pw_11_bn/gammaPlaceholder_111*
use_locking( *
T0*&
_class
loc:@conv_pw_11_bn/gamma*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_112Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_112Assignconv_pw_11_bn/betaPlaceholder_112*
use_locking( *
T0*%
_class
loc:@conv_pw_11_bn/beta*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_113Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_113Assignconv_pw_11_bn/moving_meanPlaceholder_113*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean
Z
Placeholder_114Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_114Assignconv_pw_11_bn/moving_variancePlaceholder_114*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
r
Placeholder_115Placeholder*
dtype0*'
_output_shapes
:?*
shape:?
?

Assign_115Assignconv_dw_12/depthwise_kernelPlaceholder_115*
use_locking( *
T0*.
_class$
" loc:@conv_dw_12/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
Z
Placeholder_116Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_116Assignconv_dw_12_bn/gammaPlaceholder_116*
T0*&
_class
loc:@conv_dw_12_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Z
Placeholder_117Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?

Assign_117Assignconv_dw_12_bn/betaPlaceholder_117*
_output_shapes	
:?*
use_locking( *
T0*%
_class
loc:@conv_dw_12_bn/beta*
validate_shape(
Z
Placeholder_118Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_118Assignconv_dw_12_bn/moving_meanPlaceholder_118*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0
Z
Placeholder_119Placeholder*
_output_shapes	
:?*
shape:?*
dtype0
?

Assign_119Assignconv_dw_12_bn/moving_variancePlaceholder_119*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
t
Placeholder_120Placeholder*
dtype0*(
_output_shapes
:??*
shape:??
?

Assign_120Assignconv_pw_12/kernelPlaceholder_120*
validate_shape(*(
_output_shapes
:??*
use_locking( *
T0*$
_class
loc:@conv_pw_12/kernel
Z
Placeholder_121Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_121Assignconv_pw_12_bn/gammaPlaceholder_121*
use_locking( *
T0*&
_class
loc:@conv_pw_12_bn/gamma*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_122Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_122Assignconv_pw_12_bn/betaPlaceholder_122*
use_locking( *
T0*%
_class
loc:@conv_pw_12_bn/beta*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_123Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_123Assignconv_pw_12_bn/moving_meanPlaceholder_123*
use_locking( *
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_124Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_124Assignconv_pw_12_bn/moving_variancePlaceholder_124*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance
r
Placeholder_125Placeholder*'
_output_shapes
:?*
shape:?*
dtype0
?

Assign_125Assignconv_dw_13/depthwise_kernelPlaceholder_125*.
_class$
" loc:@conv_dw_13/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking( *
T0
Z
Placeholder_126Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_126Assignconv_dw_13_bn/gammaPlaceholder_126*
use_locking( *
T0*&
_class
loc:@conv_dw_13_bn/gamma*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_127Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_127Assignconv_dw_13_bn/betaPlaceholder_127*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*%
_class
loc:@conv_dw_13_bn/beta
Z
Placeholder_128Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_128Assignconv_dw_13_bn/moving_meanPlaceholder_128*
validate_shape(*
_output_shapes	
:?*
use_locking( *
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean
Z
Placeholder_129Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_129Assignconv_dw_13_bn/moving_variancePlaceholder_129*
use_locking( *
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
t
Placeholder_130Placeholder*
shape:??*
dtype0*(
_output_shapes
:??
?

Assign_130Assignconv_pw_13/kernelPlaceholder_130*
use_locking( *
T0*$
_class
loc:@conv_pw_13/kernel*
validate_shape(*(
_output_shapes
:??
Z
Placeholder_131Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_131Assignconv_pw_13_bn/gammaPlaceholder_131*
use_locking( *
T0*&
_class
loc:@conv_pw_13_bn/gamma*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_132Placeholder*
dtype0*
_output_shapes	
:?*
shape:?
?

Assign_132Assignconv_pw_13_bn/betaPlaceholder_132*
T0*%
_class
loc:@conv_pw_13_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking( 
Z
Placeholder_133Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_133Assignconv_pw_13_bn/moving_meanPlaceholder_133*
use_locking( *
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
Z
Placeholder_134Placeholder*
shape:?*
dtype0*
_output_shapes	
:?
?

Assign_134Assignconv_pw_13_bn/moving_variancePlaceholder_134*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking( 
b
Placeholder_135Placeholder*
dtype0*
_output_shapes
:	?
*
shape:	?

?

Assign_135Assigndense_1/kernelPlaceholder_135*
use_locking( *
T0*!
_class
loc:@dense_1/kernel*
validate_shape(*
_output_shapes
:	?

X
Placeholder_136Placeholder*
dtype0*
_output_shapes
:
*
shape:

?

Assign_136Assigndense_1/biasPlaceholder_136*
use_locking( *
T0*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:

?
IsVariableInitializedIsVariableInitializedconv1_bn/moving_mean/biased*'
_class
loc:@conv1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_1IsVariableInitializedconv1_bn/moving_mean/local_step*'
_class
loc:@conv1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_2IsVariableInitializedconv1_bn/moving_variance/biased*
dtype0*
_output_shapes
: *+
_class!
loc:@conv1_bn/moving_variance
?
IsVariableInitialized_3IsVariableInitialized#conv1_bn/moving_variance/local_step*
dtype0*
_output_shapes
: *+
_class!
loc:@conv1_bn/moving_variance
?
IsVariableInitialized_4IsVariableInitializedconv_dw_1/depthwise_kernel*-
_class#
!loc:@conv_dw_1/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_5IsVariableInitializedconv_dw_1_bn/gamma*%
_class
loc:@conv_dw_1_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_6IsVariableInitializedconv_dw_1_bn/beta*$
_class
loc:@conv_dw_1_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_7IsVariableInitializedconv_dw_1_bn/moving_mean*+
_class!
loc:@conv_dw_1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_8IsVariableInitializedconv_dw_1_bn/moving_variance*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_9IsVariableInitializedconv_dw_1_bn/moving_mean/biased*+
_class!
loc:@conv_dw_1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_10IsVariableInitialized#conv_dw_1_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_11IsVariableInitialized#conv_dw_1_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_12IsVariableInitialized'conv_dw_1_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_13IsVariableInitializedconv_pw_1/kernel*#
_class
loc:@conv_pw_1/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_14IsVariableInitializedconv_pw_1_bn/gamma*
dtype0*
_output_shapes
: *%
_class
loc:@conv_pw_1_bn/gamma
?
IsVariableInitialized_15IsVariableInitializedconv_pw_1_bn/beta*$
_class
loc:@conv_pw_1_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_16IsVariableInitializedconv_pw_1_bn/moving_mean*+
_class!
loc:@conv_pw_1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_17IsVariableInitializedconv_pw_1_bn/moving_variance*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_18IsVariableInitializedconv_pw_1_bn/moving_mean/biased*
_output_shapes
: *+
_class!
loc:@conv_pw_1_bn/moving_mean*
dtype0
?
IsVariableInitialized_19IsVariableInitialized#conv_pw_1_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_1_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_20IsVariableInitialized#conv_pw_1_bn/moving_variance/biased*
_output_shapes
: */
_class%
#!loc:@conv_pw_1_bn/moving_variance*
dtype0
?
IsVariableInitialized_21IsVariableInitialized'conv_pw_1_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_22IsVariableInitializedconv_dw_2/depthwise_kernel*-
_class#
!loc:@conv_dw_2/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_23IsVariableInitializedconv_dw_2_bn/gamma*%
_class
loc:@conv_dw_2_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_24IsVariableInitializedconv_dw_2_bn/beta*$
_class
loc:@conv_dw_2_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_25IsVariableInitializedconv_dw_2_bn/moving_mean*+
_class!
loc:@conv_dw_2_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_26IsVariableInitializedconv_dw_2_bn/moving_variance*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_27IsVariableInitializedconv_dw_2_bn/moving_mean/biased*+
_class!
loc:@conv_dw_2_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_28IsVariableInitialized#conv_dw_2_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_2_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_29IsVariableInitialized#conv_dw_2_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_30IsVariableInitialized'conv_dw_2_bn/moving_variance/local_step*
_output_shapes
: */
_class%
#!loc:@conv_dw_2_bn/moving_variance*
dtype0
?
IsVariableInitialized_31IsVariableInitializedconv_pw_2/kernel*#
_class
loc:@conv_pw_2/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_32IsVariableInitializedconv_pw_2_bn/gamma*%
_class
loc:@conv_pw_2_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_33IsVariableInitializedconv_pw_2_bn/beta*$
_class
loc:@conv_pw_2_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_34IsVariableInitializedconv_pw_2_bn/moving_mean*+
_class!
loc:@conv_pw_2_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_35IsVariableInitializedconv_pw_2_bn/moving_variance*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_36IsVariableInitializedconv_pw_2_bn/moving_mean/biased*+
_class!
loc:@conv_pw_2_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_37IsVariableInitialized#conv_pw_2_bn/moving_mean/local_step*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_pw_2_bn/moving_mean
?
IsVariableInitialized_38IsVariableInitialized#conv_pw_2_bn/moving_variance/biased*
_output_shapes
: */
_class%
#!loc:@conv_pw_2_bn/moving_variance*
dtype0
?
IsVariableInitialized_39IsVariableInitialized'conv_pw_2_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_40IsVariableInitializedconv_dw_3/depthwise_kernel*
_output_shapes
: *-
_class#
!loc:@conv_dw_3/depthwise_kernel*
dtype0
?
IsVariableInitialized_41IsVariableInitializedconv_dw_3_bn/gamma*
dtype0*
_output_shapes
: *%
_class
loc:@conv_dw_3_bn/gamma
?
IsVariableInitialized_42IsVariableInitializedconv_dw_3_bn/beta*$
_class
loc:@conv_dw_3_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_43IsVariableInitializedconv_dw_3_bn/moving_mean*+
_class!
loc:@conv_dw_3_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_44IsVariableInitializedconv_dw_3_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_3_bn/moving_variance
?
IsVariableInitialized_45IsVariableInitializedconv_dw_3_bn/moving_mean/biased*+
_class!
loc:@conv_dw_3_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_46IsVariableInitialized#conv_dw_3_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_3_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_47IsVariableInitialized#conv_dw_3_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_48IsVariableInitialized'conv_dw_3_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_49IsVariableInitializedconv_pw_3/kernel*#
_class
loc:@conv_pw_3/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_50IsVariableInitializedconv_pw_3_bn/gamma*%
_class
loc:@conv_pw_3_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_51IsVariableInitializedconv_pw_3_bn/beta*
_output_shapes
: *$
_class
loc:@conv_pw_3_bn/beta*
dtype0
?
IsVariableInitialized_52IsVariableInitializedconv_pw_3_bn/moving_mean*+
_class!
loc:@conv_pw_3_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_53IsVariableInitializedconv_pw_3_bn/moving_variance*
_output_shapes
: */
_class%
#!loc:@conv_pw_3_bn/moving_variance*
dtype0
?
IsVariableInitialized_54IsVariableInitializedconv_pw_3_bn/moving_mean/biased*+
_class!
loc:@conv_pw_3_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_55IsVariableInitialized#conv_pw_3_bn/moving_mean/local_step*
_output_shapes
: *+
_class!
loc:@conv_pw_3_bn/moving_mean*
dtype0
?
IsVariableInitialized_56IsVariableInitialized#conv_pw_3_bn/moving_variance/biased*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_pw_3_bn/moving_variance
?
IsVariableInitialized_57IsVariableInitialized'conv_pw_3_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_58IsVariableInitializedconv_dw_4/depthwise_kernel*-
_class#
!loc:@conv_dw_4/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_59IsVariableInitializedconv_dw_4_bn/gamma*%
_class
loc:@conv_dw_4_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_60IsVariableInitializedconv_dw_4_bn/beta*$
_class
loc:@conv_dw_4_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_61IsVariableInitializedconv_dw_4_bn/moving_mean*+
_class!
loc:@conv_dw_4_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_62IsVariableInitializedconv_dw_4_bn/moving_variance*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_63IsVariableInitializedconv_dw_4_bn/moving_mean/biased*+
_class!
loc:@conv_dw_4_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_64IsVariableInitialized#conv_dw_4_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_4_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_65IsVariableInitialized#conv_dw_4_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_66IsVariableInitialized'conv_dw_4_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_67IsVariableInitializedconv_pw_4/kernel*
_output_shapes
: *#
_class
loc:@conv_pw_4/kernel*
dtype0
?
IsVariableInitialized_68IsVariableInitializedconv_pw_4_bn/gamma*%
_class
loc:@conv_pw_4_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_69IsVariableInitializedconv_pw_4_bn/beta*
_output_shapes
: *$
_class
loc:@conv_pw_4_bn/beta*
dtype0
?
IsVariableInitialized_70IsVariableInitializedconv_pw_4_bn/moving_mean*+
_class!
loc:@conv_pw_4_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_71IsVariableInitializedconv_pw_4_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_pw_4_bn/moving_variance
?
IsVariableInitialized_72IsVariableInitializedconv_pw_4_bn/moving_mean/biased*+
_class!
loc:@conv_pw_4_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_73IsVariableInitialized#conv_pw_4_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_4_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_74IsVariableInitialized#conv_pw_4_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_75IsVariableInitialized'conv_pw_4_bn/moving_variance/local_step*
_output_shapes
: */
_class%
#!loc:@conv_pw_4_bn/moving_variance*
dtype0
?
IsVariableInitialized_76IsVariableInitializedconv_dw_5/depthwise_kernel*-
_class#
!loc:@conv_dw_5/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_77IsVariableInitializedconv_dw_5_bn/gamma*
_output_shapes
: *%
_class
loc:@conv_dw_5_bn/gamma*
dtype0
?
IsVariableInitialized_78IsVariableInitializedconv_dw_5_bn/beta*$
_class
loc:@conv_dw_5_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_79IsVariableInitializedconv_dw_5_bn/moving_mean*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_dw_5_bn/moving_mean
?
IsVariableInitialized_80IsVariableInitializedconv_dw_5_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_5_bn/moving_variance
?
IsVariableInitialized_81IsVariableInitializedconv_dw_5_bn/moving_mean/biased*+
_class!
loc:@conv_dw_5_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_82IsVariableInitialized#conv_dw_5_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_5_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_83IsVariableInitialized#conv_dw_5_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_84IsVariableInitialized'conv_dw_5_bn/moving_variance/local_step*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_5_bn/moving_variance
?
IsVariableInitialized_85IsVariableInitializedconv_pw_5/kernel*#
_class
loc:@conv_pw_5/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_86IsVariableInitializedconv_pw_5_bn/gamma*%
_class
loc:@conv_pw_5_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_87IsVariableInitializedconv_pw_5_bn/beta*
_output_shapes
: *$
_class
loc:@conv_pw_5_bn/beta*
dtype0
?
IsVariableInitialized_88IsVariableInitializedconv_pw_5_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_pw_5_bn/moving_mean*
dtype0
?
IsVariableInitialized_89IsVariableInitializedconv_pw_5_bn/moving_variance*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_90IsVariableInitializedconv_pw_5_bn/moving_mean/biased*+
_class!
loc:@conv_pw_5_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_91IsVariableInitialized#conv_pw_5_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_5_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_92IsVariableInitialized#conv_pw_5_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_93IsVariableInitialized'conv_pw_5_bn/moving_variance/local_step*
_output_shapes
: */
_class%
#!loc:@conv_pw_5_bn/moving_variance*
dtype0
?
IsVariableInitialized_94IsVariableInitializedconv_dw_6/depthwise_kernel*-
_class#
!loc:@conv_dw_6/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_95IsVariableInitializedconv_dw_6_bn/gamma*
_output_shapes
: *%
_class
loc:@conv_dw_6_bn/gamma*
dtype0
?
IsVariableInitialized_96IsVariableInitializedconv_dw_6_bn/beta*$
_class
loc:@conv_dw_6_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_97IsVariableInitializedconv_dw_6_bn/moving_mean*+
_class!
loc:@conv_dw_6_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_98IsVariableInitializedconv_dw_6_bn/moving_variance*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_99IsVariableInitializedconv_dw_6_bn/moving_mean/biased*+
_class!
loc:@conv_dw_6_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_100IsVariableInitialized#conv_dw_6_bn/moving_mean/local_step*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_dw_6_bn/moving_mean
?
IsVariableInitialized_101IsVariableInitialized#conv_dw_6_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_102IsVariableInitialized'conv_dw_6_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_103IsVariableInitializedconv_pw_6/kernel*#
_class
loc:@conv_pw_6/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_104IsVariableInitializedconv_pw_6_bn/gamma*%
_class
loc:@conv_pw_6_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_105IsVariableInitializedconv_pw_6_bn/beta*
_output_shapes
: *$
_class
loc:@conv_pw_6_bn/beta*
dtype0
?
IsVariableInitialized_106IsVariableInitializedconv_pw_6_bn/moving_mean*+
_class!
loc:@conv_pw_6_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_107IsVariableInitializedconv_pw_6_bn/moving_variance*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_108IsVariableInitializedconv_pw_6_bn/moving_mean/biased*+
_class!
loc:@conv_pw_6_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_109IsVariableInitialized#conv_pw_6_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_6_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_110IsVariableInitialized#conv_pw_6_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_111IsVariableInitialized'conv_pw_6_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_112IsVariableInitializedconv_dw_7/depthwise_kernel*-
_class#
!loc:@conv_dw_7/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_113IsVariableInitializedconv_dw_7_bn/gamma*%
_class
loc:@conv_dw_7_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_114IsVariableInitializedconv_dw_7_bn/beta*$
_class
loc:@conv_dw_7_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_115IsVariableInitializedconv_dw_7_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_dw_7_bn/moving_mean*
dtype0
?
IsVariableInitialized_116IsVariableInitializedconv_dw_7_bn/moving_variance*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
IsVariableInitialized_117IsVariableInitializedconv_dw_7_bn/moving_mean/biased*+
_class!
loc:@conv_dw_7_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_118IsVariableInitialized#conv_dw_7_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_7_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_119IsVariableInitialized#conv_dw_7_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_120IsVariableInitialized'conv_dw_7_bn/moving_variance/local_step*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_7_bn/moving_variance
?
IsVariableInitialized_121IsVariableInitializedconv_pw_7/kernel*
dtype0*
_output_shapes
: *#
_class
loc:@conv_pw_7/kernel
?
IsVariableInitialized_122IsVariableInitializedconv_pw_7_bn/gamma*%
_class
loc:@conv_pw_7_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_123IsVariableInitializedconv_pw_7_bn/beta*$
_class
loc:@conv_pw_7_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_124IsVariableInitializedconv_pw_7_bn/moving_mean*+
_class!
loc:@conv_pw_7_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_125IsVariableInitializedconv_pw_7_bn/moving_variance*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_126IsVariableInitializedconv_pw_7_bn/moving_mean/biased*+
_class!
loc:@conv_pw_7_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_127IsVariableInitialized#conv_pw_7_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_7_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_128IsVariableInitialized#conv_pw_7_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_129IsVariableInitialized'conv_pw_7_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_130IsVariableInitializedconv_dw_8/depthwise_kernel*-
_class#
!loc:@conv_dw_8/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_131IsVariableInitializedconv_dw_8_bn/gamma*
dtype0*
_output_shapes
: *%
_class
loc:@conv_dw_8_bn/gamma
?
IsVariableInitialized_132IsVariableInitializedconv_dw_8_bn/beta*$
_class
loc:@conv_dw_8_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_133IsVariableInitializedconv_dw_8_bn/moving_mean*+
_class!
loc:@conv_dw_8_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_134IsVariableInitializedconv_dw_8_bn/moving_variance*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_135IsVariableInitializedconv_dw_8_bn/moving_mean/biased*+
_class!
loc:@conv_dw_8_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_136IsVariableInitialized#conv_dw_8_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_8_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_137IsVariableInitialized#conv_dw_8_bn/moving_variance/biased*
dtype0*
_output_shapes
: */
_class%
#!loc:@conv_dw_8_bn/moving_variance
?
IsVariableInitialized_138IsVariableInitialized'conv_dw_8_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_139IsVariableInitializedconv_pw_8/kernel*#
_class
loc:@conv_pw_8/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_140IsVariableInitializedconv_pw_8_bn/gamma*%
_class
loc:@conv_pw_8_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_141IsVariableInitializedconv_pw_8_bn/beta*$
_class
loc:@conv_pw_8_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_142IsVariableInitializedconv_pw_8_bn/moving_mean*+
_class!
loc:@conv_pw_8_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_143IsVariableInitializedconv_pw_8_bn/moving_variance*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_144IsVariableInitializedconv_pw_8_bn/moving_mean/biased*+
_class!
loc:@conv_pw_8_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_145IsVariableInitialized#conv_pw_8_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_8_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_146IsVariableInitialized#conv_pw_8_bn/moving_variance/biased*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_147IsVariableInitialized'conv_pw_8_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_148IsVariableInitializedconv_dw_9/depthwise_kernel*-
_class#
!loc:@conv_dw_9/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_149IsVariableInitializedconv_dw_9_bn/gamma*%
_class
loc:@conv_dw_9_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_150IsVariableInitializedconv_dw_9_bn/beta*$
_class
loc:@conv_dw_9_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_151IsVariableInitializedconv_dw_9_bn/moving_mean*
_output_shapes
: *+
_class!
loc:@conv_dw_9_bn/moving_mean*
dtype0
?
IsVariableInitialized_152IsVariableInitializedconv_dw_9_bn/moving_variance*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_153IsVariableInitializedconv_dw_9_bn/moving_mean/biased*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_dw_9_bn/moving_mean
?
IsVariableInitialized_154IsVariableInitialized#conv_dw_9_bn/moving_mean/local_step*+
_class!
loc:@conv_dw_9_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_155IsVariableInitialized#conv_dw_9_bn/moving_variance/biased*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_156IsVariableInitialized'conv_dw_9_bn/moving_variance/local_step*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_157IsVariableInitializedconv_pw_9/kernel*#
_class
loc:@conv_pw_9/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_158IsVariableInitializedconv_pw_9_bn/gamma*
dtype0*
_output_shapes
: *%
_class
loc:@conv_pw_9_bn/gamma
?
IsVariableInitialized_159IsVariableInitializedconv_pw_9_bn/beta*
dtype0*
_output_shapes
: *$
_class
loc:@conv_pw_9_bn/beta
?
IsVariableInitialized_160IsVariableInitializedconv_pw_9_bn/moving_mean*+
_class!
loc:@conv_pw_9_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_161IsVariableInitializedconv_pw_9_bn/moving_variance*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_162IsVariableInitializedconv_pw_9_bn/moving_mean/biased*
dtype0*
_output_shapes
: *+
_class!
loc:@conv_pw_9_bn/moving_mean
?
IsVariableInitialized_163IsVariableInitialized#conv_pw_9_bn/moving_mean/local_step*+
_class!
loc:@conv_pw_9_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_164IsVariableInitialized#conv_pw_9_bn/moving_variance/biased*
_output_shapes
: */
_class%
#!loc:@conv_pw_9_bn/moving_variance*
dtype0
?
IsVariableInitialized_165IsVariableInitialized'conv_pw_9_bn/moving_variance/local_step*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_166IsVariableInitializedconv_dw_10/depthwise_kernel*.
_class$
" loc:@conv_dw_10/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_167IsVariableInitializedconv_dw_10_bn/gamma*&
_class
loc:@conv_dw_10_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_168IsVariableInitializedconv_dw_10_bn/beta*%
_class
loc:@conv_dw_10_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_169IsVariableInitializedconv_dw_10_bn/moving_mean*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_170IsVariableInitializedconv_dw_10_bn/moving_variance*
_output_shapes
: *0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
dtype0
?
IsVariableInitialized_171IsVariableInitialized conv_dw_10_bn/moving_mean/biased*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_172IsVariableInitialized$conv_dw_10_bn/moving_mean/local_step*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_173IsVariableInitialized$conv_dw_10_bn/moving_variance/biased*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_174IsVariableInitialized(conv_dw_10_bn/moving_variance/local_step*
_output_shapes
: *0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
dtype0
?
IsVariableInitialized_175IsVariableInitializedconv_pw_10/kernel*$
_class
loc:@conv_pw_10/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_176IsVariableInitializedconv_pw_10_bn/gamma*&
_class
loc:@conv_pw_10_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_177IsVariableInitializedconv_pw_10_bn/beta*%
_class
loc:@conv_pw_10_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_178IsVariableInitializedconv_pw_10_bn/moving_mean*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_179IsVariableInitializedconv_pw_10_bn/moving_variance*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_180IsVariableInitialized conv_pw_10_bn/moving_mean/biased*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_181IsVariableInitialized$conv_pw_10_bn/moving_mean/local_step*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_182IsVariableInitialized$conv_pw_10_bn/moving_variance/biased*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_183IsVariableInitialized(conv_pw_10_bn/moving_variance/local_step*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_184IsVariableInitializedconv_dw_11/depthwise_kernel*.
_class$
" loc:@conv_dw_11/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_185IsVariableInitializedconv_dw_11_bn/gamma*&
_class
loc:@conv_dw_11_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_186IsVariableInitializedconv_dw_11_bn/beta*%
_class
loc:@conv_dw_11_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_187IsVariableInitializedconv_dw_11_bn/moving_mean*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_188IsVariableInitializedconv_dw_11_bn/moving_variance*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_189IsVariableInitialized conv_dw_11_bn/moving_mean/biased*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_190IsVariableInitialized$conv_dw_11_bn/moving_mean/local_step*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_191IsVariableInitialized$conv_dw_11_bn/moving_variance/biased*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_192IsVariableInitialized(conv_dw_11_bn/moving_variance/local_step*
dtype0*
_output_shapes
: *0
_class&
$"loc:@conv_dw_11_bn/moving_variance
?
IsVariableInitialized_193IsVariableInitializedconv_pw_11/kernel*$
_class
loc:@conv_pw_11/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_194IsVariableInitializedconv_pw_11_bn/gamma*
_output_shapes
: *&
_class
loc:@conv_pw_11_bn/gamma*
dtype0
?
IsVariableInitialized_195IsVariableInitializedconv_pw_11_bn/beta*%
_class
loc:@conv_pw_11_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_196IsVariableInitializedconv_pw_11_bn/moving_mean*
_output_shapes
: *,
_class"
 loc:@conv_pw_11_bn/moving_mean*
dtype0
?
IsVariableInitialized_197IsVariableInitializedconv_pw_11_bn/moving_variance*
_output_shapes
: *0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
dtype0
?
IsVariableInitialized_198IsVariableInitialized conv_pw_11_bn/moving_mean/biased*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_199IsVariableInitialized$conv_pw_11_bn/moving_mean/local_step*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_200IsVariableInitialized$conv_pw_11_bn/moving_variance/biased*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_201IsVariableInitialized(conv_pw_11_bn/moving_variance/local_step*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_202IsVariableInitializedconv_dw_12/depthwise_kernel*
_output_shapes
: *.
_class$
" loc:@conv_dw_12/depthwise_kernel*
dtype0
?
IsVariableInitialized_203IsVariableInitializedconv_dw_12_bn/gamma*&
_class
loc:@conv_dw_12_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_204IsVariableInitializedconv_dw_12_bn/beta*%
_class
loc:@conv_dw_12_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_205IsVariableInitializedconv_dw_12_bn/moving_mean*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_206IsVariableInitializedconv_dw_12_bn/moving_variance*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_207IsVariableInitialized conv_dw_12_bn/moving_mean/biased*
_output_shapes
: *,
_class"
 loc:@conv_dw_12_bn/moving_mean*
dtype0
?
IsVariableInitialized_208IsVariableInitialized$conv_dw_12_bn/moving_mean/local_step*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_209IsVariableInitialized$conv_dw_12_bn/moving_variance/biased*
_output_shapes
: *0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
dtype0
?
IsVariableInitialized_210IsVariableInitialized(conv_dw_12_bn/moving_variance/local_step*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_211IsVariableInitializedconv_pw_12/kernel*$
_class
loc:@conv_pw_12/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_212IsVariableInitializedconv_pw_12_bn/gamma*&
_class
loc:@conv_pw_12_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_213IsVariableInitializedconv_pw_12_bn/beta*%
_class
loc:@conv_pw_12_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_214IsVariableInitializedconv_pw_12_bn/moving_mean*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_215IsVariableInitializedconv_pw_12_bn/moving_variance*
_output_shapes
: *0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
dtype0
?
IsVariableInitialized_216IsVariableInitialized conv_pw_12_bn/moving_mean/biased*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_217IsVariableInitialized$conv_pw_12_bn/moving_mean/local_step*
dtype0*
_output_shapes
: *,
_class"
 loc:@conv_pw_12_bn/moving_mean
?
IsVariableInitialized_218IsVariableInitialized$conv_pw_12_bn/moving_variance/biased*
dtype0*
_output_shapes
: *0
_class&
$"loc:@conv_pw_12_bn/moving_variance
?
IsVariableInitialized_219IsVariableInitialized(conv_pw_12_bn/moving_variance/local_step*
_output_shapes
: *0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
dtype0
?
IsVariableInitialized_220IsVariableInitializedconv_dw_13/depthwise_kernel*.
_class$
" loc:@conv_dw_13/depthwise_kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_221IsVariableInitializedconv_dw_13_bn/gamma*&
_class
loc:@conv_dw_13_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_222IsVariableInitializedconv_dw_13_bn/beta*%
_class
loc:@conv_dw_13_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_223IsVariableInitializedconv_dw_13_bn/moving_mean*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_224IsVariableInitializedconv_dw_13_bn/moving_variance*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_225IsVariableInitialized conv_dw_13_bn/moving_mean/biased*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_226IsVariableInitialized$conv_dw_13_bn/moving_mean/local_step*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_227IsVariableInitialized$conv_dw_13_bn/moving_variance/biased*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_228IsVariableInitialized(conv_dw_13_bn/moving_variance/local_step*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_229IsVariableInitializedconv_pw_13/kernel*$
_class
loc:@conv_pw_13/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_230IsVariableInitializedconv_pw_13_bn/gamma*&
_class
loc:@conv_pw_13_bn/gamma*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_231IsVariableInitializedconv_pw_13_bn/beta*%
_class
loc:@conv_pw_13_bn/beta*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_232IsVariableInitializedconv_pw_13_bn/moving_mean*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_233IsVariableInitializedconv_pw_13_bn/moving_variance*
dtype0*
_output_shapes
: *0
_class&
$"loc:@conv_pw_13_bn/moving_variance
?
IsVariableInitialized_234IsVariableInitialized conv_pw_13_bn/moving_mean/biased*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_235IsVariableInitialized$conv_pw_13_bn/moving_mean/local_step*
dtype0*
_output_shapes
: *,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
IsVariableInitialized_236IsVariableInitialized$conv_pw_13_bn/moving_variance/biased*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_237IsVariableInitialized(conv_pw_13_bn/moving_variance/local_step*
_output_shapes
: *0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
dtype0
?
IsVariableInitialized_238IsVariableInitializeddense_1/kernel*!
_class
loc:@dense_1/kernel*
dtype0*
_output_shapes
: 
?
IsVariableInitialized_239IsVariableInitializeddense_1/bias*
dtype0*
_output_shapes
: *
_class
loc:@dense_1/bias
?F
initNoOp#^conv1_bn/moving_mean/biased/Assign'^conv1_bn/moving_mean/local_step/Assign'^conv1_bn/moving_variance/biased/Assign+^conv1_bn/moving_variance/local_step/Assign"^conv_dw_1/depthwise_kernel/Assign#^conv_dw_10/depthwise_kernel/Assign^conv_dw_10_bn/beta/Assign^conv_dw_10_bn/gamma/Assign!^conv_dw_10_bn/moving_mean/Assign(^conv_dw_10_bn/moving_mean/biased/Assign,^conv_dw_10_bn/moving_mean/local_step/Assign%^conv_dw_10_bn/moving_variance/Assign,^conv_dw_10_bn/moving_variance/biased/Assign0^conv_dw_10_bn/moving_variance/local_step/Assign#^conv_dw_11/depthwise_kernel/Assign^conv_dw_11_bn/beta/Assign^conv_dw_11_bn/gamma/Assign!^conv_dw_11_bn/moving_mean/Assign(^conv_dw_11_bn/moving_mean/biased/Assign,^conv_dw_11_bn/moving_mean/local_step/Assign%^conv_dw_11_bn/moving_variance/Assign,^conv_dw_11_bn/moving_variance/biased/Assign0^conv_dw_11_bn/moving_variance/local_step/Assign#^conv_dw_12/depthwise_kernel/Assign^conv_dw_12_bn/beta/Assign^conv_dw_12_bn/gamma/Assign!^conv_dw_12_bn/moving_mean/Assign(^conv_dw_12_bn/moving_mean/biased/Assign,^conv_dw_12_bn/moving_mean/local_step/Assign%^conv_dw_12_bn/moving_variance/Assign,^conv_dw_12_bn/moving_variance/biased/Assign0^conv_dw_12_bn/moving_variance/local_step/Assign#^conv_dw_13/depthwise_kernel/Assign^conv_dw_13_bn/beta/Assign^conv_dw_13_bn/gamma/Assign!^conv_dw_13_bn/moving_mean/Assign(^conv_dw_13_bn/moving_mean/biased/Assign,^conv_dw_13_bn/moving_mean/local_step/Assign%^conv_dw_13_bn/moving_variance/Assign,^conv_dw_13_bn/moving_variance/biased/Assign0^conv_dw_13_bn/moving_variance/local_step/Assign^conv_dw_1_bn/beta/Assign^conv_dw_1_bn/gamma/Assign ^conv_dw_1_bn/moving_mean/Assign'^conv_dw_1_bn/moving_mean/biased/Assign+^conv_dw_1_bn/moving_mean/local_step/Assign$^conv_dw_1_bn/moving_variance/Assign+^conv_dw_1_bn/moving_variance/biased/Assign/^conv_dw_1_bn/moving_variance/local_step/Assign"^conv_dw_2/depthwise_kernel/Assign^conv_dw_2_bn/beta/Assign^conv_dw_2_bn/gamma/Assign ^conv_dw_2_bn/moving_mean/Assign'^conv_dw_2_bn/moving_mean/biased/Assign+^conv_dw_2_bn/moving_mean/local_step/Assign$^conv_dw_2_bn/moving_variance/Assign+^conv_dw_2_bn/moving_variance/biased/Assign/^conv_dw_2_bn/moving_variance/local_step/Assign"^conv_dw_3/depthwise_kernel/Assign^conv_dw_3_bn/beta/Assign^conv_dw_3_bn/gamma/Assign ^conv_dw_3_bn/moving_mean/Assign'^conv_dw_3_bn/moving_mean/biased/Assign+^conv_dw_3_bn/moving_mean/local_step/Assign$^conv_dw_3_bn/moving_variance/Assign+^conv_dw_3_bn/moving_variance/biased/Assign/^conv_dw_3_bn/moving_variance/local_step/Assign"^conv_dw_4/depthwise_kernel/Assign^conv_dw_4_bn/beta/Assign^conv_dw_4_bn/gamma/Assign ^conv_dw_4_bn/moving_mean/Assign'^conv_dw_4_bn/moving_mean/biased/Assign+^conv_dw_4_bn/moving_mean/local_step/Assign$^conv_dw_4_bn/moving_variance/Assign+^conv_dw_4_bn/moving_variance/biased/Assign/^conv_dw_4_bn/moving_variance/local_step/Assign"^conv_dw_5/depthwise_kernel/Assign^conv_dw_5_bn/beta/Assign^conv_dw_5_bn/gamma/Assign ^conv_dw_5_bn/moving_mean/Assign'^conv_dw_5_bn/moving_mean/biased/Assign+^conv_dw_5_bn/moving_mean/local_step/Assign$^conv_dw_5_bn/moving_variance/Assign+^conv_dw_5_bn/moving_variance/biased/Assign/^conv_dw_5_bn/moving_variance/local_step/Assign"^conv_dw_6/depthwise_kernel/Assign^conv_dw_6_bn/beta/Assign^conv_dw_6_bn/gamma/Assign ^conv_dw_6_bn/moving_mean/Assign'^conv_dw_6_bn/moving_mean/biased/Assign+^conv_dw_6_bn/moving_mean/local_step/Assign$^conv_dw_6_bn/moving_variance/Assign+^conv_dw_6_bn/moving_variance/biased/Assign/^conv_dw_6_bn/moving_variance/local_step/Assign"^conv_dw_7/depthwise_kernel/Assign^conv_dw_7_bn/beta/Assign^conv_dw_7_bn/gamma/Assign ^conv_dw_7_bn/moving_mean/Assign'^conv_dw_7_bn/moving_mean/biased/Assign+^conv_dw_7_bn/moving_mean/local_step/Assign$^conv_dw_7_bn/moving_variance/Assign+^conv_dw_7_bn/moving_variance/biased/Assign/^conv_dw_7_bn/moving_variance/local_step/Assign"^conv_dw_8/depthwise_kernel/Assign^conv_dw_8_bn/beta/Assign^conv_dw_8_bn/gamma/Assign ^conv_dw_8_bn/moving_mean/Assign'^conv_dw_8_bn/moving_mean/biased/Assign+^conv_dw_8_bn/moving_mean/local_step/Assign$^conv_dw_8_bn/moving_variance/Assign+^conv_dw_8_bn/moving_variance/biased/Assign/^conv_dw_8_bn/moving_variance/local_step/Assign"^conv_dw_9/depthwise_kernel/Assign^conv_dw_9_bn/beta/Assign^conv_dw_9_bn/gamma/Assign ^conv_dw_9_bn/moving_mean/Assign'^conv_dw_9_bn/moving_mean/biased/Assign+^conv_dw_9_bn/moving_mean/local_step/Assign$^conv_dw_9_bn/moving_variance/Assign+^conv_dw_9_bn/moving_variance/biased/Assign/^conv_dw_9_bn/moving_variance/local_step/Assign^conv_pw_1/kernel/Assign^conv_pw_10/kernel/Assign^conv_pw_10_bn/beta/Assign^conv_pw_10_bn/gamma/Assign!^conv_pw_10_bn/moving_mean/Assign(^conv_pw_10_bn/moving_mean/biased/Assign,^conv_pw_10_bn/moving_mean/local_step/Assign%^conv_pw_10_bn/moving_variance/Assign,^conv_pw_10_bn/moving_variance/biased/Assign0^conv_pw_10_bn/moving_variance/local_step/Assign^conv_pw_11/kernel/Assign^conv_pw_11_bn/beta/Assign^conv_pw_11_bn/gamma/Assign!^conv_pw_11_bn/moving_mean/Assign(^conv_pw_11_bn/moving_mean/biased/Assign,^conv_pw_11_bn/moving_mean/local_step/Assign%^conv_pw_11_bn/moving_variance/Assign,^conv_pw_11_bn/moving_variance/biased/Assign0^conv_pw_11_bn/moving_variance/local_step/Assign^conv_pw_12/kernel/Assign^conv_pw_12_bn/beta/Assign^conv_pw_12_bn/gamma/Assign!^conv_pw_12_bn/moving_mean/Assign(^conv_pw_12_bn/moving_mean/biased/Assign,^conv_pw_12_bn/moving_mean/local_step/Assign%^conv_pw_12_bn/moving_variance/Assign,^conv_pw_12_bn/moving_variance/biased/Assign0^conv_pw_12_bn/moving_variance/local_step/Assign^conv_pw_13/kernel/Assign^conv_pw_13_bn/beta/Assign^conv_pw_13_bn/gamma/Assign!^conv_pw_13_bn/moving_mean/Assign(^conv_pw_13_bn/moving_mean/biased/Assign,^conv_pw_13_bn/moving_mean/local_step/Assign%^conv_pw_13_bn/moving_variance/Assign,^conv_pw_13_bn/moving_variance/biased/Assign0^conv_pw_13_bn/moving_variance/local_step/Assign^conv_pw_1_bn/beta/Assign^conv_pw_1_bn/gamma/Assign ^conv_pw_1_bn/moving_mean/Assign'^conv_pw_1_bn/moving_mean/biased/Assign+^conv_pw_1_bn/moving_mean/local_step/Assign$^conv_pw_1_bn/moving_variance/Assign+^conv_pw_1_bn/moving_variance/biased/Assign/^conv_pw_1_bn/moving_variance/local_step/Assign^conv_pw_2/kernel/Assign^conv_pw_2_bn/beta/Assign^conv_pw_2_bn/gamma/Assign ^conv_pw_2_bn/moving_mean/Assign'^conv_pw_2_bn/moving_mean/biased/Assign+^conv_pw_2_bn/moving_mean/local_step/Assign$^conv_pw_2_bn/moving_variance/Assign+^conv_pw_2_bn/moving_variance/biased/Assign/^conv_pw_2_bn/moving_variance/local_step/Assign^conv_pw_3/kernel/Assign^conv_pw_3_bn/beta/Assign^conv_pw_3_bn/gamma/Assign ^conv_pw_3_bn/moving_mean/Assign'^conv_pw_3_bn/moving_mean/biased/Assign+^conv_pw_3_bn/moving_mean/local_step/Assign$^conv_pw_3_bn/moving_variance/Assign+^conv_pw_3_bn/moving_variance/biased/Assign/^conv_pw_3_bn/moving_variance/local_step/Assign^conv_pw_4/kernel/Assign^conv_pw_4_bn/beta/Assign^conv_pw_4_bn/gamma/Assign ^conv_pw_4_bn/moving_mean/Assign'^conv_pw_4_bn/moving_mean/biased/Assign+^conv_pw_4_bn/moving_mean/local_step/Assign$^conv_pw_4_bn/moving_variance/Assign+^conv_pw_4_bn/moving_variance/biased/Assign/^conv_pw_4_bn/moving_variance/local_step/Assign^conv_pw_5/kernel/Assign^conv_pw_5_bn/beta/Assign^conv_pw_5_bn/gamma/Assign ^conv_pw_5_bn/moving_mean/Assign'^conv_pw_5_bn/moving_mean/biased/Assign+^conv_pw_5_bn/moving_mean/local_step/Assign$^conv_pw_5_bn/moving_variance/Assign+^conv_pw_5_bn/moving_variance/biased/Assign/^conv_pw_5_bn/moving_variance/local_step/Assign^conv_pw_6/kernel/Assign^conv_pw_6_bn/beta/Assign^conv_pw_6_bn/gamma/Assign ^conv_pw_6_bn/moving_mean/Assign'^conv_pw_6_bn/moving_mean/biased/Assign+^conv_pw_6_bn/moving_mean/local_step/Assign$^conv_pw_6_bn/moving_variance/Assign+^conv_pw_6_bn/moving_variance/biased/Assign/^conv_pw_6_bn/moving_variance/local_step/Assign^conv_pw_7/kernel/Assign^conv_pw_7_bn/beta/Assign^conv_pw_7_bn/gamma/Assign ^conv_pw_7_bn/moving_mean/Assign'^conv_pw_7_bn/moving_mean/biased/Assign+^conv_pw_7_bn/moving_mean/local_step/Assign$^conv_pw_7_bn/moving_variance/Assign+^conv_pw_7_bn/moving_variance/biased/Assign/^conv_pw_7_bn/moving_variance/local_step/Assign^conv_pw_8/kernel/Assign^conv_pw_8_bn/beta/Assign^conv_pw_8_bn/gamma/Assign ^conv_pw_8_bn/moving_mean/Assign'^conv_pw_8_bn/moving_mean/biased/Assign+^conv_pw_8_bn/moving_mean/local_step/Assign$^conv_pw_8_bn/moving_variance/Assign+^conv_pw_8_bn/moving_variance/biased/Assign/^conv_pw_8_bn/moving_variance/local_step/Assign^conv_pw_9/kernel/Assign^conv_pw_9_bn/beta/Assign^conv_pw_9_bn/gamma/Assign ^conv_pw_9_bn/moving_mean/Assign'^conv_pw_9_bn/moving_mean/biased/Assign+^conv_pw_9_bn/moving_mean/local_step/Assign$^conv_pw_9_bn/moving_variance/Assign+^conv_pw_9_bn/moving_variance/biased/Assign/^conv_pw_9_bn/moving_variance/local_step/Assign^dense_1/bias/Assign^dense_1/kernel/Assign
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
?
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_b3601865007245d1998ad4577f5b5c07/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
?
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?9
save/SaveV2/tensor_namesConst"/device:CPU:0*?8
value?8B?8?Bconv1/kernelBconv1_bn/betaBconv1_bn/gammaBconv1_bn/moving_meanBconv1_bn/moving_mean/biasedBconv1_bn/moving_mean/local_stepBconv1_bn/moving_varianceBconv1_bn/moving_variance/biasedB#conv1_bn/moving_variance/local_stepBconv_dw_1/depthwise_kernelBconv_dw_10/depthwise_kernelBconv_dw_10_bn/betaBconv_dw_10_bn/gammaBconv_dw_10_bn/moving_meanB conv_dw_10_bn/moving_mean/biasedB$conv_dw_10_bn/moving_mean/local_stepBconv_dw_10_bn/moving_varianceB$conv_dw_10_bn/moving_variance/biasedB(conv_dw_10_bn/moving_variance/local_stepBconv_dw_11/depthwise_kernelBconv_dw_11_bn/betaBconv_dw_11_bn/gammaBconv_dw_11_bn/moving_meanB conv_dw_11_bn/moving_mean/biasedB$conv_dw_11_bn/moving_mean/local_stepBconv_dw_11_bn/moving_varianceB$conv_dw_11_bn/moving_variance/biasedB(conv_dw_11_bn/moving_variance/local_stepBconv_dw_12/depthwise_kernelBconv_dw_12_bn/betaBconv_dw_12_bn/gammaBconv_dw_12_bn/moving_meanB conv_dw_12_bn/moving_mean/biasedB$conv_dw_12_bn/moving_mean/local_stepBconv_dw_12_bn/moving_varianceB$conv_dw_12_bn/moving_variance/biasedB(conv_dw_12_bn/moving_variance/local_stepBconv_dw_13/depthwise_kernelBconv_dw_13_bn/betaBconv_dw_13_bn/gammaBconv_dw_13_bn/moving_meanB conv_dw_13_bn/moving_mean/biasedB$conv_dw_13_bn/moving_mean/local_stepBconv_dw_13_bn/moving_varianceB$conv_dw_13_bn/moving_variance/biasedB(conv_dw_13_bn/moving_variance/local_stepBconv_dw_1_bn/betaBconv_dw_1_bn/gammaBconv_dw_1_bn/moving_meanBconv_dw_1_bn/moving_mean/biasedB#conv_dw_1_bn/moving_mean/local_stepBconv_dw_1_bn/moving_varianceB#conv_dw_1_bn/moving_variance/biasedB'conv_dw_1_bn/moving_variance/local_stepBconv_dw_2/depthwise_kernelBconv_dw_2_bn/betaBconv_dw_2_bn/gammaBconv_dw_2_bn/moving_meanBconv_dw_2_bn/moving_mean/biasedB#conv_dw_2_bn/moving_mean/local_stepBconv_dw_2_bn/moving_varianceB#conv_dw_2_bn/moving_variance/biasedB'conv_dw_2_bn/moving_variance/local_stepBconv_dw_3/depthwise_kernelBconv_dw_3_bn/betaBconv_dw_3_bn/gammaBconv_dw_3_bn/moving_meanBconv_dw_3_bn/moving_mean/biasedB#conv_dw_3_bn/moving_mean/local_stepBconv_dw_3_bn/moving_varianceB#conv_dw_3_bn/moving_variance/biasedB'conv_dw_3_bn/moving_variance/local_stepBconv_dw_4/depthwise_kernelBconv_dw_4_bn/betaBconv_dw_4_bn/gammaBconv_dw_4_bn/moving_meanBconv_dw_4_bn/moving_mean/biasedB#conv_dw_4_bn/moving_mean/local_stepBconv_dw_4_bn/moving_varianceB#conv_dw_4_bn/moving_variance/biasedB'conv_dw_4_bn/moving_variance/local_stepBconv_dw_5/depthwise_kernelBconv_dw_5_bn/betaBconv_dw_5_bn/gammaBconv_dw_5_bn/moving_meanBconv_dw_5_bn/moving_mean/biasedB#conv_dw_5_bn/moving_mean/local_stepBconv_dw_5_bn/moving_varianceB#conv_dw_5_bn/moving_variance/biasedB'conv_dw_5_bn/moving_variance/local_stepBconv_dw_6/depthwise_kernelBconv_dw_6_bn/betaBconv_dw_6_bn/gammaBconv_dw_6_bn/moving_meanBconv_dw_6_bn/moving_mean/biasedB#conv_dw_6_bn/moving_mean/local_stepBconv_dw_6_bn/moving_varianceB#conv_dw_6_bn/moving_variance/biasedB'conv_dw_6_bn/moving_variance/local_stepBconv_dw_7/depthwise_kernelBconv_dw_7_bn/betaBconv_dw_7_bn/gammaBconv_dw_7_bn/moving_meanBconv_dw_7_bn/moving_mean/biasedB#conv_dw_7_bn/moving_mean/local_stepBconv_dw_7_bn/moving_varianceB#conv_dw_7_bn/moving_variance/biasedB'conv_dw_7_bn/moving_variance/local_stepBconv_dw_8/depthwise_kernelBconv_dw_8_bn/betaBconv_dw_8_bn/gammaBconv_dw_8_bn/moving_meanBconv_dw_8_bn/moving_mean/biasedB#conv_dw_8_bn/moving_mean/local_stepBconv_dw_8_bn/moving_varianceB#conv_dw_8_bn/moving_variance/biasedB'conv_dw_8_bn/moving_variance/local_stepBconv_dw_9/depthwise_kernelBconv_dw_9_bn/betaBconv_dw_9_bn/gammaBconv_dw_9_bn/moving_meanBconv_dw_9_bn/moving_mean/biasedB#conv_dw_9_bn/moving_mean/local_stepBconv_dw_9_bn/moving_varianceB#conv_dw_9_bn/moving_variance/biasedB'conv_dw_9_bn/moving_variance/local_stepBconv_pw_1/kernelBconv_pw_10/kernelBconv_pw_10_bn/betaBconv_pw_10_bn/gammaBconv_pw_10_bn/moving_meanB conv_pw_10_bn/moving_mean/biasedB$conv_pw_10_bn/moving_mean/local_stepBconv_pw_10_bn/moving_varianceB$conv_pw_10_bn/moving_variance/biasedB(conv_pw_10_bn/moving_variance/local_stepBconv_pw_11/kernelBconv_pw_11_bn/betaBconv_pw_11_bn/gammaBconv_pw_11_bn/moving_meanB conv_pw_11_bn/moving_mean/biasedB$conv_pw_11_bn/moving_mean/local_stepBconv_pw_11_bn/moving_varianceB$conv_pw_11_bn/moving_variance/biasedB(conv_pw_11_bn/moving_variance/local_stepBconv_pw_12/kernelBconv_pw_12_bn/betaBconv_pw_12_bn/gammaBconv_pw_12_bn/moving_meanB conv_pw_12_bn/moving_mean/biasedB$conv_pw_12_bn/moving_mean/local_stepBconv_pw_12_bn/moving_varianceB$conv_pw_12_bn/moving_variance/biasedB(conv_pw_12_bn/moving_variance/local_stepBconv_pw_13/kernelBconv_pw_13_bn/betaBconv_pw_13_bn/gammaBconv_pw_13_bn/moving_meanB conv_pw_13_bn/moving_mean/biasedB$conv_pw_13_bn/moving_mean/local_stepBconv_pw_13_bn/moving_varianceB$conv_pw_13_bn/moving_variance/biasedB(conv_pw_13_bn/moving_variance/local_stepBconv_pw_1_bn/betaBconv_pw_1_bn/gammaBconv_pw_1_bn/moving_meanBconv_pw_1_bn/moving_mean/biasedB#conv_pw_1_bn/moving_mean/local_stepBconv_pw_1_bn/moving_varianceB#conv_pw_1_bn/moving_variance/biasedB'conv_pw_1_bn/moving_variance/local_stepBconv_pw_2/kernelBconv_pw_2_bn/betaBconv_pw_2_bn/gammaBconv_pw_2_bn/moving_meanBconv_pw_2_bn/moving_mean/biasedB#conv_pw_2_bn/moving_mean/local_stepBconv_pw_2_bn/moving_varianceB#conv_pw_2_bn/moving_variance/biasedB'conv_pw_2_bn/moving_variance/local_stepBconv_pw_3/kernelBconv_pw_3_bn/betaBconv_pw_3_bn/gammaBconv_pw_3_bn/moving_meanBconv_pw_3_bn/moving_mean/biasedB#conv_pw_3_bn/moving_mean/local_stepBconv_pw_3_bn/moving_varianceB#conv_pw_3_bn/moving_variance/biasedB'conv_pw_3_bn/moving_variance/local_stepBconv_pw_4/kernelBconv_pw_4_bn/betaBconv_pw_4_bn/gammaBconv_pw_4_bn/moving_meanBconv_pw_4_bn/moving_mean/biasedB#conv_pw_4_bn/moving_mean/local_stepBconv_pw_4_bn/moving_varianceB#conv_pw_4_bn/moving_variance/biasedB'conv_pw_4_bn/moving_variance/local_stepBconv_pw_5/kernelBconv_pw_5_bn/betaBconv_pw_5_bn/gammaBconv_pw_5_bn/moving_meanBconv_pw_5_bn/moving_mean/biasedB#conv_pw_5_bn/moving_mean/local_stepBconv_pw_5_bn/moving_varianceB#conv_pw_5_bn/moving_variance/biasedB'conv_pw_5_bn/moving_variance/local_stepBconv_pw_6/kernelBconv_pw_6_bn/betaBconv_pw_6_bn/gammaBconv_pw_6_bn/moving_meanBconv_pw_6_bn/moving_mean/biasedB#conv_pw_6_bn/moving_mean/local_stepBconv_pw_6_bn/moving_varianceB#conv_pw_6_bn/moving_variance/biasedB'conv_pw_6_bn/moving_variance/local_stepBconv_pw_7/kernelBconv_pw_7_bn/betaBconv_pw_7_bn/gammaBconv_pw_7_bn/moving_meanBconv_pw_7_bn/moving_mean/biasedB#conv_pw_7_bn/moving_mean/local_stepBconv_pw_7_bn/moving_varianceB#conv_pw_7_bn/moving_variance/biasedB'conv_pw_7_bn/moving_variance/local_stepBconv_pw_8/kernelBconv_pw_8_bn/betaBconv_pw_8_bn/gammaBconv_pw_8_bn/moving_meanBconv_pw_8_bn/moving_mean/biasedB#conv_pw_8_bn/moving_mean/local_stepBconv_pw_8_bn/moving_varianceB#conv_pw_8_bn/moving_variance/biasedB'conv_pw_8_bn/moving_variance/local_stepBconv_pw_9/kernelBconv_pw_9_bn/betaBconv_pw_9_bn/gammaBconv_pw_9_bn/moving_meanBconv_pw_9_bn/moving_mean/biasedB#conv_pw_9_bn/moving_mean/local_stepBconv_pw_9_bn/moving_varianceB#conv_pw_9_bn/moving_variance/biasedB'conv_pw_9_bn/moving_variance/local_stepBdense_1/biasBdense_1/kernel*
dtype0*
_output_shapes	
:?
?
save/SaveV2/shape_and_slicesConst"/device:CPU:0*?
value?B??B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes	
:?
?;
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesconv1/kernelconv1_bn/betaconv1_bn/gammaconv1_bn/moving_meanconv1_bn/moving_mean/biasedconv1_bn/moving_mean/local_stepconv1_bn/moving_varianceconv1_bn/moving_variance/biased#conv1_bn/moving_variance/local_stepconv_dw_1/depthwise_kernelconv_dw_10/depthwise_kernelconv_dw_10_bn/betaconv_dw_10_bn/gammaconv_dw_10_bn/moving_mean conv_dw_10_bn/moving_mean/biased$conv_dw_10_bn/moving_mean/local_stepconv_dw_10_bn/moving_variance$conv_dw_10_bn/moving_variance/biased(conv_dw_10_bn/moving_variance/local_stepconv_dw_11/depthwise_kernelconv_dw_11_bn/betaconv_dw_11_bn/gammaconv_dw_11_bn/moving_mean conv_dw_11_bn/moving_mean/biased$conv_dw_11_bn/moving_mean/local_stepconv_dw_11_bn/moving_variance$conv_dw_11_bn/moving_variance/biased(conv_dw_11_bn/moving_variance/local_stepconv_dw_12/depthwise_kernelconv_dw_12_bn/betaconv_dw_12_bn/gammaconv_dw_12_bn/moving_mean conv_dw_12_bn/moving_mean/biased$conv_dw_12_bn/moving_mean/local_stepconv_dw_12_bn/moving_variance$conv_dw_12_bn/moving_variance/biased(conv_dw_12_bn/moving_variance/local_stepconv_dw_13/depthwise_kernelconv_dw_13_bn/betaconv_dw_13_bn/gammaconv_dw_13_bn/moving_mean conv_dw_13_bn/moving_mean/biased$conv_dw_13_bn/moving_mean/local_stepconv_dw_13_bn/moving_variance$conv_dw_13_bn/moving_variance/biased(conv_dw_13_bn/moving_variance/local_stepconv_dw_1_bn/betaconv_dw_1_bn/gammaconv_dw_1_bn/moving_meanconv_dw_1_bn/moving_mean/biased#conv_dw_1_bn/moving_mean/local_stepconv_dw_1_bn/moving_variance#conv_dw_1_bn/moving_variance/biased'conv_dw_1_bn/moving_variance/local_stepconv_dw_2/depthwise_kernelconv_dw_2_bn/betaconv_dw_2_bn/gammaconv_dw_2_bn/moving_meanconv_dw_2_bn/moving_mean/biased#conv_dw_2_bn/moving_mean/local_stepconv_dw_2_bn/moving_variance#conv_dw_2_bn/moving_variance/biased'conv_dw_2_bn/moving_variance/local_stepconv_dw_3/depthwise_kernelconv_dw_3_bn/betaconv_dw_3_bn/gammaconv_dw_3_bn/moving_meanconv_dw_3_bn/moving_mean/biased#conv_dw_3_bn/moving_mean/local_stepconv_dw_3_bn/moving_variance#conv_dw_3_bn/moving_variance/biased'conv_dw_3_bn/moving_variance/local_stepconv_dw_4/depthwise_kernelconv_dw_4_bn/betaconv_dw_4_bn/gammaconv_dw_4_bn/moving_meanconv_dw_4_bn/moving_mean/biased#conv_dw_4_bn/moving_mean/local_stepconv_dw_4_bn/moving_variance#conv_dw_4_bn/moving_variance/biased'conv_dw_4_bn/moving_variance/local_stepconv_dw_5/depthwise_kernelconv_dw_5_bn/betaconv_dw_5_bn/gammaconv_dw_5_bn/moving_meanconv_dw_5_bn/moving_mean/biased#conv_dw_5_bn/moving_mean/local_stepconv_dw_5_bn/moving_variance#conv_dw_5_bn/moving_variance/biased'conv_dw_5_bn/moving_variance/local_stepconv_dw_6/depthwise_kernelconv_dw_6_bn/betaconv_dw_6_bn/gammaconv_dw_6_bn/moving_meanconv_dw_6_bn/moving_mean/biased#conv_dw_6_bn/moving_mean/local_stepconv_dw_6_bn/moving_variance#conv_dw_6_bn/moving_variance/biased'conv_dw_6_bn/moving_variance/local_stepconv_dw_7/depthwise_kernelconv_dw_7_bn/betaconv_dw_7_bn/gammaconv_dw_7_bn/moving_meanconv_dw_7_bn/moving_mean/biased#conv_dw_7_bn/moving_mean/local_stepconv_dw_7_bn/moving_variance#conv_dw_7_bn/moving_variance/biased'conv_dw_7_bn/moving_variance/local_stepconv_dw_8/depthwise_kernelconv_dw_8_bn/betaconv_dw_8_bn/gammaconv_dw_8_bn/moving_meanconv_dw_8_bn/moving_mean/biased#conv_dw_8_bn/moving_mean/local_stepconv_dw_8_bn/moving_variance#conv_dw_8_bn/moving_variance/biased'conv_dw_8_bn/moving_variance/local_stepconv_dw_9/depthwise_kernelconv_dw_9_bn/betaconv_dw_9_bn/gammaconv_dw_9_bn/moving_meanconv_dw_9_bn/moving_mean/biased#conv_dw_9_bn/moving_mean/local_stepconv_dw_9_bn/moving_variance#conv_dw_9_bn/moving_variance/biased'conv_dw_9_bn/moving_variance/local_stepconv_pw_1/kernelconv_pw_10/kernelconv_pw_10_bn/betaconv_pw_10_bn/gammaconv_pw_10_bn/moving_mean conv_pw_10_bn/moving_mean/biased$conv_pw_10_bn/moving_mean/local_stepconv_pw_10_bn/moving_variance$conv_pw_10_bn/moving_variance/biased(conv_pw_10_bn/moving_variance/local_stepconv_pw_11/kernelconv_pw_11_bn/betaconv_pw_11_bn/gammaconv_pw_11_bn/moving_mean conv_pw_11_bn/moving_mean/biased$conv_pw_11_bn/moving_mean/local_stepconv_pw_11_bn/moving_variance$conv_pw_11_bn/moving_variance/biased(conv_pw_11_bn/moving_variance/local_stepconv_pw_12/kernelconv_pw_12_bn/betaconv_pw_12_bn/gammaconv_pw_12_bn/moving_mean conv_pw_12_bn/moving_mean/biased$conv_pw_12_bn/moving_mean/local_stepconv_pw_12_bn/moving_variance$conv_pw_12_bn/moving_variance/biased(conv_pw_12_bn/moving_variance/local_stepconv_pw_13/kernelconv_pw_13_bn/betaconv_pw_13_bn/gammaconv_pw_13_bn/moving_mean conv_pw_13_bn/moving_mean/biased$conv_pw_13_bn/moving_mean/local_stepconv_pw_13_bn/moving_variance$conv_pw_13_bn/moving_variance/biased(conv_pw_13_bn/moving_variance/local_stepconv_pw_1_bn/betaconv_pw_1_bn/gammaconv_pw_1_bn/moving_meanconv_pw_1_bn/moving_mean/biased#conv_pw_1_bn/moving_mean/local_stepconv_pw_1_bn/moving_variance#conv_pw_1_bn/moving_variance/biased'conv_pw_1_bn/moving_variance/local_stepconv_pw_2/kernelconv_pw_2_bn/betaconv_pw_2_bn/gammaconv_pw_2_bn/moving_meanconv_pw_2_bn/moving_mean/biased#conv_pw_2_bn/moving_mean/local_stepconv_pw_2_bn/moving_variance#conv_pw_2_bn/moving_variance/biased'conv_pw_2_bn/moving_variance/local_stepconv_pw_3/kernelconv_pw_3_bn/betaconv_pw_3_bn/gammaconv_pw_3_bn/moving_meanconv_pw_3_bn/moving_mean/biased#conv_pw_3_bn/moving_mean/local_stepconv_pw_3_bn/moving_variance#conv_pw_3_bn/moving_variance/biased'conv_pw_3_bn/moving_variance/local_stepconv_pw_4/kernelconv_pw_4_bn/betaconv_pw_4_bn/gammaconv_pw_4_bn/moving_meanconv_pw_4_bn/moving_mean/biased#conv_pw_4_bn/moving_mean/local_stepconv_pw_4_bn/moving_variance#conv_pw_4_bn/moving_variance/biased'conv_pw_4_bn/moving_variance/local_stepconv_pw_5/kernelconv_pw_5_bn/betaconv_pw_5_bn/gammaconv_pw_5_bn/moving_meanconv_pw_5_bn/moving_mean/biased#conv_pw_5_bn/moving_mean/local_stepconv_pw_5_bn/moving_variance#conv_pw_5_bn/moving_variance/biased'conv_pw_5_bn/moving_variance/local_stepconv_pw_6/kernelconv_pw_6_bn/betaconv_pw_6_bn/gammaconv_pw_6_bn/moving_meanconv_pw_6_bn/moving_mean/biased#conv_pw_6_bn/moving_mean/local_stepconv_pw_6_bn/moving_variance#conv_pw_6_bn/moving_variance/biased'conv_pw_6_bn/moving_variance/local_stepconv_pw_7/kernelconv_pw_7_bn/betaconv_pw_7_bn/gammaconv_pw_7_bn/moving_meanconv_pw_7_bn/moving_mean/biased#conv_pw_7_bn/moving_mean/local_stepconv_pw_7_bn/moving_variance#conv_pw_7_bn/moving_variance/biased'conv_pw_7_bn/moving_variance/local_stepconv_pw_8/kernelconv_pw_8_bn/betaconv_pw_8_bn/gammaconv_pw_8_bn/moving_meanconv_pw_8_bn/moving_mean/biased#conv_pw_8_bn/moving_mean/local_stepconv_pw_8_bn/moving_variance#conv_pw_8_bn/moving_variance/biased'conv_pw_8_bn/moving_variance/local_stepconv_pw_9/kernelconv_pw_9_bn/betaconv_pw_9_bn/gammaconv_pw_9_bn/moving_meanconv_pw_9_bn/moving_mean/biased#conv_pw_9_bn/moving_mean/local_stepconv_pw_9_bn/moving_variance#conv_pw_9_bn/moving_variance/biased'conv_pw_9_bn/moving_variance/local_stepdense_1/biasdense_1/kernel"/device:CPU:0*?
dtypes?
?2?
?
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
?
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*

axis *
N*
_output_shapes
:
?
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
?
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
?9
save/RestoreV2/tensor_namesConst"/device:CPU:0*?8
value?8B?8?Bconv1/kernelBconv1_bn/betaBconv1_bn/gammaBconv1_bn/moving_meanBconv1_bn/moving_mean/biasedBconv1_bn/moving_mean/local_stepBconv1_bn/moving_varianceBconv1_bn/moving_variance/biasedB#conv1_bn/moving_variance/local_stepBconv_dw_1/depthwise_kernelBconv_dw_10/depthwise_kernelBconv_dw_10_bn/betaBconv_dw_10_bn/gammaBconv_dw_10_bn/moving_meanB conv_dw_10_bn/moving_mean/biasedB$conv_dw_10_bn/moving_mean/local_stepBconv_dw_10_bn/moving_varianceB$conv_dw_10_bn/moving_variance/biasedB(conv_dw_10_bn/moving_variance/local_stepBconv_dw_11/depthwise_kernelBconv_dw_11_bn/betaBconv_dw_11_bn/gammaBconv_dw_11_bn/moving_meanB conv_dw_11_bn/moving_mean/biasedB$conv_dw_11_bn/moving_mean/local_stepBconv_dw_11_bn/moving_varianceB$conv_dw_11_bn/moving_variance/biasedB(conv_dw_11_bn/moving_variance/local_stepBconv_dw_12/depthwise_kernelBconv_dw_12_bn/betaBconv_dw_12_bn/gammaBconv_dw_12_bn/moving_meanB conv_dw_12_bn/moving_mean/biasedB$conv_dw_12_bn/moving_mean/local_stepBconv_dw_12_bn/moving_varianceB$conv_dw_12_bn/moving_variance/biasedB(conv_dw_12_bn/moving_variance/local_stepBconv_dw_13/depthwise_kernelBconv_dw_13_bn/betaBconv_dw_13_bn/gammaBconv_dw_13_bn/moving_meanB conv_dw_13_bn/moving_mean/biasedB$conv_dw_13_bn/moving_mean/local_stepBconv_dw_13_bn/moving_varianceB$conv_dw_13_bn/moving_variance/biasedB(conv_dw_13_bn/moving_variance/local_stepBconv_dw_1_bn/betaBconv_dw_1_bn/gammaBconv_dw_1_bn/moving_meanBconv_dw_1_bn/moving_mean/biasedB#conv_dw_1_bn/moving_mean/local_stepBconv_dw_1_bn/moving_varianceB#conv_dw_1_bn/moving_variance/biasedB'conv_dw_1_bn/moving_variance/local_stepBconv_dw_2/depthwise_kernelBconv_dw_2_bn/betaBconv_dw_2_bn/gammaBconv_dw_2_bn/moving_meanBconv_dw_2_bn/moving_mean/biasedB#conv_dw_2_bn/moving_mean/local_stepBconv_dw_2_bn/moving_varianceB#conv_dw_2_bn/moving_variance/biasedB'conv_dw_2_bn/moving_variance/local_stepBconv_dw_3/depthwise_kernelBconv_dw_3_bn/betaBconv_dw_3_bn/gammaBconv_dw_3_bn/moving_meanBconv_dw_3_bn/moving_mean/biasedB#conv_dw_3_bn/moving_mean/local_stepBconv_dw_3_bn/moving_varianceB#conv_dw_3_bn/moving_variance/biasedB'conv_dw_3_bn/moving_variance/local_stepBconv_dw_4/depthwise_kernelBconv_dw_4_bn/betaBconv_dw_4_bn/gammaBconv_dw_4_bn/moving_meanBconv_dw_4_bn/moving_mean/biasedB#conv_dw_4_bn/moving_mean/local_stepBconv_dw_4_bn/moving_varianceB#conv_dw_4_bn/moving_variance/biasedB'conv_dw_4_bn/moving_variance/local_stepBconv_dw_5/depthwise_kernelBconv_dw_5_bn/betaBconv_dw_5_bn/gammaBconv_dw_5_bn/moving_meanBconv_dw_5_bn/moving_mean/biasedB#conv_dw_5_bn/moving_mean/local_stepBconv_dw_5_bn/moving_varianceB#conv_dw_5_bn/moving_variance/biasedB'conv_dw_5_bn/moving_variance/local_stepBconv_dw_6/depthwise_kernelBconv_dw_6_bn/betaBconv_dw_6_bn/gammaBconv_dw_6_bn/moving_meanBconv_dw_6_bn/moving_mean/biasedB#conv_dw_6_bn/moving_mean/local_stepBconv_dw_6_bn/moving_varianceB#conv_dw_6_bn/moving_variance/biasedB'conv_dw_6_bn/moving_variance/local_stepBconv_dw_7/depthwise_kernelBconv_dw_7_bn/betaBconv_dw_7_bn/gammaBconv_dw_7_bn/moving_meanBconv_dw_7_bn/moving_mean/biasedB#conv_dw_7_bn/moving_mean/local_stepBconv_dw_7_bn/moving_varianceB#conv_dw_7_bn/moving_variance/biasedB'conv_dw_7_bn/moving_variance/local_stepBconv_dw_8/depthwise_kernelBconv_dw_8_bn/betaBconv_dw_8_bn/gammaBconv_dw_8_bn/moving_meanBconv_dw_8_bn/moving_mean/biasedB#conv_dw_8_bn/moving_mean/local_stepBconv_dw_8_bn/moving_varianceB#conv_dw_8_bn/moving_variance/biasedB'conv_dw_8_bn/moving_variance/local_stepBconv_dw_9/depthwise_kernelBconv_dw_9_bn/betaBconv_dw_9_bn/gammaBconv_dw_9_bn/moving_meanBconv_dw_9_bn/moving_mean/biasedB#conv_dw_9_bn/moving_mean/local_stepBconv_dw_9_bn/moving_varianceB#conv_dw_9_bn/moving_variance/biasedB'conv_dw_9_bn/moving_variance/local_stepBconv_pw_1/kernelBconv_pw_10/kernelBconv_pw_10_bn/betaBconv_pw_10_bn/gammaBconv_pw_10_bn/moving_meanB conv_pw_10_bn/moving_mean/biasedB$conv_pw_10_bn/moving_mean/local_stepBconv_pw_10_bn/moving_varianceB$conv_pw_10_bn/moving_variance/biasedB(conv_pw_10_bn/moving_variance/local_stepBconv_pw_11/kernelBconv_pw_11_bn/betaBconv_pw_11_bn/gammaBconv_pw_11_bn/moving_meanB conv_pw_11_bn/moving_mean/biasedB$conv_pw_11_bn/moving_mean/local_stepBconv_pw_11_bn/moving_varianceB$conv_pw_11_bn/moving_variance/biasedB(conv_pw_11_bn/moving_variance/local_stepBconv_pw_12/kernelBconv_pw_12_bn/betaBconv_pw_12_bn/gammaBconv_pw_12_bn/moving_meanB conv_pw_12_bn/moving_mean/biasedB$conv_pw_12_bn/moving_mean/local_stepBconv_pw_12_bn/moving_varianceB$conv_pw_12_bn/moving_variance/biasedB(conv_pw_12_bn/moving_variance/local_stepBconv_pw_13/kernelBconv_pw_13_bn/betaBconv_pw_13_bn/gammaBconv_pw_13_bn/moving_meanB conv_pw_13_bn/moving_mean/biasedB$conv_pw_13_bn/moving_mean/local_stepBconv_pw_13_bn/moving_varianceB$conv_pw_13_bn/moving_variance/biasedB(conv_pw_13_bn/moving_variance/local_stepBconv_pw_1_bn/betaBconv_pw_1_bn/gammaBconv_pw_1_bn/moving_meanBconv_pw_1_bn/moving_mean/biasedB#conv_pw_1_bn/moving_mean/local_stepBconv_pw_1_bn/moving_varianceB#conv_pw_1_bn/moving_variance/biasedB'conv_pw_1_bn/moving_variance/local_stepBconv_pw_2/kernelBconv_pw_2_bn/betaBconv_pw_2_bn/gammaBconv_pw_2_bn/moving_meanBconv_pw_2_bn/moving_mean/biasedB#conv_pw_2_bn/moving_mean/local_stepBconv_pw_2_bn/moving_varianceB#conv_pw_2_bn/moving_variance/biasedB'conv_pw_2_bn/moving_variance/local_stepBconv_pw_3/kernelBconv_pw_3_bn/betaBconv_pw_3_bn/gammaBconv_pw_3_bn/moving_meanBconv_pw_3_bn/moving_mean/biasedB#conv_pw_3_bn/moving_mean/local_stepBconv_pw_3_bn/moving_varianceB#conv_pw_3_bn/moving_variance/biasedB'conv_pw_3_bn/moving_variance/local_stepBconv_pw_4/kernelBconv_pw_4_bn/betaBconv_pw_4_bn/gammaBconv_pw_4_bn/moving_meanBconv_pw_4_bn/moving_mean/biasedB#conv_pw_4_bn/moving_mean/local_stepBconv_pw_4_bn/moving_varianceB#conv_pw_4_bn/moving_variance/biasedB'conv_pw_4_bn/moving_variance/local_stepBconv_pw_5/kernelBconv_pw_5_bn/betaBconv_pw_5_bn/gammaBconv_pw_5_bn/moving_meanBconv_pw_5_bn/moving_mean/biasedB#conv_pw_5_bn/moving_mean/local_stepBconv_pw_5_bn/moving_varianceB#conv_pw_5_bn/moving_variance/biasedB'conv_pw_5_bn/moving_variance/local_stepBconv_pw_6/kernelBconv_pw_6_bn/betaBconv_pw_6_bn/gammaBconv_pw_6_bn/moving_meanBconv_pw_6_bn/moving_mean/biasedB#conv_pw_6_bn/moving_mean/local_stepBconv_pw_6_bn/moving_varianceB#conv_pw_6_bn/moving_variance/biasedB'conv_pw_6_bn/moving_variance/local_stepBconv_pw_7/kernelBconv_pw_7_bn/betaBconv_pw_7_bn/gammaBconv_pw_7_bn/moving_meanBconv_pw_7_bn/moving_mean/biasedB#conv_pw_7_bn/moving_mean/local_stepBconv_pw_7_bn/moving_varianceB#conv_pw_7_bn/moving_variance/biasedB'conv_pw_7_bn/moving_variance/local_stepBconv_pw_8/kernelBconv_pw_8_bn/betaBconv_pw_8_bn/gammaBconv_pw_8_bn/moving_meanBconv_pw_8_bn/moving_mean/biasedB#conv_pw_8_bn/moving_mean/local_stepBconv_pw_8_bn/moving_varianceB#conv_pw_8_bn/moving_variance/biasedB'conv_pw_8_bn/moving_variance/local_stepBconv_pw_9/kernelBconv_pw_9_bn/betaBconv_pw_9_bn/gammaBconv_pw_9_bn/moving_meanBconv_pw_9_bn/moving_mean/biasedB#conv_pw_9_bn/moving_mean/local_stepBconv_pw_9_bn/moving_varianceB#conv_pw_9_bn/moving_variance/biasedB'conv_pw_9_bn/moving_variance/local_stepBdense_1/biasBdense_1/kernel*
dtype0*
_output_shapes	
:?
?
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes	
:?*?
value?B??B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
?

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*?
dtypes?
?2?*?
_output_shapes?
?:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
?
save/AssignAssignconv1/kernelsave/RestoreV2*
use_locking(*
T0*
_class
loc:@conv1/kernel*
validate_shape(*&
_output_shapes
: 
?
save/Assign_1Assignconv1_bn/betasave/RestoreV2:1*
use_locking(*
T0* 
_class
loc:@conv1_bn/beta*
validate_shape(*
_output_shapes
: 
?
save/Assign_2Assignconv1_bn/gammasave/RestoreV2:2*
use_locking(*
T0*!
_class
loc:@conv1_bn/gamma*
validate_shape(*
_output_shapes
: 
?
save/Assign_3Assignconv1_bn/moving_meansave/RestoreV2:3*
use_locking(*
T0*'
_class
loc:@conv1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_4Assignconv1_bn/moving_mean/biasedsave/RestoreV2:4*
use_locking(*
T0*'
_class
loc:@conv1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_5Assignconv1_bn/moving_mean/local_stepsave/RestoreV2:5*
use_locking(*
T0*'
_class
loc:@conv1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_6Assignconv1_bn/moving_variancesave/RestoreV2:6*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv1_bn/moving_variance
?
save/Assign_7Assignconv1_bn/moving_variance/biasedsave/RestoreV2:7*
use_locking(*
T0*+
_class!
loc:@conv1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_8Assign#conv1_bn/moving_variance/local_stepsave/RestoreV2:8*
use_locking(*
T0*+
_class!
loc:@conv1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_9Assignconv_dw_1/depthwise_kernelsave/RestoreV2:9*
validate_shape(*&
_output_shapes
: *
use_locking(*
T0*-
_class#
!loc:@conv_dw_1/depthwise_kernel
?
save/Assign_10Assignconv_dw_10/depthwise_kernelsave/RestoreV2:10*
T0*.
_class$
" loc:@conv_dw_10/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking(
?
save/Assign_11Assignconv_dw_10_bn/betasave/RestoreV2:11*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_10_bn/beta
?
save/Assign_12Assignconv_dw_10_bn/gammasave/RestoreV2:12*
T0*&
_class
loc:@conv_dw_10_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_13Assignconv_dw_10_bn/moving_meansave/RestoreV2:13*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_14Assign conv_dw_10_bn/moving_mean/biasedsave/RestoreV2:14*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_15Assign$conv_dw_10_bn/moving_mean/local_stepsave/RestoreV2:15*
use_locking(*
T0*,
_class"
 loc:@conv_dw_10_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_16Assignconv_dw_10_bn/moving_variancesave/RestoreV2:16*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_17Assign$conv_dw_10_bn/moving_variance/biasedsave/RestoreV2:17*0
_class&
$"loc:@conv_dw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_18Assign(conv_dw_10_bn/moving_variance/local_stepsave/RestoreV2:18*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*0
_class&
$"loc:@conv_dw_10_bn/moving_variance
?
save/Assign_19Assignconv_dw_11/depthwise_kernelsave/RestoreV2:19*
use_locking(*
T0*.
_class$
" loc:@conv_dw_11/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
save/Assign_20Assignconv_dw_11_bn/betasave/RestoreV2:20*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_11_bn/beta*
validate_shape(
?
save/Assign_21Assignconv_dw_11_bn/gammasave/RestoreV2:21*
use_locking(*
T0*&
_class
loc:@conv_dw_11_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_22Assignconv_dw_11_bn/moving_meansave/RestoreV2:22*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
validate_shape(
?
save/Assign_23Assign conv_dw_11_bn/moving_mean/biasedsave/RestoreV2:23*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_24Assign$conv_dw_11_bn/moving_mean/local_stepsave/RestoreV2:24*
T0*,
_class"
 loc:@conv_dw_11_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
save/Assign_25Assignconv_dw_11_bn/moving_variancesave/RestoreV2:25*
_output_shapes	
:?*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
validate_shape(
?
save/Assign_26Assign$conv_dw_11_bn/moving_variance/biasedsave/RestoreV2:26*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_27Assign(conv_dw_11_bn/moving_variance/local_stepsave/RestoreV2:27*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_11_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_28Assignconv_dw_12/depthwise_kernelsave/RestoreV2:28*
use_locking(*
T0*.
_class$
" loc:@conv_dw_12/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
save/Assign_29Assignconv_dw_12_bn/betasave/RestoreV2:29*
use_locking(*
T0*%
_class
loc:@conv_dw_12_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_30Assignconv_dw_12_bn/gammasave/RestoreV2:30*&
_class
loc:@conv_dw_12_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_31Assignconv_dw_12_bn/moving_meansave/RestoreV2:31*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_32Assign conv_dw_12_bn/moving_mean/biasedsave/RestoreV2:32*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
validate_shape(
?
save/Assign_33Assign$conv_dw_12_bn/moving_mean/local_stepsave/RestoreV2:33*
use_locking(*
T0*,
_class"
 loc:@conv_dw_12_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_34Assignconv_dw_12_bn/moving_variancesave/RestoreV2:34*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_35Assign$conv_dw_12_bn/moving_variance/biasedsave/RestoreV2:35*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_36Assign(conv_dw_12_bn/moving_variance/local_stepsave/RestoreV2:36*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_12_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_37Assignconv_dw_13/depthwise_kernelsave/RestoreV2:37*
validate_shape(*'
_output_shapes
:?*
use_locking(*
T0*.
_class$
" loc:@conv_dw_13/depthwise_kernel
?
save/Assign_38Assignconv_dw_13_bn/betasave/RestoreV2:38*
use_locking(*
T0*%
_class
loc:@conv_dw_13_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_39Assignconv_dw_13_bn/gammasave/RestoreV2:39*&
_class
loc:@conv_dw_13_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_40Assignconv_dw_13_bn/moving_meansave/RestoreV2:40*
use_locking(*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_41Assign conv_dw_13_bn/moving_mean/biasedsave/RestoreV2:41*
use_locking(*
T0*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_42Assign$conv_dw_13_bn/moving_mean/local_stepsave/RestoreV2:42*,
_class"
 loc:@conv_dw_13_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
save/Assign_43Assignconv_dw_13_bn/moving_variancesave/RestoreV2:43*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_44Assign$conv_dw_13_bn/moving_variance/biasedsave/RestoreV2:44*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_45Assign(conv_dw_13_bn/moving_variance/local_stepsave/RestoreV2:45*
use_locking(*
T0*0
_class&
$"loc:@conv_dw_13_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_46Assignconv_dw_1_bn/betasave/RestoreV2:46*
use_locking(*
T0*$
_class
loc:@conv_dw_1_bn/beta*
validate_shape(*
_output_shapes
: 
?
save/Assign_47Assignconv_dw_1_bn/gammasave/RestoreV2:47*
use_locking(*
T0*%
_class
loc:@conv_dw_1_bn/gamma*
validate_shape(*
_output_shapes
: 
?
save/Assign_48Assignconv_dw_1_bn/moving_meansave/RestoreV2:48*
use_locking(*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_49Assignconv_dw_1_bn/moving_mean/biasedsave/RestoreV2:49*
use_locking(*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_50Assign#conv_dw_1_bn/moving_mean/local_stepsave/RestoreV2:50*
T0*+
_class!
loc:@conv_dw_1_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
save/Assign_51Assignconv_dw_1_bn/moving_variancesave/RestoreV2:51*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_52Assign#conv_dw_1_bn/moving_variance/biasedsave/RestoreV2:52*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_53Assign'conv_dw_1_bn/moving_variance/local_stepsave/RestoreV2:53*/
_class%
#!loc:@conv_dw_1_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
save/Assign_54Assignconv_dw_2/depthwise_kernelsave/RestoreV2:54*
T0*-
_class#
!loc:@conv_dw_2/depthwise_kernel*
validate_shape(*&
_output_shapes
:@*
use_locking(
?
save/Assign_55Assignconv_dw_2_bn/betasave/RestoreV2:55*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*$
_class
loc:@conv_dw_2_bn/beta
?
save/Assign_56Assignconv_dw_2_bn/gammasave/RestoreV2:56*
use_locking(*
T0*%
_class
loc:@conv_dw_2_bn/gamma*
validate_shape(*
_output_shapes
:@
?
save/Assign_57Assignconv_dw_2_bn/moving_meansave/RestoreV2:57*
_output_shapes
:@*
use_locking(*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
validate_shape(
?
save/Assign_58Assignconv_dw_2_bn/moving_mean/biasedsave/RestoreV2:58*
use_locking(*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
validate_shape(*
_output_shapes
:@
?
save/Assign_59Assign#conv_dw_2_bn/moving_mean/local_stepsave/RestoreV2:59*
use_locking(*
T0*+
_class!
loc:@conv_dw_2_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_60Assignconv_dw_2_bn/moving_variancesave/RestoreV2:60*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
validate_shape(*
_output_shapes
:@*
use_locking(
?
save/Assign_61Assign#conv_dw_2_bn/moving_variance/biasedsave/RestoreV2:61*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance
?
save/Assign_62Assign'conv_dw_2_bn/moving_variance/local_stepsave/RestoreV2:62*
_output_shapes
: *
use_locking(*
T0*/
_class%
#!loc:@conv_dw_2_bn/moving_variance*
validate_shape(
?
save/Assign_63Assignconv_dw_3/depthwise_kernelsave/RestoreV2:63*
use_locking(*
T0*-
_class#
!loc:@conv_dw_3/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
save/Assign_64Assignconv_dw_3_bn/betasave/RestoreV2:64*
use_locking(*
T0*$
_class
loc:@conv_dw_3_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_65Assignconv_dw_3_bn/gammasave/RestoreV2:65*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_3_bn/gamma
?
save/Assign_66Assignconv_dw_3_bn/moving_meansave/RestoreV2:66*
use_locking(*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_67Assignconv_dw_3_bn/moving_mean/biasedsave/RestoreV2:67*
use_locking(*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_68Assign#conv_dw_3_bn/moving_mean/local_stepsave/RestoreV2:68*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_dw_3_bn/moving_mean
?
save/Assign_69Assignconv_dw_3_bn/moving_variancesave/RestoreV2:69*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_70Assign#conv_dw_3_bn/moving_variance/biasedsave/RestoreV2:70*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_71Assign'conv_dw_3_bn/moving_variance/local_stepsave/RestoreV2:71*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_3_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_72Assignconv_dw_4/depthwise_kernelsave/RestoreV2:72*
validate_shape(*'
_output_shapes
:?*
use_locking(*
T0*-
_class#
!loc:@conv_dw_4/depthwise_kernel
?
save/Assign_73Assignconv_dw_4_bn/betasave/RestoreV2:73*
use_locking(*
T0*$
_class
loc:@conv_dw_4_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_74Assignconv_dw_4_bn/gammasave/RestoreV2:74*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_4_bn/gamma
?
save/Assign_75Assignconv_dw_4_bn/moving_meansave/RestoreV2:75*
use_locking(*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_76Assignconv_dw_4_bn/moving_mean/biasedsave/RestoreV2:76*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_77Assign#conv_dw_4_bn/moving_mean/local_stepsave/RestoreV2:77*
use_locking(*
T0*+
_class!
loc:@conv_dw_4_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_78Assignconv_dw_4_bn/moving_variancesave/RestoreV2:78*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_79Assign#conv_dw_4_bn/moving_variance/biasedsave/RestoreV2:79*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_80Assign'conv_dw_4_bn/moving_variance/local_stepsave/RestoreV2:80*/
_class%
#!loc:@conv_dw_4_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
save/Assign_81Assignconv_dw_5/depthwise_kernelsave/RestoreV2:81*
T0*-
_class#
!loc:@conv_dw_5/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking(
?
save/Assign_82Assignconv_dw_5_bn/betasave/RestoreV2:82*
use_locking(*
T0*$
_class
loc:@conv_dw_5_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_83Assignconv_dw_5_bn/gammasave/RestoreV2:83*
use_locking(*
T0*%
_class
loc:@conv_dw_5_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_84Assignconv_dw_5_bn/moving_meansave/RestoreV2:84*+
_class!
loc:@conv_dw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_85Assignconv_dw_5_bn/moving_mean/biasedsave/RestoreV2:85*
use_locking(*
T0*+
_class!
loc:@conv_dw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_86Assign#conv_dw_5_bn/moving_mean/local_stepsave/RestoreV2:86*+
_class!
loc:@conv_dw_5_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
save/Assign_87Assignconv_dw_5_bn/moving_variancesave/RestoreV2:87*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_88Assign#conv_dw_5_bn/moving_variance/biasedsave/RestoreV2:88*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_89Assign'conv_dw_5_bn/moving_variance/local_stepsave/RestoreV2:89*
T0*/
_class%
#!loc:@conv_dw_5_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(
?
save/Assign_90Assignconv_dw_6/depthwise_kernelsave/RestoreV2:90*-
_class#
!loc:@conv_dw_6/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking(*
T0
?
save/Assign_91Assignconv_dw_6_bn/betasave/RestoreV2:91*
_output_shapes	
:?*
use_locking(*
T0*$
_class
loc:@conv_dw_6_bn/beta*
validate_shape(
?
save/Assign_92Assignconv_dw_6_bn/gammasave/RestoreV2:92*
T0*%
_class
loc:@conv_dw_6_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_93Assignconv_dw_6_bn/moving_meansave/RestoreV2:93*
use_locking(*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_94Assignconv_dw_6_bn/moving_mean/biasedsave/RestoreV2:94*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean
?
save/Assign_95Assign#conv_dw_6_bn/moving_mean/local_stepsave/RestoreV2:95*
use_locking(*
T0*+
_class!
loc:@conv_dw_6_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_96Assignconv_dw_6_bn/moving_variancesave/RestoreV2:96*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_97Assign#conv_dw_6_bn/moving_variance/biasedsave/RestoreV2:97*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_98Assign'conv_dw_6_bn/moving_variance/local_stepsave/RestoreV2:98*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_6_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_99Assignconv_dw_7/depthwise_kernelsave/RestoreV2:99*
use_locking(*
T0*-
_class#
!loc:@conv_dw_7/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
save/Assign_100Assignconv_dw_7_bn/betasave/RestoreV2:100*
use_locking(*
T0*$
_class
loc:@conv_dw_7_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_101Assignconv_dw_7_bn/gammasave/RestoreV2:101*%
_class
loc:@conv_dw_7_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_102Assignconv_dw_7_bn/moving_meansave/RestoreV2:102*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_103Assignconv_dw_7_bn/moving_mean/biasedsave/RestoreV2:103*
use_locking(*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_104Assign#conv_dw_7_bn/moving_mean/local_stepsave/RestoreV2:104*
use_locking(*
T0*+
_class!
loc:@conv_dw_7_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_105Assignconv_dw_7_bn/moving_variancesave/RestoreV2:105*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
validate_shape(
?
save/Assign_106Assign#conv_dw_7_bn/moving_variance/biasedsave/RestoreV2:106*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_107Assign'conv_dw_7_bn/moving_variance/local_stepsave/RestoreV2:107*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_7_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_108Assignconv_dw_8/depthwise_kernelsave/RestoreV2:108*
T0*-
_class#
!loc:@conv_dw_8/depthwise_kernel*
validate_shape(*'
_output_shapes
:?*
use_locking(
?
save/Assign_109Assignconv_dw_8_bn/betasave/RestoreV2:109*
use_locking(*
T0*$
_class
loc:@conv_dw_8_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_110Assignconv_dw_8_bn/gammasave/RestoreV2:110*%
_class
loc:@conv_dw_8_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_111Assignconv_dw_8_bn/moving_meansave/RestoreV2:111*
use_locking(*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_112Assignconv_dw_8_bn/moving_mean/biasedsave/RestoreV2:112*
use_locking(*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_113Assign#conv_dw_8_bn/moving_mean/local_stepsave/RestoreV2:113*
T0*+
_class!
loc:@conv_dw_8_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
save/Assign_114Assignconv_dw_8_bn/moving_variancesave/RestoreV2:114*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_115Assign#conv_dw_8_bn/moving_variance/biasedsave/RestoreV2:115*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_116Assign'conv_dw_8_bn/moving_variance/local_stepsave/RestoreV2:116*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_8_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_117Assignconv_dw_9/depthwise_kernelsave/RestoreV2:117*
use_locking(*
T0*-
_class#
!loc:@conv_dw_9/depthwise_kernel*
validate_shape(*'
_output_shapes
:?
?
save/Assign_118Assignconv_dw_9_bn/betasave/RestoreV2:118*
use_locking(*
T0*$
_class
loc:@conv_dw_9_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_119Assignconv_dw_9_bn/gammasave/RestoreV2:119*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_dw_9_bn/gamma*
validate_shape(
?
save/Assign_120Assignconv_dw_9_bn/moving_meansave/RestoreV2:120*+
_class!
loc:@conv_dw_9_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_121Assignconv_dw_9_bn/moving_mean/biasedsave/RestoreV2:121*
use_locking(*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_122Assign#conv_dw_9_bn/moving_mean/local_stepsave/RestoreV2:122*
use_locking(*
T0*+
_class!
loc:@conv_dw_9_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_123Assignconv_dw_9_bn/moving_variancesave/RestoreV2:123*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_124Assign#conv_dw_9_bn/moving_variance/biasedsave/RestoreV2:124*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_125Assign'conv_dw_9_bn/moving_variance/local_stepsave/RestoreV2:125*
use_locking(*
T0*/
_class%
#!loc:@conv_dw_9_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_126Assignconv_pw_1/kernelsave/RestoreV2:126*#
_class
loc:@conv_pw_1/kernel*
validate_shape(*&
_output_shapes
: @*
use_locking(*
T0
?
save/Assign_127Assignconv_pw_10/kernelsave/RestoreV2:127*
use_locking(*
T0*$
_class
loc:@conv_pw_10/kernel*
validate_shape(*(
_output_shapes
:??
?
save/Assign_128Assignconv_pw_10_bn/betasave/RestoreV2:128*
use_locking(*
T0*%
_class
loc:@conv_pw_10_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_129Assignconv_pw_10_bn/gammasave/RestoreV2:129*
_output_shapes	
:?*
use_locking(*
T0*&
_class
loc:@conv_pw_10_bn/gamma*
validate_shape(
?
save/Assign_130Assignconv_pw_10_bn/moving_meansave/RestoreV2:130*
use_locking(*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_131Assign conv_pw_10_bn/moving_mean/biasedsave/RestoreV2:131*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_132Assign$conv_pw_10_bn/moving_mean/local_stepsave/RestoreV2:132*
_output_shapes
: *
use_locking(*
T0*,
_class"
 loc:@conv_pw_10_bn/moving_mean*
validate_shape(
?
save/Assign_133Assignconv_pw_10_bn/moving_variancesave/RestoreV2:133*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_134Assign$conv_pw_10_bn/moving_variance/biasedsave/RestoreV2:134*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_135Assign(conv_pw_10_bn/moving_variance/local_stepsave/RestoreV2:135*
_output_shapes
: *
use_locking(*
T0*0
_class&
$"loc:@conv_pw_10_bn/moving_variance*
validate_shape(
?
save/Assign_136Assignconv_pw_11/kernelsave/RestoreV2:136*
T0*$
_class
loc:@conv_pw_11/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking(
?
save/Assign_137Assignconv_pw_11_bn/betasave/RestoreV2:137*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_pw_11_bn/beta*
validate_shape(
?
save/Assign_138Assignconv_pw_11_bn/gammasave/RestoreV2:138*
use_locking(*
T0*&
_class
loc:@conv_pw_11_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_139Assignconv_pw_11_bn/moving_meansave/RestoreV2:139*
use_locking(*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_140Assign conv_pw_11_bn/moving_mean/biasedsave/RestoreV2:140*
use_locking(*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_141Assign$conv_pw_11_bn/moving_mean/local_stepsave/RestoreV2:141*
use_locking(*
T0*,
_class"
 loc:@conv_pw_11_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_142Assignconv_pw_11_bn/moving_variancesave/RestoreV2:142*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_143Assign$conv_pw_11_bn/moving_variance/biasedsave/RestoreV2:143*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_144Assign(conv_pw_11_bn/moving_variance/local_stepsave/RestoreV2:144*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_11_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_145Assignconv_pw_12/kernelsave/RestoreV2:145*
use_locking(*
T0*$
_class
loc:@conv_pw_12/kernel*
validate_shape(*(
_output_shapes
:??
?
save/Assign_146Assignconv_pw_12_bn/betasave/RestoreV2:146*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_pw_12_bn/beta*
validate_shape(
?
save/Assign_147Assignconv_pw_12_bn/gammasave/RestoreV2:147*
T0*&
_class
loc:@conv_pw_12_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_148Assignconv_pw_12_bn/moving_meansave/RestoreV2:148*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean
?
save/Assign_149Assign conv_pw_12_bn/moving_mean/biasedsave/RestoreV2:149*
use_locking(*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_150Assign$conv_pw_12_bn/moving_mean/local_stepsave/RestoreV2:150*
_output_shapes
: *
use_locking(*
T0*,
_class"
 loc:@conv_pw_12_bn/moving_mean*
validate_shape(
?
save/Assign_151Assignconv_pw_12_bn/moving_variancesave/RestoreV2:151*
_output_shapes	
:?*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
validate_shape(
?
save/Assign_152Assign$conv_pw_12_bn/moving_variance/biasedsave/RestoreV2:152*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_153Assign(conv_pw_12_bn/moving_variance/local_stepsave/RestoreV2:153*
use_locking(*
T0*0
_class&
$"loc:@conv_pw_12_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_154Assignconv_pw_13/kernelsave/RestoreV2:154*
use_locking(*
T0*$
_class
loc:@conv_pw_13/kernel*
validate_shape(*(
_output_shapes
:??
?
save/Assign_155Assignconv_pw_13_bn/betasave/RestoreV2:155*
use_locking(*
T0*%
_class
loc:@conv_pw_13_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_156Assignconv_pw_13_bn/gammasave/RestoreV2:156*
use_locking(*
T0*&
_class
loc:@conv_pw_13_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_157Assignconv_pw_13_bn/moving_meansave/RestoreV2:157*
use_locking(*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_158Assign conv_pw_13_bn/moving_mean/biasedsave/RestoreV2:158*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean
?
save/Assign_159Assign$conv_pw_13_bn/moving_mean/local_stepsave/RestoreV2:159*
T0*,
_class"
 loc:@conv_pw_13_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
save/Assign_160Assignconv_pw_13_bn/moving_variancesave/RestoreV2:160*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_161Assign$conv_pw_13_bn/moving_variance/biasedsave/RestoreV2:161*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_162Assign(conv_pw_13_bn/moving_variance/local_stepsave/RestoreV2:162*
_output_shapes
: *
use_locking(*
T0*0
_class&
$"loc:@conv_pw_13_bn/moving_variance*
validate_shape(
?
save/Assign_163Assignconv_pw_1_bn/betasave/RestoreV2:163*
T0*$
_class
loc:@conv_pw_1_bn/beta*
validate_shape(*
_output_shapes
:@*
use_locking(
?
save/Assign_164Assignconv_pw_1_bn/gammasave/RestoreV2:164*
_output_shapes
:@*
use_locking(*
T0*%
_class
loc:@conv_pw_1_bn/gamma*
validate_shape(
?
save/Assign_165Assignconv_pw_1_bn/moving_meansave/RestoreV2:165*
use_locking(*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
validate_shape(*
_output_shapes
:@
?
save/Assign_166Assignconv_pw_1_bn/moving_mean/biasedsave/RestoreV2:166*
use_locking(*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
validate_shape(*
_output_shapes
:@
?
save/Assign_167Assign#conv_pw_1_bn/moving_mean/local_stepsave/RestoreV2:167*
T0*+
_class!
loc:@conv_pw_1_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(
?
save/Assign_168Assignconv_pw_1_bn/moving_variancesave/RestoreV2:168*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
validate_shape(*
_output_shapes
:@
?
save/Assign_169Assign#conv_pw_1_bn/moving_variance/biasedsave/RestoreV2:169*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance*
validate_shape(*
_output_shapes
:@
?
save/Assign_170Assign'conv_pw_1_bn/moving_variance/local_stepsave/RestoreV2:170*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*/
_class%
#!loc:@conv_pw_1_bn/moving_variance
?
save/Assign_171Assignconv_pw_2/kernelsave/RestoreV2:171*
use_locking(*
T0*#
_class
loc:@conv_pw_2/kernel*
validate_shape(*'
_output_shapes
:@?
?
save/Assign_172Assignconv_pw_2_bn/betasave/RestoreV2:172*$
_class
loc:@conv_pw_2_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_173Assignconv_pw_2_bn/gammasave/RestoreV2:173*
use_locking(*
T0*%
_class
loc:@conv_pw_2_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_174Assignconv_pw_2_bn/moving_meansave/RestoreV2:174*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
validate_shape(
?
save/Assign_175Assignconv_pw_2_bn/moving_mean/biasedsave/RestoreV2:175*
use_locking(*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_176Assign#conv_pw_2_bn/moving_mean/local_stepsave/RestoreV2:176*
use_locking(*
T0*+
_class!
loc:@conv_pw_2_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_177Assignconv_pw_2_bn/moving_variancesave/RestoreV2:177*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_178Assign#conv_pw_2_bn/moving_variance/biasedsave/RestoreV2:178*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_179Assign'conv_pw_2_bn/moving_variance/local_stepsave/RestoreV2:179*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_2_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_180Assignconv_pw_3/kernelsave/RestoreV2:180*
T0*#
_class
loc:@conv_pw_3/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking(
?
save/Assign_181Assignconv_pw_3_bn/betasave/RestoreV2:181*$
_class
loc:@conv_pw_3_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_182Assignconv_pw_3_bn/gammasave/RestoreV2:182*
use_locking(*
T0*%
_class
loc:@conv_pw_3_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_183Assignconv_pw_3_bn/moving_meansave/RestoreV2:183*
use_locking(*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_184Assignconv_pw_3_bn/moving_mean/biasedsave/RestoreV2:184*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
validate_shape(
?
save/Assign_185Assign#conv_pw_3_bn/moving_mean/local_stepsave/RestoreV2:185*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_pw_3_bn/moving_mean*
validate_shape(
?
save/Assign_186Assignconv_pw_3_bn/moving_variancesave/RestoreV2:186*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_187Assign#conv_pw_3_bn/moving_variance/biasedsave/RestoreV2:187*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_188Assign'conv_pw_3_bn/moving_variance/local_stepsave/RestoreV2:188*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*/
_class%
#!loc:@conv_pw_3_bn/moving_variance
?
save/Assign_189Assignconv_pw_4/kernelsave/RestoreV2:189*#
_class
loc:@conv_pw_4/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking(*
T0
?
save/Assign_190Assignconv_pw_4_bn/betasave/RestoreV2:190*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*$
_class
loc:@conv_pw_4_bn/beta
?
save/Assign_191Assignconv_pw_4_bn/gammasave/RestoreV2:191*
use_locking(*
T0*%
_class
loc:@conv_pw_4_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_192Assignconv_pw_4_bn/moving_meansave/RestoreV2:192*
use_locking(*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_193Assignconv_pw_4_bn/moving_mean/biasedsave/RestoreV2:193*+
_class!
loc:@conv_pw_4_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_194Assign#conv_pw_4_bn/moving_mean/local_stepsave/RestoreV2:194*
use_locking(*
T0*+
_class!
loc:@conv_pw_4_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_195Assignconv_pw_4_bn/moving_variancesave/RestoreV2:195*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_196Assign#conv_pw_4_bn/moving_variance/biasedsave/RestoreV2:196*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
validate_shape(
?
save/Assign_197Assign'conv_pw_4_bn/moving_variance/local_stepsave/RestoreV2:197*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_4_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_198Assignconv_pw_5/kernelsave/RestoreV2:198*
validate_shape(*(
_output_shapes
:??*
use_locking(*
T0*#
_class
loc:@conv_pw_5/kernel
?
save/Assign_199Assignconv_pw_5_bn/betasave/RestoreV2:199*$
_class
loc:@conv_pw_5_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_200Assignconv_pw_5_bn/gammasave/RestoreV2:200*
use_locking(*
T0*%
_class
loc:@conv_pw_5_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_201Assignconv_pw_5_bn/moving_meansave/RestoreV2:201*
use_locking(*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_202Assignconv_pw_5_bn/moving_mean/biasedsave/RestoreV2:202*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean
?
save/Assign_203Assign#conv_pw_5_bn/moving_mean/local_stepsave/RestoreV2:203*
use_locking(*
T0*+
_class!
loc:@conv_pw_5_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_204Assignconv_pw_5_bn/moving_variancesave/RestoreV2:204*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_205Assign#conv_pw_5_bn/moving_variance/biasedsave/RestoreV2:205*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_206Assign'conv_pw_5_bn/moving_variance/local_stepsave/RestoreV2:206*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_5_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_207Assignconv_pw_6/kernelsave/RestoreV2:207*
T0*#
_class
loc:@conv_pw_6/kernel*
validate_shape(*(
_output_shapes
:??*
use_locking(
?
save/Assign_208Assignconv_pw_6_bn/betasave/RestoreV2:208*
use_locking(*
T0*$
_class
loc:@conv_pw_6_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_209Assignconv_pw_6_bn/gammasave/RestoreV2:209*%
_class
loc:@conv_pw_6_bn/gamma*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_210Assignconv_pw_6_bn/moving_meansave/RestoreV2:210*
use_locking(*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_211Assignconv_pw_6_bn/moving_mean/biasedsave/RestoreV2:211*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_212Assign#conv_pw_6_bn/moving_mean/local_stepsave/RestoreV2:212*
use_locking(*
T0*+
_class!
loc:@conv_pw_6_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_213Assignconv_pw_6_bn/moving_variancesave/RestoreV2:213*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_214Assign#conv_pw_6_bn/moving_variance/biasedsave/RestoreV2:214*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_215Assign'conv_pw_6_bn/moving_variance/local_stepsave/RestoreV2:215*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_6_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_216Assignconv_pw_7/kernelsave/RestoreV2:216*
validate_shape(*(
_output_shapes
:??*
use_locking(*
T0*#
_class
loc:@conv_pw_7/kernel
?
save/Assign_217Assignconv_pw_7_bn/betasave/RestoreV2:217*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*$
_class
loc:@conv_pw_7_bn/beta
?
save/Assign_218Assignconv_pw_7_bn/gammasave/RestoreV2:218*
use_locking(*
T0*%
_class
loc:@conv_pw_7_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_219Assignconv_pw_7_bn/moving_meansave/RestoreV2:219*
use_locking(*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_220Assignconv_pw_7_bn/moving_mean/biasedsave/RestoreV2:220*
T0*+
_class!
loc:@conv_pw_7_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_221Assign#conv_pw_7_bn/moving_mean/local_stepsave/RestoreV2:221*+
_class!
loc:@conv_pw_7_bn/moving_mean*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
?
save/Assign_222Assignconv_pw_7_bn/moving_variancesave/RestoreV2:222*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance
?
save/Assign_223Assign#conv_pw_7_bn/moving_variance/biasedsave/RestoreV2:223*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_224Assign'conv_pw_7_bn/moving_variance/local_stepsave/RestoreV2:224*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_7_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_225Assignconv_pw_8/kernelsave/RestoreV2:225*
use_locking(*
T0*#
_class
loc:@conv_pw_8/kernel*
validate_shape(*(
_output_shapes
:??
?
save/Assign_226Assignconv_pw_8_bn/betasave/RestoreV2:226*
T0*$
_class
loc:@conv_pw_8_bn/beta*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_227Assignconv_pw_8_bn/gammasave/RestoreV2:227*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*%
_class
loc:@conv_pw_8_bn/gamma
?
save/Assign_228Assignconv_pw_8_bn/moving_meansave/RestoreV2:228*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
validate_shape(
?
save/Assign_229Assignconv_pw_8_bn/moving_mean/biasedsave/RestoreV2:229*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
validate_shape(*
_output_shapes	
:?*
use_locking(
?
save/Assign_230Assign#conv_pw_8_bn/moving_mean/local_stepsave/RestoreV2:230*
use_locking(*
T0*+
_class!
loc:@conv_pw_8_bn/moving_mean*
validate_shape(*
_output_shapes
: 
?
save/Assign_231Assignconv_pw_8_bn/moving_variancesave/RestoreV2:231*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0
?
save/Assign_232Assign#conv_pw_8_bn/moving_variance/biasedsave/RestoreV2:232*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_233Assign'conv_pw_8_bn/moving_variance/local_stepsave/RestoreV2:233*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_8_bn/moving_variance*
validate_shape(*
_output_shapes
: 
?
save/Assign_234Assignconv_pw_9/kernelsave/RestoreV2:234*
use_locking(*
T0*#
_class
loc:@conv_pw_9/kernel*
validate_shape(*(
_output_shapes
:??
?
save/Assign_235Assignconv_pw_9_bn/betasave/RestoreV2:235*
use_locking(*
T0*$
_class
loc:@conv_pw_9_bn/beta*
validate_shape(*
_output_shapes	
:?
?
save/Assign_236Assignconv_pw_9_bn/gammasave/RestoreV2:236*
use_locking(*
T0*%
_class
loc:@conv_pw_9_bn/gamma*
validate_shape(*
_output_shapes	
:?
?
save/Assign_237Assignconv_pw_9_bn/moving_meansave/RestoreV2:237*
use_locking(*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
validate_shape(*
_output_shapes	
:?
?
save/Assign_238Assignconv_pw_9_bn/moving_mean/biasedsave/RestoreV2:238*
_output_shapes	
:?*
use_locking(*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
validate_shape(
?
save/Assign_239Assign#conv_pw_9_bn/moving_mean/local_stepsave/RestoreV2:239*
_output_shapes
: *
use_locking(*
T0*+
_class!
loc:@conv_pw_9_bn/moving_mean*
validate_shape(
?
save/Assign_240Assignconv_pw_9_bn/moving_variancesave/RestoreV2:240*
validate_shape(*
_output_shapes	
:?*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance
?
save/Assign_241Assign#conv_pw_9_bn/moving_variance/biasedsave/RestoreV2:241*
use_locking(*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
validate_shape(*
_output_shapes	
:?
?
save/Assign_242Assign'conv_pw_9_bn/moving_variance/local_stepsave/RestoreV2:242*
T0*/
_class%
#!loc:@conv_pw_9_bn/moving_variance*
validate_shape(*
_output_shapes
: *
use_locking(
?
save/Assign_243Assigndense_1/biassave/RestoreV2:243*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:

?
save/Assign_244Assigndense_1/kernelsave/RestoreV2:244*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(*
_output_shapes
:	?

?!
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_100^save/Assign_101^save/Assign_102^save/Assign_103^save/Assign_104^save/Assign_105^save/Assign_106^save/Assign_107^save/Assign_108^save/Assign_109^save/Assign_11^save/Assign_110^save/Assign_111^save/Assign_112^save/Assign_113^save/Assign_114^save/Assign_115^save/Assign_116^save/Assign_117^save/Assign_118^save/Assign_119^save/Assign_12^save/Assign_120^save/Assign_121^save/Assign_122^save/Assign_123^save/Assign_124^save/Assign_125^save/Assign_126^save/Assign_127^save/Assign_128^save/Assign_129^save/Assign_13^save/Assign_130^save/Assign_131^save/Assign_132^save/Assign_133^save/Assign_134^save/Assign_135^save/Assign_136^save/Assign_137^save/Assign_138^save/Assign_139^save/Assign_14^save/Assign_140^save/Assign_141^save/Assign_142^save/Assign_143^save/Assign_144^save/Assign_145^save/Assign_146^save/Assign_147^save/Assign_148^save/Assign_149^save/Assign_15^save/Assign_150^save/Assign_151^save/Assign_152^save/Assign_153^save/Assign_154^save/Assign_155^save/Assign_156^save/Assign_157^save/Assign_158^save/Assign_159^save/Assign_16^save/Assign_160^save/Assign_161^save/Assign_162^save/Assign_163^save/Assign_164^save/Assign_165^save/Assign_166^save/Assign_167^save/Assign_168^save/Assign_169^save/Assign_17^save/Assign_170^save/Assign_171^save/Assign_172^save/Assign_173^save/Assign_174^save/Assign_175^save/Assign_176^save/Assign_177^save/Assign_178^save/Assign_179^save/Assign_18^save/Assign_180^save/Assign_181^save/Assign_182^save/Assign_183^save/Assign_184^save/Assign_185^save/Assign_186^save/Assign_187^save/Assign_188^save/Assign_189^save/Assign_19^save/Assign_190^save/Assign_191^save/Assign_192^save/Assign_193^save/Assign_194^save/Assign_195^save/Assign_196^save/Assign_197^save/Assign_198^save/Assign_199^save/Assign_2^save/Assign_20^save/Assign_200^save/Assign_201^save/Assign_202^save/Assign_203^save/Assign_204^save/Assign_205^save/Assign_206^save/Assign_207^save/Assign_208^save/Assign_209^save/Assign_21^save/Assign_210^save/Assign_211^save/Assign_212^save/Assign_213^save/Assign_214^save/Assign_215^save/Assign_216^save/Assign_217^save/Assign_218^save/Assign_219^save/Assign_22^save/Assign_220^save/Assign_221^save/Assign_222^save/Assign_223^save/Assign_224^save/Assign_225^save/Assign_226^save/Assign_227^save/Assign_228^save/Assign_229^save/Assign_23^save/Assign_230^save/Assign_231^save/Assign_232^save/Assign_233^save/Assign_234^save/Assign_235^save/Assign_236^save/Assign_237^save/Assign_238^save/Assign_239^save/Assign_24^save/Assign_240^save/Assign_241^save/Assign_242^save/Assign_243^save/Assign_244^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_3^save/Assign_30^save/Assign_31^save/Assign_32^save/Assign_33^save/Assign_34^save/Assign_35^save/Assign_36^save/Assign_37^save/Assign_38^save/Assign_39^save/Assign_4^save/Assign_40^save/Assign_41^save/Assign_42^save/Assign_43^save/Assign_44^save/Assign_45^save/Assign_46^save/Assign_47^save/Assign_48^save/Assign_49^save/Assign_5^save/Assign_50^save/Assign_51^save/Assign_52^save/Assign_53^save/Assign_54^save/Assign_55^save/Assign_56^save/Assign_57^save/Assign_58^save/Assign_59^save/Assign_6^save/Assign_60^save/Assign_61^save/Assign_62^save/Assign_63^save/Assign_64^save/Assign_65^save/Assign_66^save/Assign_67^save/Assign_68^save/Assign_69^save/Assign_7^save/Assign_70^save/Assign_71^save/Assign_72^save/Assign_73^save/Assign_74^save/Assign_75^save/Assign_76^save/Assign_77^save/Assign_78^save/Assign_79^save/Assign_8^save/Assign_80^save/Assign_81^save/Assign_82^save/Assign_83^save/Assign_84^save/Assign_85^save/Assign_86^save/Assign_87^save/Assign_88^save/Assign_89^save/Assign_9^save/Assign_90^save/Assign_91^save/Assign_92^save/Assign_93^save/Assign_94^save/Assign_95^save/Assign_96^save/Assign_97^save/Assign_98^save/Assign_99
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"?{
trainable_variables?{?{
T
conv1/kernel:0conv1/kernel/Assignconv1/kernel/read:02conv1/random_uniform:08
T
conv1_bn/gamma:0conv1_bn/gamma/Assignconv1_bn/gamma/read:02conv1_bn/Const:08
S
conv1_bn/beta:0conv1_bn/beta/Assignconv1_bn/beta/read:02conv1_bn/Const_1:08
h
conv1_bn/moving_mean:0conv1_bn/moving_mean/Assignconv1_bn/moving_mean/read:02conv1_bn/Const_2:08
t
conv1_bn/moving_variance:0conv1_bn/moving_variance/Assignconv1_bn/moving_variance/read:02conv1_bn/Const_3:08
?
conv_dw_1/depthwise_kernel:0!conv_dw_1/depthwise_kernel/Assign!conv_dw_1/depthwise_kernel/read:02conv_dw_1/random_uniform:08
d
conv_dw_1_bn/gamma:0conv_dw_1_bn/gamma/Assignconv_dw_1_bn/gamma/read:02conv_dw_1_bn/Const:08
c
conv_dw_1_bn/beta:0conv_dw_1_bn/beta/Assignconv_dw_1_bn/beta/read:02conv_dw_1_bn/Const_1:08
x
conv_dw_1_bn/moving_mean:0conv_dw_1_bn/moving_mean/Assignconv_dw_1_bn/moving_mean/read:02conv_dw_1_bn/Const_2:08
?
conv_dw_1_bn/moving_variance:0#conv_dw_1_bn/moving_variance/Assign#conv_dw_1_bn/moving_variance/read:02conv_dw_1_bn/Const_3:08
d
conv_pw_1/kernel:0conv_pw_1/kernel/Assignconv_pw_1/kernel/read:02conv_pw_1/random_uniform:08
d
conv_pw_1_bn/gamma:0conv_pw_1_bn/gamma/Assignconv_pw_1_bn/gamma/read:02conv_pw_1_bn/Const:08
c
conv_pw_1_bn/beta:0conv_pw_1_bn/beta/Assignconv_pw_1_bn/beta/read:02conv_pw_1_bn/Const_1:08
x
conv_pw_1_bn/moving_mean:0conv_pw_1_bn/moving_mean/Assignconv_pw_1_bn/moving_mean/read:02conv_pw_1_bn/Const_2:08
?
conv_pw_1_bn/moving_variance:0#conv_pw_1_bn/moving_variance/Assign#conv_pw_1_bn/moving_variance/read:02conv_pw_1_bn/Const_3:08
?
conv_dw_2/depthwise_kernel:0!conv_dw_2/depthwise_kernel/Assign!conv_dw_2/depthwise_kernel/read:02conv_dw_2/random_uniform:08
d
conv_dw_2_bn/gamma:0conv_dw_2_bn/gamma/Assignconv_dw_2_bn/gamma/read:02conv_dw_2_bn/Const:08
c
conv_dw_2_bn/beta:0conv_dw_2_bn/beta/Assignconv_dw_2_bn/beta/read:02conv_dw_2_bn/Const_1:08
x
conv_dw_2_bn/moving_mean:0conv_dw_2_bn/moving_mean/Assignconv_dw_2_bn/moving_mean/read:02conv_dw_2_bn/Const_2:08
?
conv_dw_2_bn/moving_variance:0#conv_dw_2_bn/moving_variance/Assign#conv_dw_2_bn/moving_variance/read:02conv_dw_2_bn/Const_3:08
d
conv_pw_2/kernel:0conv_pw_2/kernel/Assignconv_pw_2/kernel/read:02conv_pw_2/random_uniform:08
d
conv_pw_2_bn/gamma:0conv_pw_2_bn/gamma/Assignconv_pw_2_bn/gamma/read:02conv_pw_2_bn/Const:08
c
conv_pw_2_bn/beta:0conv_pw_2_bn/beta/Assignconv_pw_2_bn/beta/read:02conv_pw_2_bn/Const_1:08
x
conv_pw_2_bn/moving_mean:0conv_pw_2_bn/moving_mean/Assignconv_pw_2_bn/moving_mean/read:02conv_pw_2_bn/Const_2:08
?
conv_pw_2_bn/moving_variance:0#conv_pw_2_bn/moving_variance/Assign#conv_pw_2_bn/moving_variance/read:02conv_pw_2_bn/Const_3:08
?
conv_dw_3/depthwise_kernel:0!conv_dw_3/depthwise_kernel/Assign!conv_dw_3/depthwise_kernel/read:02conv_dw_3/random_uniform:08
d
conv_dw_3_bn/gamma:0conv_dw_3_bn/gamma/Assignconv_dw_3_bn/gamma/read:02conv_dw_3_bn/Const:08
c
conv_dw_3_bn/beta:0conv_dw_3_bn/beta/Assignconv_dw_3_bn/beta/read:02conv_dw_3_bn/Const_1:08
x
conv_dw_3_bn/moving_mean:0conv_dw_3_bn/moving_mean/Assignconv_dw_3_bn/moving_mean/read:02conv_dw_3_bn/Const_2:08
?
conv_dw_3_bn/moving_variance:0#conv_dw_3_bn/moving_variance/Assign#conv_dw_3_bn/moving_variance/read:02conv_dw_3_bn/Const_3:08
d
conv_pw_3/kernel:0conv_pw_3/kernel/Assignconv_pw_3/kernel/read:02conv_pw_3/random_uniform:08
d
conv_pw_3_bn/gamma:0conv_pw_3_bn/gamma/Assignconv_pw_3_bn/gamma/read:02conv_pw_3_bn/Const:08
c
conv_pw_3_bn/beta:0conv_pw_3_bn/beta/Assignconv_pw_3_bn/beta/read:02conv_pw_3_bn/Const_1:08
x
conv_pw_3_bn/moving_mean:0conv_pw_3_bn/moving_mean/Assignconv_pw_3_bn/moving_mean/read:02conv_pw_3_bn/Const_2:08
?
conv_pw_3_bn/moving_variance:0#conv_pw_3_bn/moving_variance/Assign#conv_pw_3_bn/moving_variance/read:02conv_pw_3_bn/Const_3:08
?
conv_dw_4/depthwise_kernel:0!conv_dw_4/depthwise_kernel/Assign!conv_dw_4/depthwise_kernel/read:02conv_dw_4/random_uniform:08
d
conv_dw_4_bn/gamma:0conv_dw_4_bn/gamma/Assignconv_dw_4_bn/gamma/read:02conv_dw_4_bn/Const:08
c
conv_dw_4_bn/beta:0conv_dw_4_bn/beta/Assignconv_dw_4_bn/beta/read:02conv_dw_4_bn/Const_1:08
x
conv_dw_4_bn/moving_mean:0conv_dw_4_bn/moving_mean/Assignconv_dw_4_bn/moving_mean/read:02conv_dw_4_bn/Const_2:08
?
conv_dw_4_bn/moving_variance:0#conv_dw_4_bn/moving_variance/Assign#conv_dw_4_bn/moving_variance/read:02conv_dw_4_bn/Const_3:08
d
conv_pw_4/kernel:0conv_pw_4/kernel/Assignconv_pw_4/kernel/read:02conv_pw_4/random_uniform:08
d
conv_pw_4_bn/gamma:0conv_pw_4_bn/gamma/Assignconv_pw_4_bn/gamma/read:02conv_pw_4_bn/Const:08
c
conv_pw_4_bn/beta:0conv_pw_4_bn/beta/Assignconv_pw_4_bn/beta/read:02conv_pw_4_bn/Const_1:08
x
conv_pw_4_bn/moving_mean:0conv_pw_4_bn/moving_mean/Assignconv_pw_4_bn/moving_mean/read:02conv_pw_4_bn/Const_2:08
?
conv_pw_4_bn/moving_variance:0#conv_pw_4_bn/moving_variance/Assign#conv_pw_4_bn/moving_variance/read:02conv_pw_4_bn/Const_3:08
?
conv_dw_5/depthwise_kernel:0!conv_dw_5/depthwise_kernel/Assign!conv_dw_5/depthwise_kernel/read:02conv_dw_5/random_uniform:08
d
conv_dw_5_bn/gamma:0conv_dw_5_bn/gamma/Assignconv_dw_5_bn/gamma/read:02conv_dw_5_bn/Const:08
c
conv_dw_5_bn/beta:0conv_dw_5_bn/beta/Assignconv_dw_5_bn/beta/read:02conv_dw_5_bn/Const_1:08
x
conv_dw_5_bn/moving_mean:0conv_dw_5_bn/moving_mean/Assignconv_dw_5_bn/moving_mean/read:02conv_dw_5_bn/Const_2:08
?
conv_dw_5_bn/moving_variance:0#conv_dw_5_bn/moving_variance/Assign#conv_dw_5_bn/moving_variance/read:02conv_dw_5_bn/Const_3:08
d
conv_pw_5/kernel:0conv_pw_5/kernel/Assignconv_pw_5/kernel/read:02conv_pw_5/random_uniform:08
d
conv_pw_5_bn/gamma:0conv_pw_5_bn/gamma/Assignconv_pw_5_bn/gamma/read:02conv_pw_5_bn/Const:08
c
conv_pw_5_bn/beta:0conv_pw_5_bn/beta/Assignconv_pw_5_bn/beta/read:02conv_pw_5_bn/Const_1:08
x
conv_pw_5_bn/moving_mean:0conv_pw_5_bn/moving_mean/Assignconv_pw_5_bn/moving_mean/read:02conv_pw_5_bn/Const_2:08
?
conv_pw_5_bn/moving_variance:0#conv_pw_5_bn/moving_variance/Assign#conv_pw_5_bn/moving_variance/read:02conv_pw_5_bn/Const_3:08
?
conv_dw_6/depthwise_kernel:0!conv_dw_6/depthwise_kernel/Assign!conv_dw_6/depthwise_kernel/read:02conv_dw_6/random_uniform:08
d
conv_dw_6_bn/gamma:0conv_dw_6_bn/gamma/Assignconv_dw_6_bn/gamma/read:02conv_dw_6_bn/Const:08
c
conv_dw_6_bn/beta:0conv_dw_6_bn/beta/Assignconv_dw_6_bn/beta/read:02conv_dw_6_bn/Const_1:08
x
conv_dw_6_bn/moving_mean:0conv_dw_6_bn/moving_mean/Assignconv_dw_6_bn/moving_mean/read:02conv_dw_6_bn/Const_2:08
?
conv_dw_6_bn/moving_variance:0#conv_dw_6_bn/moving_variance/Assign#conv_dw_6_bn/moving_variance/read:02conv_dw_6_bn/Const_3:08
d
conv_pw_6/kernel:0conv_pw_6/kernel/Assignconv_pw_6/kernel/read:02conv_pw_6/random_uniform:08
d
conv_pw_6_bn/gamma:0conv_pw_6_bn/gamma/Assignconv_pw_6_bn/gamma/read:02conv_pw_6_bn/Const:08
c
conv_pw_6_bn/beta:0conv_pw_6_bn/beta/Assignconv_pw_6_bn/beta/read:02conv_pw_6_bn/Const_1:08
x
conv_pw_6_bn/moving_mean:0conv_pw_6_bn/moving_mean/Assignconv_pw_6_bn/moving_mean/read:02conv_pw_6_bn/Const_2:08
?
conv_pw_6_bn/moving_variance:0#conv_pw_6_bn/moving_variance/Assign#conv_pw_6_bn/moving_variance/read:02conv_pw_6_bn/Const_3:08
?
conv_dw_7/depthwise_kernel:0!conv_dw_7/depthwise_kernel/Assign!conv_dw_7/depthwise_kernel/read:02conv_dw_7/random_uniform:08
d
conv_dw_7_bn/gamma:0conv_dw_7_bn/gamma/Assignconv_dw_7_bn/gamma/read:02conv_dw_7_bn/Const:08
c
conv_dw_7_bn/beta:0conv_dw_7_bn/beta/Assignconv_dw_7_bn/beta/read:02conv_dw_7_bn/Const_1:08
x
conv_dw_7_bn/moving_mean:0conv_dw_7_bn/moving_mean/Assignconv_dw_7_bn/moving_mean/read:02conv_dw_7_bn/Const_2:08
?
conv_dw_7_bn/moving_variance:0#conv_dw_7_bn/moving_variance/Assign#conv_dw_7_bn/moving_variance/read:02conv_dw_7_bn/Const_3:08
d
conv_pw_7/kernel:0conv_pw_7/kernel/Assignconv_pw_7/kernel/read:02conv_pw_7/random_uniform:08
d
conv_pw_7_bn/gamma:0conv_pw_7_bn/gamma/Assignconv_pw_7_bn/gamma/read:02conv_pw_7_bn/Const:08
c
conv_pw_7_bn/beta:0conv_pw_7_bn/beta/Assignconv_pw_7_bn/beta/read:02conv_pw_7_bn/Const_1:08
x
conv_pw_7_bn/moving_mean:0conv_pw_7_bn/moving_mean/Assignconv_pw_7_bn/moving_mean/read:02conv_pw_7_bn/Const_2:08
?
conv_pw_7_bn/moving_variance:0#conv_pw_7_bn/moving_variance/Assign#conv_pw_7_bn/moving_variance/read:02conv_pw_7_bn/Const_3:08
?
conv_dw_8/depthwise_kernel:0!conv_dw_8/depthwise_kernel/Assign!conv_dw_8/depthwise_kernel/read:02conv_dw_8/random_uniform:08
d
conv_dw_8_bn/gamma:0conv_dw_8_bn/gamma/Assignconv_dw_8_bn/gamma/read:02conv_dw_8_bn/Const:08
c
conv_dw_8_bn/beta:0conv_dw_8_bn/beta/Assignconv_dw_8_bn/beta/read:02conv_dw_8_bn/Const_1:08
x
conv_dw_8_bn/moving_mean:0conv_dw_8_bn/moving_mean/Assignconv_dw_8_bn/moving_mean/read:02conv_dw_8_bn/Const_2:08
?
conv_dw_8_bn/moving_variance:0#conv_dw_8_bn/moving_variance/Assign#conv_dw_8_bn/moving_variance/read:02conv_dw_8_bn/Const_3:08
d
conv_pw_8/kernel:0conv_pw_8/kernel/Assignconv_pw_8/kernel/read:02conv_pw_8/random_uniform:08
d
conv_pw_8_bn/gamma:0conv_pw_8_bn/gamma/Assignconv_pw_8_bn/gamma/read:02conv_pw_8_bn/Const:08
c
conv_pw_8_bn/beta:0conv_pw_8_bn/beta/Assignconv_pw_8_bn/beta/read:02conv_pw_8_bn/Const_1:08
x
conv_pw_8_bn/moving_mean:0conv_pw_8_bn/moving_mean/Assignconv_pw_8_bn/moving_mean/read:02conv_pw_8_bn/Const_2:08
?
conv_pw_8_bn/moving_variance:0#conv_pw_8_bn/moving_variance/Assign#conv_pw_8_bn/moving_variance/read:02conv_pw_8_bn/Const_3:08
?
conv_dw_9/depthwise_kernel:0!conv_dw_9/depthwise_kernel/Assign!conv_dw_9/depthwise_kernel/read:02conv_dw_9/random_uniform:08
d
conv_dw_9_bn/gamma:0conv_dw_9_bn/gamma/Assignconv_dw_9_bn/gamma/read:02conv_dw_9_bn/Const:08
c
conv_dw_9_bn/beta:0conv_dw_9_bn/beta/Assignconv_dw_9_bn/beta/read:02conv_dw_9_bn/Const_1:08
x
conv_dw_9_bn/moving_mean:0conv_dw_9_bn/moving_mean/Assignconv_dw_9_bn/moving_mean/read:02conv_dw_9_bn/Const_2:08
?
conv_dw_9_bn/moving_variance:0#conv_dw_9_bn/moving_variance/Assign#conv_dw_9_bn/moving_variance/read:02conv_dw_9_bn/Const_3:08
d
conv_pw_9/kernel:0conv_pw_9/kernel/Assignconv_pw_9/kernel/read:02conv_pw_9/random_uniform:08
d
conv_pw_9_bn/gamma:0conv_pw_9_bn/gamma/Assignconv_pw_9_bn/gamma/read:02conv_pw_9_bn/Const:08
c
conv_pw_9_bn/beta:0conv_pw_9_bn/beta/Assignconv_pw_9_bn/beta/read:02conv_pw_9_bn/Const_1:08
x
conv_pw_9_bn/moving_mean:0conv_pw_9_bn/moving_mean/Assignconv_pw_9_bn/moving_mean/read:02conv_pw_9_bn/Const_2:08
?
conv_pw_9_bn/moving_variance:0#conv_pw_9_bn/moving_variance/Assign#conv_pw_9_bn/moving_variance/read:02conv_pw_9_bn/Const_3:08
?
conv_dw_10/depthwise_kernel:0"conv_dw_10/depthwise_kernel/Assign"conv_dw_10/depthwise_kernel/read:02conv_dw_10/random_uniform:08
h
conv_dw_10_bn/gamma:0conv_dw_10_bn/gamma/Assignconv_dw_10_bn/gamma/read:02conv_dw_10_bn/Const:08
g
conv_dw_10_bn/beta:0conv_dw_10_bn/beta/Assignconv_dw_10_bn/beta/read:02conv_dw_10_bn/Const_1:08
|
conv_dw_10_bn/moving_mean:0 conv_dw_10_bn/moving_mean/Assign conv_dw_10_bn/moving_mean/read:02conv_dw_10_bn/Const_2:08
?
conv_dw_10_bn/moving_variance:0$conv_dw_10_bn/moving_variance/Assign$conv_dw_10_bn/moving_variance/read:02conv_dw_10_bn/Const_3:08
h
conv_pw_10/kernel:0conv_pw_10/kernel/Assignconv_pw_10/kernel/read:02conv_pw_10/random_uniform:08
h
conv_pw_10_bn/gamma:0conv_pw_10_bn/gamma/Assignconv_pw_10_bn/gamma/read:02conv_pw_10_bn/Const:08
g
conv_pw_10_bn/beta:0conv_pw_10_bn/beta/Assignconv_pw_10_bn/beta/read:02conv_pw_10_bn/Const_1:08
|
conv_pw_10_bn/moving_mean:0 conv_pw_10_bn/moving_mean/Assign conv_pw_10_bn/moving_mean/read:02conv_pw_10_bn/Const_2:08
?
conv_pw_10_bn/moving_variance:0$conv_pw_10_bn/moving_variance/Assign$conv_pw_10_bn/moving_variance/read:02conv_pw_10_bn/Const_3:08
?
conv_dw_11/depthwise_kernel:0"conv_dw_11/depthwise_kernel/Assign"conv_dw_11/depthwise_kernel/read:02conv_dw_11/random_uniform:08
h
conv_dw_11_bn/gamma:0conv_dw_11_bn/gamma/Assignconv_dw_11_bn/gamma/read:02conv_dw_11_bn/Const:08
g
conv_dw_11_bn/beta:0conv_dw_11_bn/beta/Assignconv_dw_11_bn/beta/read:02conv_dw_11_bn/Const_1:08
|
conv_dw_11_bn/moving_mean:0 conv_dw_11_bn/moving_mean/Assign conv_dw_11_bn/moving_mean/read:02conv_dw_11_bn/Const_2:08
?
conv_dw_11_bn/moving_variance:0$conv_dw_11_bn/moving_variance/Assign$conv_dw_11_bn/moving_variance/read:02conv_dw_11_bn/Const_3:08
h
conv_pw_11/kernel:0conv_pw_11/kernel/Assignconv_pw_11/kernel/read:02conv_pw_11/random_uniform:08
h
conv_pw_11_bn/gamma:0conv_pw_11_bn/gamma/Assignconv_pw_11_bn/gamma/read:02conv_pw_11_bn/Const:08
g
conv_pw_11_bn/beta:0conv_pw_11_bn/beta/Assignconv_pw_11_bn/beta/read:02conv_pw_11_bn/Const_1:08
|
conv_pw_11_bn/moving_mean:0 conv_pw_11_bn/moving_mean/Assign conv_pw_11_bn/moving_mean/read:02conv_pw_11_bn/Const_2:08
?
conv_pw_11_bn/moving_variance:0$conv_pw_11_bn/moving_variance/Assign$conv_pw_11_bn/moving_variance/read:02conv_pw_11_bn/Const_3:08
?
conv_dw_12/depthwise_kernel:0"conv_dw_12/depthwise_kernel/Assign"conv_dw_12/depthwise_kernel/read:02conv_dw_12/random_uniform:08
h
conv_dw_12_bn/gamma:0conv_dw_12_bn/gamma/Assignconv_dw_12_bn/gamma/read:02conv_dw_12_bn/Const:08
g
conv_dw_12_bn/beta:0conv_dw_12_bn/beta/Assignconv_dw_12_bn/beta/read:02conv_dw_12_bn/Const_1:08
|
conv_dw_12_bn/moving_mean:0 conv_dw_12_bn/moving_mean/Assign conv_dw_12_bn/moving_mean/read:02conv_dw_12_bn/Const_2:08
?
conv_dw_12_bn/moving_variance:0$conv_dw_12_bn/moving_variance/Assign$conv_dw_12_bn/moving_variance/read:02conv_dw_12_bn/Const_3:08
h
conv_pw_12/kernel:0conv_pw_12/kernel/Assignconv_pw_12/kernel/read:02conv_pw_12/random_uniform:08
h
conv_pw_12_bn/gamma:0conv_pw_12_bn/gamma/Assignconv_pw_12_bn/gamma/read:02conv_pw_12_bn/Const:08
g
conv_pw_12_bn/beta:0conv_pw_12_bn/beta/Assignconv_pw_12_bn/beta/read:02conv_pw_12_bn/Const_1:08
|
conv_pw_12_bn/moving_mean:0 conv_pw_12_bn/moving_mean/Assign conv_pw_12_bn/moving_mean/read:02conv_pw_12_bn/Const_2:08
?
conv_pw_12_bn/moving_variance:0$conv_pw_12_bn/moving_variance/Assign$conv_pw_12_bn/moving_variance/read:02conv_pw_12_bn/Const_3:08
?
conv_dw_13/depthwise_kernel:0"conv_dw_13/depthwise_kernel/Assign"conv_dw_13/depthwise_kernel/read:02conv_dw_13/random_uniform:08
h
conv_dw_13_bn/gamma:0conv_dw_13_bn/gamma/Assignconv_dw_13_bn/gamma/read:02conv_dw_13_bn/Const:08
g
conv_dw_13_bn/beta:0conv_dw_13_bn/beta/Assignconv_dw_13_bn/beta/read:02conv_dw_13_bn/Const_1:08
|
conv_dw_13_bn/moving_mean:0 conv_dw_13_bn/moving_mean/Assign conv_dw_13_bn/moving_mean/read:02conv_dw_13_bn/Const_2:08
?
conv_dw_13_bn/moving_variance:0$conv_dw_13_bn/moving_variance/Assign$conv_dw_13_bn/moving_variance/read:02conv_dw_13_bn/Const_3:08
h
conv_pw_13/kernel:0conv_pw_13/kernel/Assignconv_pw_13/kernel/read:02conv_pw_13/random_uniform:08
h
conv_pw_13_bn/gamma:0conv_pw_13_bn/gamma/Assignconv_pw_13_bn/gamma/read:02conv_pw_13_bn/Const:08
g
conv_pw_13_bn/beta:0conv_pw_13_bn/beta/Assignconv_pw_13_bn/beta/read:02conv_pw_13_bn/Const_1:08
|
conv_pw_13_bn/moving_mean:0 conv_pw_13_bn/moving_mean/Assign conv_pw_13_bn/moving_mean/read:02conv_pw_13_bn/Const_2:08
?
conv_pw_13_bn/moving_variance:0$conv_pw_13_bn/moving_variance/Assign$conv_pw_13_bn/moving_variance/read:02conv_pw_13_bn/Const_3:08
\
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02dense_1/random_uniform:08
M
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02dense_1/Const:08"??
cond_context????
?
conv1_bn/cond/cond_textconv1_bn/cond/pred_id:0conv1_bn/cond/switch_t:0 *?
conv1_bn/FusedBatchNorm:0
conv1_bn/cond/Switch_1:0
conv1_bn/cond/Switch_1:1
conv1_bn/cond/pred_id:0
conv1_bn/cond/switch_t:05
conv1_bn/FusedBatchNorm:0conv1_bn/cond/Switch_1:12
conv1_bn/cond/pred_id:0conv1_bn/cond/pred_id:0
?
conv1_bn/cond/cond_text_1conv1_bn/cond/pred_id:0conv1_bn/cond/switch_f:0*?
conv1/convolution:0
conv1_bn/beta/read:0
conv1_bn/cond/batchnorm/Rsqrt:0
$conv1_bn/cond/batchnorm/add/Switch:0
conv1_bn/cond/batchnorm/add/y:0
conv1_bn/cond/batchnorm/add:0
conv1_bn/cond/batchnorm/add_1:0
$conv1_bn/cond/batchnorm/mul/Switch:0
conv1_bn/cond/batchnorm/mul:0
&conv1_bn/cond/batchnorm/mul_1/Switch:0
conv1_bn/cond/batchnorm/mul_1:0
&conv1_bn/cond/batchnorm/mul_2/Switch:0
conv1_bn/cond/batchnorm/mul_2:0
$conv1_bn/cond/batchnorm/sub/Switch:0
conv1_bn/cond/batchnorm/sub:0
conv1_bn/cond/pred_id:0
conv1_bn/cond/switch_f:0
conv1_bn/gamma/read:0
conv1_bn/moving_mean/read:0
conv1_bn/moving_variance/read:0G
conv1_bn/moving_variance/read:0$conv1_bn/cond/batchnorm/add/Switch:0E
conv1_bn/moving_mean/read:0&conv1_bn/cond/batchnorm/mul_2/Switch:0=
conv1_bn/gamma/read:0$conv1_bn/cond/batchnorm/mul/Switch:02
conv1_bn/cond/pred_id:0conv1_bn/cond/pred_id:0<
conv1_bn/beta/read:0$conv1_bn/cond/batchnorm/sub/Switch:0=
conv1/convolution:0&conv1_bn/cond/batchnorm/mul_1/Switch:0
?
conv_dw_1_bn/cond/cond_textconv_dw_1_bn/cond/pred_id:0conv_dw_1_bn/cond/switch_t:0 *?
conv_dw_1_bn/FusedBatchNorm:0
conv_dw_1_bn/cond/Switch_1:0
conv_dw_1_bn/cond/Switch_1:1
conv_dw_1_bn/cond/pred_id:0
conv_dw_1_bn/cond/switch_t:0:
conv_dw_1_bn/cond/pred_id:0conv_dw_1_bn/cond/pred_id:0=
conv_dw_1_bn/FusedBatchNorm:0conv_dw_1_bn/cond/Switch_1:1
?	
conv_dw_1_bn/cond/cond_text_1conv_dw_1_bn/cond/pred_id:0conv_dw_1_bn/cond/switch_f:0*?
conv_dw_1/depthwise:0
conv_dw_1_bn/beta/read:0
#conv_dw_1_bn/cond/batchnorm/Rsqrt:0
(conv_dw_1_bn/cond/batchnorm/add/Switch:0
#conv_dw_1_bn/cond/batchnorm/add/y:0
!conv_dw_1_bn/cond/batchnorm/add:0
#conv_dw_1_bn/cond/batchnorm/add_1:0
(conv_dw_1_bn/cond/batchnorm/mul/Switch:0
!conv_dw_1_bn/cond/batchnorm/mul:0
*conv_dw_1_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_1_bn/cond/batchnorm/mul_1:0
*conv_dw_1_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_1_bn/cond/batchnorm/mul_2:0
(conv_dw_1_bn/cond/batchnorm/sub/Switch:0
!conv_dw_1_bn/cond/batchnorm/sub:0
conv_dw_1_bn/cond/pred_id:0
conv_dw_1_bn/cond/switch_f:0
conv_dw_1_bn/gamma/read:0
conv_dw_1_bn/moving_mean/read:0
#conv_dw_1_bn/moving_variance/read:0:
conv_dw_1_bn/cond/pred_id:0conv_dw_1_bn/cond/pred_id:0E
conv_dw_1_bn/gamma/read:0(conv_dw_1_bn/cond/batchnorm/mul/Switch:0D
conv_dw_1_bn/beta/read:0(conv_dw_1_bn/cond/batchnorm/sub/Switch:0O
#conv_dw_1_bn/moving_variance/read:0(conv_dw_1_bn/cond/batchnorm/add/Switch:0M
conv_dw_1_bn/moving_mean/read:0*conv_dw_1_bn/cond/batchnorm/mul_2/Switch:0C
conv_dw_1/depthwise:0*conv_dw_1_bn/cond/batchnorm/mul_1/Switch:0
?
conv_pw_1_bn/cond/cond_textconv_pw_1_bn/cond/pred_id:0conv_pw_1_bn/cond/switch_t:0 *?
conv_pw_1_bn/FusedBatchNorm:0
conv_pw_1_bn/cond/Switch_1:0
conv_pw_1_bn/cond/Switch_1:1
conv_pw_1_bn/cond/pred_id:0
conv_pw_1_bn/cond/switch_t:0=
conv_pw_1_bn/FusedBatchNorm:0conv_pw_1_bn/cond/Switch_1:1:
conv_pw_1_bn/cond/pred_id:0conv_pw_1_bn/cond/pred_id:0
?	
conv_pw_1_bn/cond/cond_text_1conv_pw_1_bn/cond/pred_id:0conv_pw_1_bn/cond/switch_f:0*?
conv_pw_1/convolution:0
conv_pw_1_bn/beta/read:0
#conv_pw_1_bn/cond/batchnorm/Rsqrt:0
(conv_pw_1_bn/cond/batchnorm/add/Switch:0
#conv_pw_1_bn/cond/batchnorm/add/y:0
!conv_pw_1_bn/cond/batchnorm/add:0
#conv_pw_1_bn/cond/batchnorm/add_1:0
(conv_pw_1_bn/cond/batchnorm/mul/Switch:0
!conv_pw_1_bn/cond/batchnorm/mul:0
*conv_pw_1_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_1_bn/cond/batchnorm/mul_1:0
*conv_pw_1_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_1_bn/cond/batchnorm/mul_2:0
(conv_pw_1_bn/cond/batchnorm/sub/Switch:0
!conv_pw_1_bn/cond/batchnorm/sub:0
conv_pw_1_bn/cond/pred_id:0
conv_pw_1_bn/cond/switch_f:0
conv_pw_1_bn/gamma/read:0
conv_pw_1_bn/moving_mean/read:0
#conv_pw_1_bn/moving_variance/read:0:
conv_pw_1_bn/cond/pred_id:0conv_pw_1_bn/cond/pred_id:0E
conv_pw_1_bn/gamma/read:0(conv_pw_1_bn/cond/batchnorm/mul/Switch:0E
conv_pw_1/convolution:0*conv_pw_1_bn/cond/batchnorm/mul_1/Switch:0D
conv_pw_1_bn/beta/read:0(conv_pw_1_bn/cond/batchnorm/sub/Switch:0O
#conv_pw_1_bn/moving_variance/read:0(conv_pw_1_bn/cond/batchnorm/add/Switch:0M
conv_pw_1_bn/moving_mean/read:0*conv_pw_1_bn/cond/batchnorm/mul_2/Switch:0
?
conv_dw_2_bn/cond/cond_textconv_dw_2_bn/cond/pred_id:0conv_dw_2_bn/cond/switch_t:0 *?
conv_dw_2_bn/FusedBatchNorm:0
conv_dw_2_bn/cond/Switch_1:0
conv_dw_2_bn/cond/Switch_1:1
conv_dw_2_bn/cond/pred_id:0
conv_dw_2_bn/cond/switch_t:0:
conv_dw_2_bn/cond/pred_id:0conv_dw_2_bn/cond/pred_id:0=
conv_dw_2_bn/FusedBatchNorm:0conv_dw_2_bn/cond/Switch_1:1
?	
conv_dw_2_bn/cond/cond_text_1conv_dw_2_bn/cond/pred_id:0conv_dw_2_bn/cond/switch_f:0*?
conv_dw_2/depthwise:0
conv_dw_2_bn/beta/read:0
#conv_dw_2_bn/cond/batchnorm/Rsqrt:0
(conv_dw_2_bn/cond/batchnorm/add/Switch:0
#conv_dw_2_bn/cond/batchnorm/add/y:0
!conv_dw_2_bn/cond/batchnorm/add:0
#conv_dw_2_bn/cond/batchnorm/add_1:0
(conv_dw_2_bn/cond/batchnorm/mul/Switch:0
!conv_dw_2_bn/cond/batchnorm/mul:0
*conv_dw_2_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_2_bn/cond/batchnorm/mul_1:0
*conv_dw_2_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_2_bn/cond/batchnorm/mul_2:0
(conv_dw_2_bn/cond/batchnorm/sub/Switch:0
!conv_dw_2_bn/cond/batchnorm/sub:0
conv_dw_2_bn/cond/pred_id:0
conv_dw_2_bn/cond/switch_f:0
conv_dw_2_bn/gamma/read:0
conv_dw_2_bn/moving_mean/read:0
#conv_dw_2_bn/moving_variance/read:0O
#conv_dw_2_bn/moving_variance/read:0(conv_dw_2_bn/cond/batchnorm/add/Switch:0M
conv_dw_2_bn/moving_mean/read:0*conv_dw_2_bn/cond/batchnorm/mul_2/Switch:0E
conv_dw_2_bn/gamma/read:0(conv_dw_2_bn/cond/batchnorm/mul/Switch:0D
conv_dw_2_bn/beta/read:0(conv_dw_2_bn/cond/batchnorm/sub/Switch:0:
conv_dw_2_bn/cond/pred_id:0conv_dw_2_bn/cond/pred_id:0C
conv_dw_2/depthwise:0*conv_dw_2_bn/cond/batchnorm/mul_1/Switch:0
?
conv_pw_2_bn/cond/cond_textconv_pw_2_bn/cond/pred_id:0conv_pw_2_bn/cond/switch_t:0 *?
conv_pw_2_bn/FusedBatchNorm:0
conv_pw_2_bn/cond/Switch_1:0
conv_pw_2_bn/cond/Switch_1:1
conv_pw_2_bn/cond/pred_id:0
conv_pw_2_bn/cond/switch_t:0=
conv_pw_2_bn/FusedBatchNorm:0conv_pw_2_bn/cond/Switch_1:1:
conv_pw_2_bn/cond/pred_id:0conv_pw_2_bn/cond/pred_id:0
?	
conv_pw_2_bn/cond/cond_text_1conv_pw_2_bn/cond/pred_id:0conv_pw_2_bn/cond/switch_f:0*?
conv_pw_2/convolution:0
conv_pw_2_bn/beta/read:0
#conv_pw_2_bn/cond/batchnorm/Rsqrt:0
(conv_pw_2_bn/cond/batchnorm/add/Switch:0
#conv_pw_2_bn/cond/batchnorm/add/y:0
!conv_pw_2_bn/cond/batchnorm/add:0
#conv_pw_2_bn/cond/batchnorm/add_1:0
(conv_pw_2_bn/cond/batchnorm/mul/Switch:0
!conv_pw_2_bn/cond/batchnorm/mul:0
*conv_pw_2_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_2_bn/cond/batchnorm/mul_1:0
*conv_pw_2_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_2_bn/cond/batchnorm/mul_2:0
(conv_pw_2_bn/cond/batchnorm/sub/Switch:0
!conv_pw_2_bn/cond/batchnorm/sub:0
conv_pw_2_bn/cond/pred_id:0
conv_pw_2_bn/cond/switch_f:0
conv_pw_2_bn/gamma/read:0
conv_pw_2_bn/moving_mean/read:0
#conv_pw_2_bn/moving_variance/read:0O
#conv_pw_2_bn/moving_variance/read:0(conv_pw_2_bn/cond/batchnorm/add/Switch:0M
conv_pw_2_bn/moving_mean/read:0*conv_pw_2_bn/cond/batchnorm/mul_2/Switch:0E
conv_pw_2_bn/gamma/read:0(conv_pw_2_bn/cond/batchnorm/mul/Switch:0D
conv_pw_2_bn/beta/read:0(conv_pw_2_bn/cond/batchnorm/sub/Switch:0:
conv_pw_2_bn/cond/pred_id:0conv_pw_2_bn/cond/pred_id:0E
conv_pw_2/convolution:0*conv_pw_2_bn/cond/batchnorm/mul_1/Switch:0
?
conv_dw_3_bn/cond/cond_textconv_dw_3_bn/cond/pred_id:0conv_dw_3_bn/cond/switch_t:0 *?
conv_dw_3_bn/FusedBatchNorm:0
conv_dw_3_bn/cond/Switch_1:0
conv_dw_3_bn/cond/Switch_1:1
conv_dw_3_bn/cond/pred_id:0
conv_dw_3_bn/cond/switch_t:0:
conv_dw_3_bn/cond/pred_id:0conv_dw_3_bn/cond/pred_id:0=
conv_dw_3_bn/FusedBatchNorm:0conv_dw_3_bn/cond/Switch_1:1
?	
conv_dw_3_bn/cond/cond_text_1conv_dw_3_bn/cond/pred_id:0conv_dw_3_bn/cond/switch_f:0*?
conv_dw_3/depthwise:0
conv_dw_3_bn/beta/read:0
#conv_dw_3_bn/cond/batchnorm/Rsqrt:0
(conv_dw_3_bn/cond/batchnorm/add/Switch:0
#conv_dw_3_bn/cond/batchnorm/add/y:0
!conv_dw_3_bn/cond/batchnorm/add:0
#conv_dw_3_bn/cond/batchnorm/add_1:0
(conv_dw_3_bn/cond/batchnorm/mul/Switch:0
!conv_dw_3_bn/cond/batchnorm/mul:0
*conv_dw_3_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_3_bn/cond/batchnorm/mul_1:0
*conv_dw_3_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_3_bn/cond/batchnorm/mul_2:0
(conv_dw_3_bn/cond/batchnorm/sub/Switch:0
!conv_dw_3_bn/cond/batchnorm/sub:0
conv_dw_3_bn/cond/pred_id:0
conv_dw_3_bn/cond/switch_f:0
conv_dw_3_bn/gamma/read:0
conv_dw_3_bn/moving_mean/read:0
#conv_dw_3_bn/moving_variance/read:0C
conv_dw_3/depthwise:0*conv_dw_3_bn/cond/batchnorm/mul_1/Switch:0D
conv_dw_3_bn/beta/read:0(conv_dw_3_bn/cond/batchnorm/sub/Switch:0:
conv_dw_3_bn/cond/pred_id:0conv_dw_3_bn/cond/pred_id:0E
conv_dw_3_bn/gamma/read:0(conv_dw_3_bn/cond/batchnorm/mul/Switch:0O
#conv_dw_3_bn/moving_variance/read:0(conv_dw_3_bn/cond/batchnorm/add/Switch:0M
conv_dw_3_bn/moving_mean/read:0*conv_dw_3_bn/cond/batchnorm/mul_2/Switch:0
?
conv_pw_3_bn/cond/cond_textconv_pw_3_bn/cond/pred_id:0conv_pw_3_bn/cond/switch_t:0 *?
conv_pw_3_bn/FusedBatchNorm:0
conv_pw_3_bn/cond/Switch_1:0
conv_pw_3_bn/cond/Switch_1:1
conv_pw_3_bn/cond/pred_id:0
conv_pw_3_bn/cond/switch_t:0:
conv_pw_3_bn/cond/pred_id:0conv_pw_3_bn/cond/pred_id:0=
conv_pw_3_bn/FusedBatchNorm:0conv_pw_3_bn/cond/Switch_1:1
?	
conv_pw_3_bn/cond/cond_text_1conv_pw_3_bn/cond/pred_id:0conv_pw_3_bn/cond/switch_f:0*?
conv_pw_3/convolution:0
conv_pw_3_bn/beta/read:0
#conv_pw_3_bn/cond/batchnorm/Rsqrt:0
(conv_pw_3_bn/cond/batchnorm/add/Switch:0
#conv_pw_3_bn/cond/batchnorm/add/y:0
!conv_pw_3_bn/cond/batchnorm/add:0
#conv_pw_3_bn/cond/batchnorm/add_1:0
(conv_pw_3_bn/cond/batchnorm/mul/Switch:0
!conv_pw_3_bn/cond/batchnorm/mul:0
*conv_pw_3_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_3_bn/cond/batchnorm/mul_1:0
*conv_pw_3_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_3_bn/cond/batchnorm/mul_2:0
(conv_pw_3_bn/cond/batchnorm/sub/Switch:0
!conv_pw_3_bn/cond/batchnorm/sub:0
conv_pw_3_bn/cond/pred_id:0
conv_pw_3_bn/cond/switch_f:0
conv_pw_3_bn/gamma/read:0
conv_pw_3_bn/moving_mean/read:0
#conv_pw_3_bn/moving_variance/read:0O
#conv_pw_3_bn/moving_variance/read:0(conv_pw_3_bn/cond/batchnorm/add/Switch:0M
conv_pw_3_bn/moving_mean/read:0*conv_pw_3_bn/cond/batchnorm/mul_2/Switch:0D
conv_pw_3_bn/beta/read:0(conv_pw_3_bn/cond/batchnorm/sub/Switch:0:
conv_pw_3_bn/cond/pred_id:0conv_pw_3_bn/cond/pred_id:0E
conv_pw_3_bn/gamma/read:0(conv_pw_3_bn/cond/batchnorm/mul/Switch:0E
conv_pw_3/convolution:0*conv_pw_3_bn/cond/batchnorm/mul_1/Switch:0
?
conv_dw_4_bn/cond/cond_textconv_dw_4_bn/cond/pred_id:0conv_dw_4_bn/cond/switch_t:0 *?
conv_dw_4_bn/FusedBatchNorm:0
conv_dw_4_bn/cond/Switch_1:0
conv_dw_4_bn/cond/Switch_1:1
conv_dw_4_bn/cond/pred_id:0
conv_dw_4_bn/cond/switch_t:0=
conv_dw_4_bn/FusedBatchNorm:0conv_dw_4_bn/cond/Switch_1:1:
conv_dw_4_bn/cond/pred_id:0conv_dw_4_bn/cond/pred_id:0
?	
conv_dw_4_bn/cond/cond_text_1conv_dw_4_bn/cond/pred_id:0conv_dw_4_bn/cond/switch_f:0*?
conv_dw_4/depthwise:0
conv_dw_4_bn/beta/read:0
#conv_dw_4_bn/cond/batchnorm/Rsqrt:0
(conv_dw_4_bn/cond/batchnorm/add/Switch:0
#conv_dw_4_bn/cond/batchnorm/add/y:0
!conv_dw_4_bn/cond/batchnorm/add:0
#conv_dw_4_bn/cond/batchnorm/add_1:0
(conv_dw_4_bn/cond/batchnorm/mul/Switch:0
!conv_dw_4_bn/cond/batchnorm/mul:0
*conv_dw_4_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_4_bn/cond/batchnorm/mul_1:0
*conv_dw_4_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_4_bn/cond/batchnorm/mul_2:0
(conv_dw_4_bn/cond/batchnorm/sub/Switch:0
!conv_dw_4_bn/cond/batchnorm/sub:0
conv_dw_4_bn/cond/pred_id:0
conv_dw_4_bn/cond/switch_f:0
conv_dw_4_bn/gamma/read:0
conv_dw_4_bn/moving_mean/read:0
#conv_dw_4_bn/moving_variance/read:0:
conv_dw_4_bn/cond/pred_id:0conv_dw_4_bn/cond/pred_id:0D
conv_dw_4_bn/beta/read:0(conv_dw_4_bn/cond/batchnorm/sub/Switch:0C
conv_dw_4/depthwise:0*conv_dw_4_bn/cond/batchnorm/mul_1/Switch:0O
#conv_dw_4_bn/moving_variance/read:0(conv_dw_4_bn/cond/batchnorm/add/Switch:0M
conv_dw_4_bn/moving_mean/read:0*conv_dw_4_bn/cond/batchnorm/mul_2/Switch:0E
conv_dw_4_bn/gamma/read:0(conv_dw_4_bn/cond/batchnorm/mul/Switch:0
?
conv_pw_4_bn/cond/cond_textconv_pw_4_bn/cond/pred_id:0conv_pw_4_bn/cond/switch_t:0 *?
conv_pw_4_bn/FusedBatchNorm:0
conv_pw_4_bn/cond/Switch_1:0
conv_pw_4_bn/cond/Switch_1:1
conv_pw_4_bn/cond/pred_id:0
conv_pw_4_bn/cond/switch_t:0=
conv_pw_4_bn/FusedBatchNorm:0conv_pw_4_bn/cond/Switch_1:1:
conv_pw_4_bn/cond/pred_id:0conv_pw_4_bn/cond/pred_id:0
?	
conv_pw_4_bn/cond/cond_text_1conv_pw_4_bn/cond/pred_id:0conv_pw_4_bn/cond/switch_f:0*?
conv_pw_4/convolution:0
conv_pw_4_bn/beta/read:0
#conv_pw_4_bn/cond/batchnorm/Rsqrt:0
(conv_pw_4_bn/cond/batchnorm/add/Switch:0
#conv_pw_4_bn/cond/batchnorm/add/y:0
!conv_pw_4_bn/cond/batchnorm/add:0
#conv_pw_4_bn/cond/batchnorm/add_1:0
(conv_pw_4_bn/cond/batchnorm/mul/Switch:0
!conv_pw_4_bn/cond/batchnorm/mul:0
*conv_pw_4_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_4_bn/cond/batchnorm/mul_1:0
*conv_pw_4_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_4_bn/cond/batchnorm/mul_2:0
(conv_pw_4_bn/cond/batchnorm/sub/Switch:0
!conv_pw_4_bn/cond/batchnorm/sub:0
conv_pw_4_bn/cond/pred_id:0
conv_pw_4_bn/cond/switch_f:0
conv_pw_4_bn/gamma/read:0
conv_pw_4_bn/moving_mean/read:0
#conv_pw_4_bn/moving_variance/read:0E
conv_pw_4_bn/gamma/read:0(conv_pw_4_bn/cond/batchnorm/mul/Switch:0:
conv_pw_4_bn/cond/pred_id:0conv_pw_4_bn/cond/pred_id:0D
conv_pw_4_bn/beta/read:0(conv_pw_4_bn/cond/batchnorm/sub/Switch:0E
conv_pw_4/convolution:0*conv_pw_4_bn/cond/batchnorm/mul_1/Switch:0O
#conv_pw_4_bn/moving_variance/read:0(conv_pw_4_bn/cond/batchnorm/add/Switch:0M
conv_pw_4_bn/moving_mean/read:0*conv_pw_4_bn/cond/batchnorm/mul_2/Switch:0
?
conv_dw_5_bn/cond/cond_textconv_dw_5_bn/cond/pred_id:0conv_dw_5_bn/cond/switch_t:0 *?
conv_dw_5_bn/FusedBatchNorm:0
conv_dw_5_bn/cond/Switch_1:0
conv_dw_5_bn/cond/Switch_1:1
conv_dw_5_bn/cond/pred_id:0
conv_dw_5_bn/cond/switch_t:0:
conv_dw_5_bn/cond/pred_id:0conv_dw_5_bn/cond/pred_id:0=
conv_dw_5_bn/FusedBatchNorm:0conv_dw_5_bn/cond/Switch_1:1
?	
conv_dw_5_bn/cond/cond_text_1conv_dw_5_bn/cond/pred_id:0conv_dw_5_bn/cond/switch_f:0*?
conv_dw_5/depthwise:0
conv_dw_5_bn/beta/read:0
#conv_dw_5_bn/cond/batchnorm/Rsqrt:0
(conv_dw_5_bn/cond/batchnorm/add/Switch:0
#conv_dw_5_bn/cond/batchnorm/add/y:0
!conv_dw_5_bn/cond/batchnorm/add:0
#conv_dw_5_bn/cond/batchnorm/add_1:0
(conv_dw_5_bn/cond/batchnorm/mul/Switch:0
!conv_dw_5_bn/cond/batchnorm/mul:0
*conv_dw_5_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_5_bn/cond/batchnorm/mul_1:0
*conv_dw_5_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_5_bn/cond/batchnorm/mul_2:0
(conv_dw_5_bn/cond/batchnorm/sub/Switch:0
!conv_dw_5_bn/cond/batchnorm/sub:0
conv_dw_5_bn/cond/pred_id:0
conv_dw_5_bn/cond/switch_f:0
conv_dw_5_bn/gamma/read:0
conv_dw_5_bn/moving_mean/read:0
#conv_dw_5_bn/moving_variance/read:0:
conv_dw_5_bn/cond/pred_id:0conv_dw_5_bn/cond/pred_id:0E
conv_dw_5_bn/gamma/read:0(conv_dw_5_bn/cond/batchnorm/mul/Switch:0D
conv_dw_5_bn/beta/read:0(conv_dw_5_bn/cond/batchnorm/sub/Switch:0O
#conv_dw_5_bn/moving_variance/read:0(conv_dw_5_bn/cond/batchnorm/add/Switch:0M
conv_dw_5_bn/moving_mean/read:0*conv_dw_5_bn/cond/batchnorm/mul_2/Switch:0C
conv_dw_5/depthwise:0*conv_dw_5_bn/cond/batchnorm/mul_1/Switch:0
?
conv_pw_5_bn/cond/cond_textconv_pw_5_bn/cond/pred_id:0conv_pw_5_bn/cond/switch_t:0 *?
conv_pw_5_bn/FusedBatchNorm:0
conv_pw_5_bn/cond/Switch_1:0
conv_pw_5_bn/cond/Switch_1:1
conv_pw_5_bn/cond/pred_id:0
conv_pw_5_bn/cond/switch_t:0:
conv_pw_5_bn/cond/pred_id:0conv_pw_5_bn/cond/pred_id:0=
conv_pw_5_bn/FusedBatchNorm:0conv_pw_5_bn/cond/Switch_1:1
?	
conv_pw_5_bn/cond/cond_text_1conv_pw_5_bn/cond/pred_id:0conv_pw_5_bn/cond/switch_f:0*?
conv_pw_5/convolution:0
conv_pw_5_bn/beta/read:0
#conv_pw_5_bn/cond/batchnorm/Rsqrt:0
(conv_pw_5_bn/cond/batchnorm/add/Switch:0
#conv_pw_5_bn/cond/batchnorm/add/y:0
!conv_pw_5_bn/cond/batchnorm/add:0
#conv_pw_5_bn/cond/batchnorm/add_1:0
(conv_pw_5_bn/cond/batchnorm/mul/Switch:0
!conv_pw_5_bn/cond/batchnorm/mul:0
*conv_pw_5_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_5_bn/cond/batchnorm/mul_1:0
*conv_pw_5_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_5_bn/cond/batchnorm/mul_2:0
(conv_pw_5_bn/cond/batchnorm/sub/Switch:0
!conv_pw_5_bn/cond/batchnorm/sub:0
conv_pw_5_bn/cond/pred_id:0
conv_pw_5_bn/cond/switch_f:0
conv_pw_5_bn/gamma/read:0
conv_pw_5_bn/moving_mean/read:0
#conv_pw_5_bn/moving_variance/read:0E
conv_pw_5/convolution:0*conv_pw_5_bn/cond/batchnorm/mul_1/Switch:0D
conv_pw_5_bn/beta/read:0(conv_pw_5_bn/cond/batchnorm/sub/Switch:0O
#conv_pw_5_bn/moving_variance/read:0(conv_pw_5_bn/cond/batchnorm/add/Switch:0M
conv_pw_5_bn/moving_mean/read:0*conv_pw_5_bn/cond/batchnorm/mul_2/Switch:0:
conv_pw_5_bn/cond/pred_id:0conv_pw_5_bn/cond/pred_id:0E
conv_pw_5_bn/gamma/read:0(conv_pw_5_bn/cond/batchnorm/mul/Switch:0
?
conv_dw_6_bn/cond/cond_textconv_dw_6_bn/cond/pred_id:0conv_dw_6_bn/cond/switch_t:0 *?
conv_dw_6_bn/FusedBatchNorm:0
conv_dw_6_bn/cond/Switch_1:0
conv_dw_6_bn/cond/Switch_1:1
conv_dw_6_bn/cond/pred_id:0
conv_dw_6_bn/cond/switch_t:0:
conv_dw_6_bn/cond/pred_id:0conv_dw_6_bn/cond/pred_id:0=
conv_dw_6_bn/FusedBatchNorm:0conv_dw_6_bn/cond/Switch_1:1
?	
conv_dw_6_bn/cond/cond_text_1conv_dw_6_bn/cond/pred_id:0conv_dw_6_bn/cond/switch_f:0*?
conv_dw_6/depthwise:0
conv_dw_6_bn/beta/read:0
#conv_dw_6_bn/cond/batchnorm/Rsqrt:0
(conv_dw_6_bn/cond/batchnorm/add/Switch:0
#conv_dw_6_bn/cond/batchnorm/add/y:0
!conv_dw_6_bn/cond/batchnorm/add:0
#conv_dw_6_bn/cond/batchnorm/add_1:0
(conv_dw_6_bn/cond/batchnorm/mul/Switch:0
!conv_dw_6_bn/cond/batchnorm/mul:0
*conv_dw_6_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_6_bn/cond/batchnorm/mul_1:0
*conv_dw_6_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_6_bn/cond/batchnorm/mul_2:0
(conv_dw_6_bn/cond/batchnorm/sub/Switch:0
!conv_dw_6_bn/cond/batchnorm/sub:0
conv_dw_6_bn/cond/pred_id:0
conv_dw_6_bn/cond/switch_f:0
conv_dw_6_bn/gamma/read:0
conv_dw_6_bn/moving_mean/read:0
#conv_dw_6_bn/moving_variance/read:0:
conv_dw_6_bn/cond/pred_id:0conv_dw_6_bn/cond/pred_id:0C
conv_dw_6/depthwise:0*conv_dw_6_bn/cond/batchnorm/mul_1/Switch:0O
#conv_dw_6_bn/moving_variance/read:0(conv_dw_6_bn/cond/batchnorm/add/Switch:0M
conv_dw_6_bn/moving_mean/read:0*conv_dw_6_bn/cond/batchnorm/mul_2/Switch:0E
conv_dw_6_bn/gamma/read:0(conv_dw_6_bn/cond/batchnorm/mul/Switch:0D
conv_dw_6_bn/beta/read:0(conv_dw_6_bn/cond/batchnorm/sub/Switch:0
?
conv_pw_6_bn/cond/cond_textconv_pw_6_bn/cond/pred_id:0conv_pw_6_bn/cond/switch_t:0 *?
conv_pw_6_bn/FusedBatchNorm:0
conv_pw_6_bn/cond/Switch_1:0
conv_pw_6_bn/cond/Switch_1:1
conv_pw_6_bn/cond/pred_id:0
conv_pw_6_bn/cond/switch_t:0=
conv_pw_6_bn/FusedBatchNorm:0conv_pw_6_bn/cond/Switch_1:1:
conv_pw_6_bn/cond/pred_id:0conv_pw_6_bn/cond/pred_id:0
?	
conv_pw_6_bn/cond/cond_text_1conv_pw_6_bn/cond/pred_id:0conv_pw_6_bn/cond/switch_f:0*?
conv_pw_6/convolution:0
conv_pw_6_bn/beta/read:0
#conv_pw_6_bn/cond/batchnorm/Rsqrt:0
(conv_pw_6_bn/cond/batchnorm/add/Switch:0
#conv_pw_6_bn/cond/batchnorm/add/y:0
!conv_pw_6_bn/cond/batchnorm/add:0
#conv_pw_6_bn/cond/batchnorm/add_1:0
(conv_pw_6_bn/cond/batchnorm/mul/Switch:0
!conv_pw_6_bn/cond/batchnorm/mul:0
*conv_pw_6_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_6_bn/cond/batchnorm/mul_1:0
*conv_pw_6_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_6_bn/cond/batchnorm/mul_2:0
(conv_pw_6_bn/cond/batchnorm/sub/Switch:0
!conv_pw_6_bn/cond/batchnorm/sub:0
conv_pw_6_bn/cond/pred_id:0
conv_pw_6_bn/cond/switch_f:0
conv_pw_6_bn/gamma/read:0
conv_pw_6_bn/moving_mean/read:0
#conv_pw_6_bn/moving_variance/read:0D
conv_pw_6_bn/beta/read:0(conv_pw_6_bn/cond/batchnorm/sub/Switch:0:
conv_pw_6_bn/cond/pred_id:0conv_pw_6_bn/cond/pred_id:0E
conv_pw_6/convolution:0*conv_pw_6_bn/cond/batchnorm/mul_1/Switch:0O
#conv_pw_6_bn/moving_variance/read:0(conv_pw_6_bn/cond/batchnorm/add/Switch:0M
conv_pw_6_bn/moving_mean/read:0*conv_pw_6_bn/cond/batchnorm/mul_2/Switch:0E
conv_pw_6_bn/gamma/read:0(conv_pw_6_bn/cond/batchnorm/mul/Switch:0
?
conv_dw_7_bn/cond/cond_textconv_dw_7_bn/cond/pred_id:0conv_dw_7_bn/cond/switch_t:0 *?
conv_dw_7_bn/FusedBatchNorm:0
conv_dw_7_bn/cond/Switch_1:0
conv_dw_7_bn/cond/Switch_1:1
conv_dw_7_bn/cond/pred_id:0
conv_dw_7_bn/cond/switch_t:0:
conv_dw_7_bn/cond/pred_id:0conv_dw_7_bn/cond/pred_id:0=
conv_dw_7_bn/FusedBatchNorm:0conv_dw_7_bn/cond/Switch_1:1
?	
conv_dw_7_bn/cond/cond_text_1conv_dw_7_bn/cond/pred_id:0conv_dw_7_bn/cond/switch_f:0*?
conv_dw_7/depthwise:0
conv_dw_7_bn/beta/read:0
#conv_dw_7_bn/cond/batchnorm/Rsqrt:0
(conv_dw_7_bn/cond/batchnorm/add/Switch:0
#conv_dw_7_bn/cond/batchnorm/add/y:0
!conv_dw_7_bn/cond/batchnorm/add:0
#conv_dw_7_bn/cond/batchnorm/add_1:0
(conv_dw_7_bn/cond/batchnorm/mul/Switch:0
!conv_dw_7_bn/cond/batchnorm/mul:0
*conv_dw_7_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_7_bn/cond/batchnorm/mul_1:0
*conv_dw_7_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_7_bn/cond/batchnorm/mul_2:0
(conv_dw_7_bn/cond/batchnorm/sub/Switch:0
!conv_dw_7_bn/cond/batchnorm/sub:0
conv_dw_7_bn/cond/pred_id:0
conv_dw_7_bn/cond/switch_f:0
conv_dw_7_bn/gamma/read:0
conv_dw_7_bn/moving_mean/read:0
#conv_dw_7_bn/moving_variance/read:0C
conv_dw_7/depthwise:0*conv_dw_7_bn/cond/batchnorm/mul_1/Switch:0D
conv_dw_7_bn/beta/read:0(conv_dw_7_bn/cond/batchnorm/sub/Switch:0:
conv_dw_7_bn/cond/pred_id:0conv_dw_7_bn/cond/pred_id:0E
conv_dw_7_bn/gamma/read:0(conv_dw_7_bn/cond/batchnorm/mul/Switch:0O
#conv_dw_7_bn/moving_variance/read:0(conv_dw_7_bn/cond/batchnorm/add/Switch:0M
conv_dw_7_bn/moving_mean/read:0*conv_dw_7_bn/cond/batchnorm/mul_2/Switch:0
?
conv_pw_7_bn/cond/cond_textconv_pw_7_bn/cond/pred_id:0conv_pw_7_bn/cond/switch_t:0 *?
conv_pw_7_bn/FusedBatchNorm:0
conv_pw_7_bn/cond/Switch_1:0
conv_pw_7_bn/cond/Switch_1:1
conv_pw_7_bn/cond/pred_id:0
conv_pw_7_bn/cond/switch_t:0:
conv_pw_7_bn/cond/pred_id:0conv_pw_7_bn/cond/pred_id:0=
conv_pw_7_bn/FusedBatchNorm:0conv_pw_7_bn/cond/Switch_1:1
?	
conv_pw_7_bn/cond/cond_text_1conv_pw_7_bn/cond/pred_id:0conv_pw_7_bn/cond/switch_f:0*?
conv_pw_7/convolution:0
conv_pw_7_bn/beta/read:0
#conv_pw_7_bn/cond/batchnorm/Rsqrt:0
(conv_pw_7_bn/cond/batchnorm/add/Switch:0
#conv_pw_7_bn/cond/batchnorm/add/y:0
!conv_pw_7_bn/cond/batchnorm/add:0
#conv_pw_7_bn/cond/batchnorm/add_1:0
(conv_pw_7_bn/cond/batchnorm/mul/Switch:0
!conv_pw_7_bn/cond/batchnorm/mul:0
*conv_pw_7_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_7_bn/cond/batchnorm/mul_1:0
*conv_pw_7_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_7_bn/cond/batchnorm/mul_2:0
(conv_pw_7_bn/cond/batchnorm/sub/Switch:0
!conv_pw_7_bn/cond/batchnorm/sub:0
conv_pw_7_bn/cond/pred_id:0
conv_pw_7_bn/cond/switch_f:0
conv_pw_7_bn/gamma/read:0
conv_pw_7_bn/moving_mean/read:0
#conv_pw_7_bn/moving_variance/read:0D
conv_pw_7_bn/beta/read:0(conv_pw_7_bn/cond/batchnorm/sub/Switch:0:
conv_pw_7_bn/cond/pred_id:0conv_pw_7_bn/cond/pred_id:0E
conv_pw_7_bn/gamma/read:0(conv_pw_7_bn/cond/batchnorm/mul/Switch:0E
conv_pw_7/convolution:0*conv_pw_7_bn/cond/batchnorm/mul_1/Switch:0O
#conv_pw_7_bn/moving_variance/read:0(conv_pw_7_bn/cond/batchnorm/add/Switch:0M
conv_pw_7_bn/moving_mean/read:0*conv_pw_7_bn/cond/batchnorm/mul_2/Switch:0
?
conv_dw_8_bn/cond/cond_textconv_dw_8_bn/cond/pred_id:0conv_dw_8_bn/cond/switch_t:0 *?
conv_dw_8_bn/FusedBatchNorm:0
conv_dw_8_bn/cond/Switch_1:0
conv_dw_8_bn/cond/Switch_1:1
conv_dw_8_bn/cond/pred_id:0
conv_dw_8_bn/cond/switch_t:0:
conv_dw_8_bn/cond/pred_id:0conv_dw_8_bn/cond/pred_id:0=
conv_dw_8_bn/FusedBatchNorm:0conv_dw_8_bn/cond/Switch_1:1
?	
conv_dw_8_bn/cond/cond_text_1conv_dw_8_bn/cond/pred_id:0conv_dw_8_bn/cond/switch_f:0*?
conv_dw_8/depthwise:0
conv_dw_8_bn/beta/read:0
#conv_dw_8_bn/cond/batchnorm/Rsqrt:0
(conv_dw_8_bn/cond/batchnorm/add/Switch:0
#conv_dw_8_bn/cond/batchnorm/add/y:0
!conv_dw_8_bn/cond/batchnorm/add:0
#conv_dw_8_bn/cond/batchnorm/add_1:0
(conv_dw_8_bn/cond/batchnorm/mul/Switch:0
!conv_dw_8_bn/cond/batchnorm/mul:0
*conv_dw_8_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_8_bn/cond/batchnorm/mul_1:0
*conv_dw_8_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_8_bn/cond/batchnorm/mul_2:0
(conv_dw_8_bn/cond/batchnorm/sub/Switch:0
!conv_dw_8_bn/cond/batchnorm/sub:0
conv_dw_8_bn/cond/pred_id:0
conv_dw_8_bn/cond/switch_f:0
conv_dw_8_bn/gamma/read:0
conv_dw_8_bn/moving_mean/read:0
#conv_dw_8_bn/moving_variance/read:0:
conv_dw_8_bn/cond/pred_id:0conv_dw_8_bn/cond/pred_id:0D
conv_dw_8_bn/beta/read:0(conv_dw_8_bn/cond/batchnorm/sub/Switch:0C
conv_dw_8/depthwise:0*conv_dw_8_bn/cond/batchnorm/mul_1/Switch:0O
#conv_dw_8_bn/moving_variance/read:0(conv_dw_8_bn/cond/batchnorm/add/Switch:0M
conv_dw_8_bn/moving_mean/read:0*conv_dw_8_bn/cond/batchnorm/mul_2/Switch:0E
conv_dw_8_bn/gamma/read:0(conv_dw_8_bn/cond/batchnorm/mul/Switch:0
?
conv_pw_8_bn/cond/cond_textconv_pw_8_bn/cond/pred_id:0conv_pw_8_bn/cond/switch_t:0 *?
conv_pw_8_bn/FusedBatchNorm:0
conv_pw_8_bn/cond/Switch_1:0
conv_pw_8_bn/cond/Switch_1:1
conv_pw_8_bn/cond/pred_id:0
conv_pw_8_bn/cond/switch_t:0:
conv_pw_8_bn/cond/pred_id:0conv_pw_8_bn/cond/pred_id:0=
conv_pw_8_bn/FusedBatchNorm:0conv_pw_8_bn/cond/Switch_1:1
?	
conv_pw_8_bn/cond/cond_text_1conv_pw_8_bn/cond/pred_id:0conv_pw_8_bn/cond/switch_f:0*?
conv_pw_8/convolution:0
conv_pw_8_bn/beta/read:0
#conv_pw_8_bn/cond/batchnorm/Rsqrt:0
(conv_pw_8_bn/cond/batchnorm/add/Switch:0
#conv_pw_8_bn/cond/batchnorm/add/y:0
!conv_pw_8_bn/cond/batchnorm/add:0
#conv_pw_8_bn/cond/batchnorm/add_1:0
(conv_pw_8_bn/cond/batchnorm/mul/Switch:0
!conv_pw_8_bn/cond/batchnorm/mul:0
*conv_pw_8_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_8_bn/cond/batchnorm/mul_1:0
*conv_pw_8_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_8_bn/cond/batchnorm/mul_2:0
(conv_pw_8_bn/cond/batchnorm/sub/Switch:0
!conv_pw_8_bn/cond/batchnorm/sub:0
conv_pw_8_bn/cond/pred_id:0
conv_pw_8_bn/cond/switch_f:0
conv_pw_8_bn/gamma/read:0
conv_pw_8_bn/moving_mean/read:0
#conv_pw_8_bn/moving_variance/read:0D
conv_pw_8_bn/beta/read:0(conv_pw_8_bn/cond/batchnorm/sub/Switch:0E
conv_pw_8/convolution:0*conv_pw_8_bn/cond/batchnorm/mul_1/Switch:0O
#conv_pw_8_bn/moving_variance/read:0(conv_pw_8_bn/cond/batchnorm/add/Switch:0M
conv_pw_8_bn/moving_mean/read:0*conv_pw_8_bn/cond/batchnorm/mul_2/Switch:0E
conv_pw_8_bn/gamma/read:0(conv_pw_8_bn/cond/batchnorm/mul/Switch:0:
conv_pw_8_bn/cond/pred_id:0conv_pw_8_bn/cond/pred_id:0
?
conv_dw_9_bn/cond/cond_textconv_dw_9_bn/cond/pred_id:0conv_dw_9_bn/cond/switch_t:0 *?
conv_dw_9_bn/FusedBatchNorm:0
conv_dw_9_bn/cond/Switch_1:0
conv_dw_9_bn/cond/Switch_1:1
conv_dw_9_bn/cond/pred_id:0
conv_dw_9_bn/cond/switch_t:0=
conv_dw_9_bn/FusedBatchNorm:0conv_dw_9_bn/cond/Switch_1:1:
conv_dw_9_bn/cond/pred_id:0conv_dw_9_bn/cond/pred_id:0
?	
conv_dw_9_bn/cond/cond_text_1conv_dw_9_bn/cond/pred_id:0conv_dw_9_bn/cond/switch_f:0*?
conv_dw_9/depthwise:0
conv_dw_9_bn/beta/read:0
#conv_dw_9_bn/cond/batchnorm/Rsqrt:0
(conv_dw_9_bn/cond/batchnorm/add/Switch:0
#conv_dw_9_bn/cond/batchnorm/add/y:0
!conv_dw_9_bn/cond/batchnorm/add:0
#conv_dw_9_bn/cond/batchnorm/add_1:0
(conv_dw_9_bn/cond/batchnorm/mul/Switch:0
!conv_dw_9_bn/cond/batchnorm/mul:0
*conv_dw_9_bn/cond/batchnorm/mul_1/Switch:0
#conv_dw_9_bn/cond/batchnorm/mul_1:0
*conv_dw_9_bn/cond/batchnorm/mul_2/Switch:0
#conv_dw_9_bn/cond/batchnorm/mul_2:0
(conv_dw_9_bn/cond/batchnorm/sub/Switch:0
!conv_dw_9_bn/cond/batchnorm/sub:0
conv_dw_9_bn/cond/pred_id:0
conv_dw_9_bn/cond/switch_f:0
conv_dw_9_bn/gamma/read:0
conv_dw_9_bn/moving_mean/read:0
#conv_dw_9_bn/moving_variance/read:0D
conv_dw_9_bn/beta/read:0(conv_dw_9_bn/cond/batchnorm/sub/Switch:0O
#conv_dw_9_bn/moving_variance/read:0(conv_dw_9_bn/cond/batchnorm/add/Switch:0M
conv_dw_9_bn/moving_mean/read:0*conv_dw_9_bn/cond/batchnorm/mul_2/Switch:0C
conv_dw_9/depthwise:0*conv_dw_9_bn/cond/batchnorm/mul_1/Switch:0:
conv_dw_9_bn/cond/pred_id:0conv_dw_9_bn/cond/pred_id:0E
conv_dw_9_bn/gamma/read:0(conv_dw_9_bn/cond/batchnorm/mul/Switch:0
?
conv_pw_9_bn/cond/cond_textconv_pw_9_bn/cond/pred_id:0conv_pw_9_bn/cond/switch_t:0 *?
conv_pw_9_bn/FusedBatchNorm:0
conv_pw_9_bn/cond/Switch_1:0
conv_pw_9_bn/cond/Switch_1:1
conv_pw_9_bn/cond/pred_id:0
conv_pw_9_bn/cond/switch_t:0=
conv_pw_9_bn/FusedBatchNorm:0conv_pw_9_bn/cond/Switch_1:1:
conv_pw_9_bn/cond/pred_id:0conv_pw_9_bn/cond/pred_id:0
?	
conv_pw_9_bn/cond/cond_text_1conv_pw_9_bn/cond/pred_id:0conv_pw_9_bn/cond/switch_f:0*?
conv_pw_9/convolution:0
conv_pw_9_bn/beta/read:0
#conv_pw_9_bn/cond/batchnorm/Rsqrt:0
(conv_pw_9_bn/cond/batchnorm/add/Switch:0
#conv_pw_9_bn/cond/batchnorm/add/y:0
!conv_pw_9_bn/cond/batchnorm/add:0
#conv_pw_9_bn/cond/batchnorm/add_1:0
(conv_pw_9_bn/cond/batchnorm/mul/Switch:0
!conv_pw_9_bn/cond/batchnorm/mul:0
*conv_pw_9_bn/cond/batchnorm/mul_1/Switch:0
#conv_pw_9_bn/cond/batchnorm/mul_1:0
*conv_pw_9_bn/cond/batchnorm/mul_2/Switch:0
#conv_pw_9_bn/cond/batchnorm/mul_2:0
(conv_pw_9_bn/cond/batchnorm/sub/Switch:0
!conv_pw_9_bn/cond/batchnorm/sub:0
conv_pw_9_bn/cond/pred_id:0
conv_pw_9_bn/cond/switch_f:0
conv_pw_9_bn/gamma/read:0
conv_pw_9_bn/moving_mean/read:0
#conv_pw_9_bn/moving_variance/read:0E
conv_pw_9/convolution:0*conv_pw_9_bn/cond/batchnorm/mul_1/Switch:0D
conv_pw_9_bn/beta/read:0(conv_pw_9_bn/cond/batchnorm/sub/Switch:0O
#conv_pw_9_bn/moving_variance/read:0(conv_pw_9_bn/cond/batchnorm/add/Switch:0M
conv_pw_9_bn/moving_mean/read:0*conv_pw_9_bn/cond/batchnorm/mul_2/Switch:0:
conv_pw_9_bn/cond/pred_id:0conv_pw_9_bn/cond/pred_id:0E
conv_pw_9_bn/gamma/read:0(conv_pw_9_bn/cond/batchnorm/mul/Switch:0
?
conv_dw_10_bn/cond/cond_textconv_dw_10_bn/cond/pred_id:0conv_dw_10_bn/cond/switch_t:0 *?
conv_dw_10_bn/FusedBatchNorm:0
conv_dw_10_bn/cond/Switch_1:0
conv_dw_10_bn/cond/Switch_1:1
conv_dw_10_bn/cond/pred_id:0
conv_dw_10_bn/cond/switch_t:0?
conv_dw_10_bn/FusedBatchNorm:0conv_dw_10_bn/cond/Switch_1:1<
conv_dw_10_bn/cond/pred_id:0conv_dw_10_bn/cond/pred_id:0
?	
conv_dw_10_bn/cond/cond_text_1conv_dw_10_bn/cond/pred_id:0conv_dw_10_bn/cond/switch_f:0*?	
conv_dw_10/depthwise:0
conv_dw_10_bn/beta/read:0
$conv_dw_10_bn/cond/batchnorm/Rsqrt:0
)conv_dw_10_bn/cond/batchnorm/add/Switch:0
$conv_dw_10_bn/cond/batchnorm/add/y:0
"conv_dw_10_bn/cond/batchnorm/add:0
$conv_dw_10_bn/cond/batchnorm/add_1:0
)conv_dw_10_bn/cond/batchnorm/mul/Switch:0
"conv_dw_10_bn/cond/batchnorm/mul:0
+conv_dw_10_bn/cond/batchnorm/mul_1/Switch:0
$conv_dw_10_bn/cond/batchnorm/mul_1:0
+conv_dw_10_bn/cond/batchnorm/mul_2/Switch:0
$conv_dw_10_bn/cond/batchnorm/mul_2:0
)conv_dw_10_bn/cond/batchnorm/sub/Switch:0
"conv_dw_10_bn/cond/batchnorm/sub:0
conv_dw_10_bn/cond/pred_id:0
conv_dw_10_bn/cond/switch_f:0
conv_dw_10_bn/gamma/read:0
 conv_dw_10_bn/moving_mean/read:0
$conv_dw_10_bn/moving_variance/read:0E
conv_dw_10/depthwise:0+conv_dw_10_bn/cond/batchnorm/mul_1/Switch:0<
conv_dw_10_bn/cond/pred_id:0conv_dw_10_bn/cond/pred_id:0G
conv_dw_10_bn/gamma/read:0)conv_dw_10_bn/cond/batchnorm/mul/Switch:0F
conv_dw_10_bn/beta/read:0)conv_dw_10_bn/cond/batchnorm/sub/Switch:0Q
$conv_dw_10_bn/moving_variance/read:0)conv_dw_10_bn/cond/batchnorm/add/Switch:0O
 conv_dw_10_bn/moving_mean/read:0+conv_dw_10_bn/cond/batchnorm/mul_2/Switch:0
?
conv_pw_10_bn/cond/cond_textconv_pw_10_bn/cond/pred_id:0conv_pw_10_bn/cond/switch_t:0 *?
conv_pw_10_bn/FusedBatchNorm:0
conv_pw_10_bn/cond/Switch_1:0
conv_pw_10_bn/cond/Switch_1:1
conv_pw_10_bn/cond/pred_id:0
conv_pw_10_bn/cond/switch_t:0<
conv_pw_10_bn/cond/pred_id:0conv_pw_10_bn/cond/pred_id:0?
conv_pw_10_bn/FusedBatchNorm:0conv_pw_10_bn/cond/Switch_1:1
?	
conv_pw_10_bn/cond/cond_text_1conv_pw_10_bn/cond/pred_id:0conv_pw_10_bn/cond/switch_f:0*?	
conv_pw_10/convolution:0
conv_pw_10_bn/beta/read:0
$conv_pw_10_bn/cond/batchnorm/Rsqrt:0
)conv_pw_10_bn/cond/batchnorm/add/Switch:0
$conv_pw_10_bn/cond/batchnorm/add/y:0
"conv_pw_10_bn/cond/batchnorm/add:0
$conv_pw_10_bn/cond/batchnorm/add_1:0
)conv_pw_10_bn/cond/batchnorm/mul/Switch:0
"conv_pw_10_bn/cond/batchnorm/mul:0
+conv_pw_10_bn/cond/batchnorm/mul_1/Switch:0
$conv_pw_10_bn/cond/batchnorm/mul_1:0
+conv_pw_10_bn/cond/batchnorm/mul_2/Switch:0
$conv_pw_10_bn/cond/batchnorm/mul_2:0
)conv_pw_10_bn/cond/batchnorm/sub/Switch:0
"conv_pw_10_bn/cond/batchnorm/sub:0
conv_pw_10_bn/cond/pred_id:0
conv_pw_10_bn/cond/switch_f:0
conv_pw_10_bn/gamma/read:0
 conv_pw_10_bn/moving_mean/read:0
$conv_pw_10_bn/moving_variance/read:0G
conv_pw_10/convolution:0+conv_pw_10_bn/cond/batchnorm/mul_1/Switch:0F
conv_pw_10_bn/beta/read:0)conv_pw_10_bn/cond/batchnorm/sub/Switch:0Q
$conv_pw_10_bn/moving_variance/read:0)conv_pw_10_bn/cond/batchnorm/add/Switch:0O
 conv_pw_10_bn/moving_mean/read:0+conv_pw_10_bn/cond/batchnorm/mul_2/Switch:0<
conv_pw_10_bn/cond/pred_id:0conv_pw_10_bn/cond/pred_id:0G
conv_pw_10_bn/gamma/read:0)conv_pw_10_bn/cond/batchnorm/mul/Switch:0
?
conv_dw_11_bn/cond/cond_textconv_dw_11_bn/cond/pred_id:0conv_dw_11_bn/cond/switch_t:0 *?
conv_dw_11_bn/FusedBatchNorm:0
conv_dw_11_bn/cond/Switch_1:0
conv_dw_11_bn/cond/Switch_1:1
conv_dw_11_bn/cond/pred_id:0
conv_dw_11_bn/cond/switch_t:0<
conv_dw_11_bn/cond/pred_id:0conv_dw_11_bn/cond/pred_id:0?
conv_dw_11_bn/FusedBatchNorm:0conv_dw_11_bn/cond/Switch_1:1
?	
conv_dw_11_bn/cond/cond_text_1conv_dw_11_bn/cond/pred_id:0conv_dw_11_bn/cond/switch_f:0*?	
conv_dw_11/depthwise:0
conv_dw_11_bn/beta/read:0
$conv_dw_11_bn/cond/batchnorm/Rsqrt:0
)conv_dw_11_bn/cond/batchnorm/add/Switch:0
$conv_dw_11_bn/cond/batchnorm/add/y:0
"conv_dw_11_bn/cond/batchnorm/add:0
$conv_dw_11_bn/cond/batchnorm/add_1:0
)conv_dw_11_bn/cond/batchnorm/mul/Switch:0
"conv_dw_11_bn/cond/batchnorm/mul:0
+conv_dw_11_bn/cond/batchnorm/mul_1/Switch:0
$conv_dw_11_bn/cond/batchnorm/mul_1:0
+conv_dw_11_bn/cond/batchnorm/mul_2/Switch:0
$conv_dw_11_bn/cond/batchnorm/mul_2:0
)conv_dw_11_bn/cond/batchnorm/sub/Switch:0
"conv_dw_11_bn/cond/batchnorm/sub:0
conv_dw_11_bn/cond/pred_id:0
conv_dw_11_bn/cond/switch_f:0
conv_dw_11_bn/gamma/read:0
 conv_dw_11_bn/moving_mean/read:0
$conv_dw_11_bn/moving_variance/read:0<
conv_dw_11_bn/cond/pred_id:0conv_dw_11_bn/cond/pred_id:0E
conv_dw_11/depthwise:0+conv_dw_11_bn/cond/batchnorm/mul_1/Switch:0Q
$conv_dw_11_bn/moving_variance/read:0)conv_dw_11_bn/cond/batchnorm/add/Switch:0O
 conv_dw_11_bn/moving_mean/read:0+conv_dw_11_bn/cond/batchnorm/mul_2/Switch:0G
conv_dw_11_bn/gamma/read:0)conv_dw_11_bn/cond/batchnorm/mul/Switch:0F
conv_dw_11_bn/beta/read:0)conv_dw_11_bn/cond/batchnorm/sub/Switch:0
?
conv_pw_11_bn/cond/cond_textconv_pw_11_bn/cond/pred_id:0conv_pw_11_bn/cond/switch_t:0 *?
conv_pw_11_bn/FusedBatchNorm:0
conv_pw_11_bn/cond/Switch_1:0
conv_pw_11_bn/cond/Switch_1:1
conv_pw_11_bn/cond/pred_id:0
conv_pw_11_bn/cond/switch_t:0<
conv_pw_11_bn/cond/pred_id:0conv_pw_11_bn/cond/pred_id:0?
conv_pw_11_bn/FusedBatchNorm:0conv_pw_11_bn/cond/Switch_1:1
?	
conv_pw_11_bn/cond/cond_text_1conv_pw_11_bn/cond/pred_id:0conv_pw_11_bn/cond/switch_f:0*?	
conv_pw_11/convolution:0
conv_pw_11_bn/beta/read:0
$conv_pw_11_bn/cond/batchnorm/Rsqrt:0
)conv_pw_11_bn/cond/batchnorm/add/Switch:0
$conv_pw_11_bn/cond/batchnorm/add/y:0
"conv_pw_11_bn/cond/batchnorm/add:0
$conv_pw_11_bn/cond/batchnorm/add_1:0
)conv_pw_11_bn/cond/batchnorm/mul/Switch:0
"conv_pw_11_bn/cond/batchnorm/mul:0
+conv_pw_11_bn/cond/batchnorm/mul_1/Switch:0
$conv_pw_11_bn/cond/batchnorm/mul_1:0
+conv_pw_11_bn/cond/batchnorm/mul_2/Switch:0
$conv_pw_11_bn/cond/batchnorm/mul_2:0
)conv_pw_11_bn/cond/batchnorm/sub/Switch:0
"conv_pw_11_bn/cond/batchnorm/sub:0
conv_pw_11_bn/cond/pred_id:0
conv_pw_11_bn/cond/switch_f:0
conv_pw_11_bn/gamma/read:0
 conv_pw_11_bn/moving_mean/read:0
$conv_pw_11_bn/moving_variance/read:0G
conv_pw_11_bn/gamma/read:0)conv_pw_11_bn/cond/batchnorm/mul/Switch:0F
conv_pw_11_bn/beta/read:0)conv_pw_11_bn/cond/batchnorm/sub/Switch:0<
conv_pw_11_bn/cond/pred_id:0conv_pw_11_bn/cond/pred_id:0G
conv_pw_11/convolution:0+conv_pw_11_bn/cond/batchnorm/mul_1/Switch:0Q
$conv_pw_11_bn/moving_variance/read:0)conv_pw_11_bn/cond/batchnorm/add/Switch:0O
 conv_pw_11_bn/moving_mean/read:0+conv_pw_11_bn/cond/batchnorm/mul_2/Switch:0
?
conv_dw_12_bn/cond/cond_textconv_dw_12_bn/cond/pred_id:0conv_dw_12_bn/cond/switch_t:0 *?
conv_dw_12_bn/FusedBatchNorm:0
conv_dw_12_bn/cond/Switch_1:0
conv_dw_12_bn/cond/Switch_1:1
conv_dw_12_bn/cond/pred_id:0
conv_dw_12_bn/cond/switch_t:0<
conv_dw_12_bn/cond/pred_id:0conv_dw_12_bn/cond/pred_id:0?
conv_dw_12_bn/FusedBatchNorm:0conv_dw_12_bn/cond/Switch_1:1
?	
conv_dw_12_bn/cond/cond_text_1conv_dw_12_bn/cond/pred_id:0conv_dw_12_bn/cond/switch_f:0*?	
conv_dw_12/depthwise:0
conv_dw_12_bn/beta/read:0
$conv_dw_12_bn/cond/batchnorm/Rsqrt:0
)conv_dw_12_bn/cond/batchnorm/add/Switch:0
$conv_dw_12_bn/cond/batchnorm/add/y:0
"conv_dw_12_bn/cond/batchnorm/add:0
$conv_dw_12_bn/cond/batchnorm/add_1:0
)conv_dw_12_bn/cond/batchnorm/mul/Switch:0
"conv_dw_12_bn/cond/batchnorm/mul:0
+conv_dw_12_bn/cond/batchnorm/mul_1/Switch:0
$conv_dw_12_bn/cond/batchnorm/mul_1:0
+conv_dw_12_bn/cond/batchnorm/mul_2/Switch:0
$conv_dw_12_bn/cond/batchnorm/mul_2:0
)conv_dw_12_bn/cond/batchnorm/sub/Switch:0
"conv_dw_12_bn/cond/batchnorm/sub:0
conv_dw_12_bn/cond/pred_id:0
conv_dw_12_bn/cond/switch_f:0
conv_dw_12_bn/gamma/read:0
 conv_dw_12_bn/moving_mean/read:0
$conv_dw_12_bn/moving_variance/read:0E
conv_dw_12/depthwise:0+conv_dw_12_bn/cond/batchnorm/mul_1/Switch:0F
conv_dw_12_bn/beta/read:0)conv_dw_12_bn/cond/batchnorm/sub/Switch:0<
conv_dw_12_bn/cond/pred_id:0conv_dw_12_bn/cond/pred_id:0G
conv_dw_12_bn/gamma/read:0)conv_dw_12_bn/cond/batchnorm/mul/Switch:0Q
$conv_dw_12_bn/moving_variance/read:0)conv_dw_12_bn/cond/batchnorm/add/Switch:0O
 conv_dw_12_bn/moving_mean/read:0+conv_dw_12_bn/cond/batchnorm/mul_2/Switch:0
?
conv_pw_12_bn/cond/cond_textconv_pw_12_bn/cond/pred_id:0conv_pw_12_bn/cond/switch_t:0 *?
conv_pw_12_bn/FusedBatchNorm:0
conv_pw_12_bn/cond/Switch_1:0
conv_pw_12_bn/cond/Switch_1:1
conv_pw_12_bn/cond/pred_id:0
conv_pw_12_bn/cond/switch_t:0?
conv_pw_12_bn/FusedBatchNorm:0conv_pw_12_bn/cond/Switch_1:1<
conv_pw_12_bn/cond/pred_id:0conv_pw_12_bn/cond/pred_id:0
?	
conv_pw_12_bn/cond/cond_text_1conv_pw_12_bn/cond/pred_id:0conv_pw_12_bn/cond/switch_f:0*?	
conv_pw_12/convolution:0
conv_pw_12_bn/beta/read:0
$conv_pw_12_bn/cond/batchnorm/Rsqrt:0
)conv_pw_12_bn/cond/batchnorm/add/Switch:0
$conv_pw_12_bn/cond/batchnorm/add/y:0
"conv_pw_12_bn/cond/batchnorm/add:0
$conv_pw_12_bn/cond/batchnorm/add_1:0
)conv_pw_12_bn/cond/batchnorm/mul/Switch:0
"conv_pw_12_bn/cond/batchnorm/mul:0
+conv_pw_12_bn/cond/batchnorm/mul_1/Switch:0
$conv_pw_12_bn/cond/batchnorm/mul_1:0
+conv_pw_12_bn/cond/batchnorm/mul_2/Switch:0
$conv_pw_12_bn/cond/batchnorm/mul_2:0
)conv_pw_12_bn/cond/batchnorm/sub/Switch:0
"conv_pw_12_bn/cond/batchnorm/sub:0
conv_pw_12_bn/cond/pred_id:0
conv_pw_12_bn/cond/switch_f:0
conv_pw_12_bn/gamma/read:0
 conv_pw_12_bn/moving_mean/read:0
$conv_pw_12_bn/moving_variance/read:0F
conv_pw_12_bn/beta/read:0)conv_pw_12_bn/cond/batchnorm/sub/Switch:0<
conv_pw_12_bn/cond/pred_id:0conv_pw_12_bn/cond/pred_id:0G
conv_pw_12_bn/gamma/read:0)conv_pw_12_bn/cond/batchnorm/mul/Switch:0G
conv_pw_12/convolution:0+conv_pw_12_bn/cond/batchnorm/mul_1/Switch:0Q
$conv_pw_12_bn/moving_variance/read:0)conv_pw_12_bn/cond/batchnorm/add/Switch:0O
 conv_pw_12_bn/moving_mean/read:0+conv_pw_12_bn/cond/batchnorm/mul_2/Switch:0
?
conv_dw_13_bn/cond/cond_textconv_dw_13_bn/cond/pred_id:0conv_dw_13_bn/cond/switch_t:0 *?
conv_dw_13_bn/FusedBatchNorm:0
conv_dw_13_bn/cond/Switch_1:0
conv_dw_13_bn/cond/Switch_1:1
conv_dw_13_bn/cond/pred_id:0
conv_dw_13_bn/cond/switch_t:0?
conv_dw_13_bn/FusedBatchNorm:0conv_dw_13_bn/cond/Switch_1:1<
conv_dw_13_bn/cond/pred_id:0conv_dw_13_bn/cond/pred_id:0
?	
conv_dw_13_bn/cond/cond_text_1conv_dw_13_bn/cond/pred_id:0conv_dw_13_bn/cond/switch_f:0*?	
conv_dw_13/depthwise:0
conv_dw_13_bn/beta/read:0
$conv_dw_13_bn/cond/batchnorm/Rsqrt:0
)conv_dw_13_bn/cond/batchnorm/add/Switch:0
$conv_dw_13_bn/cond/batchnorm/add/y:0
"conv_dw_13_bn/cond/batchnorm/add:0
$conv_dw_13_bn/cond/batchnorm/add_1:0
)conv_dw_13_bn/cond/batchnorm/mul/Switch:0
"conv_dw_13_bn/cond/batchnorm/mul:0
+conv_dw_13_bn/cond/batchnorm/mul_1/Switch:0
$conv_dw_13_bn/cond/batchnorm/mul_1:0
+conv_dw_13_bn/cond/batchnorm/mul_2/Switch:0
$conv_dw_13_bn/cond/batchnorm/mul_2:0
)conv_dw_13_bn/cond/batchnorm/sub/Switch:0
"conv_dw_13_bn/cond/batchnorm/sub:0
conv_dw_13_bn/cond/pred_id:0
conv_dw_13_bn/cond/switch_f:0
conv_dw_13_bn/gamma/read:0
 conv_dw_13_bn/moving_mean/read:0
$conv_dw_13_bn/moving_variance/read:0<
conv_dw_13_bn/cond/pred_id:0conv_dw_13_bn/cond/pred_id:0F
conv_dw_13_bn/beta/read:0)conv_dw_13_bn/cond/batchnorm/sub/Switch:0E
conv_dw_13/depthwise:0+conv_dw_13_bn/cond/batchnorm/mul_1/Switch:0Q
$conv_dw_13_bn/moving_variance/read:0)conv_dw_13_bn/cond/batchnorm/add/Switch:0O
 conv_dw_13_bn/moving_mean/read:0+conv_dw_13_bn/cond/batchnorm/mul_2/Switch:0G
conv_dw_13_bn/gamma/read:0)conv_dw_13_bn/cond/batchnorm/mul/Switch:0
?
conv_pw_13_bn/cond/cond_textconv_pw_13_bn/cond/pred_id:0conv_pw_13_bn/cond/switch_t:0 *?
conv_pw_13_bn/FusedBatchNorm:0
conv_pw_13_bn/cond/Switch_1:0
conv_pw_13_bn/cond/Switch_1:1
conv_pw_13_bn/cond/pred_id:0
conv_pw_13_bn/cond/switch_t:0<
conv_pw_13_bn/cond/pred_id:0conv_pw_13_bn/cond/pred_id:0?
conv_pw_13_bn/FusedBatchNorm:0conv_pw_13_bn/cond/Switch_1:1
?	
conv_pw_13_bn/cond/cond_text_1conv_pw_13_bn/cond/pred_id:0conv_pw_13_bn/cond/switch_f:0*?	
conv_pw_13/convolution:0
conv_pw_13_bn/beta/read:0
$conv_pw_13_bn/cond/batchnorm/Rsqrt:0
)conv_pw_13_bn/cond/batchnorm/add/Switch:0
$conv_pw_13_bn/cond/batchnorm/add/y:0
"conv_pw_13_bn/cond/batchnorm/add:0
$conv_pw_13_bn/cond/batchnorm/add_1:0
)conv_pw_13_bn/cond/batchnorm/mul/Switch:0
"conv_pw_13_bn/cond/batchnorm/mul:0
+conv_pw_13_bn/cond/batchnorm/mul_1/Switch:0
$conv_pw_13_bn/cond/batchnorm/mul_1:0
+conv_pw_13_bn/cond/batchnorm/mul_2/Switch:0
$conv_pw_13_bn/cond/batchnorm/mul_2:0
)conv_pw_13_bn/cond/batchnorm/sub/Switch:0
"conv_pw_13_bn/cond/batchnorm/sub:0
conv_pw_13_bn/cond/pred_id:0
conv_pw_13_bn/cond/switch_f:0
conv_pw_13_bn/gamma/read:0
 conv_pw_13_bn/moving_mean/read:0
$conv_pw_13_bn/moving_variance/read:0G
conv_pw_13_bn/gamma/read:0)conv_pw_13_bn/cond/batchnorm/mul/Switch:0<
conv_pw_13_bn/cond/pred_id:0conv_pw_13_bn/cond/pred_id:0F
conv_pw_13_bn/beta/read:0)conv_pw_13_bn/cond/batchnorm/sub/Switch:0G
conv_pw_13/convolution:0+conv_pw_13_bn/cond/batchnorm/mul_1/Switch:0Q
$conv_pw_13_bn/moving_variance/read:0)conv_pw_13_bn/cond/batchnorm/add/Switch:0O
 conv_pw_13_bn/moving_mean/read:0+conv_pw_13_bn/cond/batchnorm/mul_2/Switch:0"??
	variablesמӞ
T
conv1/kernel:0conv1/kernel/Assignconv1/kernel/read:02conv1/random_uniform:08
T
conv1_bn/gamma:0conv1_bn/gamma/Assignconv1_bn/gamma/read:02conv1_bn/Const:08
S
conv1_bn/beta:0conv1_bn/beta/Assignconv1_bn/beta/read:02conv1_bn/Const_1:08
h
conv1_bn/moving_mean:0conv1_bn/moving_mean/Assignconv1_bn/moving_mean/read:02conv1_bn/Const_2:08
t
conv1_bn/moving_variance:0conv1_bn/moving_variance/Assignconv1_bn/moving_variance/read:02conv1_bn/Const_3:08
?
conv1_bn/moving_mean/biased:0"conv1_bn/moving_mean/biased/Assign"conv1_bn/moving_mean/biased/read:025conv1_bn/AssignMovingAvg/conv1_bn/moving_mean/zeros:0
?
!conv1_bn/moving_mean/local_step:0&conv1_bn/moving_mean/local_step/Assign&conv1_bn/moving_mean/local_step/read:023conv1_bn/moving_mean/local_step/Initializer/zeros:0
?
!conv1_bn/moving_variance/biased:0&conv1_bn/moving_variance/biased/Assign&conv1_bn/moving_variance/biased/read:02;conv1_bn/AssignMovingAvg_1/conv1_bn/moving_variance/zeros:0
?
%conv1_bn/moving_variance/local_step:0*conv1_bn/moving_variance/local_step/Assign*conv1_bn/moving_variance/local_step/read:027conv1_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_1/depthwise_kernel:0!conv_dw_1/depthwise_kernel/Assign!conv_dw_1/depthwise_kernel/read:02conv_dw_1/random_uniform:08
d
conv_dw_1_bn/gamma:0conv_dw_1_bn/gamma/Assignconv_dw_1_bn/gamma/read:02conv_dw_1_bn/Const:08
c
conv_dw_1_bn/beta:0conv_dw_1_bn/beta/Assignconv_dw_1_bn/beta/read:02conv_dw_1_bn/Const_1:08
x
conv_dw_1_bn/moving_mean:0conv_dw_1_bn/moving_mean/Assignconv_dw_1_bn/moving_mean/read:02conv_dw_1_bn/Const_2:08
?
conv_dw_1_bn/moving_variance:0#conv_dw_1_bn/moving_variance/Assign#conv_dw_1_bn/moving_variance/read:02conv_dw_1_bn/Const_3:08
?
!conv_dw_1_bn/moving_mean/biased:0&conv_dw_1_bn/moving_mean/biased/Assign&conv_dw_1_bn/moving_mean/biased/read:02=conv_dw_1_bn/AssignMovingAvg/conv_dw_1_bn/moving_mean/zeros:0
?
%conv_dw_1_bn/moving_mean/local_step:0*conv_dw_1_bn/moving_mean/local_step/Assign*conv_dw_1_bn/moving_mean/local_step/read:027conv_dw_1_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_1_bn/moving_variance/biased:0*conv_dw_1_bn/moving_variance/biased/Assign*conv_dw_1_bn/moving_variance/biased/read:02Cconv_dw_1_bn/AssignMovingAvg_1/conv_dw_1_bn/moving_variance/zeros:0
?
)conv_dw_1_bn/moving_variance/local_step:0.conv_dw_1_bn/moving_variance/local_step/Assign.conv_dw_1_bn/moving_variance/local_step/read:02;conv_dw_1_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_1/kernel:0conv_pw_1/kernel/Assignconv_pw_1/kernel/read:02conv_pw_1/random_uniform:08
d
conv_pw_1_bn/gamma:0conv_pw_1_bn/gamma/Assignconv_pw_1_bn/gamma/read:02conv_pw_1_bn/Const:08
c
conv_pw_1_bn/beta:0conv_pw_1_bn/beta/Assignconv_pw_1_bn/beta/read:02conv_pw_1_bn/Const_1:08
x
conv_pw_1_bn/moving_mean:0conv_pw_1_bn/moving_mean/Assignconv_pw_1_bn/moving_mean/read:02conv_pw_1_bn/Const_2:08
?
conv_pw_1_bn/moving_variance:0#conv_pw_1_bn/moving_variance/Assign#conv_pw_1_bn/moving_variance/read:02conv_pw_1_bn/Const_3:08
?
!conv_pw_1_bn/moving_mean/biased:0&conv_pw_1_bn/moving_mean/biased/Assign&conv_pw_1_bn/moving_mean/biased/read:02=conv_pw_1_bn/AssignMovingAvg/conv_pw_1_bn/moving_mean/zeros:0
?
%conv_pw_1_bn/moving_mean/local_step:0*conv_pw_1_bn/moving_mean/local_step/Assign*conv_pw_1_bn/moving_mean/local_step/read:027conv_pw_1_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_1_bn/moving_variance/biased:0*conv_pw_1_bn/moving_variance/biased/Assign*conv_pw_1_bn/moving_variance/biased/read:02Cconv_pw_1_bn/AssignMovingAvg_1/conv_pw_1_bn/moving_variance/zeros:0
?
)conv_pw_1_bn/moving_variance/local_step:0.conv_pw_1_bn/moving_variance/local_step/Assign.conv_pw_1_bn/moving_variance/local_step/read:02;conv_pw_1_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_2/depthwise_kernel:0!conv_dw_2/depthwise_kernel/Assign!conv_dw_2/depthwise_kernel/read:02conv_dw_2/random_uniform:08
d
conv_dw_2_bn/gamma:0conv_dw_2_bn/gamma/Assignconv_dw_2_bn/gamma/read:02conv_dw_2_bn/Const:08
c
conv_dw_2_bn/beta:0conv_dw_2_bn/beta/Assignconv_dw_2_bn/beta/read:02conv_dw_2_bn/Const_1:08
x
conv_dw_2_bn/moving_mean:0conv_dw_2_bn/moving_mean/Assignconv_dw_2_bn/moving_mean/read:02conv_dw_2_bn/Const_2:08
?
conv_dw_2_bn/moving_variance:0#conv_dw_2_bn/moving_variance/Assign#conv_dw_2_bn/moving_variance/read:02conv_dw_2_bn/Const_3:08
?
!conv_dw_2_bn/moving_mean/biased:0&conv_dw_2_bn/moving_mean/biased/Assign&conv_dw_2_bn/moving_mean/biased/read:02=conv_dw_2_bn/AssignMovingAvg/conv_dw_2_bn/moving_mean/zeros:0
?
%conv_dw_2_bn/moving_mean/local_step:0*conv_dw_2_bn/moving_mean/local_step/Assign*conv_dw_2_bn/moving_mean/local_step/read:027conv_dw_2_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_2_bn/moving_variance/biased:0*conv_dw_2_bn/moving_variance/biased/Assign*conv_dw_2_bn/moving_variance/biased/read:02Cconv_dw_2_bn/AssignMovingAvg_1/conv_dw_2_bn/moving_variance/zeros:0
?
)conv_dw_2_bn/moving_variance/local_step:0.conv_dw_2_bn/moving_variance/local_step/Assign.conv_dw_2_bn/moving_variance/local_step/read:02;conv_dw_2_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_2/kernel:0conv_pw_2/kernel/Assignconv_pw_2/kernel/read:02conv_pw_2/random_uniform:08
d
conv_pw_2_bn/gamma:0conv_pw_2_bn/gamma/Assignconv_pw_2_bn/gamma/read:02conv_pw_2_bn/Const:08
c
conv_pw_2_bn/beta:0conv_pw_2_bn/beta/Assignconv_pw_2_bn/beta/read:02conv_pw_2_bn/Const_1:08
x
conv_pw_2_bn/moving_mean:0conv_pw_2_bn/moving_mean/Assignconv_pw_2_bn/moving_mean/read:02conv_pw_2_bn/Const_2:08
?
conv_pw_2_bn/moving_variance:0#conv_pw_2_bn/moving_variance/Assign#conv_pw_2_bn/moving_variance/read:02conv_pw_2_bn/Const_3:08
?
!conv_pw_2_bn/moving_mean/biased:0&conv_pw_2_bn/moving_mean/biased/Assign&conv_pw_2_bn/moving_mean/biased/read:02=conv_pw_2_bn/AssignMovingAvg/conv_pw_2_bn/moving_mean/zeros:0
?
%conv_pw_2_bn/moving_mean/local_step:0*conv_pw_2_bn/moving_mean/local_step/Assign*conv_pw_2_bn/moving_mean/local_step/read:027conv_pw_2_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_2_bn/moving_variance/biased:0*conv_pw_2_bn/moving_variance/biased/Assign*conv_pw_2_bn/moving_variance/biased/read:02Cconv_pw_2_bn/AssignMovingAvg_1/conv_pw_2_bn/moving_variance/zeros:0
?
)conv_pw_2_bn/moving_variance/local_step:0.conv_pw_2_bn/moving_variance/local_step/Assign.conv_pw_2_bn/moving_variance/local_step/read:02;conv_pw_2_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_3/depthwise_kernel:0!conv_dw_3/depthwise_kernel/Assign!conv_dw_3/depthwise_kernel/read:02conv_dw_3/random_uniform:08
d
conv_dw_3_bn/gamma:0conv_dw_3_bn/gamma/Assignconv_dw_3_bn/gamma/read:02conv_dw_3_bn/Const:08
c
conv_dw_3_bn/beta:0conv_dw_3_bn/beta/Assignconv_dw_3_bn/beta/read:02conv_dw_3_bn/Const_1:08
x
conv_dw_3_bn/moving_mean:0conv_dw_3_bn/moving_mean/Assignconv_dw_3_bn/moving_mean/read:02conv_dw_3_bn/Const_2:08
?
conv_dw_3_bn/moving_variance:0#conv_dw_3_bn/moving_variance/Assign#conv_dw_3_bn/moving_variance/read:02conv_dw_3_bn/Const_3:08
?
!conv_dw_3_bn/moving_mean/biased:0&conv_dw_3_bn/moving_mean/biased/Assign&conv_dw_3_bn/moving_mean/biased/read:02=conv_dw_3_bn/AssignMovingAvg/conv_dw_3_bn/moving_mean/zeros:0
?
%conv_dw_3_bn/moving_mean/local_step:0*conv_dw_3_bn/moving_mean/local_step/Assign*conv_dw_3_bn/moving_mean/local_step/read:027conv_dw_3_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_3_bn/moving_variance/biased:0*conv_dw_3_bn/moving_variance/biased/Assign*conv_dw_3_bn/moving_variance/biased/read:02Cconv_dw_3_bn/AssignMovingAvg_1/conv_dw_3_bn/moving_variance/zeros:0
?
)conv_dw_3_bn/moving_variance/local_step:0.conv_dw_3_bn/moving_variance/local_step/Assign.conv_dw_3_bn/moving_variance/local_step/read:02;conv_dw_3_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_3/kernel:0conv_pw_3/kernel/Assignconv_pw_3/kernel/read:02conv_pw_3/random_uniform:08
d
conv_pw_3_bn/gamma:0conv_pw_3_bn/gamma/Assignconv_pw_3_bn/gamma/read:02conv_pw_3_bn/Const:08
c
conv_pw_3_bn/beta:0conv_pw_3_bn/beta/Assignconv_pw_3_bn/beta/read:02conv_pw_3_bn/Const_1:08
x
conv_pw_3_bn/moving_mean:0conv_pw_3_bn/moving_mean/Assignconv_pw_3_bn/moving_mean/read:02conv_pw_3_bn/Const_2:08
?
conv_pw_3_bn/moving_variance:0#conv_pw_3_bn/moving_variance/Assign#conv_pw_3_bn/moving_variance/read:02conv_pw_3_bn/Const_3:08
?
!conv_pw_3_bn/moving_mean/biased:0&conv_pw_3_bn/moving_mean/biased/Assign&conv_pw_3_bn/moving_mean/biased/read:02=conv_pw_3_bn/AssignMovingAvg/conv_pw_3_bn/moving_mean/zeros:0
?
%conv_pw_3_bn/moving_mean/local_step:0*conv_pw_3_bn/moving_mean/local_step/Assign*conv_pw_3_bn/moving_mean/local_step/read:027conv_pw_3_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_3_bn/moving_variance/biased:0*conv_pw_3_bn/moving_variance/biased/Assign*conv_pw_3_bn/moving_variance/biased/read:02Cconv_pw_3_bn/AssignMovingAvg_1/conv_pw_3_bn/moving_variance/zeros:0
?
)conv_pw_3_bn/moving_variance/local_step:0.conv_pw_3_bn/moving_variance/local_step/Assign.conv_pw_3_bn/moving_variance/local_step/read:02;conv_pw_3_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_4/depthwise_kernel:0!conv_dw_4/depthwise_kernel/Assign!conv_dw_4/depthwise_kernel/read:02conv_dw_4/random_uniform:08
d
conv_dw_4_bn/gamma:0conv_dw_4_bn/gamma/Assignconv_dw_4_bn/gamma/read:02conv_dw_4_bn/Const:08
c
conv_dw_4_bn/beta:0conv_dw_4_bn/beta/Assignconv_dw_4_bn/beta/read:02conv_dw_4_bn/Const_1:08
x
conv_dw_4_bn/moving_mean:0conv_dw_4_bn/moving_mean/Assignconv_dw_4_bn/moving_mean/read:02conv_dw_4_bn/Const_2:08
?
conv_dw_4_bn/moving_variance:0#conv_dw_4_bn/moving_variance/Assign#conv_dw_4_bn/moving_variance/read:02conv_dw_4_bn/Const_3:08
?
!conv_dw_4_bn/moving_mean/biased:0&conv_dw_4_bn/moving_mean/biased/Assign&conv_dw_4_bn/moving_mean/biased/read:02=conv_dw_4_bn/AssignMovingAvg/conv_dw_4_bn/moving_mean/zeros:0
?
%conv_dw_4_bn/moving_mean/local_step:0*conv_dw_4_bn/moving_mean/local_step/Assign*conv_dw_4_bn/moving_mean/local_step/read:027conv_dw_4_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_4_bn/moving_variance/biased:0*conv_dw_4_bn/moving_variance/biased/Assign*conv_dw_4_bn/moving_variance/biased/read:02Cconv_dw_4_bn/AssignMovingAvg_1/conv_dw_4_bn/moving_variance/zeros:0
?
)conv_dw_4_bn/moving_variance/local_step:0.conv_dw_4_bn/moving_variance/local_step/Assign.conv_dw_4_bn/moving_variance/local_step/read:02;conv_dw_4_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_4/kernel:0conv_pw_4/kernel/Assignconv_pw_4/kernel/read:02conv_pw_4/random_uniform:08
d
conv_pw_4_bn/gamma:0conv_pw_4_bn/gamma/Assignconv_pw_4_bn/gamma/read:02conv_pw_4_bn/Const:08
c
conv_pw_4_bn/beta:0conv_pw_4_bn/beta/Assignconv_pw_4_bn/beta/read:02conv_pw_4_bn/Const_1:08
x
conv_pw_4_bn/moving_mean:0conv_pw_4_bn/moving_mean/Assignconv_pw_4_bn/moving_mean/read:02conv_pw_4_bn/Const_2:08
?
conv_pw_4_bn/moving_variance:0#conv_pw_4_bn/moving_variance/Assign#conv_pw_4_bn/moving_variance/read:02conv_pw_4_bn/Const_3:08
?
!conv_pw_4_bn/moving_mean/biased:0&conv_pw_4_bn/moving_mean/biased/Assign&conv_pw_4_bn/moving_mean/biased/read:02=conv_pw_4_bn/AssignMovingAvg/conv_pw_4_bn/moving_mean/zeros:0
?
%conv_pw_4_bn/moving_mean/local_step:0*conv_pw_4_bn/moving_mean/local_step/Assign*conv_pw_4_bn/moving_mean/local_step/read:027conv_pw_4_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_4_bn/moving_variance/biased:0*conv_pw_4_bn/moving_variance/biased/Assign*conv_pw_4_bn/moving_variance/biased/read:02Cconv_pw_4_bn/AssignMovingAvg_1/conv_pw_4_bn/moving_variance/zeros:0
?
)conv_pw_4_bn/moving_variance/local_step:0.conv_pw_4_bn/moving_variance/local_step/Assign.conv_pw_4_bn/moving_variance/local_step/read:02;conv_pw_4_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_5/depthwise_kernel:0!conv_dw_5/depthwise_kernel/Assign!conv_dw_5/depthwise_kernel/read:02conv_dw_5/random_uniform:08
d
conv_dw_5_bn/gamma:0conv_dw_5_bn/gamma/Assignconv_dw_5_bn/gamma/read:02conv_dw_5_bn/Const:08
c
conv_dw_5_bn/beta:0conv_dw_5_bn/beta/Assignconv_dw_5_bn/beta/read:02conv_dw_5_bn/Const_1:08
x
conv_dw_5_bn/moving_mean:0conv_dw_5_bn/moving_mean/Assignconv_dw_5_bn/moving_mean/read:02conv_dw_5_bn/Const_2:08
?
conv_dw_5_bn/moving_variance:0#conv_dw_5_bn/moving_variance/Assign#conv_dw_5_bn/moving_variance/read:02conv_dw_5_bn/Const_3:08
?
!conv_dw_5_bn/moving_mean/biased:0&conv_dw_5_bn/moving_mean/biased/Assign&conv_dw_5_bn/moving_mean/biased/read:02=conv_dw_5_bn/AssignMovingAvg/conv_dw_5_bn/moving_mean/zeros:0
?
%conv_dw_5_bn/moving_mean/local_step:0*conv_dw_5_bn/moving_mean/local_step/Assign*conv_dw_5_bn/moving_mean/local_step/read:027conv_dw_5_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_5_bn/moving_variance/biased:0*conv_dw_5_bn/moving_variance/biased/Assign*conv_dw_5_bn/moving_variance/biased/read:02Cconv_dw_5_bn/AssignMovingAvg_1/conv_dw_5_bn/moving_variance/zeros:0
?
)conv_dw_5_bn/moving_variance/local_step:0.conv_dw_5_bn/moving_variance/local_step/Assign.conv_dw_5_bn/moving_variance/local_step/read:02;conv_dw_5_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_5/kernel:0conv_pw_5/kernel/Assignconv_pw_5/kernel/read:02conv_pw_5/random_uniform:08
d
conv_pw_5_bn/gamma:0conv_pw_5_bn/gamma/Assignconv_pw_5_bn/gamma/read:02conv_pw_5_bn/Const:08
c
conv_pw_5_bn/beta:0conv_pw_5_bn/beta/Assignconv_pw_5_bn/beta/read:02conv_pw_5_bn/Const_1:08
x
conv_pw_5_bn/moving_mean:0conv_pw_5_bn/moving_mean/Assignconv_pw_5_bn/moving_mean/read:02conv_pw_5_bn/Const_2:08
?
conv_pw_5_bn/moving_variance:0#conv_pw_5_bn/moving_variance/Assign#conv_pw_5_bn/moving_variance/read:02conv_pw_5_bn/Const_3:08
?
!conv_pw_5_bn/moving_mean/biased:0&conv_pw_5_bn/moving_mean/biased/Assign&conv_pw_5_bn/moving_mean/biased/read:02=conv_pw_5_bn/AssignMovingAvg/conv_pw_5_bn/moving_mean/zeros:0
?
%conv_pw_5_bn/moving_mean/local_step:0*conv_pw_5_bn/moving_mean/local_step/Assign*conv_pw_5_bn/moving_mean/local_step/read:027conv_pw_5_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_5_bn/moving_variance/biased:0*conv_pw_5_bn/moving_variance/biased/Assign*conv_pw_5_bn/moving_variance/biased/read:02Cconv_pw_5_bn/AssignMovingAvg_1/conv_pw_5_bn/moving_variance/zeros:0
?
)conv_pw_5_bn/moving_variance/local_step:0.conv_pw_5_bn/moving_variance/local_step/Assign.conv_pw_5_bn/moving_variance/local_step/read:02;conv_pw_5_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_6/depthwise_kernel:0!conv_dw_6/depthwise_kernel/Assign!conv_dw_6/depthwise_kernel/read:02conv_dw_6/random_uniform:08
d
conv_dw_6_bn/gamma:0conv_dw_6_bn/gamma/Assignconv_dw_6_bn/gamma/read:02conv_dw_6_bn/Const:08
c
conv_dw_6_bn/beta:0conv_dw_6_bn/beta/Assignconv_dw_6_bn/beta/read:02conv_dw_6_bn/Const_1:08
x
conv_dw_6_bn/moving_mean:0conv_dw_6_bn/moving_mean/Assignconv_dw_6_bn/moving_mean/read:02conv_dw_6_bn/Const_2:08
?
conv_dw_6_bn/moving_variance:0#conv_dw_6_bn/moving_variance/Assign#conv_dw_6_bn/moving_variance/read:02conv_dw_6_bn/Const_3:08
?
!conv_dw_6_bn/moving_mean/biased:0&conv_dw_6_bn/moving_mean/biased/Assign&conv_dw_6_bn/moving_mean/biased/read:02=conv_dw_6_bn/AssignMovingAvg/conv_dw_6_bn/moving_mean/zeros:0
?
%conv_dw_6_bn/moving_mean/local_step:0*conv_dw_6_bn/moving_mean/local_step/Assign*conv_dw_6_bn/moving_mean/local_step/read:027conv_dw_6_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_6_bn/moving_variance/biased:0*conv_dw_6_bn/moving_variance/biased/Assign*conv_dw_6_bn/moving_variance/biased/read:02Cconv_dw_6_bn/AssignMovingAvg_1/conv_dw_6_bn/moving_variance/zeros:0
?
)conv_dw_6_bn/moving_variance/local_step:0.conv_dw_6_bn/moving_variance/local_step/Assign.conv_dw_6_bn/moving_variance/local_step/read:02;conv_dw_6_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_6/kernel:0conv_pw_6/kernel/Assignconv_pw_6/kernel/read:02conv_pw_6/random_uniform:08
d
conv_pw_6_bn/gamma:0conv_pw_6_bn/gamma/Assignconv_pw_6_bn/gamma/read:02conv_pw_6_bn/Const:08
c
conv_pw_6_bn/beta:0conv_pw_6_bn/beta/Assignconv_pw_6_bn/beta/read:02conv_pw_6_bn/Const_1:08
x
conv_pw_6_bn/moving_mean:0conv_pw_6_bn/moving_mean/Assignconv_pw_6_bn/moving_mean/read:02conv_pw_6_bn/Const_2:08
?
conv_pw_6_bn/moving_variance:0#conv_pw_6_bn/moving_variance/Assign#conv_pw_6_bn/moving_variance/read:02conv_pw_6_bn/Const_3:08
?
!conv_pw_6_bn/moving_mean/biased:0&conv_pw_6_bn/moving_mean/biased/Assign&conv_pw_6_bn/moving_mean/biased/read:02=conv_pw_6_bn/AssignMovingAvg/conv_pw_6_bn/moving_mean/zeros:0
?
%conv_pw_6_bn/moving_mean/local_step:0*conv_pw_6_bn/moving_mean/local_step/Assign*conv_pw_6_bn/moving_mean/local_step/read:027conv_pw_6_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_6_bn/moving_variance/biased:0*conv_pw_6_bn/moving_variance/biased/Assign*conv_pw_6_bn/moving_variance/biased/read:02Cconv_pw_6_bn/AssignMovingAvg_1/conv_pw_6_bn/moving_variance/zeros:0
?
)conv_pw_6_bn/moving_variance/local_step:0.conv_pw_6_bn/moving_variance/local_step/Assign.conv_pw_6_bn/moving_variance/local_step/read:02;conv_pw_6_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_7/depthwise_kernel:0!conv_dw_7/depthwise_kernel/Assign!conv_dw_7/depthwise_kernel/read:02conv_dw_7/random_uniform:08
d
conv_dw_7_bn/gamma:0conv_dw_7_bn/gamma/Assignconv_dw_7_bn/gamma/read:02conv_dw_7_bn/Const:08
c
conv_dw_7_bn/beta:0conv_dw_7_bn/beta/Assignconv_dw_7_bn/beta/read:02conv_dw_7_bn/Const_1:08
x
conv_dw_7_bn/moving_mean:0conv_dw_7_bn/moving_mean/Assignconv_dw_7_bn/moving_mean/read:02conv_dw_7_bn/Const_2:08
?
conv_dw_7_bn/moving_variance:0#conv_dw_7_bn/moving_variance/Assign#conv_dw_7_bn/moving_variance/read:02conv_dw_7_bn/Const_3:08
?
!conv_dw_7_bn/moving_mean/biased:0&conv_dw_7_bn/moving_mean/biased/Assign&conv_dw_7_bn/moving_mean/biased/read:02=conv_dw_7_bn/AssignMovingAvg/conv_dw_7_bn/moving_mean/zeros:0
?
%conv_dw_7_bn/moving_mean/local_step:0*conv_dw_7_bn/moving_mean/local_step/Assign*conv_dw_7_bn/moving_mean/local_step/read:027conv_dw_7_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_7_bn/moving_variance/biased:0*conv_dw_7_bn/moving_variance/biased/Assign*conv_dw_7_bn/moving_variance/biased/read:02Cconv_dw_7_bn/AssignMovingAvg_1/conv_dw_7_bn/moving_variance/zeros:0
?
)conv_dw_7_bn/moving_variance/local_step:0.conv_dw_7_bn/moving_variance/local_step/Assign.conv_dw_7_bn/moving_variance/local_step/read:02;conv_dw_7_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_7/kernel:0conv_pw_7/kernel/Assignconv_pw_7/kernel/read:02conv_pw_7/random_uniform:08
d
conv_pw_7_bn/gamma:0conv_pw_7_bn/gamma/Assignconv_pw_7_bn/gamma/read:02conv_pw_7_bn/Const:08
c
conv_pw_7_bn/beta:0conv_pw_7_bn/beta/Assignconv_pw_7_bn/beta/read:02conv_pw_7_bn/Const_1:08
x
conv_pw_7_bn/moving_mean:0conv_pw_7_bn/moving_mean/Assignconv_pw_7_bn/moving_mean/read:02conv_pw_7_bn/Const_2:08
?
conv_pw_7_bn/moving_variance:0#conv_pw_7_bn/moving_variance/Assign#conv_pw_7_bn/moving_variance/read:02conv_pw_7_bn/Const_3:08
?
!conv_pw_7_bn/moving_mean/biased:0&conv_pw_7_bn/moving_mean/biased/Assign&conv_pw_7_bn/moving_mean/biased/read:02=conv_pw_7_bn/AssignMovingAvg/conv_pw_7_bn/moving_mean/zeros:0
?
%conv_pw_7_bn/moving_mean/local_step:0*conv_pw_7_bn/moving_mean/local_step/Assign*conv_pw_7_bn/moving_mean/local_step/read:027conv_pw_7_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_7_bn/moving_variance/biased:0*conv_pw_7_bn/moving_variance/biased/Assign*conv_pw_7_bn/moving_variance/biased/read:02Cconv_pw_7_bn/AssignMovingAvg_1/conv_pw_7_bn/moving_variance/zeros:0
?
)conv_pw_7_bn/moving_variance/local_step:0.conv_pw_7_bn/moving_variance/local_step/Assign.conv_pw_7_bn/moving_variance/local_step/read:02;conv_pw_7_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_8/depthwise_kernel:0!conv_dw_8/depthwise_kernel/Assign!conv_dw_8/depthwise_kernel/read:02conv_dw_8/random_uniform:08
d
conv_dw_8_bn/gamma:0conv_dw_8_bn/gamma/Assignconv_dw_8_bn/gamma/read:02conv_dw_8_bn/Const:08
c
conv_dw_8_bn/beta:0conv_dw_8_bn/beta/Assignconv_dw_8_bn/beta/read:02conv_dw_8_bn/Const_1:08
x
conv_dw_8_bn/moving_mean:0conv_dw_8_bn/moving_mean/Assignconv_dw_8_bn/moving_mean/read:02conv_dw_8_bn/Const_2:08
?
conv_dw_8_bn/moving_variance:0#conv_dw_8_bn/moving_variance/Assign#conv_dw_8_bn/moving_variance/read:02conv_dw_8_bn/Const_3:08
?
!conv_dw_8_bn/moving_mean/biased:0&conv_dw_8_bn/moving_mean/biased/Assign&conv_dw_8_bn/moving_mean/biased/read:02=conv_dw_8_bn/AssignMovingAvg/conv_dw_8_bn/moving_mean/zeros:0
?
%conv_dw_8_bn/moving_mean/local_step:0*conv_dw_8_bn/moving_mean/local_step/Assign*conv_dw_8_bn/moving_mean/local_step/read:027conv_dw_8_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_8_bn/moving_variance/biased:0*conv_dw_8_bn/moving_variance/biased/Assign*conv_dw_8_bn/moving_variance/biased/read:02Cconv_dw_8_bn/AssignMovingAvg_1/conv_dw_8_bn/moving_variance/zeros:0
?
)conv_dw_8_bn/moving_variance/local_step:0.conv_dw_8_bn/moving_variance/local_step/Assign.conv_dw_8_bn/moving_variance/local_step/read:02;conv_dw_8_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_8/kernel:0conv_pw_8/kernel/Assignconv_pw_8/kernel/read:02conv_pw_8/random_uniform:08
d
conv_pw_8_bn/gamma:0conv_pw_8_bn/gamma/Assignconv_pw_8_bn/gamma/read:02conv_pw_8_bn/Const:08
c
conv_pw_8_bn/beta:0conv_pw_8_bn/beta/Assignconv_pw_8_bn/beta/read:02conv_pw_8_bn/Const_1:08
x
conv_pw_8_bn/moving_mean:0conv_pw_8_bn/moving_mean/Assignconv_pw_8_bn/moving_mean/read:02conv_pw_8_bn/Const_2:08
?
conv_pw_8_bn/moving_variance:0#conv_pw_8_bn/moving_variance/Assign#conv_pw_8_bn/moving_variance/read:02conv_pw_8_bn/Const_3:08
?
!conv_pw_8_bn/moving_mean/biased:0&conv_pw_8_bn/moving_mean/biased/Assign&conv_pw_8_bn/moving_mean/biased/read:02=conv_pw_8_bn/AssignMovingAvg/conv_pw_8_bn/moving_mean/zeros:0
?
%conv_pw_8_bn/moving_mean/local_step:0*conv_pw_8_bn/moving_mean/local_step/Assign*conv_pw_8_bn/moving_mean/local_step/read:027conv_pw_8_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_8_bn/moving_variance/biased:0*conv_pw_8_bn/moving_variance/biased/Assign*conv_pw_8_bn/moving_variance/biased/read:02Cconv_pw_8_bn/AssignMovingAvg_1/conv_pw_8_bn/moving_variance/zeros:0
?
)conv_pw_8_bn/moving_variance/local_step:0.conv_pw_8_bn/moving_variance/local_step/Assign.conv_pw_8_bn/moving_variance/local_step/read:02;conv_pw_8_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_9/depthwise_kernel:0!conv_dw_9/depthwise_kernel/Assign!conv_dw_9/depthwise_kernel/read:02conv_dw_9/random_uniform:08
d
conv_dw_9_bn/gamma:0conv_dw_9_bn/gamma/Assignconv_dw_9_bn/gamma/read:02conv_dw_9_bn/Const:08
c
conv_dw_9_bn/beta:0conv_dw_9_bn/beta/Assignconv_dw_9_bn/beta/read:02conv_dw_9_bn/Const_1:08
x
conv_dw_9_bn/moving_mean:0conv_dw_9_bn/moving_mean/Assignconv_dw_9_bn/moving_mean/read:02conv_dw_9_bn/Const_2:08
?
conv_dw_9_bn/moving_variance:0#conv_dw_9_bn/moving_variance/Assign#conv_dw_9_bn/moving_variance/read:02conv_dw_9_bn/Const_3:08
?
!conv_dw_9_bn/moving_mean/biased:0&conv_dw_9_bn/moving_mean/biased/Assign&conv_dw_9_bn/moving_mean/biased/read:02=conv_dw_9_bn/AssignMovingAvg/conv_dw_9_bn/moving_mean/zeros:0
?
%conv_dw_9_bn/moving_mean/local_step:0*conv_dw_9_bn/moving_mean/local_step/Assign*conv_dw_9_bn/moving_mean/local_step/read:027conv_dw_9_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_dw_9_bn/moving_variance/biased:0*conv_dw_9_bn/moving_variance/biased/Assign*conv_dw_9_bn/moving_variance/biased/read:02Cconv_dw_9_bn/AssignMovingAvg_1/conv_dw_9_bn/moving_variance/zeros:0
?
)conv_dw_9_bn/moving_variance/local_step:0.conv_dw_9_bn/moving_variance/local_step/Assign.conv_dw_9_bn/moving_variance/local_step/read:02;conv_dw_9_bn/moving_variance/local_step/Initializer/zeros:0
d
conv_pw_9/kernel:0conv_pw_9/kernel/Assignconv_pw_9/kernel/read:02conv_pw_9/random_uniform:08
d
conv_pw_9_bn/gamma:0conv_pw_9_bn/gamma/Assignconv_pw_9_bn/gamma/read:02conv_pw_9_bn/Const:08
c
conv_pw_9_bn/beta:0conv_pw_9_bn/beta/Assignconv_pw_9_bn/beta/read:02conv_pw_9_bn/Const_1:08
x
conv_pw_9_bn/moving_mean:0conv_pw_9_bn/moving_mean/Assignconv_pw_9_bn/moving_mean/read:02conv_pw_9_bn/Const_2:08
?
conv_pw_9_bn/moving_variance:0#conv_pw_9_bn/moving_variance/Assign#conv_pw_9_bn/moving_variance/read:02conv_pw_9_bn/Const_3:08
?
!conv_pw_9_bn/moving_mean/biased:0&conv_pw_9_bn/moving_mean/biased/Assign&conv_pw_9_bn/moving_mean/biased/read:02=conv_pw_9_bn/AssignMovingAvg/conv_pw_9_bn/moving_mean/zeros:0
?
%conv_pw_9_bn/moving_mean/local_step:0*conv_pw_9_bn/moving_mean/local_step/Assign*conv_pw_9_bn/moving_mean/local_step/read:027conv_pw_9_bn/moving_mean/local_step/Initializer/zeros:0
?
%conv_pw_9_bn/moving_variance/biased:0*conv_pw_9_bn/moving_variance/biased/Assign*conv_pw_9_bn/moving_variance/biased/read:02Cconv_pw_9_bn/AssignMovingAvg_1/conv_pw_9_bn/moving_variance/zeros:0
?
)conv_pw_9_bn/moving_variance/local_step:0.conv_pw_9_bn/moving_variance/local_step/Assign.conv_pw_9_bn/moving_variance/local_step/read:02;conv_pw_9_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_10/depthwise_kernel:0"conv_dw_10/depthwise_kernel/Assign"conv_dw_10/depthwise_kernel/read:02conv_dw_10/random_uniform:08
h
conv_dw_10_bn/gamma:0conv_dw_10_bn/gamma/Assignconv_dw_10_bn/gamma/read:02conv_dw_10_bn/Const:08
g
conv_dw_10_bn/beta:0conv_dw_10_bn/beta/Assignconv_dw_10_bn/beta/read:02conv_dw_10_bn/Const_1:08
|
conv_dw_10_bn/moving_mean:0 conv_dw_10_bn/moving_mean/Assign conv_dw_10_bn/moving_mean/read:02conv_dw_10_bn/Const_2:08
?
conv_dw_10_bn/moving_variance:0$conv_dw_10_bn/moving_variance/Assign$conv_dw_10_bn/moving_variance/read:02conv_dw_10_bn/Const_3:08
?
"conv_dw_10_bn/moving_mean/biased:0'conv_dw_10_bn/moving_mean/biased/Assign'conv_dw_10_bn/moving_mean/biased/read:02?conv_dw_10_bn/AssignMovingAvg/conv_dw_10_bn/moving_mean/zeros:0
?
&conv_dw_10_bn/moving_mean/local_step:0+conv_dw_10_bn/moving_mean/local_step/Assign+conv_dw_10_bn/moving_mean/local_step/read:028conv_dw_10_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_dw_10_bn/moving_variance/biased:0+conv_dw_10_bn/moving_variance/biased/Assign+conv_dw_10_bn/moving_variance/biased/read:02Econv_dw_10_bn/AssignMovingAvg_1/conv_dw_10_bn/moving_variance/zeros:0
?
*conv_dw_10_bn/moving_variance/local_step:0/conv_dw_10_bn/moving_variance/local_step/Assign/conv_dw_10_bn/moving_variance/local_step/read:02<conv_dw_10_bn/moving_variance/local_step/Initializer/zeros:0
h
conv_pw_10/kernel:0conv_pw_10/kernel/Assignconv_pw_10/kernel/read:02conv_pw_10/random_uniform:08
h
conv_pw_10_bn/gamma:0conv_pw_10_bn/gamma/Assignconv_pw_10_bn/gamma/read:02conv_pw_10_bn/Const:08
g
conv_pw_10_bn/beta:0conv_pw_10_bn/beta/Assignconv_pw_10_bn/beta/read:02conv_pw_10_bn/Const_1:08
|
conv_pw_10_bn/moving_mean:0 conv_pw_10_bn/moving_mean/Assign conv_pw_10_bn/moving_mean/read:02conv_pw_10_bn/Const_2:08
?
conv_pw_10_bn/moving_variance:0$conv_pw_10_bn/moving_variance/Assign$conv_pw_10_bn/moving_variance/read:02conv_pw_10_bn/Const_3:08
?
"conv_pw_10_bn/moving_mean/biased:0'conv_pw_10_bn/moving_mean/biased/Assign'conv_pw_10_bn/moving_mean/biased/read:02?conv_pw_10_bn/AssignMovingAvg/conv_pw_10_bn/moving_mean/zeros:0
?
&conv_pw_10_bn/moving_mean/local_step:0+conv_pw_10_bn/moving_mean/local_step/Assign+conv_pw_10_bn/moving_mean/local_step/read:028conv_pw_10_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_pw_10_bn/moving_variance/biased:0+conv_pw_10_bn/moving_variance/biased/Assign+conv_pw_10_bn/moving_variance/biased/read:02Econv_pw_10_bn/AssignMovingAvg_1/conv_pw_10_bn/moving_variance/zeros:0
?
*conv_pw_10_bn/moving_variance/local_step:0/conv_pw_10_bn/moving_variance/local_step/Assign/conv_pw_10_bn/moving_variance/local_step/read:02<conv_pw_10_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_11/depthwise_kernel:0"conv_dw_11/depthwise_kernel/Assign"conv_dw_11/depthwise_kernel/read:02conv_dw_11/random_uniform:08
h
conv_dw_11_bn/gamma:0conv_dw_11_bn/gamma/Assignconv_dw_11_bn/gamma/read:02conv_dw_11_bn/Const:08
g
conv_dw_11_bn/beta:0conv_dw_11_bn/beta/Assignconv_dw_11_bn/beta/read:02conv_dw_11_bn/Const_1:08
|
conv_dw_11_bn/moving_mean:0 conv_dw_11_bn/moving_mean/Assign conv_dw_11_bn/moving_mean/read:02conv_dw_11_bn/Const_2:08
?
conv_dw_11_bn/moving_variance:0$conv_dw_11_bn/moving_variance/Assign$conv_dw_11_bn/moving_variance/read:02conv_dw_11_bn/Const_3:08
?
"conv_dw_11_bn/moving_mean/biased:0'conv_dw_11_bn/moving_mean/biased/Assign'conv_dw_11_bn/moving_mean/biased/read:02?conv_dw_11_bn/AssignMovingAvg/conv_dw_11_bn/moving_mean/zeros:0
?
&conv_dw_11_bn/moving_mean/local_step:0+conv_dw_11_bn/moving_mean/local_step/Assign+conv_dw_11_bn/moving_mean/local_step/read:028conv_dw_11_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_dw_11_bn/moving_variance/biased:0+conv_dw_11_bn/moving_variance/biased/Assign+conv_dw_11_bn/moving_variance/biased/read:02Econv_dw_11_bn/AssignMovingAvg_1/conv_dw_11_bn/moving_variance/zeros:0
?
*conv_dw_11_bn/moving_variance/local_step:0/conv_dw_11_bn/moving_variance/local_step/Assign/conv_dw_11_bn/moving_variance/local_step/read:02<conv_dw_11_bn/moving_variance/local_step/Initializer/zeros:0
h
conv_pw_11/kernel:0conv_pw_11/kernel/Assignconv_pw_11/kernel/read:02conv_pw_11/random_uniform:08
h
conv_pw_11_bn/gamma:0conv_pw_11_bn/gamma/Assignconv_pw_11_bn/gamma/read:02conv_pw_11_bn/Const:08
g
conv_pw_11_bn/beta:0conv_pw_11_bn/beta/Assignconv_pw_11_bn/beta/read:02conv_pw_11_bn/Const_1:08
|
conv_pw_11_bn/moving_mean:0 conv_pw_11_bn/moving_mean/Assign conv_pw_11_bn/moving_mean/read:02conv_pw_11_bn/Const_2:08
?
conv_pw_11_bn/moving_variance:0$conv_pw_11_bn/moving_variance/Assign$conv_pw_11_bn/moving_variance/read:02conv_pw_11_bn/Const_3:08
?
"conv_pw_11_bn/moving_mean/biased:0'conv_pw_11_bn/moving_mean/biased/Assign'conv_pw_11_bn/moving_mean/biased/read:02?conv_pw_11_bn/AssignMovingAvg/conv_pw_11_bn/moving_mean/zeros:0
?
&conv_pw_11_bn/moving_mean/local_step:0+conv_pw_11_bn/moving_mean/local_step/Assign+conv_pw_11_bn/moving_mean/local_step/read:028conv_pw_11_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_pw_11_bn/moving_variance/biased:0+conv_pw_11_bn/moving_variance/biased/Assign+conv_pw_11_bn/moving_variance/biased/read:02Econv_pw_11_bn/AssignMovingAvg_1/conv_pw_11_bn/moving_variance/zeros:0
?
*conv_pw_11_bn/moving_variance/local_step:0/conv_pw_11_bn/moving_variance/local_step/Assign/conv_pw_11_bn/moving_variance/local_step/read:02<conv_pw_11_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_12/depthwise_kernel:0"conv_dw_12/depthwise_kernel/Assign"conv_dw_12/depthwise_kernel/read:02conv_dw_12/random_uniform:08
h
conv_dw_12_bn/gamma:0conv_dw_12_bn/gamma/Assignconv_dw_12_bn/gamma/read:02conv_dw_12_bn/Const:08
g
conv_dw_12_bn/beta:0conv_dw_12_bn/beta/Assignconv_dw_12_bn/beta/read:02conv_dw_12_bn/Const_1:08
|
conv_dw_12_bn/moving_mean:0 conv_dw_12_bn/moving_mean/Assign conv_dw_12_bn/moving_mean/read:02conv_dw_12_bn/Const_2:08
?
conv_dw_12_bn/moving_variance:0$conv_dw_12_bn/moving_variance/Assign$conv_dw_12_bn/moving_variance/read:02conv_dw_12_bn/Const_3:08
?
"conv_dw_12_bn/moving_mean/biased:0'conv_dw_12_bn/moving_mean/biased/Assign'conv_dw_12_bn/moving_mean/biased/read:02?conv_dw_12_bn/AssignMovingAvg/conv_dw_12_bn/moving_mean/zeros:0
?
&conv_dw_12_bn/moving_mean/local_step:0+conv_dw_12_bn/moving_mean/local_step/Assign+conv_dw_12_bn/moving_mean/local_step/read:028conv_dw_12_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_dw_12_bn/moving_variance/biased:0+conv_dw_12_bn/moving_variance/biased/Assign+conv_dw_12_bn/moving_variance/biased/read:02Econv_dw_12_bn/AssignMovingAvg_1/conv_dw_12_bn/moving_variance/zeros:0
?
*conv_dw_12_bn/moving_variance/local_step:0/conv_dw_12_bn/moving_variance/local_step/Assign/conv_dw_12_bn/moving_variance/local_step/read:02<conv_dw_12_bn/moving_variance/local_step/Initializer/zeros:0
h
conv_pw_12/kernel:0conv_pw_12/kernel/Assignconv_pw_12/kernel/read:02conv_pw_12/random_uniform:08
h
conv_pw_12_bn/gamma:0conv_pw_12_bn/gamma/Assignconv_pw_12_bn/gamma/read:02conv_pw_12_bn/Const:08
g
conv_pw_12_bn/beta:0conv_pw_12_bn/beta/Assignconv_pw_12_bn/beta/read:02conv_pw_12_bn/Const_1:08
|
conv_pw_12_bn/moving_mean:0 conv_pw_12_bn/moving_mean/Assign conv_pw_12_bn/moving_mean/read:02conv_pw_12_bn/Const_2:08
?
conv_pw_12_bn/moving_variance:0$conv_pw_12_bn/moving_variance/Assign$conv_pw_12_bn/moving_variance/read:02conv_pw_12_bn/Const_3:08
?
"conv_pw_12_bn/moving_mean/biased:0'conv_pw_12_bn/moving_mean/biased/Assign'conv_pw_12_bn/moving_mean/biased/read:02?conv_pw_12_bn/AssignMovingAvg/conv_pw_12_bn/moving_mean/zeros:0
?
&conv_pw_12_bn/moving_mean/local_step:0+conv_pw_12_bn/moving_mean/local_step/Assign+conv_pw_12_bn/moving_mean/local_step/read:028conv_pw_12_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_pw_12_bn/moving_variance/biased:0+conv_pw_12_bn/moving_variance/biased/Assign+conv_pw_12_bn/moving_variance/biased/read:02Econv_pw_12_bn/AssignMovingAvg_1/conv_pw_12_bn/moving_variance/zeros:0
?
*conv_pw_12_bn/moving_variance/local_step:0/conv_pw_12_bn/moving_variance/local_step/Assign/conv_pw_12_bn/moving_variance/local_step/read:02<conv_pw_12_bn/moving_variance/local_step/Initializer/zeros:0
?
conv_dw_13/depthwise_kernel:0"conv_dw_13/depthwise_kernel/Assign"conv_dw_13/depthwise_kernel/read:02conv_dw_13/random_uniform:08
h
conv_dw_13_bn/gamma:0conv_dw_13_bn/gamma/Assignconv_dw_13_bn/gamma/read:02conv_dw_13_bn/Const:08
g
conv_dw_13_bn/beta:0conv_dw_13_bn/beta/Assignconv_dw_13_bn/beta/read:02conv_dw_13_bn/Const_1:08
|
conv_dw_13_bn/moving_mean:0 conv_dw_13_bn/moving_mean/Assign conv_dw_13_bn/moving_mean/read:02conv_dw_13_bn/Const_2:08
?
conv_dw_13_bn/moving_variance:0$conv_dw_13_bn/moving_variance/Assign$conv_dw_13_bn/moving_variance/read:02conv_dw_13_bn/Const_3:08
?
"conv_dw_13_bn/moving_mean/biased:0'conv_dw_13_bn/moving_mean/biased/Assign'conv_dw_13_bn/moving_mean/biased/read:02?conv_dw_13_bn/AssignMovingAvg/conv_dw_13_bn/moving_mean/zeros:0
?
&conv_dw_13_bn/moving_mean/local_step:0+conv_dw_13_bn/moving_mean/local_step/Assign+conv_dw_13_bn/moving_mean/local_step/read:028conv_dw_13_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_dw_13_bn/moving_variance/biased:0+conv_dw_13_bn/moving_variance/biased/Assign+conv_dw_13_bn/moving_variance/biased/read:02Econv_dw_13_bn/AssignMovingAvg_1/conv_dw_13_bn/moving_variance/zeros:0
?
*conv_dw_13_bn/moving_variance/local_step:0/conv_dw_13_bn/moving_variance/local_step/Assign/conv_dw_13_bn/moving_variance/local_step/read:02<conv_dw_13_bn/moving_variance/local_step/Initializer/zeros:0
h
conv_pw_13/kernel:0conv_pw_13/kernel/Assignconv_pw_13/kernel/read:02conv_pw_13/random_uniform:08
h
conv_pw_13_bn/gamma:0conv_pw_13_bn/gamma/Assignconv_pw_13_bn/gamma/read:02conv_pw_13_bn/Const:08
g
conv_pw_13_bn/beta:0conv_pw_13_bn/beta/Assignconv_pw_13_bn/beta/read:02conv_pw_13_bn/Const_1:08
|
conv_pw_13_bn/moving_mean:0 conv_pw_13_bn/moving_mean/Assign conv_pw_13_bn/moving_mean/read:02conv_pw_13_bn/Const_2:08
?
conv_pw_13_bn/moving_variance:0$conv_pw_13_bn/moving_variance/Assign$conv_pw_13_bn/moving_variance/read:02conv_pw_13_bn/Const_3:08
?
"conv_pw_13_bn/moving_mean/biased:0'conv_pw_13_bn/moving_mean/biased/Assign'conv_pw_13_bn/moving_mean/biased/read:02?conv_pw_13_bn/AssignMovingAvg/conv_pw_13_bn/moving_mean/zeros:0
?
&conv_pw_13_bn/moving_mean/local_step:0+conv_pw_13_bn/moving_mean/local_step/Assign+conv_pw_13_bn/moving_mean/local_step/read:028conv_pw_13_bn/moving_mean/local_step/Initializer/zeros:0
?
&conv_pw_13_bn/moving_variance/biased:0+conv_pw_13_bn/moving_variance/biased/Assign+conv_pw_13_bn/moving_variance/biased/read:02Econv_pw_13_bn/AssignMovingAvg_1/conv_pw_13_bn/moving_variance/zeros:0
?
*conv_pw_13_bn/moving_variance/local_step:0/conv_pw_13_bn/moving_variance/local_step/Assign/conv_pw_13_bn/moving_variance/local_step/read:02<conv_pw_13_bn/moving_variance/local_step/Initializer/zeros:0
\
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02dense_1/random_uniform:08
M
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02dense_1/Const:08*?
image_quality?
9
input_image*
	input_1:0???????????>
quality_prediction(
dense_1/Softmax:0?????????
tensorflow/serving/predict